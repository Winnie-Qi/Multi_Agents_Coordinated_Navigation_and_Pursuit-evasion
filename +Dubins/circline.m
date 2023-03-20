function [x, y, th] = circline(s, x0, y0, th0, k)
  x = x0 + s * Dubins.sinc(k * s / 2.0) * cos(th0 + k * s / 2);
  y = y0 + s * Dubins.sinc(k * s / 2.0) * sin(th0 + k * s / 2);
  th = Dubins.mod2pi(th0 + k * s);
end
