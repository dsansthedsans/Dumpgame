
if (controller.press_enter == 1 && speed != 0)
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
	dmg = round(dmg * (xfactor * 3));
	dmg = clamp(dmg, 0, 999999999999999999);
	audio_play(snd_battle_knife_hit, 0, VOLUME_SOUND);
	create(-20, -20, obj_battle_knife);
}
else if (side == -1 && x >= (controller.box_x + (controller.box_w / 2) - sprite_width)) || (side == 1 && x <= (controller.box_x - (controller.box_w / 2) + sprite_width))
{
	dmg = 0;
	create(-20, -20, obj_battle_dmgwriter);
	controller.enemy_target = -1;
	destroy(id);
}