# use Julia's package manager
using Pkg
# Activate package environment associated with the Zero2Hero workshop
Pkg.activate(@__DIR__)
# Instantiate the environment (install everything)
# but make sure you use the same Julia version as the workshop before doing so!
Pkg.instantiate()
# Compile all installed packages
Pkg.precompile()