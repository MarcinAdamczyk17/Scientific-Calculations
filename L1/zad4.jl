#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();

#=
  Funkcja zaczynając od 1.0 przeszukuje w petli kolejne liczby (x) Float64 az do 2.0 w poszukiwaniu "anomalii" w postaci x*(1/x) != 1
  gdy taka znajdzie petla konczy swoje dzialanie a x zostaje wyswietlony w konsoli
=#

function findThatThing()
   local x = Float64(1.0);

   while x < 2.0 && (x * (1 / x) == 1)
     x = nextfloat(x);
   end

   println("x == ", x);
   println("x == ", bits(x));
   println("result == ", x * (1 / x));
 end

findThatThing();
