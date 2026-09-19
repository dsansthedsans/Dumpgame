con = 0;
if (exists(obj_battle_controller) == true)
{
	con = 1;
	alarm[2] = round(60 * 1.5);
	enemy = obj_battle_controller.enemy_obj[obj_battle_controller.enemy_target];
	depth = (obj_battle_controller.battle_depth[8] - 50);
	heart_spr = spr_battle_heart;
	heart_x = enemy.orig_x;
	heart_y = (enemy.orig_y - (enemy.sprite_height / 2));
	heart_xorig = heart_x;
	heart_yorig = heart_y;
	heart_alpha = 1;
	shard_amt = 6;
}
else
	destroy(id);