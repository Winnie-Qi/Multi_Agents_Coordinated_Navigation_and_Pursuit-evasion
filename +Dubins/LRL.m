function [ok, sc_s1, sc_s2, sc_s3] = LRL(sc_th0, sc_thf, sc_Kmax)
  invK = 1 / sc_Kmax;
  C = cos(sc_thf) - cos(sc_th0);
  S = 2 * sc_Kmax + sin(sc_th0) - sin(sc_thf);
  temp1 = atan2(C, S);
  temp2 = 0.125 * (6 - 4 * sc_Kmax^2 + 2 * cos(sc_th0 - sc_thf) - 4 * sc_Kmax * (sin(sc_th0) - sin(sc_thf)));
  if (abs(temp2) > 1)
    ok = false; sc_s1 = 0; sc_s2 = 0; sc_s3 = 0;
    return;
  end
  sc_s2 = invK * Dubins.mod2pi(2 * pi - acos(temp2));
  sc_s1 = invK * Dubins.mod2pi(temp1 - sc_th0 + 0.5 * sc_s2 * sc_Kmax);
  sc_s3 = invK * Dubins.mod2pi(sc_thf - sc_th0 + sc_Kmax * (sc_s2 - sc_s1));
  ok = true;
end

