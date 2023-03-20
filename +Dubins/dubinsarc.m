% Create a structure representing an arc of a Dubins curve (straight or
% circular)
function c = dubinsarc(x0, y0, th0, k, L)
  c.x0 = x0;
  c.y0 = y0;
  c.th0 = th0;
  c.k = k;
  c.L = L;
  [c.xf, c.yf, c.thf] = Dubins.circline(L, x0, y0, th0, k);
end
