function [vector] = p()
  vector = [0:255];
  for i = 1 : 1 : 256
    vector(i) = pAux(i-1, 255);
  end
end

function [y] = pAux(x, L)
  l = L / 2;
  o = L / 4;
  y = 1 / (o*sqrt(pi)) * exp( -0.5 * ((x-l)/o) * ((x-l)/o) );
end