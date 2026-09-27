con = 0;
control = obj_battle_controller;
if (exists(control) == true)
{
	depth = (control.battle_depth[8] - 50);
	enemy = control.enemy_obj[control.enemy_target];
	switch (control.enemy_type[control.enemy_target])
	{
		// Broken Clock
		case 6:
		con = 4;
		heart_x = enemy.body.x;
		heart_y = enemy.body.y;
		break;
		// Other
		default:
		con = 1;
		alarm[2] = round(60 * 1.5);
		heart_x = enemy.orig_x;
		heart_y = (enemy.orig_y - (enemy.sprite_height / 2));
		break;
	}
	heart_spr = spr_battle_heart;
	heart_xorig = heart_x;
	heart_yorig = heart_y;
	heart_alpha = 1;
	shard_amt = 6;
}
else
	destroy(id);