#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();

x = 1.0;     #wartość od ktorej zaczynać będziemy obliczenia
d = 1 / 2 ^ 52; #delta
k = 0;         #mnoznik delty

flag = true :: Bool;

while 1.0 + (k * d) == x && x <= 2.0
    k = k + 1;
    x = nextfloat(x);
    println(x);
end

if x >= 2.0
  println("everything ok");
elseif x < 2.0
  println("not ok");
end


println("the end");
