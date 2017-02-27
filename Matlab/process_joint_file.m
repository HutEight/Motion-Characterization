function process_joint_file(fname, ofname, jnum, offset)
	M_input = csvread(fname);
	
	seq = M_input(:, 1);
	seq = ((seq - seq(1)) / 1000000000) - offset;
	joint = M_input(:, jnum);
	
	%j_max = max(joint);
	%y_max = max(pos_y);
	%z_max = max(pos_z);
	
	%j_min = min(joint);
	%y_min = min(pos_y);
	%z_min = min(pos_z);
	
	%min_norm = min(min(j_min, y_min), z_min);
	%maj_norm = max(max(j_max, y_max), z_max) - min_norm;
	
	%joint = (joint - min_norm) / maj_norm;
	%pos_y = (pos_y - min_norm) / maj_norm;
	%pos_z = (pos_z - min_norm) / maj_norm;
	%set(gca, 'YLim', [0, 0.05]);
	
	mask_1 = (seq >= 15 & seq <= 20);
	mask_2 = (seq >= 35 & seq <= 40);
	mask_3 = (seq >= 55 & seq <= 60);
	mask_4 = (seq >= 75 & seq <= 80);
	mask_5 = (seq >= 95 & seq <= 100);
	mask_6 = (seq >= 115 & seq <= 120);
	mask_7 = (seq >= 135 & seq <= 140);
	mask_8 = (seq >= 155 & seq <= 160);
	mask_9 = (seq >= 175 & seq <= 180);
	mask_10 = (seq >= 195 & seq <= 200);
	
	t_1 = seq(mask_1);
	j_1 = joint(mask_1);
	t_2 = seq(mask_2);
	j_2 = joint(mask_2);
	t_3 = seq(mask_3);
	j_3 = joint(mask_3);
	t_4 = seq(mask_4);
	j_4 = joint(mask_4);
	t_5 = seq(mask_5);
	j_5 = joint(mask_5);
	t_6 = seq(mask_6);
	j_6 = joint(mask_6);
	t_7 = seq(mask_7);
	j_7 = joint(mask_7);
	t_8 = seq(mask_8);
	j_8 = joint(mask_8);
	t_9 = seq(mask_9);
	j_9 = joint(mask_9);
	t_10 = seq(mask_10);
	j_10 = joint(mask_10);
	
	all_t = [t_1; t_2; t_3; t_4; t_5; t_6; t_7; t_8; t_9; t_10];
	all_j = [j_1; j_2; j_3; j_4; j_5; j_6; j_7; j_8; j_9; j_10];
	
	figure('Name', 'X');
	plot(seq, joint);
	hold on;
	plot(all_t, all_j);
	hold off;
	
	std_j_1 = std(j_1);
	avg_j_1 = mean(j_1);
	std_j_2 = std(j_2);
	avg_j_2 = mean(j_2);
	std_j_3 = std(j_3);
	avg_j_3 = mean(j_3);
	std_j_4 = std(j_4);
	avg_j_4 = mean(j_4);
	std_j_5 = std(j_5);
	avg_j_5 = mean(j_5);
	std_j_6 = std(j_6);
	avg_j_6 = mean(j_6);
	std_j_7 = std(j_7);
	avg_j_7 = mean(j_7);
	std_j_8 = std(j_8);
	avg_j_8 = mean(j_8);
	std_j_9 = std(j_9);
	avg_j_9 = mean(j_9);
	std_j_10 = std(j_10);
	avg_j_10 = mean(j_10);
	
	big_matrix = [avg_j_1, std_j_1;
		avg_j_2, std_j_2;
		avg_j_3, std_j_3;
		avg_j_4, std_j_4;
		avg_j_5, std_j_5;
		avg_j_6, std_j_6;
		avg_j_7, std_j_7;
		avg_j_8, std_j_8;
		avg_j_9, std_j_9;
		avg_j_10, std_j_10];
	
	csvwrite(ofname, big_matrix);
end