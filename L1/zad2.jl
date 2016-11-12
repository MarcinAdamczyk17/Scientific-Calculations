#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();

eps64 = Float64(3.0)*(Float64(4.0)/Float64(3.0) - Float64(1.0)) - Float64(1.0);
eps32 = Float32(3.0)*(Float32(4.0)/Float32(3.0) - Float32(1.0)) - Float32(1.0);
eps16 = Float16(3.0)*(Float16(4.0)/Float16(3.0) - Float16(1.0)) - Float16(1.0);

println("my eps64: ",eps64);
println("real one: ",eps(Float64));

println("\nmy eps32: ",eps32);
println("real one: ",eps(Float32));

println("\nmy eps16: ",eps16);
println("real one: ",eps(Float16));
