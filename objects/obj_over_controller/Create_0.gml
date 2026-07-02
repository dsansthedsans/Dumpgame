
con = 0;
altcon = 0;
active = 1;
alpha = 1;

bg_spd = 0.05;
bg_alpha = 1;

heart_x = global.battle_heart_x;
heart_y = global.battle_heart_y;
heart_spr = spr_battle_heart;
heart_alpha = 1;
heart_color = global.c_dump;
heart_targetx = (room_width / 2);
heart_targety = (room_height / 1.5);

title_scale = 1;
title_xalign = (2 * title_scale);
var _middlex = ((room_width / 2) + ((9 * title_scale) / 2));
title_x[0] = (_middlex - (title_xalign / 2));
title_x[1] = (_middlex + (title_xalign / 2));
title_y = 70;
title_spr[0] = spr_gameover_title0;
title_spr[1] = spr_gameover_title1;
title_length = 0;

shard_amt = 6;

draw_set_font(fnt_main_big);
mainopt[0] = get_text("gameover_0");
mainopt[1] = "";
mainopt[2] = get_text("gameover_1");
for (var i = 0; i < 3; i++)
	mainopt_x[i] = ((room_width / 2) - 80 + (80 * i));
mainopt_y = (room_height / 1.5);
mainopt_pos = 1;
mainopt_leftmiddle = 0;

mainopt_heartx[0] = (mainopt_x[0] - string_width(mainopt[0]) - 20);
mainopt_heartx[1] = mainopt_x[1];
mainopt_heartx[2] = (mainopt_x[2] - 20);

var _hspace = (40 + sprite_get_width(spr_heart_small));
var _vspace = 30;
mainopt_bgx = (mainopt_heartx[0] + 20 - _hspace);
mainopt_bgy = (mainopt_y - (string_height(mainopt[0]) / 2) - _vspace);
mainopt_bgw = ((_hspace * 2) + string_width(mainopt[0]) + 160 + string_width(mainopt[2]));
mainopt_bgh = ((_vspace * 2) + string_height(mainopt[0]));

skipalpha = 0;

create(0, 0, obj_menu_bg);

depth = -1000;
image_alpha = 0;
alarm[2] = 80;

/*
mystage_alt = 0;
mydelay = 80;
myheart = spr_battle_heart;
myheartx = (room_width / 4);
myhearty = (room_width / 1.5);
myhearttargetx = (room_width / 2);
myhearttargety = (room_height / 1.5);
myheartcol = global.c_dump;
myheartalpha = 1;
myheartamt = 0.1;
mytitle = spr_gameover_title;
mytitlescale = 1;
mytitlex = round((room_width / 2) - (sprite_get_width(mytitle) * (mytitlescale / 2)))
mytitley = 80;
mytitlew = 0;
mytitleh = sprite_get_height(mytitle);
myshardamt = 4
fadealpha = 0;
*/