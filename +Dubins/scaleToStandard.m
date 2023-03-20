function [sc_th0, sc_thf, sc_Kmax, lambda] = scaleToStandard(x0, y0, th0, xf, yf, thf, Kmax)
  % find transform parameters
  dx = xf - x0;
  dy = yf - y0;
  phi = atan2(dy, dx);
  lambda = hypot(dx, dy)/2;

  % scale and normalize angles and curvature
  sc_th0 = Dubins.mod2pi(th0 - phi);
  sc_thf = Dubins.mod2pi(thf - phi);
  sc_Kmax = Kmax * lambda;
end
