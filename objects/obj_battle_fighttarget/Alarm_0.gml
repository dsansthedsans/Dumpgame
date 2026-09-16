
if (exists(obj_battle_knife) == 0)
{
	controller.enemy_obj[target].hurt = 1;
	if (dmg > 0)
	{
		var _snd = snd_impactHit;
		if (controller.enemy_type[target] == 2000)
			_snd = snd_impactBump;
		audio_play(_snd, 0, VOLUME_SOUND);
		if (global.chara_weapon == ITEM_TRIDENT && x >= (320 - item_trident_lightningDistance) && x <= (320 + item_trident_lightningDistance) && controller.enemy_type[target] != 6)
			create(-20, -20, obj_battle_item_trident_lightning);
	}
	alarm[1] = 60;
}
else
	alarm[0] = 1;