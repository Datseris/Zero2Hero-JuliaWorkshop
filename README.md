# Zero-to-Hero Julia workshop

**Table of Contents**
1. [Summary](#summary)
2. [Participating in this workshop](#participating-in-this-workshop)
   1. [Installing Julia: NOT covered](#installing-julia-not-covered)
   2. [Play around a bit!](#play-around-a-bit)
3. [What is Julia?](#what-is-julia)
4. [Why should I learn Julia?](#why-should-i-learn-julia)
5. [Credit](#credit)

![workshop's add poster](add.jpg)

## Summary

This is an intensive full-day workshop for the [Julia language](#what-is-julia), composed out of three 2-hour segments. It assumes only *rudimentary programming familiarity*. The goal of the workshop is to take you from zero to hero (regarding Julia): even if you know nothing about Julia, by the end you should be able to use it like a pro.


The material has been updated during July-August 2023 to Julia v1.9+ and corresponding latest stable versions of used packages.

This workshop is also available on YouTube: https://www.youtube.com/watch?v=Fi7Pf2NveH0 (in its original form)


## Participating in this workshop

### Installing Julia: NOT covered

Installing Julia and the environment you want to program in Julia is NOT part of this workshop! There are many options, up to preference, and may even depend on your operating system.

We recommend to install Julia using the most automated, pre-packaged, and fool-proof way, which is as follows:

1. Install Julia via `juliaup`: https://github.com/JuliaLang/juliaup
2. Install VSCode as your programming environment: https://code.visualstudio.com/
3. Install the Julia for VSCode extension: Open VSCode, go to Extensions, search for `Julia` and install.

These steps are simple, work for "any" operating system, and out of the box you get:

1. A console for Julia which you can get by typing `Alt+J, Alt+O` in VSCode.
2. Using Julia in a scripting environment in VSCode. When working on a Julia script (`.jl` text file) you may evaluate any amount of code in the script interactively. E.g., `Ctrl+Enter` evaluates current line being edited. The Julia process that evaluates the script is the same as the one in the console you get in point 1. **The Julia console and the text editor window are linked!**
3. Jupyter notebooks, like the one you are reading now, which you can open from the command launch in VSCode (Ctrl+Shift+P) and then selecting "Jupyter: Import new notebook". Each Jupyter notebook launches a dedicated Julia process. **Jupyter notebooks are not linked with the standard text editor and Julia console of VSCode!**

Additional Julia packages that may be used during the workshop can be installed on the spot, but if you want to pre-compile everything then simply run

```julia
import Pkg
Pkg.add(["BenchmarkTools", "CairoMakie", "OrdinaryDiffEq", "DynamicalSystems", "DrWatson", "DataFrames"])
```

### Play around a bit!

It is **strongly encouraged to have an active mindset during this tutorial**. Instead of only listening to my own boring voice, you should have a second Julia instance (e.g. REPL or a VSCode editor) and play around with the code and ideas I present. Ask questions during the tutorial, as there is a lot of time allocated for that!

## What is Julia?

[Julia](https://julialang.org/) is a relatively new programming language, developed at MIT, with version 1.0 released in August 2018. Even though it is so recent, it has taken the scientific community by storm and many serious large scale projects have started using Julia.

The [Julia documentation](https://docs.julialang.org/en/v1/) outlines the main facts and features of Julia.

## Why should I learn Julia?

I've put my thoughts on how to answer this question in a well-composed text: [Why Julia - a Manifesto](https://github.com/Datseris/whyjulia-manifesto). The brief summary that follows from there is that among the four most important aspects of a programming language, Julia emerges as the strongest candidate for scientific computing:

1. **Speed of writing.** Julia is a dynamic language allowing flexible code development and rapid prototyping. It has intuitive, high level syntax, and when combined with its modern parser this leads concise and readable code.
2. **Speed of execution.** Julia code is compiled to efficient machine code that runs as fast as traditional static languages like C or FORTRAN. That is a native property of the language and applies to typical user code - no need for external tools like Numba or Cython!
3. **Available libraries.** Julia has software organizations around seemingly every area of science, from high energy physics to economics, offering native Julia software for most scientific applications. Additionally, many of these software are the best-in-class among all open source programming languages, e.g., DifferentialEquations.jl, JuMP.jl, or Turing.jl.
4. **Extensibility/Composability.** Julia allows calling C/FORTRAN/R/Python code straightforwardly. Arguably the biggest strength of Julia however is its inter-package composability. Julia has brought in an unprecedented amount of code re-use, enabling packages to easily communicate with each other and extend each other, all without the boilerplate code and name spaces issues one encounters in languages like Python.

For more details, have a look at the manifesto!

## Credit

Much of the material of this workshop is created by the author (George Datseris). However significant content comes from the following sources:

* The JuliaBox tutorials for the core language
* Exercises from exercism.io
* Chris Rackauckas' tutorials from <http://ucidatascienceinitiative.github.io/IntroToJulia/>
* Carsten Bauer's workshop <https://github.com/crstnbr/JuliaWorkshop19>
* Stefan Karpinski's JuliaCon talk, "The Unreasonable Effectiveness of Multiple Dispatch"
* Jonas Isensee's DrWatson talk at Julia users meetup (in UK, hosted by Invenia)
* <https://github.com/mitmath/18330>
* Kristoffer Carlsson and Fredrik Bagge Carlson's talk "Julia for AI and Data Science" <https://www.youtube.com/watch?v=2MBD10lqWp8>
