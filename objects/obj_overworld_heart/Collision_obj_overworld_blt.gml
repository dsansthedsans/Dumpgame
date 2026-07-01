
if (canhurt == 1 && invtime <= 0 && other.active == 1)
{
	image_speed = 0.4;
	global.chara_curhp -= other.dmg;
	global.chara_curhp = clamp(global.chara_curhp, 0, global.chara_maxhp);
	audio_play(snd_battle_hurt, 0, VOLUME_SOUND);
	shakescreen(2, 2);
	destroy(other);
	invtime = 60;
}