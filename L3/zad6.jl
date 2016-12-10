#=
  autor: Marcin Adamczyk
  nr indeksu: 221429
=#

workspace();

using MyModule

println("e^(x-1) - 1:")
println("metoda bisekcji:  ", mbisekcji(x -> e^(x-1) - 1, 0.0, 2.0, 5.0e-6,5.0e-6))
println("metoda stycznych: ",mstycznych(x -> e^(x-1) - 1, x -> -e^(1-x), -1.0, 5.0e-6,5.0e-6, 500))
println("metoda siecznych: ",msiecznych(x -> e^(x-1) - 1, 0.0, 2.0, 5.0e-6,5.0e-6, 50))

println("\nx*e^(-x):")
println("metoda bisekcji:  ", mbisekcji(x -> x*e^(-x), -1.0, 1.0, 5.0e-6,5.0e-6))
println("metoda stycznych: ",mstycznych(x -> x*e^(-x), x -> (e^(-x))*(x-1), -0.5, 5.0e-6,5.0e-6, 500))
println("metoda siecznych: ",msiecznych(x -> x*e^(-x), -1.0, 2.0, 5.0e-6,5.0e-6, 50))
