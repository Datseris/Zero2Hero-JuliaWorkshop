# Zero-to-Hero Julia workshop

**Table of Contents**
1. [Summary](#summary)
2. [Participating in this workshop](#participating-in-this-workshop)
3. [What is Julia?](#what-is-julia)
4. [Why should I learn Julia?](#why-should-i-learn-julia)
5. [Credit](#credit)

![workshop's add poster](add.jpg)

## Summary

This is an intensive workshop for the [Julia language](#what-is-julia), composed out of three 2-hour segments. It targets people **already familiar with programming**, so that the established basics such as `for`-loops are skipped through quickly and efficiently. Nevertheless, it assumes only *rudimentary programming familiarity* and does explain concepts that go beyond the basics. The goal of the workshop is to take you from zero to hero (regarding Julia): even if you know nothing about Julia, by the end you should be able to use it like a pro.

The material has been updated during July-December 2023 to Julia v1.9+ and corresponding latest stable versions of used packages

This workshop is also available on YouTube: https://www.youtube.com/watch?v=Fi7Pf2NveH0 in its original form, however the current notebook versions are significantly more streamlined and of higher educational quality!

## Participating in this workshop

**Installing Julia and the environment you want to program Julia in is NOT part of this workshop!** There are many options, up to preference, and may even depend on your operating system. And some options may be impossible depending on your environment, who knows!

To participate in this workshop, please follow these steps:

0. **Clone this GitHub repository.** This contains the Jupyter notebooks that we will use for the tutorials, the exercise solutions, and the installation script.
1. **Install Julia.** We recommend to use the [`juliaup`](https://github.com/JuliaLang/juliaup) command line tool for installing and managing Julia, but you can use whatever means you want. After installing Julia, you can launch it, which will launch the REPL (read-evaluate-print-loop) environment where you can immediately start coding and running Julia in.
2. **Install VSCode.** We recommend [VSCode](https://code.visualstudio.com/) as the environment to code and run Julia in, because it has an integrated text editor and a REPL console, it can run Jupyter notebooks out of the box, and has high quality debugging tooling.
3. **Install the Julia for VSCode extension.** To do this, open VSCode, go to Extensions, search for `Julia` and install. Once this is done, you should be able to run Julia within VSCode without any further configuration. Examples of what is possible:
   1. A console for Julia which you can get by typing `Alt+J, Alt+O` in VSCode.
   2. Using Julia in a scripting environment in VSCode. When working on a Julia script (a `.jl` text file) you may evaluate any amount of code in the script interactively. E.g., `Ctrl+Enter` evaluates current line being edited. The Julia process that evaluates the script is the same as the one in the console you get in point 1. **The Julia console and the text editor window are linked!**
   3. You can open Jupyter notebooks without installing anything else. Simply drag+drop the notebook into VSCode and it will request a "kernel" (choose Julia).  Each Jupyter notebook launches a dedicated Julia process, so the Jupyter notebooks are not linked with the standard text editor and Julia console of VSCode!
4. **Install the Julia packages that we will use.** Depending on your internet connection and your machine, the speed that the Julia packages we use will be downloaded, installed, and compiled, can take up to several minutes. Hence, it is good to do it before the workshop. To install everything run the `install_and_compile.jl` Julia script. This is also a good test that you have correctly installed Julia.

## What is Julia?

[Julia](https://julialang.org/) is a relatively new programming language, developed at MIT, with version 1.0 released in August 2018. Even though it is so recent, it has taken the scientific community by storm and many serious large scale projects have started using Julia.

The [Julia documentation](https://docs.julialang.org/en/v1/) outlines the main facts and features of Julia.

## Why should I learn Julia?

I've put my thoughts on how to answer this question in [Why Julia - a Manifesto](https://github.com/Datseris/whyjulia-manifesto).

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
