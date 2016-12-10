#=
  autor: Marcin Adamczyk
  nr indeksu: 221429
=#

module MyModule

export mbisekcji, mstycznych, msiecznych

#=
  @param f    funkcja
  @param a,b  końce przedzialu
  @param delta, epsilon dokladnosc obliczen
=#
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
  fa = f(a);
  fb = f(b);
  err = 0;

  if sign(fa) == sign(fb)
    err = 1;
    return 'x', 'x', 'x', err;
  end

  e = b - a;
  e = e / 2;
  c = a + e;
  w = f(c);
  it = 1;
  while abs(w) > epsilon && abs(e) > delta
    it=  it + 1;

    if sign(w) != sign(fa)
      b = c;
      fb = w;
    else
      a = c;
      fa = w;
    end

    e = e / 2;
    c = a + e;
    w = f(c);
  end

  return c, w, it, err;
end

function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  v = f(x0);
  if abs(v) < epsilon;
    return 0, x0, v, 0
  end
  if abs(pf(x0)) < epsilon;
    return 0, x0, v, 2
  end
  k = 1
  x1 = x0 - v / pf(x0)
  for k=1:maxit
    x1 = x0 - v / pf(x0)
    v = f(x1);

    if abs(x1- x0) < delta || abs(v) < epsilon
      return x1, v, k, 0
    end

    x0 = x1;
  end

  return x1, v, k, 1
end


function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
  fa = f(x0)
  fb = f(x1)

  temp = 0.0;
  k = 0; s = 0.0
  for k = 1 : maxit
    if abs(fa) > abs(fb)
      temp = x1;
      x1 = x0;
      x0 = temp;

      temp = fa;
      fa = fb;
      fb = temp;
    end

    s = (x1 - x0) / (fb - fa);
    x1 = x0;
    fb = fa;
    x0 = x0 - fa * s;
    fa = f(x0);

    if abs(x1 - x0) < delta || abs(fa) < epsilon
      return x0, fa, k, 0;
    end
  end

  return x0, fa, k, 1;
end

end
