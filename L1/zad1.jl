#Obliczenia Naukowe
#Autor: Marcin Aamczyk
#nr indeksu: 221 429
workspace();

function myMacheps64()
  local x =1.0;
  while  1.0 + x/2 > 1.0
    x = x / 2.0;
  end
  println("my Float64 eps:  ",x);
end

function myMacheps32()
  local x = Float32(1.0);
  while  (Float32(1.0) + Float32(x/2)) > Float32(1.0)
    x = Float32(x) / 2.0;
  end
  println("my Float32 eps:  ",Float32(x));
end


function myMacheps16()
  local x = Float16(1.0);
  while  (Float16(1.0) + Float16(x/2)) > Float16(1.0)
    x = Float16(x) / 2.0;
  end
  println("my Float16 eps:  ",Float16(x));
end

function myEta64() :: Float64
  local x = 1.0;
  while x/2 > 0
    x /= 2;
  end
 return x;
end

function myEta32() :: Float32
  local x = Float32(1.0);
  while x / 2 > 0
    x = x / 2;
  end
  return Float32(x);
end

function myEta16() :: Float16
  local x = Float16(1.0);
  while Float16(x / 2) > 0
    x = Float16(x / 2);
  end
  return Float16(x);
end

function max64() :: Float64
  local x = prevfloat(1.0);

  while x * 2.0 != Inf
    x *= 2.0;
  end

  return x;
end

function max32() :: Float32
  local x = prevfloat(Float32(1.0));

  while !isinf(Float32(x * 2.0))
    x = x * 2.0;
  end

  return Float32(x);
end

function max16() :: Float16
  local x = prevfloat(Float16(1.0));

  while !isinf(Float16(x * 2.0))
    x = x * 2.0;
  end

  return Float16(x);
end



println("\nFloat64 eps:     ", eps(Float64));
myMacheps64();

println("\nFloat32 eps:     ", eps(Float32));
myMacheps32();

println("\nFloat16 eps:     ", eps(Float16));
myMacheps16();


println("\neta 64:    ", nextfloat(0.0));
println("my eta 64: ", myEta64());

println("\neta 32:    ", nextfloat(Float32(0.0)));
println("my eta 32: ", myEta32());

println("\neta 16:    ", nextfloat(Float16(0.0)));
println("my eta 16: ", myEta16());


println("\nrealmax 64:    ", realmax(Float64));
println("my realmax 64: ", max64());

println("\nrealmax 32:    ", realmax(Float32));
println("my realmax 32: ", max32());

println("\nrealmax 16:    ", realmax(Float16));
println("my realmax 16: ", max16());
