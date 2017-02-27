rng(123);
M_1 = csvread('../Topics/a1.csv');
M_2 = csvread('../Topics/a2.csv');
M_3 = csvread('../Topics/a3.csv');

offset_1 = 4;
offset_2 = 3;
offset_3 = 48;

seq = M_1(:, 1);
seq = ((seq - seq(1)) / 1000000000) - offset_1;
pos_x = M_1(:, 11);
pos_y = M_1(:, 12);
pos_z = M_1(:, 13);

%mask_1 = (seq >= 1 & seq <= 9);
mask_2 = (seq >= 21 & seq <= 29);
mask_3 = (seq >= 41 & seq <= 49);
mask_4 = (seq >= 61 & seq <= 69);
mask_5 = (seq >= 81 & seq <= 89);
mask_6 = (seq >= 101 & seq <= 109);
mask_7 = (seq >= 121 & seq <= 129);
mask_8 = (seq >= 141 & seq <= 149);
mask_9 = (seq >= 161 & seq <= 169);
mask_10 = (seq >= 181 & seq <= 189);

mask = mask_2 | mask_3 | mask_3 | mask_4 | mask_5 | mask_6 | mask_7 | mask_8 | mask_9 | mask_10;

t_1 = seq(mask);
x_1 = pos_x(mask);
y_1 = pos_y(mask);
z_1 = pos_z(mask);

figure('Name', '1x');
plot(seq, pos_x);
hold on;
plot(t_1, x_1, '.');
xlabel('Time (sec)');
ylabel('X-Displacement (m)');
hold off;
figure('Name', '1y');
plot(seq, pos_y);
hold on;
plot(t_1, y_1, '.');
xlabel('Time (sec)');
ylabel('Y-Displacement (m)');
hold off;
figure('Name', '1z');
plot(seq, pos_z);
hold on;
plot(t_1, z_1, '.');
xlabel('Time (sec)');
ylabel('Z-Displacement (m)');
hold off;

seq = M_2(:, 1);
seq = ((seq - seq(1)) / 1000000000) - offset_2;
pos_x = M_2(:, 11);
pos_y = M_2(:, 12);
pos_z = M_2(:, 13);

%mask_1 = (seq >= 1 & seq <= 9);
mask_2 = (seq >= 21 & seq <= 29);
mask_3 = (seq >= 41 & seq <= 49);
mask_4 = (seq >= 61 & seq <= 69);
mask_5 = (seq >= 81 & seq <= 89);
mask_6 = (seq >= 101 & seq <= 109);
mask_7 = (seq >= 121 & seq <= 129);
mask_8 = (seq >= 141 & seq <= 149);
mask_9 = (seq >= 161 & seq <= 169);
mask_10 = (seq >= 181 & seq <= 189);

mask = mask_2 | mask_3 | mask_3 | mask_4 | mask_5 | mask_6 | mask_7 | mask_8 | mask_9 | mask_10;

t_2 = seq(mask);
x_2 = pos_x(mask);
y_2 = pos_y(mask);
z_2 = pos_z(mask);

figure('Name', '2x');
plot(seq, pos_x);
hold on;
plot(t_2, x_2);
hold off;
figure('Name', '2y');
plot(seq, pos_y);
hold on;
plot(t_2, y_2);
hold off;
figure('Name', '2z');
plot(seq, pos_z);
hold on;
plot(t_2, z_2);
hold off;

seq = M_3(:, 1);
seq = ((seq - seq(1)) / 1000000000) - offset_3;
pos_x = M_3(:, 11);
pos_y = M_3(:, 12);
pos_z = M_3(:, 13);

mask_1 = (seq >= 1 & seq <= 9);
mask_2 = (seq >= 21 & seq <= 29);
mask_3 = (seq >= 41 & seq <= 49);
mask_4 = (seq >= 61 & seq <= 69);
mask_5 = (seq >= 81 & seq <= 89);
mask_6 = (seq >= 101 & seq <= 109);
mask_7 = (seq >= 121 & seq <= 129);
mask_8 = (seq >= 141 & seq <= 149);
mask_9 = (seq >= 161 & seq <= 169);
%mask_10 = (seq >= 181 & seq <= 189);

mask = mask_1 | mask_2 | mask_3 | mask_3 | mask_4 | mask_5 | mask_6 | mask_7 | mask_8 | mask_9;

t_3 = seq(mask);
x_3 = pos_x(mask);
y_3 = pos_y(mask);
z_3 = pos_z(mask);

size(x_1)
size(z_2)

figure('Name', '3');
plot(seq, pos_x);
hold on;
plot(t_3, x_3);
hold off;

figure('Name', 'Circle 1');
scatter3(x_1, y_1, z_1);
hold on
scatter3(x_2, y_2, z_2);
scatter3(x_3, y_3, z_3);

xlabel('X-Displacement (m)');
ylabel('Y-Displacement (m)');
zlabel('Z-Displacement (m)');

%figure('Name', 'Circle 2');

%figure('Name', 'Circle 3');

pc1 = pointCloud([x_1, y_1, z_1]);
[plane_1, ~, ~, rms_1] = pcfitplane(pc1, 1000);%The plane-fitter insists on finite limits for the outliers, so I just set it to one kilometer.
plane_1.plot();

pc2 = pointCloud([x_2, y_2, z_2]);
[plane_2, ~, ~, rms_2] = pcfitplane(pc2, 1000);
plane_2.plot();

hold off;

dp = dot(plane_1.Normal, plane_2.Normal);

perpray = cross(plane_1.Normal, plane_2.Normal);

perp_y = polyfit(z_3, y_3, 1);
perp_x = polyfit(z_3, x_3, 1);

pvec = [perp_x(1), perp_y(1), 1.0] ./ norm([perp_x(1), perp_y(1), 1.0]);

dp
dp_ideal = dot(perpray, pvec)
dp_1 = dot(pvec, plane_1.Normal)
dp_2 = dot(pvec, plane_2.Normal)
rms_1
rms_2