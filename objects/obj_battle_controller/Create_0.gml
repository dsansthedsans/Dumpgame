
battle_lvl = 0;
battle_won = 0;
battle_flee = 1;
battle_group = 0;
battle_round = 0;
battle_music = mus_battle1;
battle_serious = 0;
battle_depth[0] = -1000; // battle_controller
battle_depth[1] = -800; // enemy & battle_vapor & battle_vaporpixel
battle_depth[2] = -900; // battle_knife & battle_dmgwriter & battle_sparecloud
battle_depth[3] = -1100; // battle_fightbar
battle_depth[4] = -1200; // battle_fighttarget
battle_depth[5] = -1300; // battle_danger
battle_depth[6] = -1400; // battle_blt
battle_depth[7] = -1500; // battle_heart
battle_depth[8] = -700; // battle_bg
battle_depth[9] = -2500; // battle_fadein
battle_oldmainmsg = "%%%";
battle_expreward = 0;
battle_mnyreward = 0;
battle_turntime = 0;
battle_usedact = 0;
battle_bg = -1;
depth = battle_depth[0];
x = -20;
y = -20;

createbubble = 0;
startattack = 0;
returnmain = 0;
fleeing = 0;

// button
button_spr[0] = spr_battle_button_fight;
button_spr[1] = spr_battle_button_act;
button_spr[2] = spr_battle_button_item;
button_spr[3] = spr_battle_button_mercy;
	
button_x[0] = 30;
button_x[1] = 183;
button_x[2] = 338;
button_x[3] = 493;
for (var i = 0; i < 4; i++)
	button_y[i] = round(432 - (sprite_get_height(button_spr[0]) / 4) + 0);

button_alpha = 1;
button_color[0] = #136641;
button_color[1] = global.c_dump;

button_pos = 0;
button_length = array_length(button_spr);
button_select = 1;

// gui
hp_color[0] = #FFDC31;
hp_color[1] = #DD2929;
gui_alpha = 1;

// box
box_x = round((room_width / 2) - 1);
box_y = round(room_width / 2);
box_w = 564;
box_h = 129;
box_nextx = box_x;
box_nexty = box_y;
box_nextw = box_w;
box_nexth = box_h;
box_defaultx = box_x;
box_defaulty = box_y;
box_defaultw = box_w;
box_defaulth = box_h;
box_borderw = 5;

// heart
heart = create(-20, -20, obj_battle_heart);
heart.controller = id;
heart_move = 0;
heart_nextx = box_nextx;
heart_nexty = box_nexty;

// enemy
enemy_length = 3;
enemy_target = -1;
for (var i = 0; i < enemy_length; i++)
{
	enemy_type[i] = 0;
	enemy_obj[i] = -1;
	enemy_spare[i] = 0;
	enemy_attack[i] = -1;
	attackobj[i] = -1;
	
	enemy_name[i] = "";
	enemy_curhp[i] = 0;
	enemy_maxhp[i] = 0;
	enemy_atk[i] = 0;
	enemy_def[i] = 0;
	enemy_reward_exp[i] = 0;
	enemy_reward_mny[i] = 0;
	for (var z = 0; z < 6; z++)
		enemy_act[i, z] = "";
	enemy_act[i, 0] = "Check";
}

battle_getgroup();
create(0, 0, obj_battle_bg);
battle_setupgroup();
battle_enemy();

// in-level
level_pos = 0;
level_pos_xfactor = 0;
level_pos_yfactor = 0;
level_length = 0;
level_heard = -1;

level_length[0] = 0;
level_length[1] = (enemy_length - 1);
level_length[2] = (enemy_length - 1);

level_curbarcolor[0] = #27CC84;
level_curbarcolor[1] = c_yellow;
level_maxbarcolor[0] = #DD2929;
level_maxbarcolor[1] = #B24A00//#CC6600;

create(-20, -20, obj_battle_fadein);
if ((enemy_type[0] == 0 && enemy_type[1] == 0 && enemy_type[2] == 0) == false)
	writer("battle_main", -1, -1);
screenpos(0, 0);

/*
// deltarune background custom
spamtontest_cart_x = (room_width / 7);
spamtontest_cart_siner = 0;
spamtontest_rail_x[0] = -room_width;
spamtontest_rail_x[1] = 0;
spamtontest_rail_x[2] = room_width;
*/