#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429

# MAIN
using Polynomials;
using PyPlot;

function printVector(V)
  for i=1:length(V)
    println(V[i]);
  end
  println();
end


data1=[1.0, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

data2=[1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0];

data3=[1.0, -210.0 - (1.0/(2.0^23)), 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

#tworzenie wielomianu P(x)
P = Poly(flipdim(data1, 1));
A = roots(P);

#println("\nwektor miejsc zerowych A:");
#printVector(A);

#show(P);

#tworzenie wielomianu p(x)
p = poly(data2);
B = roots(p);
#println("\nwektor miejsc zerowych B:");
#printVector(B);

#tworzenie wielomianu P(x) ze zmodyfikowanym wspolczynnikiem
MP = Poly(flipdim(data3, 1));
C = roots(MP)

#

println("\nDla postaci naturalnej wielomianu Wilkinsona");
for i=1:20
println("P(",i,") = ", P(A[i]))
end

println("\nDla wielomianu Wilkinsona");
for i=1:20
  println("p(",i,") = ", p(A[i]))
end

println("\nróżnice między wartościami roots() a rzeczywistymi");
for i=1:20
  println(A[i] - i)
end


println();

printVector(C);

println();

for i=1:20
  println("MP(",i,") = ", MP(C[i]))
end
  println();
for i=1:20
  println("p(",i,") = ", p(C[i]))
end
  println();
for i=1:20
  println("z(", i , ") - ", i , " = ", C[i] - i)
end
