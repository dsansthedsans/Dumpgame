// Levers
if (stage == 0)
{
	for (var l = 0; l < 2; l++)
	{
		if (levers[l].active == false && key("enter_press") == true && exists(chara) == true && point_distance(chara.x, (chara.y - (chara.sprite_height / 2)), (levers[l].object.x + (levers[l].object.sprite_width / 2)), (levers[l].object.y + (levers[l].object.sprite_height / 2))) <= 20 && global.chara_facing == UP && global.chara_move == true)
		{
			levers[l].active = true;
			audio_play(snd_heartpulse1, false, VOLUME_SOUND);
			if (levers[!l].active == true)
			{
				stage = 1;
				break;
			}
		}
	}
}
if (stage == 1)
{
	global.flag[50] = 0.5;
	chara_change(-1, false, false, true, false, false, true);
	stage = 2;
	alarm[2] = (60 + 15);
}
// Doors
if (stage == 3)
{
	chara_change(-1, true, true, true, false, false, true);
	if (is_undefined(doors[0].object) == false)
		doors[0].object.sprite_index = spr_overworld_bigdoor_open;
	doors[0].active = true;
	audio_play(snd_bluh, 0, VOLUME_SOUND);
	shakescreen(3, 3);
	timer.active = true;
	stage = 4;
}
// Timer
if (timer.active == true && timer.seconds > 0)
{
	timer.milliseconds -= 1;
	if (timer.milliseconds < 0)
	{
		timer.seconds = clamp((timer.seconds - 1), 0, timer.seconds);
		timer.milliseconds = ((timer.seconds > 0) ? 60 : 0);
		timer.color_green = 255;
		timer.scale = 1.25;
	}
}