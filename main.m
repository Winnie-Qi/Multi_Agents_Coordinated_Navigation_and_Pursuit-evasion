% Author: Weijie Qi
% Date: 02/2023

clc; clear all;

axis([0,10,0,10]);
daspect([1 1 1]);

n = input('Please enter the number of obstacles: ');
global obstacles;  
global empty;
global graph;
obstacles = {}; % the number of elements in the Cell equals the number of the obstacles
empty = {}; % the number of elements in the Cell equals the numbers of the free decomposed cells

% Obtain the number and vertex of obstacles through user input
for i=1:n
    n_i = input(strcat('Please enter the number of vertices of the no.', num2str(i),' obstacle: '));
    obstacle = zeros(n_i,2);
    for j=1:n_i
        [x,y] = ginput(1);
        hold on;
        plot(x,y,'b.');        
        obstacle(j,:) = [x,y];        
    end
    hold on;
    plot(polyshape(obstacle(:,1),obstacle(:,2)),'FaceColor','b');    
    obstacles =[obstacles;obstacle];    
end

quadtree([0 0;10 0;10 10;0 10]); % Quadtree cell decomposition

graph = graph_generation();
% graph:
% the number of elements in the Cell equals the numbers of the free decomposed cells
% in every Cell: 
% 1st column: center point of the this cell
% 2nd column: the row index of the cells connected to this cell
% 3rd column: the distances between this cell and its connected cells

% Obtain the starting point and the target point through user input
disp('Please enter the starting point');
[start_x,start_y] = ginput(1);
plot(start_x,start_y,'bx');
disp('Please enter the direction of the starting point');
[direction_x1,direction_y1] = ginput(1);
quiver(start_x,start_y,direction_x1-start_x,direction_y1-start_y,0,'b','LineWidth',1,'MaxHeadSize',1);
disp('Please enter the target point');
[target_x,target_y] = ginput(1);
plot(target_x,target_y,'rx');
disp('Please enter the direction of the target point');
[direction_x2,direction_y2] = ginput(1);
quiver(target_x,target_y,direction_x2-target_x,direction_y2-target_y,0,'b','LineWidth',1,'MaxHeadSize',1);

path = dijkstra(start_x,start_y);
% path: the row index of the last cell that closest to the starting point from the current cell

pivot_points = find_path(path,start_x,start_y,target_x,target_y); % sequence of points that connect from the start point to the target point

n = size(pivot_points,1);

% the input of the dubins curve: [x,y,¦È]
tripleInput_dubin = zeros(n,3);
tripleInput_dubin(:,1:2) = pivot_points;
tripleInput_dubin(1,3) = theta(start_x,start_y,direction_x1,direction_y1);
for i = 2:n-1
    tripleInput_dubin(i,3) = theta(pivot_points(i,1),pivot_points(i,2),pivot_points(i+1,1),pivot_points(i+1,2));
end
tripleInput_dubin(n,3) = theta(target_x,target_y,direction_x2,direction_y2);

% [pidx, curve] = Dubins.pairs_dubins(start_x,start_y, theta(start_x,start_y,direction_x1,direction_y1)...
%     , tripleInput_dubin(2,1),tripleInput_dubin(2,2), tripleInput_dubin(2,3), 3);
for i = 1:n-1    
    x0 = tripleInput_dubin(i,1);
    y0 = tripleInput_dubin(i,2);
    th0 = tripleInput_dubin(i,3);
    xf = tripleInput_dubin(i+1,1);
    yf = tripleInput_dubin(i+1,2);
    thf = tripleInput_dubin(i+1,3);
    [pidx, curve] = Dubins.pairs_dubins(x0, y0, th0, xf, yf, thf, 2);
    
end