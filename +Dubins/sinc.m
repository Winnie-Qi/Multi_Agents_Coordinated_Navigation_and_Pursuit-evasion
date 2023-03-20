% Implementation of function sinc(t), returning 1 for t==0, and sin(t)/t
% otherwise
function s = sinc(t)
  if (abs(t) < 0.002)
    % For small values of t use Taylor series approximation
    s = 1 - t^2/6 * (1 - t^2/20);
  else
    s = sin(t)/t;
  end
end