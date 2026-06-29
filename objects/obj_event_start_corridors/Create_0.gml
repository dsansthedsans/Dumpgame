
event_inherited();

if (global.flag[0] == 0)
{
	chara_facing(FALLEN);
	chara_change(-1, 0, 0, 1, 0, 0, 0);
	
	chara = obj_chara;
	screenpos(0, (chara.y - (chara.sprite_height / 2) - 120));
	chara.y += 10;
	getuptime = (60 * 5);
	fade_alpha = 1;
	section_alpha = 1;
		
	audio_play(snd_titleimpact, 0, VOLUME_SOUND);
	depth = -9999;
	alarm[5] = 210;
	aftercon = 1;
	alarm[2] = (getuptime / 2);
	con = 1;
	
	/*
	if (global.hasfile == 1 && global.achievement[ACHIEVEMENT_RESTART] == 0)
	{
		global.achievement[ACHIEVEMENT_RESTART] = 1;
		create_notification("restart");
	}
	*/
}
else
	destroy(id);





