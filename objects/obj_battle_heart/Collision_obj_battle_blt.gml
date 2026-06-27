
if (invtime <= 0 && controller.fleeing == 0 && other.active == 1) // take damage
{
	if (other.can_damage == 1)
	{
		var _dmg = other.dmg;
		for (var i = 0; i < 6; i++)
		{
			if (global.chara_curhp >= (30 + (10 * i)))
				_dmg += 1;
		}
		var _dmgamt = round(_dmg - (global.chara_def + global.chara_astrength) / 5);
		if (_dmgamt < 0)
			_dmgamt = 0;
	
		image_speed = 0.4;
		global.chara_curhp -= _dmg;
		global.chara_curhp = clamp(global.chara_curhp, 0, global.chara_maxhp);
		audio_play(snd_battle_hurt, 0, VOLUME_SOUND);
		shakescreen(3, 3);
		invtime = 60;
	}
	if (other.destroy_on_impact == 1)
	{
		debug("IMPOSIVVELLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL");
		destroy(other);
	}
}