
// take damage
if (invtime <= 0 && other.active == 1 && exists(controller) == true && controller.fleeing == 0)
{
	if (other.can_damage == 1)
	{
		var _dmg = clamp((other.dmg - floor((global.chara_def + global.chara_astrength - 10) / 2)), 1, global.chara_maxhp);
		if (global.chara_armor == ITEM_BOWL && irandom_range(1, 7) == 7)
			_dmg = 0;
		if (_dmg > 0)
		{
			audio_play(snd_impactHurt, 0, VOLUME_SOUND);
			shakescreen(3, 3);
		}
		else
			audio_play(snd_impactBump, 0, VOLUME_SOUND);
		global.chara_curhp = clamp((global.chara_curhp - _dmg), 0, global.chara_maxhp);
		if (global.chara_curhp > 0)
		{
			image_speed = 0.4;
			invtime = chara_invtime();
		}
		else
		{
			persistent = true;
			room_goto(room_over);
		}
	}
	if (other.destroy_on_impact == 1)
		destroy(other);
}