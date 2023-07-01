#=
Please notice: the solutions to these exercises are
written in a form a experienced Julia user would solve them.
This is on purpose, to get more familiar with "normal" Julia
syntax. For example you will see syntax like:
`a && return b`.
For anything that you are unfamiliar with, don't worry,
just search it on the Julia docs (only basic syntax is used here).

Remember, if there is a symbol, e.g. `≠` , or a function, e.g. `haskey`
that you don't know, use the help functionality of Julia: ?function_name
=#

#########################################################################
# 1
#########################################################################
function collatz(n)
    c = 0
    while n ≠ 1
        n = isodd(n) ? 3n + 1 : n÷2
        c+=1
    end
    return c
end
collatz(100)

function fibonacci(n)
    n ∈ (1, 2) && return 1
    return fibonacci(n-1) + fibonacci(n-2)
end
fibonacci(5)
fibonacci.(1:8)

logistic(x, r) = r*x*(1-x)
function logistic(x0, r, N)
    a = fill(x0, N)
    for i in 2:N
        a[i] = logistic(a[i-1], r)
    end
    return a
end
a = logistic(0.5, 3.7, 100)

function count_nucleotides(strand::AbstractString)
    occurence = Dict('A' => 0, 'C' => 0, 'G' => 0, 'T' => 0)
    for n in strand
        haskey(occurence, n) || error("unknown nucleotide $(n)!")
        occurence[n] += 1
    end
    return occurence
end
count_nucleotides("AGAGAGATCCCTTA")
count_nucleotides("ATATATAGGCCAX")

hamming(a, b) = count(i != j for (i, j) in zip(a, b))
hamming("AGAGAGATCCCTTA", "ATATATAGGCCAXA")

babystep(x, y) = 0.5(x + y/x)
function babylon(y, ε)
    n, x, xn = 0, 1.0, Inf
    while abs(x - xn) > ε
        xn = x
        x = babystep(xn, y)
        n += 1
    end
    println("Took me $n steps!")
    return x
end
babylon(2, 1e-12)

#########################################################################
# 2
#########################################################################
# %% student type hierarchy
abstract type AbstractPerson end
struct Person <: AbstractPerson
    name::String
end
struct GradStudent <: AbstractPerson
    name::String
    grade::Float64
end
struct GroupLeader <: AbstractPerson
    name::String
    group::String
end
showname(p::AbstractPerson) =
    print("This is a $(typeof(p)) named $(p.name) ")
showproperty(p::Person) = nothing
showproperty(p::GradStudent) =
    println("with grade $(p.grade)")
showproperty(p::GroupLeader) =
    println("with group $(p.group)")
person_info(p::AbstractPerson) =
    (showname(p); showproperty(p))

# %% my own range
struct Range{T}
    start::T
    step::T
    stop::T
    n::Int # it is convenient to make length part of struct
end
Range(a, b, c) = Range(promote(a, b, c)...) # convenience!
function Range(a::T, b::T, c::T) where {T}
    n = (c - a)÷b
    return Range{T}(a, b, c, n)
end
function Base.getindex(r::Range, i)
    (i ≤ 0 || i > r.n) && error("Index out of bounds!")
    return r.start + (i-1)*r.step
end
r = Range(0, 0.2, 4)
r[5]
r[514]
r[-5]

# %% making range iterable
function Base.iterate(r::Range, i = 1)
    i > r.n && return nothing
    return (r.start + (i-1)*r.step), i+1
end
Base.length(r::Range) = r.n
for s in r
    @show s
end

using Unitful
unitr = Range(1u"kg", 0.1u"kg", 10u"kg")
for s in unitr
    @show s
end


# %% custom whackadoodle iterator
mutable struct WhackaDoodle
    n::Int
    last::Float64
end
WhackaDoodle(n::Int) = WhackaDoodle(n, 0)
w = WhackaDoodle(10)

function Base.iterate(w::WhackaDoodle, i = 1)
    if i == w.n
        return nothing
    elseif i == 1
        w.last = rand()
    elseif isodd(i)
        w.last /= rand()
    else
        w.last *= rand()
    end
    return w.last, i+1
end

w = WhackaDoodle(500)
using Statistics: mean, std
std(w)


# %% Rational numbers
function _normalize(n::Integer, d::Integer)
    g = gcd(n, d)
    m = d < 0 ? -1 : 1
    (m * n ÷ g, m * d ÷ g)
end

struct RationalNumber <: Real
    n::Int
    d::Int
    function RationalNumber(n, d)
        d == 0 && error("Can't divide by zero!")
        x, y = _normalize(n, d)
        new(x, y)
    end
end
const RN = RationalNumber # convenience shortcut

Base.:+(a::RN, b::RN) = RN(a.n*b.d + b.n*a.d, a.d*b.d)
Base.:-(a::RN, b::RN) = a + RN(-b.n, b.d)
Base.:*(a::RN, b::RN) = RN(a.n*b.n, a.d*b.d)
Base.:/(a::RN, b::RN) = a * RN(b.d, b.n)

a = RN(1, 3)
b = RN(5, 10)
a + b
a - b
a * b
a / b

Base.float(a::RN) = a.n / a.d
cos(a)
tanh(a)

#########################################################################
# 3
#########################################################################
# %% Bouncing ball
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
