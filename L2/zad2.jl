#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();
include("hilb.jl");
using Plots
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
    @printf("%.5f ", V[i] );
  end
  println();
end
#notacja taka jak w zadaniu: A - macierz n x n; b - wektor n-elementowy
for n=20:20
  A = hilb(n);
  x = ones(n);

  b = A * x;

  x = A\b;
  print("n = ",n, " ");
  printVector(x, n);

  plot(x);
end
