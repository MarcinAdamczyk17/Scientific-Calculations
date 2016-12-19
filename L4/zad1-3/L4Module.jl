#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
module L4Module

export ilorazyRoznicowe, warNewton, rysujNnfx

using PyPlot;

#=
@param x wektor zawierajacy wezly
@param f wektor zawierajacy wartosc interpolowanej funkcji w wezlach
=#
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
  n = length(x);
  if(n != length(f))
    println("error")
    return;
  end

  #deklaracja tablicy, w ktorej bedziemy przechowywac ilorazy roznicowe
  fx = Array(Float64, n)

  #rozpoczynamy od wypelnienia tej tablicy odpowiadajacymi indeksom wartosciami
  #funkcji interpolowanej
  for i = 1 : n
    fx[i] = f[i];
  end

  for j = 1 : n
    for i = n : -1 : j+1
      fx[i] = (fx[i] - fx[i-1]) / (x[i] - x[i-j])
    end
  end
  return fx
end

#=
@param x wektor zawierajacy wezly
@param fx wektor zawierajacy ilorazy roznicowe
@param t punkt dla ktorego ma zostac obliczona wartosc wielomianu interpolacyjnego
=#
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
  n = length(x)

  nt = fx[n];

  #uogolniony schemat Hornera
  for i=n-1 : -1 : 1
    nt = nt * (t - x[i]) + fx[i];
  end
  return nt;
end


#=
@param f funkcja anonimowa
@param a lewy koniec przedzialu
@param b prawy koniec przedzialu
@param n stopien wielomianu interpolacyjnego
=#
function rysujNnfx(f,a::Float64,b::Float64,n::Int)
  #poniewaz punkty maja byc rowno-odlegle obliczam wartosc o jaka bede zwiekszal kazdy nastepny argument funkcji
  h = (b - a) / n;

  #przygotowanie tablic dla argumentow (tablica x) oraz wartosci f(x) (tablica y)
  x = Array(Float64, n + 1);
  y = Array(Float64, n + 1);

  #obliczanie wartosci dla ww tablic
  for i=1 : n + 1
    x[i] = a + (i-1) * h;
    y[i] = f(x[i]);
  end

  #liczenie ilorazow roznicowych
  fx = ilorazyRoznicowe(x, y);

  #przygotowanie do rysowania wykresu.
  #Aby byl dokladniejszy obliczam wartosci w 201 punktach
  closeness = 201;
  functionResults = Array(Float64, closeness);
  interpResults = Array(Float64, closeness);

  #uzupelnienie tablic wartosciami funkcji interpolowanej oraz interpolujacej
  h1 = (b - a) / (closeness-1);
  for i=1 : closeness
    t = a + (i-1) * h1;
    functionResults[i] = f(t);
    interpResults[i] = warNewton(x, fx , t);
  end


  plot(linspace(a, b, closeness), functionResults, "b-", linewidth=1)
  plot(linspace(a, b, closeness), interpResults, "r-", linewidth=1)

end

end
