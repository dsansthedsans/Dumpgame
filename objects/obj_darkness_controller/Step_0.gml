if (type == 1)
{
	for (var i = 0; i < (1 + (global.flag[2] == 1 && global.party[0] != -1 && exists(global.party[0]) == true)); i++)
	{
		var _obj = chara;
		var _val = "val";
		if (i == 1)
		{
			_obj = m6;
			_val = "m6_val";
		}
		var _valNew = 255;
		if (_obj.x >= 210 && ((_obj.y-2 >= 360 && _obj.y-2 <= 400) || (_obj.y-2 >= 600 && _obj.y-2 <= 660)))
			_valNew = (255 * (1 - (0.6 * ((_obj.x - 210) / 100))));
		if (_obj.x >= 210 && _obj.y-2 >= 400 && _obj.y-2 <= 599)
			_valNew = (255 * 0.4);
		variable_instance_set(id, _val, lerp(variable_instance_get(id, _val), _valNew, 0.35));
		_obj.image_blend = make_color_hsv(0, 0, variable_instance_get(id, _val));
	}
}
if (type == 2)
{
	var _length = 1;
	if (global.flag[2] == 1 && exists(obj_party) == 1)
		_length = 2;
	for (var i = 0; i < _length; i++)
	{
		var _x = chara.x;
		var _y = chara.y;
		var _value = chara_colorvalue;
		var _color = chara_curcolor;
		var _instance = chara;
		if (i == 1)
		{
			_x = m6.x;
			_y = m6.y;
			_value = m6_colorvalue;
			_color = m6_curcolor;
			_instance = m6;
		}
	
		var _dist = 0;
		if (_y >= 120 && _y < 160 + 5)
		{
			if (_x >= 75)
				_dist = ((_x - 75) / 0.75);
			_value = (255 - _dist);
		}
		else
		{
			_dist = ((_x - 39) / 1.5);
			_value = (120 - _dist);
		}
		_color = lerp(_color, _value, 0.3);
		var _rgbcolor = make_color_rgb(_color, _color, _color);
		_instance.image_blend = _rgbcolor;
	
		if (i == 0)
		{
			chara_colorvalue = _value;
			chara_curcolor = _color;
		}
		else
		{
			m6_colorvalue = _value;
			m6_curcolor = _color;
		}
	}
}
if (type == 3)
{
	for (var o = 0; o < instance_number(all); o++)
	{
		var _object = instance_find(all, o);
		_object.image_blend = c_white
		if (_object.sprite_index != spr_overworld_brokenfloor && _object.x <= (leftX + 2)) || (_object.x >= (rightX - 2)) || (_object.y <= (topY + 2)) || (_object.y >= (bottomY - 2))
			_object.image_blend = c_gray;
	}
}