function angle = theta(x1,y1,x2,y2)
x3 = x1+1;
y3 = y1;
a2 = (x2-x1)*(x2-x1)+(y2-y1)*(y2-y1);
b2 = (x3-x1)*(x3-x1)+(y3-y1)*(y3-y1);
inner_product = (x2-x1)*(x3-x1)+(y2-y1)*(y3-y1);
cos_angle = inner_product/(sqrt(a2)*sqrt(b2));
if y2>=y1
    angle = acos(cos_angle); 
else
    angle = -acos(cos_angle); 
end

