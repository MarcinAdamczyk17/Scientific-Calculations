#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();
include("hilb.jl");
include("matcond.jl");
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

println("\n HILBERT MATRIX \n");
result = 0.0;
for n=1:20
  A = hilb(n);
  x = ones(n);

  b = A * x;

  result1 = A\b;
  result2 = inv(A) * b;
  println(rank(A));
  println(cond(A))
  println(norm(x - result1)/norm(x));
  println(norm(x - result2)/norm(x));
  println();
  print("n = ",n, " ");
  printVector(x, n);

  #plot(x, "ro")
end

println("\n RANDOM MATRIX \n");
cArr = [0.0, 1.0, 3.0, 7.0, 12.0, 16.0];
nArr = [5, 10, 20];

for i=1:3
  for j=1:6
    A = matcond(nArr[i], 10.0 ^ cArr[j]);
    x = ones(nArr[i]);

    b = A * x;

    result1 = A\b;
    result2 = inv(A) * b;
    println(rank(A));
    println(cond(A))
    println(nArr[i])
    println(norm(x - result1)/norm(x));
    println(norm(x - result2)/norm(x));
    println();
  end
end
