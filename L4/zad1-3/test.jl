#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
using L4Module

#wynik powinien wynosić: [1.0,2.0,-0.375,0.175] (przykład z wykładu)
println("ilorazy roznicowe: ", ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]))

#wynik powinien wynosić: 1
println("wartosc wielomianu: ", warNewton([3.0, 1.0, 5.0, 6.0], ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0]) , 3.0))

#powinien zostać wkonany wykres funkcji |x|
rysujNnfx(x->abs(x), -1.0, 1.0, 5);
