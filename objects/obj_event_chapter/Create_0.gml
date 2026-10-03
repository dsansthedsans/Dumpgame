
event_inherited();

if (room == room_corridors_1 && global.flag[0] == 0) || (room == room_cave_1 && global.flag[62] == 0 && global.flag[2] == false)
{
	if (global.chara_armor == ITEM_BOWL)
	{
		itemDropped_add(ITEM_BOWL, 120, (170 - 20));
		global.chara_armor = -1;
	}
	chara_facing(FALLEN);
	chara_change(-1, 0, 0, 1, 0, 0, 0);
	chara = obj_chara;
	screenpos(0, (chara.y - (chara.sprite_height / 2) - 120));
	chara.y += 10;
	getuptime = (60 * 5);
	fade_alpha = 1;
	chapter_alpha = 0;
	chapter_outlineWidth = 0.5;
	depth = -9999;
	alarm[3] = (getuptime / 2);
}
else
	destroy(id);





