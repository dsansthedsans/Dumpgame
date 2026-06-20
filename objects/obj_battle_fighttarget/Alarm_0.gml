
if (exists(obj_battle_knife) == 0)
{
	controller.enemy_obj[target].hurt = 1;
	if (dmg > 0)
	{
		var _snd = snd_enemy_hit;
		if (controller.enemy_type[target] == -2000)
			_snd = snd_bump;
		audio_play(_snd, 0, VOLUME_SOUND);
	}
	alarm[1] = 60;
}
else
	alarm[0] = 1;