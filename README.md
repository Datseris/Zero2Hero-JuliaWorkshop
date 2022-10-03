# Zero-to-Hero Julia workshop

This workshop is also available on YouTube: https://www.youtube.com/watch?v=Fi7Pf2NveH0

This is an intensive full-day workshop for the [Julia language](#what-is-julia), composed out of three 2-hour segments. It assumes only *rudimentary programming familiarity*. For example, what is a `for` loop will be explained, and the syntax will be shown, but we won't be dwelling too much on really explaining the nature of a `for`-loop and how to use it.

The goal of the workshop is to take you from zero to hero (regarding Julia): even if you know nothing about Julia, by the end you should be able to use it like a pro.

**Table of Contents**
1. [Participating in this workshop](#participating-in-this-workshop)
   1. [Quick setup](#quick-setup)
   2. [Play around a bit!](#play-around-a-bit)
   3. [Credit](#credit)
2. [What is Julia?](#what-is-julia)
3. [Why should I learn Julia?](#why-should-i-learn-julia)

![workshop's add poster](add.jpg)

## Participating in this workshop

### Quick setup
These notebooks are available in this repo: https://github.com/Datseris/Zero2Hero-JuliaWorkshop

To be able to run everything in these notebooks you will need install and compile some Julia packages. For most of the packages that will be used, installation and compilation are instant, but for the following ones it isn't. So please open a new Julia REPL (the console that is installed with Julia) and run the following commands and let them in the background while we go through the first part of this workshop:
```julia
using Pkg
Pkg.add(["IJulia", "PyPlot", "OrdinaryDiffEq", "DynamicalSystems"])
using IJulia, PyPlot, OrdinaryDiffEq, DynamicalSystems
```
For the other packages you will encounter in these notebooks, simply doing `Pkg.add("PackageName"); using PackageName` on the spot should be fast enough.

Notice that you can have multiple Julia REPLs open in parallel. These tutorials are made in Jupyter notebooks, and thus require the `IJulia` package to run. I personally use the [VSCode IDE](https://www.julia-vscode.org/) to write and run Julia code, instead of the REPL or Jupyter notebooks, and that's the medium I recommend for any code development in Julia.

### Play around a bit!
It is **strongly encouraged to have an active mindset during this tutorial**. Instead of only listening to my own boring voice, you should have a second Julia instance (e.g. REPL or a VSCode editor) and play around with the code and ideas I present. Ask questions during the tutorial, as there is a lot of time allocated for that!

### Credit
Much of the material of this workshop is created by the author (George Datseris). However significant content comes from the following sources:

* The JuliaBox tutorials for the core language
* Exercises from exercism.io
* Chris Rackauckas' tutorials from http://ucidatascienceinitiative.github.io/IntroToJulia/
* Carsten Bauer's workshop https://github.com/crstnbr/JuliaWorkshop19
* Stefan Karpinski's JuliaCon talk, "The Unreasonable Effectiveness of Multiple Dispatch"
* Jonas Isensee's DrWatson talk at Julia users meetup (in UK, hosted by Invenia)
* https://github.com/mitmath/18330


## What is Julia?

[Julia](https://julialang.org/) is a relatively new programming language, developed at MIT, with version 1.0 released in August 2018. Even though it is so recent, it has taken the scientific community by storm and many serious large scale projects have started using Julia.

The [Julia documentation](https://docs.julialang.org/en/v1/) outlines the main facts and features of Julia.

## Why should I learn Julia?

*(in the author's personal opinion, which targets an audience of scientists)*

1. **It solves the two language problem**: it is a dynamic and interactive language that allows real time scientific exploration, but still offers the performance of static low level languages such as C. Julia works by compiling machine level code and hence all basic programming concepts such as iteration, broadcasting, function-as-arguments, are fast by themselves. Hence, you would never have to "re-write" a code in Julia in another language to make it faster!
2. **It's syntax is intuitive and as close to math as possible**: The combination of high level syntax, Unicode, and simple to reason for code makes the code faster to write and read.
3. **Multiple dispatch**: is the core programming paradigm of Julia and is used with functional programming and in my opinion is the [most suitable paradigm to implement scientific thought in code](https://www.youtube.com/watch?v=7y-ahkUsIrY). Additionally, the power of multiple dispatch leads to [unprecedented code re-use](https://www.youtube.com/watch?v=kc9HwsxE1OY) that has never been seen in other programming languages. In short, packages can use and extend other packages very easily (most of the times for free!), without boiler-plate or glue code. See [this presentation](https://www.youtube.com/watch?v=2MBD10lqWp8) for how useful this is in scientific and data analysis context.
4. **Julia is written in Julia**: this has many advantages.
   * A typical user code isn't really different from Julia's very own base code, all the way down to basic arithmetic. This means, that understanding source code of other's packages, or even Julia's code itself, is straightforward. Hence, it is also straightforward to improve an existing codebase via a code contribution.
   * Most basic Julia types are used almost everywhere, and even if they aren't, due to multiple dispatch a front-end user wouldn't care. To give an example: a Python user would _have_ to use e.g., array types from PyTorch to implement performant advanced algorithms, especially for large datasets. However, if performant version of a function/operation a user needed, like e.g., or the gamma function or some algorithm that operates on arrays, was not implemented for this "special" array type, that user is doomed. They will most likely not understand how a package like PyTorch implements numerics, to add their version of what they need. Instead, they will have to convert to "normal" python array, at a price of a slowdown in performance, and then going back again to the "fast" array versions. In Julia such things don't happen, because the "fast" array version is the "standard" array version, and even if not, all array types are anyways part of the same abstract interface due to multiple dispatch.
   * As a consequence, Python users are "forced" to find existing implementations of algorithms/functionalities in these Python packages like PyTorch/Numpy, and are "discouraged" from writing their own versions (writing a Runge-Kutta solver in Python was one of the biggest mistakes I've made!). Julia users instead could write their own low-level code, which improves their algorithmic/programming skills, gives them better understanding of how the algorithm works, and gives them more flexibility over it as well.
5. **Julia's package ecosystem is top-of-the-class in many scientific disciplines already**. Even though Julia is very new, and with a relatively small user base ([StackOverflow results](https://survey.stackoverflow.co/2022/#technology-most-popular-technologies) show Python usage at about 50%, Julia at about 2%), in many disciplines Julia's ecosystem is at least as good, and typically better, as Python's. I can only speak from experience, and from my perspective these ecosystems are about [nonlinear dynamics & complex systems](https://juliadynamics.github.io/JuliaDynamics/), [differential equations & scientific machine learning](https://juliadynamics.github.io/JuliaDynamics/), [machine learning and auto differentiation](https://fluxml.ai/), [statistics](https://github.com/JuliaStats) (especially Distributions.jl and OnlineStats.jl), and even a [scientific project assistant software](https://github.com/JuliaDynamics/DrWatson.jl).
6. **Interoperability with other languages**: C is directly and natively callable from Julia. Python is callable from Julia with the same syntax as normal object-oriented Python code via [PythonCall.jl](https://github.com/cjdoris/PythonCall.jl). This means that you can really _use any Python package_ in Julia, most of the time without even changing the syntax of the Python code. R, FORTRAN, etc., are callable similarly simply.
7. **Exceptionally strong integrated package manager**: Julia's package manager is just another package. It is flexible, strong, leading to less ambiguities versus other languages. On top of it, a strong binary shipping system is built. This all means that everything runs everywhere: no `makefile` nonsence, no spending weeks figuring out how to install things, no worries whether your program will be able to run on Windows. Everything is a 1-click install.
