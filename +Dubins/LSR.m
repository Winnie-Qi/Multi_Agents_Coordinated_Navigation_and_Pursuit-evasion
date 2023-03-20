function [ok, sc_s1, sc_s2, sc_s3] = LSR(sc_th0, sc_thf, sc_Kmax)
  invK = 1 / sc_Kmax;
  C = cos(sc_th0) + cos(sc_thf);
  S = 2 * sc_Kmax + sin(sc_th0) + sin(sc_thf);
  temp1 = atan2(-C, S);
  temp3 = 4 * sc_Kmax^2 - 2 + 2 * cos(sc_th0 - sc_thf) + 4 * sc_Kmax * (sin(sc_th0) + sin(sc_thf));
  if (temp3 < 0)
    ok = false; sc_s1 = 0; sc_s2 = 0; sc_s3 = 0;
    return;
  end
  sc_s2 = invK * sqrt(temp3);
  temp2 = -atan2(-2, sc_s2 * sc_Kmax);
  sc_s1 = invK * Dubins.mod2pi(temp1 + temp2 - sc_th0);
  sc_s3 = invK * Dubins.mod2pi(temp1 + temp2 - sc_thf);
  ok = true;
end

