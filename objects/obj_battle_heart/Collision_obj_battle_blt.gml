
// take damage
if (invtime <= 0 && other.active == 1 && exists(controller) == true && controller.fleeing == 0)
{
	if (other.can_damage == 1)
	{
		var _dmg = clamp((other.dmg - floor((global.chara_def + global.chara_astrength - 10) / 2)), 0, global.chara_maxhp);
		global.chara_curhp = clamp((global.chara_curhp - _dmg), 0, global.chara_maxhp);
		if (global.chara_curhp <= 0)
		{
			persistent = true;
			room_goto(room_over);
		}
		else
			image_speed = 0.4;
		audio_play(snd_battle_hurt, 0, VOLUME_SOUND);
		shakescreen(3, 3);
		invtime = 60;
	}
	if (other.destroy_on_impact == 1)
		destroy(other);
}