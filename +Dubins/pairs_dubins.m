function [pidx, curve] = pairs_dubins(x0, y0, th0, xf, yf, thf, Kmax)
  % Compute params of standard scaled problem
  [sc_th0, sc_thf, sc_Kmax, lambda] = Dubins.scaleToStandard(x0, y0, th0, xf, yf, thf, Kmax);

  % Define the functions corresponding to the different primitives, and the
  % corresponding curvatue signs 
  primitives = {@Dubins.LSL, @Dubins.RSR, @Dubins.LSR, @Dubins.RSL, @Dubins.RLR, @Dubins.LRL};
  ksigns = [
              1  0  1 % LSL
             -1  0 -1 % RSR
              1  0 -1 % LSR
             -1  0  1 % RSL
             -1  1 -1 % RLR
              1 -1  1 % LRL
           ];

  % Try all the possible primitives, to find the optimal solution
  pidx = -1;
  L = inf;
  for i = 1:numel(primitives)
    [ok, sc_s1_c, sc_s2_c, sc_s3_c] = primitives{i}(sc_th0, sc_thf, sc_Kmax);
    Lcur = sc_s1_c + sc_s2_c + sc_s3_c;
    if (ok && Lcur<L)
      L = Lcur;
      sc_s1 = sc_s1_c;
      sc_s2 = sc_s2_c;
      sc_s3 = sc_s3_c;
      pidx = i;
    end
  end

  curve = [];
  if pidx > 0
    % Transform the solution to the problem in standard form to the 
    % solution of the original problem (scale the lengths)  
    [s1, s2, s3] = Dubins.scaleFromStandard(lambda, sc_s1, sc_s2, sc_s3);
    
    % Construct the Dubins curve object with the computed optimal parameters
    curve = Dubins.dubinscurve(x0, y0, th0, s1, s2, s3, ksigns(pidx,1)*Kmax, ksigns(pidx,2)*Kmax, ksigns(pidx,3)*Kmax);
    
    % Check the correctness of the algorithm
    assert(Dubins.check(sc_s1, ksigns(pidx,1)*sc_Kmax, sc_s2, ksigns(pidx,2)*sc_Kmax, sc_s3, ksigns(pidx,3)*sc_Kmax, sc_th0, sc_thf));
  end

if pidx > 0
%   figure; axis equal;
  Dubins.plotdubins(curve, true, [1 0 0], [0 0 0], [1 0 0]);
  curve.a1
  curve.a2
  curve.a3
  curve.L
else
  fprintf('Failed!\n');
end
end