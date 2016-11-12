#MAIN
using PyPlot;

cArr=[-2.0,-2.0,-2.0,-1.0,-1.0,-1.0,-1.0];
xArr=[1.0, 2.0, 1.99999999999999, 1.0, -1.0, 0.75, 0.25];

results = zeros(7,40);

function printMatrix(A)
  for i=1:40
    for j=1:7
      @printf("%.10f ", A[j,i] );
    end
    println();
  end
end


for i=1:7
  x = xArr[i]
  c = cArr[i]
  for j=1:40
    x = (x^2) + c
    results[i,j] = x
  end
end

printMatrix(results)

plot(results)
