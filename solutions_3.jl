using OrdinaryDiffEq, PyPlot, StaticArrays
bouncy(u,p,t) = SVector(u[2], -p[1] -p[2]*u[2])
condition(u,t,integrator) = u[1]
u₀ = SVector(1.0, 0.0)
p₀ = [1, 0.99]
prob = ODEProblem(bouncy, u₀, (0.0, 10.0), p₀)
saveat = 0:0.1:10
affect!(integ) = integ.u = SVector(max(0, integ.u[1]), -integ.u[2])
cb = ContinuousCallback(condition, affect!)
sol = solve(prob; alg = Tsit5(), callback=cb, saveat=saveat)
plot(sol.t, sol[1, :])

# %% distribution quantile
using Distributions
function myquantile(d::UnivariateDistribution, q::Number)
    θ = mean(d)
    tol = Inf
    while tol > 1e-5
        θold = θ
        θ -= (cdf(d, θ) - q) / pdf(d, θ)
        tol = abs(θold - θ)
    end
    θ
end

for dist in [Gamma(5, 1), Normal(0, 1), Beta(2, 4)]
    @show dist
    @show myquantile(dist, .75)
    @show quantile(dist, .75)
    println()
end

# %% plotting subset
using DataFrames, CSV, Statistics
iris = DataFrame(CSV.File(
    joinpath(dirname(pathof(DataFrames)),
    "../docs/src/assets/iris.csv")
))

allspecies = unique(iris[!, :Species])

for species in unique(iris[!, :Species])
    df = filter(row -> row.Species == species, iris)
    fig, axs = subplots(1,2)
    fig.suptitle(species)
    axs[1,1].scatter(df.PetalLength, df.PetalWidth)
    axs[1,1].set_xlabel("PetalLength"); axs[1,1].set_ylabel("PetalWidth")
    axs[2,1].scatter(df.SepalLength, df.SepalWidth, c= "C1")
    axs[2,1].set_xlabel("SepalLength"); axs[2,1].set_ylabel("SepalWidth")
    fig.tight_layout()
    println("$species Petal pearson: ", cor(df.PetalLength, df.PetalWidth))
end

# %% chaos dataframe
using DynamicalSystems, DataFrames, Query

ro = Systems.roessler(ones(3))

as = 0.15:0.05:0.25
bs = 0.15:0.05:0.25
cs = 4:0.1:6.0

df = DataFrame()
@time for a in as, b in bs, c in cs
    begin
        set_parameter!(ro, (a, b, c))
        λs = lyapunovs(ro, 5000)
        tr = trajectory(ro, 1000; dt = 0.1)
        H = genentropy(1.0, 0.1, tr)
    end
    push!(df, (a=a, b=b, c=c, λ1=λs[1], λ2=λs[2], H=H))
end

chaoticpars = @from row in df begin
    @where row.λ1 > 0.01
    @select {row.a, row.b, row.c}
    @collect DataFrame
end

λvsH = @from row in df begin
    @where row.λ1 > 0.01
    @select {row.λ1, row.H}
    @collect DataFrame
end
using PyPlot
figure(); scatter(λvsH.λ1, λvsH.H)

heatdf = @from row in df begin
    @where row.a == 0.2
    @select {row.b, row.c, row.H}
    @collect DataFrame
end
unstacked = unstack(heatdf, :b,  :H; renamecols = (x -> "H for b=$(x)"))
heat = Matrix(unstacked[:, Not(:c)])
figure(); imshow(heat, extent = (bs[1], bs[end], cs[1], cs[end]))
gca().set_aspect("auto")
colorbar()
xlabel("b"); ylabel("c");

# %% reproducible science projet
using DrWatson
cd(@__DIR__)
initialize_project("test", "Test project")
using Pkg; Pkg.add("BSON")

# now go into a test script, e.g. `/test/scripts/test.jl`
# and do:
# tagsave("test.bson", data; gitpath = dirname(@__DIR__))

rm("test"; recursive = true, force = true)
