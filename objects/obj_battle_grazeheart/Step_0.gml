
var _damage = false;
var _list = ds_list_create();
var _length = instance_place_list(x, y, obj_battle_blt, _list, true);
if (_length > 0)
{
    for (var i = 0; i < _length; ++i)
    {
		if (_list[| i].active == true && _list[| i].can_damage == true)
		{
			_damage = true;
			break;
		}
    }
}
ds_list_destroy(_list);
if (_damage == true)
{
	if (image_alpha != 1)
		audio_play(snd_battle_graze, 0, VOLUME_SOUND);
	image_alpha = 1;	
}
else if (image_alpha > 0)
	image_alpha -= 0.05;