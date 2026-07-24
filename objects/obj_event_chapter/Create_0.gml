
event_inherited();

if (room == room_corridors_1 && global.flag[0] == 0) || (room == room_caverns_1 && global.flag[62] == 0)
{
	if (global.chara_armor == ITEM_BOWL)
	{
		itemDropped_add(ITEM_BOWL, 100, 160);
		global.chara_armor = -1;
	}
	chara_facing(FALLEN);
	chara_change(-1, 0, 0, 1, 0, 0, 0);
	chara = obj_chara;
	screenpos(0, (chara.y - (chara.sprite_height / 2) - 120));
	chara.y += 10;
	getuptime = (60 * 5);
	fade_alpha = 1;
	chapter_alpha = 1;
	chapter_outlineWidth = 0.5;
	audio_play(snd_titleimpact, 0, VOLUME_SOUND);
	depth = -9999;
	alarm[5] = 210;
	aftercon = 1;
	alarm[2] = (getuptime / 2);
	con = 1;
}
else
	destroy(id);





