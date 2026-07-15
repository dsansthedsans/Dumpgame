
// button control
for (var w = 0; w < 3; w++)
{	
	for (var h = 0; h < 3; h++)
	{
		if (buttons_press == 1)
		{
			// button touch
			if (mybutton_pressed[w, h] == 0)
			{
				with (mybutton_obj[w, h])
				{
					if (place_meeting(x, y, obj_chara) == 1)
					{
						image_index = 1;
						audio_stop(snd_heartpulse1);
						audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
						with (parent)
						{
							mywrite += myletter[w, h];
							mybutton_pressed[w, h] = 1;
						}
					}
				}
			}
		
			// reset button touch
			with (resetbutton_obj)
			{
				if (place_meeting(x, y, obj_chara) == 1 && parent.resetbutton_pressed == 0)
				{
					image_index = 3;
					parent.mywrite = "";
					parent.resetbutton_pressed = 1;
					audio_stop(snd_heartpulse1);
					audio_play(snd_heartpulse1, 0, VOLUME_SOUND);
					for (var i = 0; i < 3; i++)
					{	
						for (var z = 0; z < 3; z++)
						{
							parent.mybutton_obj[i, z].image_index = 0;
							parent.mybutton_pressed[i, z] = 0;
						}
					}
				}
				else if (place_meeting(x, y, obj_chara) == 0 && parent.resetbutton_pressed == 1)
				{
					image_index = 2;
					parent.resetbutton_pressed = 0;	
				}
			}
		}
		else
		{
			mybutton_obj[w, h].image_index = 1;
			mybutton_pressed[w, h] = 1;
			
			resetbutton_obj.image_index = 3;
			resetbutton_pressed = 1;
			
			myscreen_write_color[0] = global.c_dump;
			myscreen_write_color[1] = #1E994E;
		}	
	}
}

// victory
if (victory_delay <= 0)
{
	if (victory == 0.2)
	{
		victory = 1;
		global.flag[15] = 1;
		global.chara_move = 1;
		shakescreen(0, 5);
		audio_play(snd_bluh, 0, VOLUME_SOUND);
		if (audio_playing(victorysound) == true)
			audio_stop(victorysound);
	}
	if (victory == 0.1)
	{
		buttons_press = 0;
		if (room == room_corridors_5_A)
			global.flag[11] = 1;
		else
			global.flag[14] = 1;
		victorysound = snd_victory;
		if (room == room_corridors_5_B)
			victorysound = snd_victory_wrong;
		victorysound = audio_play(victorysound, 0, VOLUME_SOUND);
		/*if (room == room_corridors_5_B)
		{
			audio_pitch(victorysound, victorypitch);
			peachy = 1;
		}*/
		if (global.flag[11] == 1 && global.flag[14] == 1)
		{
			victory = 0.2;
			victory_delay = 45;
			if (room == room_corridors_5_B)
				victory_delay *= 2;
		}
		else
		{
			victory = 1;
			global.chara_move = 1;
		}
	}
	if (mywrite == myword && victory == 0)
	{
		victory = 0.1;
		victory_delay = 60;
		global.chara_move = 0;
		chara_stop();
	}
}
else
	victory_delay -= 1;

/*if (victorysound != -1 && audio_playing(victorysound) == true && room == room_corridors_5_B)
{
	victorypitch = lerp(victorypitch, 0.25, 0.01);
	audio_pitch(victorysound, victorypitch);
}*/