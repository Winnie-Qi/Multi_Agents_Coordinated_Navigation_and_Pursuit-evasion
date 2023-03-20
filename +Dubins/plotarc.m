function plotarc(arc, color)
  npts = 100;
  pts = zeros(npts+1, 2);
  for j = 0:npts
    s = arc.L/npts * j;
    [x, y] = Dubins.circline(s, arc.x0, arc.y0, arc.th0, arc.k);
    pts(j+1, 1:2) = [x, y];
  end
  plot(pts(:, 1), pts(:, 2), 'Color', color, 'LineWidth', 4);
end
