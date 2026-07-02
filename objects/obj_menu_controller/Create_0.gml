
/*
if (global.resetfile == 1)
{
	GAME_START();
	TEMPFILE_LOAD();
	global.fastmenu = 1;
}
*/
//PRESS ENTER TO SKIP GAME OVER TIPO HOLD ALT TO HIDE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
depth = -1000;
screenpos(0, 0);
if (global.savefile_selected != -1)
	start_maininfo();


global.menu_lvl = 0;
lvl = @"
		0 = Title
		1 = Select file
		2 = Settings
		3 = Achievements
		4 = Credits
		5 = Play (Continue)
		6 = Controls
		7 = Play (New game)
		";

started = 0;
startcon = 0;
startalpha = 1;


warning_text = get_text("warning");
warning_alpha = 0;


title_x[0] = 36;
title_x[1] = 103;
title_x[2] = 170;
title_x[3] = 262;
title_x[4] = 324;
title_x[5] = 386;
title_x[6] = 463;
title_x[7] = 554;
title_y = 215;
title_spr[0] = spr_menu_title_d;
title_spr[1] = spr_menu_title_u;
title_spr[2] = spr_menu_title_m1;
title_spr[3] = spr_menu_title_p;
title_spr[4] = spr_menu_title_g;
title_spr[5] = spr_menu_title_a;
title_spr[6] = spr_menu_title_m2;
title_spr[7] = spr_menu_title_e;
title_length = 0;
dumpgaem = irandom_range(1, 100);
if (dumpgaem == 1)
{
	title_spr[6] = spr_menu_title_e;
	title_spr[7] = spr_menu_title_m2;
	title_x[7] -= 29;
}


// opções e informações principais
move = 0;
alpha = 1;
option_pos = 0;
option_font = fnt_main_spaced_big;
option_alpha = 1;
event_user(0);


// outros principais
ovos = 0;
scroll_y = 0;
play_save = 0;
play_erase = 0;
play_continue = 0;
acid_siner = 0;
namer_state = 0;
credits_pos = 0;
achievement_pos = 0;
controls_changing = 0;


// outros
event_user(5);
particle_delay = 0;
leftnamer = 0;
fadingout = 0;
play_namey = 0;
continueback_surface = -1;
continueback_bcsiner = 0;
continueback_armsindex = 0;
if (global.fastmenu > 0)
{
	if (global.fastmenu == 0.5)
		global.fastmenu = 0;
	global.menu_lvl = 0;
	
	started = 1;
	startcon = 28;
	startalpha = 0;
	
	title_y = 70;
	title_length = 8;
	
	move = 1;
	alpha = 1;
	
	window_set_caption("Dumpgame");
	if (dumpgaem == 1)
		window_set_caption("Dumpgaem");
	audio_play(snd_dumpgame, 0, VOLUME_SOUND);
}


// partículas e efeitos
create(0, 0, obj_menu_bg);