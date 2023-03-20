function  pivot_points = find_path(path,start_x,start_y,target_x,target_y)

global graph;
global empty;
fastest_connect = [];
pivot_points = [];
len = size(path,1);
for i = 1:len % check which cell contains start point
    t = inpolygon(start_x,start_y,empty{i}(:,1),empty{i}(:,2));
    if t        
        start_cell = i;
        break;
    end
end

for i = 1:len % check which cell contains target point
    t = inpolygon(target_x,target_y,empty{i}(:,1),empty{i}(:,2));
    if t        
        target_cell = i;
        break;
    end
end

i = path(target_cell);
fastest_connect = [target_cell;fastest_connect];
while i ~= start_cell    
    fastest_connect = [i;fastest_connect];
    i = path(i);
end
fastest_connect = [i;fastest_connect];

n = length(fastest_connect);

% save sequence of center points of the fastest connected cells
for i = 1:n
    pivot_points = [pivot_points; [graph{fastest_connect(i),1}(1),graph{fastest_connect(i),1}(2)]];
end

% check if the second point and the penultimate point are necessary
% x2 = pivot_points(1,1); y2 = pivot_points(1,2);
% x3 = pivot_points(2,1); y3 = pivot_points(2,2);
% t = angle(start_x,start_y,x2,y2,x3,y3);
% if t
pivot_points(1,:) = [start_x,start_y];
% else
%     pivot_points = [[start_x,start_y];pivot_points];
%     n = n+1;
% end
% px2 = pivot_points(n-1,1); py2 = pivot_points(n-1,2);
% px1 = pivot_points(n,1); py1 = pivot_points(n,2);
% t = angle(target_x,target_y,px1,py1,px2,py2);
% if t
pivot_points(n,:) = [target_x,target_y];
% else
%     pivot_points = [pivot_points;[target_x,target_y]];
% end
% 
% n = length(pivot_points);

% plot
for i = 1:n-1
    plot([pivot_points(i,1),pivot_points(i+1,1)],[pivot_points(i,2),pivot_points(i+1,2)],'g','LineWidth',1);  
end