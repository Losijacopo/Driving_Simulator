points_cloud_0 = load('points_cloud_0.csv');

position = [points_cloud_0(:,1), points_cloud_0(:,2)];
x = position(:,1);
y = position(:,2);
angle = points_cloud_0(:,3);

[bound_idx, area_0] = boundary(x,y);
position_bound = [ x(bound_idx), y(bound_idx) ];