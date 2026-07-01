
event_inherited();

if (global.flag[62] == 0)
{
	//global.chara_move = 0;
	//global.chara_facing = FALLEN;
	//global.chara_cutscene = 1;
	//global.chara_cameramove = 1;
	//global.chara_openmenu = 1;
	//global.chara_canpause = 1;
	//global.chara_world = WORLD_CAVERNS;
	//global.chara_curhp = 1;
	chara_facing(FALLEN);
	chara_change(-1, 0, 0, 1, 0, 0, 1);
	global.chara_curhp = 1;
	chara = obj_chara;
	getuptime = 150;
	fade_alpha = 1;
	chapter_alpha = 1;
	audio_play(snd_titleimpact, 0, VOLUME_SOUND);
	depth = -9999;
	alarm[5] = 210;
	aftercon = 1;
	alarm[2] = 180;
	con = 1;
}
else
	destroy(id);





