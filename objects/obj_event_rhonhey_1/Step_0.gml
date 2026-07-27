if (global.flag[66] == 0 && chara.bbox_top <= 980)
|| (global.flag[66] == 1 && chara.bbox_top <= 680)
|| (global.flag[66] == 2 && chara.bbox_top <= 200)
{
	var t = global.flag[66];
	global.flag[66] += 1;
	thing.objects[t].speed = thing.speeds[t];
	if (thing.directions[t] != undefined)
		thing.objects[t].direction = thing.directions[t];
	audio_play(thing.audio.assets[t], 0, VOLUME_SOUND, thing.audio.volumes[t], , , thing.audio.pitches[t]);
}
if (global.flag[66] == 3 && thing.objects[2] != undefined && exists(thing.objects[2]) == true)
{
	with (thing.objects[2])
	{
		speed += 0.05;
		direction = point_direction(x, y, obj_chara.x, obj_chara.bbox_top);
		if (place_meeting(x, y, obj_chara) == true && global.chara_move == true)
		{
			global.battle_nextgroup = 13;
			battle();
			audio_stop(other.thing.audio.assets[2]);
		}
	}
}