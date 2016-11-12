#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace()

function f(x :: Float64) :: Float64
  return sqrt(x^2 + 1.0) - 1.0
end

function g(x :: Float64) :: Float64
  return x ^ 2 / (sqrt(x^2 + 1.0) + 1.0)
end

function iterate(range :: Int8)
  for i = 1 : range
    x = 1 / (8 ^ i);
    println("x = 8^-", i, " f(x) = ", f(x));
    println("x = 8^-", i, " g(x) = ", g(x));
    println();
  end
end

iterate(Int8(15));
