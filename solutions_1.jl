# exercise 1
babystep(x, y) = 0.5(x + y/x)
function babylon(y, ε, x0 = 1.0)
    n, x, xn = 0, x0, Inf
    while abs(x - xn) > ε
        xn = x
        x = babystep(xn, y)
        n += 1
    end
    return n
end
babylon(2, 1e-12)

# exercise 2
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

# exercise 3
function fibonacci(n)
    n ∈ (1, 2) && return 1
    return fibonacci(n-1) + fibonacci(n-2)
end
fibonacci(5)
fibonacci.(1:8)

# Plotting, ex. 1
using Random: Xoshiro
rng = Xoshiro(1234)
xp1 = 0.2randn(rng, 10_000) .+ 0.5
p2 = 0.5randn(rng, 10_000)
edges = -2:0.1:2
hist(p1; bins = edges, color = ("black", 0.75), label = "p1")
hist!(p2; bins = edges, color = ("red", 0.75), label = "p2")
ylims!(0, nothing)
axislegend()
current_figure()

# Plotting, ex. 2
fig = Figure(resolution = (600, 600))

colors = [
    "#7143E0",
    "#191E44",
    "#0A9A84",
    "#C0A12B",
    "#701B80",
    "#2E6137",
]

Box(fig[1, 1:2], color = colors[1], strokewidth = 0)
Box(fig[1:2, 3], color = colors[2], strokewidth = 0)
Box(fig[3, 2:3], color = colors[3], strokewidth = 0)
Box(fig[2:3, 1], color = colors[4], strokewidth = 0)
Box(fig[2, 2], color = colors[5], strokewidth = 0)

ax = Axis(fig[:, :])
n = 4
t = 0:0.01:2n*π
x = (2n*π .- t) .* cos.(t)
y = (2n*π .- t) .* sin.(t)

lines!(ax, x, y; color = colors[6], linewidth = 5)
hidedecorations!(ax)
hidespines!(ax)
fig

# Performance
function collatz(n)
    c = 0
    while n ≠ 1
        n = isodd(n) ? 3n + 1 : n÷2
        c+=1
    end
    return c
end
collatz(100)


logistic(x, r) = r*x*(1-x)
function logistic(x0, r, N)
    a = fill(x0, N)
    for i in 2:N
        a[i] = logistic(a[i-1], r)
    end
    return a
end
a = logistic(0.5, 3.7, 100)