var _damage = false;
if (control.assist.active == true)
{
	touching = ds_list_create();
	touching_length = instance_place_list(x, y, obj_battle_blt, touching, true);
	if (touching_length > 0)
	{
	    for (var i = 0; i < touching_length; ++i)
	    {
			if (touching[| i].object_index == obj_battle_blt && touching[| i].active == true && touching[| i].can_damage == true)
			{
				_damage = true;
				image_alpha = 1;
				if (ds_list_find_index(touched, touching[| i]) == -1)
				{
					ds_list_add(touched, touching[| i]);
					with (control)
						assist.curr = clamp((assist.curr + assist.speed), 0, assist.max);
					audio_play(snd_battle_graze, 0, VOLUME_SOUND);
				}
			}
	    }
	}
	else	
		ds_list_clear(touched);
	ds_list_destroy(touching);
	
}
if (_damage == false && image_alpha > 0)
	image_alpha -= 0.05;