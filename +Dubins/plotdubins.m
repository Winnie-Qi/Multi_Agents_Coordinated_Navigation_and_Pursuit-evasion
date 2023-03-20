function plotdubins(curve, decorations, c1, c2, c3)
%   currhold = ishold;
%   hold on;
  
  % Plot arcs
  Dubins.plotarc(curve.a1, c1);
  Dubins.plotarc(curve.a2, c2);
  Dubins.plotarc(curve.a3, c3);
  
  % Plot initial and final position and orientation
  if decorations
    plot(curve.a1.x0, curve.a1.y0, 'ob');
    plot(curve.a3.xf, curve.a3.yf, 'ob');
%     quiver(curve.a1.x0, curve.a1.y0, 0.1*curve.L*cos(curve.a1.th0), 0.1*curve.L*sin(curve.a1.th0), 'b', 'LineWidth', 2);
%     quiver(curve.a3.xf, curve.a3.yf, 0.1*curve.L*cos(curve.a3.thf), 0.1*curve.L*sin(curve.a3.thf), 'b', 'LineWidth', 2);
  end
  
%   if ~currhold
%     hold off;
%   end
end

