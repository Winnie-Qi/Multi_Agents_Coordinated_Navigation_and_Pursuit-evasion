% Normalize an angular difference (range (-pi, pi])
function out = rangeSymm(ang)
  out = ang;
  while (out <= -pi)
    out = out + 2 * pi;
  end
  while (out > pi)
    out = out - 2 * pi;
  end
end

