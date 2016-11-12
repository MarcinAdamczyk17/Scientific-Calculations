#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();
include("hilb.jl");
#using PyPlot
function printMatrix(A, n)
  for i=1:n
    for j=1:n
      @printf("%.15f ", A[i,j] );
    end
    println();
  end
end

function printVector(V, n)
  for i=1:n
    println(abs(V[i] - 1));
  end
  println();
end
#notacja taka jak w zadaniu: A - macierz n x n; b - wektor n-elementowy
for n=1:20
  A = hilb(n);
  x = ones(n);

  b = A * x;

  x = A\b;

  println(x)
  print("n = ",n, " ");
  printVector(x, n);

  #plot(x, "ro")
end
