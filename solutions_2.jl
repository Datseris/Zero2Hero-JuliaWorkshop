import Pkg
Pkg.activate(@__DIR__)

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
showname(p::AbstractPerson) = print("This is a $(typeof(p)) named $(p.name) ")
showproperty(p::Person) = nothing
showproperty(p::GradStudent) = println("with grade $(p.grade)")
showproperty(p::GroupLeader) = println("with group $(p.group)")
person_info(p::AbstractPerson) = (showname(p); showproperty(p))

person_info(Person("Tim"))
person_info(GradStudent("Tim", 1))
person_info(GroupLeader("Tim", "A"))











# %% my own range
struct Range{T}
    start::T
    step::T
    stop::T
end
# We also implement a promotion rule,
# so that `Range(0, 0.5, 1)` works
# (i.,e., combining integers and floats as input is fine)
Range(a, b, c) = Range(promote(a, b, c)...) # convenience!

function Base.getindex(r::Range, i)
    n = (r.stop - r.start)÷r.step
    if (i ≤ 0 || i > n)
        error("Index out of bounds!")
    end
    return r.start + (i-1)*r.step
end
r = Range(0, 0.2, 4)
r[5]
r[514]
r[-5]
r["test"]








# %% making range iterable
Base.length(r::Range) = (r.stop - r.start)÷r.step
function Base.iterate(r::Range, i = 1)
    i > length(r) && return nothing
    return r[i], i+1
end
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
WhackaDoodle(n::Int) = WhackaDoodle(n, 0.0)
w = WhackaDoodle(10)

function Base.iterate(w::WhackaDoodle, i = 1)
    if i == w.n + 1
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

w = WhackaDoodle(50000)
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
