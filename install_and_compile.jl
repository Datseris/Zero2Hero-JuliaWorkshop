# use Julia's package manager
using Pkg
# Activate package environment associated with the Zero2Hero workshop
Pkg.activate(@__DIR__)
# Instantiate the environment (install everything)
# but make sure you use the same (or later) Julia version as the workshop before doing so!
# (you can find this version at the very top of the Manifest.toml file)
Pkg.instantiate()
# Compile all installed packages
Pkg.precompile()