clc;
clear;
close all;

%% description

% These datasets shows that in the computation of the worksapce it's
% important to consider the fact that the possible ranges of the actuators
% are different in each pose of the platform.

%% import data

% Three columns, representing:
%   --> x position of the platform;
%   --> y position of the platform;
%   --> roll angle of the platform.

% BAD DATA: cautelative in the middle, but imprecise at the left and right
% extremes. This data represents the case in which we don't consider that
% in some position of the platform the possible ranges for the actuators is
% less than in other points.
points_cloud_bad = load('Points_cloud_bad.csv');

% bad workspace x - y
bad_xy = points_cloud_bad(:,1:2);
% bad workspace x - angle
bad_xangle = points_cloud_bad(:,[1,3]);
% bad workspace y - angle
bad_yangle = points_cloud_bad(:,[2,3]);


% GOOD DATA: taking into account the fact that in each pose of the plaform
% the possible ranges for the actuators are different.
points_cloud_tot = load('Points_cloud_tot.csv');

% total workspace x - y
tot_xy = points_cloud_tot(:,1:2);
% total workspace x - angle
tot_xangle = points_cloud_tot(:,[1,3]);
% total workspace y - angle
tot_yangle = points_cloud_tot(:,[2,3]);

% volume boundary
[bound_idx, volume] = boundary(points_cloud_tot(:,1), points_cloud_tot(:,2), points_cloud_tot(:,3), 0.9);
bound_x = points_cloud_tot( bound_idx(:,1), 1);
bound_y = points_cloud_tot( bound_idx(:,2), 2);
bound_angle = points_cloud_tot( bound_idx(:,3), 3);
bounded = [bound_x, bound_y, bound_angle];

figure(1)
plot(bad_xy(:,1), bad_xy(:,2), 'or');
hold on
plot(tot_xy(:,1), tot_xy(:,2), 'o');
hold off

figure(2)
plot(tot_xy(:,1), tot_xy(:,2), 'o');

figure(3)
plot(tot_xangle(:,1), tot_xangle(:,2), 'o');

figure(4)
plot(tot_yangle(:,1), tot_yangle(:,2), 'o');

figure(5)
plot3(tot_xy(:,1), tot_xy(:,2), points_cloud_tot(:,3), 'o')

figure(6)
plot3(bounded(:,1),bounded(:,2), bounded(:,3),'o')