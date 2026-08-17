if (con == 1)
{
	con += 1;
	chara.x -= 10;
	chara.vspeed = -0.75;
	chara.image_speed = 0.2;
	chara.image_index = 1;
}
if (con == 2 && chara.y <= 195)
{
	con += 1;
	alarm[2] = 30;
	chara.vspeed = 0;
	chara_stop();
}
if (con == 4)
{
	writer("event_m6_meet_0", -1, -1);
	con += 1;
}
if (con == 5 && exists(thiswriter) == 0)
{
	con += 1;
	alarm[2] = 60;
	cutout_draw = true;
	audio_play(snd_heartpulse1, false, VOLUME_SOUND);
}
if (con == 7)
{
	writer("event_m6_meet_1", -1, -1);
	con += 1;
}