% Create a structure representing a Dubins curve (composed by three arcs)
function d = dubinscurve(x0, y0, th0, s1, s2, s3, k0, k1, k2)
  d = struct();
  d.a1 = Dubins.dubinsarc(x0, y0, th0, k0, s1);
  d.a2 = Dubins.dubinsarc(d.a1.xf, d.a1.yf, d.a1.thf, k1, s2);
  d.a3 = Dubins.dubinsarc(d.a2.xf, d.a2.yf, d.a2.thf, k2, s3);
  d.L = d.a1.L + d.a2.L + d.a3.L;
end
