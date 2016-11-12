#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();

#=
  d/dx(sin(x)+cos(3 x)) = cos(x)-3 sin(3 x)
  (Wolfram Alpha)
=#
function f(x) :: Float64
  return sin(x) + cos(3.0 * x);
end

function derivF(x) :: Float64
  return cos(x) - 3.0 * sin(3.0 * x);
end

function approxDerivF(x :: Float64, h :: Float64) :: Float64
  return (f(x + h) - f(x)) / h
end

function iterate(range :: Int8)
  local h;
  local h1;
  for i = 0 : range
    h = 1.0 / 2.0 ^ i;
    h1 = h + 1.0;
    println("\nn = ", i, " exact  derivative = ", derivF(1.0));
    println("n = ", i, " approx derivative = ", approxDerivF(1.0, h));
    println("n = ", i, " difference        = ", approxDerivF(1.0, h) - derivF(1.0));
    println("n = ", i, " h + 1             = ", h1);
  end

end

iterate(Int8(54));
