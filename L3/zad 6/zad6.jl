#=
  autor: Marcin Adamczyk
  nr indeksu: 221429
=#

workspace();

using MyModule

println("e^(x-1) - 1:")
println("metoda bisekcji:  ", mbisekcji(x -> e^(1-x) - 1, 0.0, 1.1, 1.0e-5, 1.0e-5))
println("metoda stycznych: ",mstycznych(x -> e^(1-x) - 1, x -> -e^(1-x), 0.2, 1.0e-5, 1.0e-5, 50))
println("metoda siecznych: ",msiecznych(x -> e^(1-x) - 1, 0.5, 1.5, 1.0e-5, 1.0e-5, 50))

println("\nx*e^(-x):")
println("metoda bisekcji:  ", mbisekcji(x -> x*e^(-x), -0.4, 0.6, 1.0e-5, 1.0e-5))
println("metoda stycznych: ",mstycznych(x -> x*e^(-x), x -> (-e^(-x))*(x-1), 0.5, 1.0e-5, 1.0e-5, 50))
println("metoda siecznych: ",msiecznych(x -> x*e^(-x), -1.0, 1.0, 1.0e-5, 1.0e-5, 50))
