function [s1, s2, s3] = scaleFromStandard(lambda, sc_s1, sc_s2, sc_s3)
  s1 = sc_s1 * lambda;
  s2 = sc_s2 * lambda;
  s3 = sc_s3 * lambda;
end
