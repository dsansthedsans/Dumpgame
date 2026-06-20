
if (type == 1)
{
	var _val = 255;
	var _y = (chara.y - 2);
	if (chara.x >= 220 && _y >= 400 && _y <= 599)
		_val = (255 * 0.59);
	
	val = lerp(val, _val, 0.2);
	chara.image_blend = make_color_hsv(0, 0, val);
}










/*
if (type == 1)
{
	var _length = 1;
	if (global.flag[2] == 1 && exists(obj_sidechara) == 1)
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
		if (_y > 120 && _y < 180)
		{
			if (_x >= 75)
				_dist = ((_x - 75) / 1);
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
*/