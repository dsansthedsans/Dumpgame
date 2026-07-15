
depth = -10000;
obj_chara.depth = -15000;

chara = obj_chara;
chara_color = 255;
myalpha = 0;
heart_x = chara.x;
heart_y = (chara.y - round(chara.sprite_height / 2));
heart_move = 0;
heart_alpha = 0;
heart_targetx = (camera_get_view_x(view_camera[0]) + round(50 / 2));
heart_targety = (camera_get_view_y(view_camera[0]) + round(451 / 2));
marker(heart_x, heart_y, spr_battle_heart, heart_alpha, 0.5, 0.5, 0, 0, 0, global.c_dump, -20000);
heart = thismarker;

switch_amt = 0;
switch_max = 6;

nobody = 0;
if (global.battle_nextgroup == 1) || (global.world_curpopulation[global.chara_world] <= 0 && global.battle_nextgroup == 0)
	nobody = 1;

audio_stop(snd_victory);
audio_stop(snd_option_movehold);
audio_stop(snd_impact);

alarm[0] = 1;