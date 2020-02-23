# Zero-to-Hero Julia workshop

This is an intensive full-day workshop for the [Julia language](#what-is-julia), composed out of three 2-hour segments. it assumes only *rudimentary programming familiarity*. For example, what is a `for` loop will be explained, and the syntax will be shown, but we won't be dwelling too much on really explaining the nature of a `for`-loop and how to use it.

The goal of the workshop is to take you from zero to hero (regarding Julia): even if you know nothing about Julia, by the end you should be able to use it like a pro.

![workshop's add poster](add.jpg)

### Quick setup
These notebooks are available in this repo: https://github.com/Datseris/Zero2Hero-JuliaWorkshop

To be able to run everything in these notebooks you will need install and compile some Julia packages. For most of the packages that will be used, installation and compilation are instant, but for the following ones it isn't. So please open a new Julia REPL (the console that is installed with Julia) and run the following commands and let them in the background while we go through the first part of this workshop:
```julia
using Pkg
Pkg.add("IJulia", "PyPlot", "OrdinaryDiffEq", "DynamicalSystems")
using IJulia, PyPlot, OrdinaryDiffEq, DynamicalSystems
```
For the other packages you will encounter in these notebooks, simply doing `Pkg.add("PackageName"); using PackageName` on the spot should be fast enough.

Notice that you can have multiple Julia REPLs open in parallel. These tutorials are made in Jupyter notebooks, and thus require the `IJulia` package to run. I personally use the [Juno IDE](https://junolab.org/) to use Julia, instead of the REPL.

### Play around a bit!
It is **strongly encouraged to have an active mindset during this tutorial**. Instead of only listening to my own boring voice, you should have a second Julia instance (e.g. REPL or a Juno editor) and play around with the code and ideas I present. Ask questions during the tutorial, as there is a lot of time allocated for that!

### Credit
Much of the material of this workshop is created by the author (George Datseris). However significant content comes from the following sources:

* The JuliaBox tutorials for the core language
* Exercises from exercism.io
* Chris Rackauckas' tutorials from http://ucidatascienceinitiative.github.io/IntroToJulia/
* Carsten Bauer's workshop https://github.com/crstnbr/JuliaWorkshop19
* Stefan Karpinski's JuliaCon talk, "The Unreasonable Effectiveness of Multiple Dispatch"
* Jonas Isensee's DrWatson talk at Julia users meetup (in UK, hosted by Invenia)

Also have a look at the following sources, which have interesting exercises not used here:
* https://github.com/mitmath/18330


## What is Julia?

[Julia](https://julialang.org/) is a relatively new programming language, developed at MIT, with version 1.0 released in August 2018. Even though it is so recent, it has taken the scientific community by storm and many serious large scale projects have started using Julia.

The following **facts** about Julia justify why so many scientists are willing to learn a new language:

- Performance as good as C/Fortran
- Dynamic, interactive language like Python or Matlab
- Intuitive, expressive and high-level syntax
- General purpose as well as scientific computing
- Multiple dispatch
- Interoperability and "free" extension-ability of Julia packages
- Able to call C, Fortran, Python, etc... without boilerplate
- Free and open source
- Thriving ecosystem

## Why should I learn Julia?

*(in the author's personal opinion, which targets an audience of scientists)*

- It solves the two language problem: allows interactive exploration of your system with high performance.
- It offers a syntax that is intuitive and easy to read. Your own code does not differ much from Julia's base code.
- Unicode makes math expressions in code feel natural and allows you to use symbols from your native language as well!
- Integrated package manager (and super good as well), and everything runs everywhere: no `makefile` nonsence, no spending weeks figuring out how to install things, no worries whether your program will be able to run on Windows.
- Multiple dispatch and functional programming are [most suitable paradigm to implement scientific thought in code](https://www.youtube.com/watch?v=7y-ahkUsIrY).
- Its so darn easy to extend other's people code and then for other people to extend your code!
- A lot of code re-use leads to rapid development and more features than would be possible with other languages.
- The astonishing and cutting edge Julia package ecosystem.
- Many programming laguanges (e.g. Python, C) are directly callable from Julia without boilerplate. Which means, if you have a good code base in Python or C, you don't have to re-write it!
- Julia has a [scientific project assistant software](https://github.com/JuliaDynamics/DrWatson.jl).
