
// desenhar corpo
var _chara_y = (y + (2 * inwater));
if (inwater == false)
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
else
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width, (sprite_height - 2), (x - (sprite_width / 2) + 0.5), (_chara_y - (sprite_height - 2) - 2), xscale, yscale, image_blend, image_alpha);	
if (xscale < 1) || (yscale < 1)
{
	xscale = lerp(xscale, 1, 0.3);
	yscale = lerp(yscale, 1, 0.3);
}

// desenhar armadura e sombra do genocida
if (global.chara_facing != -1 && global.chara_facing != FALLEN && global.chara_facing != SIT) || (sprite_index == spr_chara_r_prejump) || (sprite_index == spr_chara_r_jump) || (sprite_index == spr_chara_r_fallhold) || (sprite_index == spr_chara_r_fall)
{
	var _extrayfactor = 0;
	if (image_index >= 1 && image_index < 2) || (image_index >= 3 && image_index < 4)
		_extrayfactor = 1;
	if (sprite_index == spr_chara_r_prejump) || (sprite_index == spr_chara_r_jump) || (sprite_index == spr_chara_r_fallhold) || (sprite_index == spr_chara_r_fall)
		_extrayfactor = 0;
	if (chara_murder() >= 1)
	{
		var _sprite = spr_chara_genoshadow;
		if (sprite_index == spr_chara_r_prejump) || (sprite_index == spr_chara_r_jump) || (sprite_index == spr_chara_r_fallhold) || (sprite_index == spr_chara_r_fall)
			_sprite = asset_get_index($"{sprite_get_name(sprite_index)}_genoshadow");
		draw_sprite_ext(_sprite, global.chara_facing, x, (y + _extrayfactor), xscale, yscale, image_angle, image_blend, (image_alpha * ((chara_murder() == 1) ? 0.5 : 1)));
	}
	var _armor = 0;
	var _armor_x = -20;
	var _armor_y = -20;
	if (global.chara_armor == ITEM_BOWL)
	{
		_armor = spr_mainchara_armor_candybowl;
		_armor_x = x;
		_armor_y = (_chara_y - (sprite_height * yscale) - 1);
		if (sprite_index == spr_chara_r_prejump)
			_armor_y += 2;
		if (sprite_index == spr_chara_r_jump)
		{
			_armor_x -= 1;
			_armor_y += 1;
		}
		if (sprite_index == spr_chara_r_fallhold)
			_armor_y += image_index;
	}
	_armor_y += _extrayfactor;
	if (_armor != 0 && _armor_x != -20 && _armor_y != -20)
		draw_sprite_ext(_armor, global.chara_facing, _armor_x, _armor_y, xscale, yscale, image_angle, image_blend, image_alpha);
}



/*
// image
var _chara_y = (y + (2 * inwater));
if (inwater == 0)
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
else
	draw_sprite_part_ext(sprite_index, image_index, 0, 0, sprite_width, (sprite_height - 2), (x - (sprite_width / 2) + 0.5), (_chara_y - (sprite_height - 2) - 2), xscale, yscale, image_blend, image_alpha);	
if (xscale < 1) || (yscale < 1)
{
	xscale = lerp(xscale, 1, 0.3);
	yscale = lerp(yscale, 1, 0.3);
}

// draw extra factors
if (global.chara_facing != -1 && global.chara_facing != FALLEN && global.chara_facing != SIT) || (sprite_index == spr_mainchara_r_prejump) || (sprite_index == spr_mainchara_r_jump) || (sprite_index == spr_mainchara_r_fallhold) || (sprite_index == spr_mainchara_r_fall)
{
	// get y factor
	var _extrayfactor = 0;
	if (image_index >= 1 && image_index < 2) || (image_index >= 3 && image_index < 4)
		_extrayfactor = 1;
		
	// draw geno shadow
	if (global.chara_murder >= 2)
		draw_sprite_ext(spr_mainchara_genoshadow, global.chara_facing, x, (_chara_y + _extrayfactor), xscale, yscale, image_angle, image_blend, image_alpha);
	
	// draw armor
	var _armor = 0;
	var _armor_x = -20;
	var _armor_y = -20;
	
	if (global.chara_armor == ITEM_BOWL)
	{
		_armor = spr_mainchara_armor_candybowl;
		_armor_x = x;
		_armor_y = (_chara_y - (sprite_height * myyscale) - 1);
		if (sprite_index == spr_mainchara_r_prejump)
			_armor_y += 2;
		if (sprite_index == spr_mainchara_r_jump)
		{
			_armor_x -= 1;
			_armor_y += 1;
		}
	}
	_armor_y += _extrayfactor;
	
	if (_armor != 0 && _armor_x != -20 && _armor_y != -20)
		draw_sprite_ext(_armor, global.chara_facing, _armor_x, _armor_y, xscale, yscale, image_angle, image_blend, image_alpha);
}
*/















/*
// get extra y factor to draw extra in sprite
var _extrayfactor = 0;
if (global.chara_facing != UP_KNIFE && (image_index >= 1 && image_index < 2) || (image_index >= 3 && image_index < 4))
	_extrayfactor = 1;
	
// draw geno shadow
if (global.chara_murder >= 2 && global.chara_facing != -1)
{
		
}

// draw armor
if (global.chara_armor != 2 && global.chara_facing != -1 && global.chara_facing != FALLEN && global.chara_facing != SIT)
{
	// get info
	var _myarmor = 0;
	var _myarmor_x = -20;
	var _myarmor_y = -20;
	var _myarmor_origy = -20;
	if (global.chara_armor == ITEM_CANDYBOWL)
	{
		_myarmor = spr_mainchara_armor_candybowl;
		_myarmor_x = x;
		_myarmor_origy = (y - (sprite_height * myyscale) - 1);	
	}
	_myarmor_y = (_myarmor_origy + _extrayfactor);
	
	// draw
	if (_myarmor != 0 && _myarmor_x != -20 && _myarmor_y != -20)
		draw_sprite_ext(_myarmor, global.chara_facing, _myarmor_x, _myarmor_y, myxscale, myyscale, image_angle, image_blend, image_alpha);
}
*/














