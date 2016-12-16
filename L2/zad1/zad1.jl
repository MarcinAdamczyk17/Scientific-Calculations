#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();

global x64 = [2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995];
global y64 = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049];

global x32 = [Float32(2.718281828), Float32(-3.141592654), Float32(1.414213562), Float32(0.577215664), Float32(0.301029995)];
global y32 = [Float32(1486.2497), Float32(878366.9879), Float32(-22.37492), Float32(4773714.647), Float32(0.000185049)];


#--------------------------------------------------------------------------------\\
#dodawanie po kolei od piewrszego
function forward64(n)
  local S = 0.0;

  for i = 1 : n
    S = S + x64[i]*y64[i];
  end

  return S;
end

#--------------------------------------------------------------------------------\\
#dodawanie od konca
function backward64(n)
  local S = 0.0;

  for i = n : -1 : 1
    S = S + x64[i]*y64[i];
  end

  return S;
end
#--------------------------------------------------------------------------------\\
#najpierw o największej wartości bezwzglednej, oddzielnie dodatnie i ujemne
function maxFirst64(n)

  temp = Array{Float64}(n);

  for i = 1 : n
    temp[i] = x64[i] * y64[i];
  end

  sort!(temp);  #sortowanie w miejscu
  S1 = 0.0 :: Float64;  #suma ujemnych
  S2 = 0.0 :: Float64;  #suma dodatnich

  i = 0;  #bedzie wskazywal miejsce za ktorym nastepuje zmiana znaku danych w posortowanej tablicy
  while sign(temp[i + 1]) == -1
    S1 += temp[i + 1];
    i = i + 1;
  end

  for j = n : -1 : i + 1
    S2 += temp[j];
  end

  return S1 + S2;
end
#--------------------------------------------------------------------------------\\
#odwrotnie niz maxFirst
function minFirst64(n)

  temp = Array{Float64}(n);

  for i = 1 : n
    temp[i] = x64[i] * y64[i];
  end

  sort!(temp);  #sortowanie w miejscu
  S1 = 0.0 :: Float64;  #suma ujemnych
  S2 = 0.0 :: Float64;  #suma dodatnich

  i = 0;  #bedzie wskazywal miejsce zmiany znaku danych w posortowanej tablicy
  while sign(temp[i+1]) == -1
    i = i + 1;
  end

  for j = i : -1 : 1
    S1 += temp[j];
  end

  for j = i + 1 : n
    S2 += temp[j];
  end

  return (S1 + S2);
end
#--------------------------------------------------------------------------------\\
function forward32(n)
  local S = Float32(0.0);

  for i = 1 : n
    S += x32[i] * y32[i];
  end

  return Float32(S);
end
#--------------------------------------------------------------------------------\\
function backward32(n)
  local S = Float32(0.0);

  for i = n : -1 : 1
    S += x32[i] * y32[i];
  end

  return Float32(S);
end

#--------------------------------------------------------------------------------\\
function maxFirst32(n)

  temp = Array{Float32}(n);

  for i = 1 : n
    temp[i] = x32[i] * y32[i];
  end

  sort!(temp);
  S1 = Float32(0.0) :: Float32;
  S2 = Float32(0.0) :: Float32;

  i = 0;
  while sign(temp[i+1]) == -1
    S1 += temp[i+1];
    i = i + 1;
  end

  for j = n : -1 : i + 1
    S2 += temp[j];
  end

  return Float32(S1 + S2);
end
#--------------------------------------------------------------------------------\\
function minFirst32(n)

  temp = Array{Float32}(n);

  for i = 1 : n
    temp[i] = x32[i] * y32[i];
  end

  sort!(temp);  #sortowanie w miejscu
  S1 = Float32(0.0) :: Float32;  #suma ujemnych
  S2 = Float32(0.0) :: Float32;  #suma dodatnich

  i = 0;  #bedzie wskazywal miejsce zmiany znaku danych w posortowanej tablicy
  while sign(temp[i+1]) == -1
    i = i + 1;
  end

  for j = i : -1 : 1
    S1 += temp[j];
  end

  for j = i + 1 : n
    S2 += temp[j];
  end

  return (S1 + S2);
end
#--------------------------------------------------------------------------------\\
#=
println("forward 64: ", forward64(5));
println("backward 64: ", backward64(5));
println("maxFirst 64: ", maxFirst64(5););
println("minFirst 64: ", minFirst64(5););
println();
println("forward 32: ", forward32(5));
println("backward 32: ", backward32(5));
println("maxFirst 32: ", maxFirst32(5));
println("minFirst 32: ", minFirst32(5););
=#
