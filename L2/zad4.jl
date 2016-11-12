#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429

#MAIN


r = 3

p32 = Float32(0.01)
for i=1:40
  p32 = p32 + r * p32 * (Float32(1.0) - p32)
end
println(p32)

p32 = Float32(0.01)
for i=1:4
  for j=1:10
    p32 = p32 + r * p32 * (Float32(1.0) - p32)
  end
  p32 = floor(p32,3)
end
println(p32)

p64 = 0.01
for i=1:40
  p64 = p64 + r * p64 * (1.0 - p64)
end
println(p64)
