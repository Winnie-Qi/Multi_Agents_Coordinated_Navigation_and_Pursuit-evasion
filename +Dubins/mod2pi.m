function out = mod2pi(ang)
  out = ang;
  while (out < 0)
    out = out + 2 * pi;
  end
  while (out >= 2 * pi)
    out = out - 2 * pi;
  end
end