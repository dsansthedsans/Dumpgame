if (exists(obj_battle_item_trident_lightning) == true && controller.enemy_target == myself && global.visualeff == true && item_trident_lightningFog == true)
	gpu_set_fog(true, c_white, 0, 0);