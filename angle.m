function t = angle(x1,y1,x2,y2,x3,y3)
% if angle at point2 bigger than pi/2 return true
t = false;
a2 = (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
b2 = (x3-x2)*(x3-x2)+(y3-y2)*(y3-y2);
c2 = (x1-x3)*(x1-x3)+(y1-y3)*(y1-y3);
a = sqrt(a2);
b = sqrt(b2);
c = sqrt(c2);
pos = (a2+b2-c2)/(2*a*b);   
angle = acos(pos);         
if angle < pi/2
    t = true;
end
end

