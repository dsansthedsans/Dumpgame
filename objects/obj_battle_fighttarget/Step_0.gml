if (speed != 0)
{
	speed += accel;
	if (controller.press_enter == 1)
	{
		x = round(x);
		speed = 0;
		image_speed = 0.4;
		alarm[0] = 1;
		theirdef = controller.enemy_def[target];
		mystat = (global.chara_wstrength + global.chara_atk);
		dmg = (mystat - theirdef);
		postx = x;
		if (x > 320)
			postx = (640 - x);
		xfactor = (postx / 320);
		dmg = (dmg * (xfactor * 3));
		xscale = 1.25;
		if (postx >= (320 - 10))
		{
			dmg *= 1.25;
			xscale = 1.5;
			blend = 0.25;
			audio_play(snd_bigcut, , VOLUME_SOUND);
		}
		yscale = xscale;
		dmg = round(clamp(dmg, 0, 999999999999999999));
		create(-20, -20, obj_battle_knife);
	}
	else if (side == -1 && x >= (controller.box_x + (controller.box_w / 2) - sprite_width)) || (side == 1 && x <= (controller.box_x - (controller.box_w / 2) + sprite_width))
	{
		dmg = 0;
		create(-20, -20, obj_battle_dmgwriter);
		controller.enemy_target = -1;
		destroy(id);
	}
}


