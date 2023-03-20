% Check validity of a solution by evaluating explicitly the 3 equations 
% defining a Dubins problem (in standard form)
function bool = check(s1, k0, s2, k1, s3, k2, th0, thf)
  x0 = -1;
  y0 = 0;
  xf = 1;
  yf = 0;

  eq1 = x0 + s1 * Dubins.sinc((1/2.) * k0 * s1) * cos(th0 + (1/2.) * k0 * s1) ...
           + s2 * Dubins.sinc((1/2.) * k1 * s2) * cos(th0 + k0 * s1 + (1/2.) * k1 * s2) ...
           + s3 * Dubins.sinc((1/2.) * k2 * s3) * cos(th0 + k0 * s1 + k1 * s2 + (1/2.) * k2 * s3) - xf;
  eq2 = y0 + s1 * Dubins.sinc((1/2.) * k0 * s1) * sin(th0 + (1/2.) * k0 * s1) ...
           + s2 * Dubins.sinc((1/2.) * k1 * s2) * sin(th0 + k0 * s1 + (1/2.) * k1 * s2) ...
           + s3 * Dubins.sinc((1/2.) * k2 * s3) * sin(th0 + k0 * s1 + k1 * s2 + (1/2.) * k2 * s3) - yf;
  eq3 = Dubins.rangeSymm(k0 * s1 + k1 * s2 + k2 * s3 + th0 - thf);

  Lpos = (s1 > 0) || (s2 > 0) || (s3 > 0);
  bool = (sqrt(eq1 * eq1 + eq2 * eq2 + eq3 * eq3) < 1.e-10) && Lpos;
end

