if (con == 1)
{
	heart_x = (heart_xorig + (irandom(2) * choose(-1, 1) * global.visualeff));
	heart_y = (heart_yorig + (irandom(2) * choose(-1, 1) * global.visualeff));
}
if (con == 2)
{
	con += 1;
	alarm[2] = round(60 * 1.25);
	heart_spr = spr_battle_heart_break;
	audio_play(snd_breakSplit, false, VOLUME_SOUND, 0.5);
}
if (con == 4)
{
	heart_alpha = 0;
	audio_play(snd_breakPieces, 0, VOLUME_SOUND, 0.5);
	shard = [];
	for (var i = 0; i < shard_amt * global.visualeff; i++)
	{
		shard[i] = instance_create_layer(heart_x, heart_y, "Instances", obj_marker);
		with (shard[i]) 
		{
			sprite_index = spr_battle_heart_break;
			image_speed = 0;
			image_index = irandom_range(1, 3);
			image_blend = c_white;
			direction = irandom_range(0, 360);
			gravity = 0.1;
			depth = other.depth;
			speed = 3;
		}
	}
	con += 1;
}
if (con == 5)
{
	for (var i = 0; i < array_length(shard) * global.visualeff; i++)
	{
		if (exists(shard[i]) == true)
		{
			if (shard[i].x < (room_width / 2))
				shard[i].image_angle -= shard_amt;
			else
				shard[i].image_angle += shard_amt;
			if (shard[i].y >= (room_height + 40))
			{
				destroy(shard[i]);
				array_delete(shard, i, 1);
			}
		}
	}
	if (array_length(shard) <= 0)
	{
		debug("change da world. my final message. Goodb ye");
		destroy(id);
	}
}