function item_organize()
{
	for (var i = 0; i < global.item_length; i++)
	{
		if (global.item[i] == -1 && i < global.item_last && global.item[(i + 1)] != -1)
		{
			global.item[i] = global.item[(i + 1)];
			global.item[(i + 1)] = -1;
		}
	}
}
function item_id(_item)
{
	var _id = argument0;
	var _idname = "none";
	if (_id == ITEM_STICK)
		_idname = "stick";
	if (_id == ITEM_BANDAGE)
		_idname = "bandage";
	if (_id == ITEM_CANDY)
		_idname = "candy";
	if (_id == ITEM_BOWL)
		_idname = "bowl";
	if (_id == ITEM_KUNAI)
		_idname = "kunai";
	if (_id == ITEM_CHOCO)
		_idname = "choco";
	if (_id == ITEM_PACE)
		_idname = "pace";
	return _idname;
}
function item_type(_item)
{
	var _id = argument0;
	var _type = ITEM_TYPE_CONSUMABLE;
	if (_id == ITEM_STICK) || (_id == ITEM_KUNAI)
		_type = ITEM_TYPE_WEAPON;
	if (_id == ITEM_BANDAGE) || (_id == ITEM_BOWL) || (_id == ITEM_PACE)
		_type = ITEM_TYPE_ARMOR;
	return _type;
}
function item_value(_item)
{
	var _id = argument0;
	var _value = 0;
	
	if (_id == ITEM_CANDY)
	{
		_value = 7;
		if (irandom_range(1, 7) == 7)
		{
			_value = 10;
			audio_play(snd_jingleSpell, false, VOLUME_SOUND);
		}
	}
	if (_id == ITEM_CHOCO)
		_value = 14;
	if (_id == ITEM_BOWL) || (_id == ITEM_KUNAI)
		_value = 3;
	if (_id == ITEM_PACE)
		_value = 6;
	return _value;
}
function item_name(_item, _type)
{
	var _name = "item_name_" + string(item_id(_item));
	if (_type != "" && get_text($"{_name}_{_type}") != "")
		_name += "_" + string(argument1);
	return get_text(_name);
}
function item_desc(_item)
{
	var _desc = "item_desc_" + string(item_id(argument0));
	return get_text(_desc);
}
function item_use()
{
	var _pos = -1;
	if (exists(obj_chara_menu) == true)
		_pos = obj_chara_menu.option_pos_old;
	if (global.inbattle == 1 && exists(obj_battle_controller) == true)
		_pos = obj_battle_controller.level_pos;
	var _item = global.item[_pos];
	if (item_type(_item) == ITEM_TYPE_CONSUMABLE)
	{
		var _amt = item_value(_item);
		chara_hp(_amt);
		global.chara_heals += 1;
		var _rest = string(get_text("item_use_1")) + string(_amt) + " HP;D.)";
		if (global.chara_curhp >= global.chara_maxhp)
			_rest = get_text("item_use_2")
		msg[0] = string(get_text("item_use_0")) + ":Y" + string(item_name(_item, "")) + ";D.)^3" + string(_rest);
		global.item[_pos] = -1;
	}
	if (item_type(_item) == ITEM_TYPE_WEAPON) || (item_type(_item) == ITEM_TYPE_ARMOR)
	{
		var _old = global.chara_weapon;
		if (item_type(_item) == ITEM_TYPE_ARMOR)
		{
			_old = global.chara_armor;
			global.chara_armor = _item;
		}
		else
			global.chara_weapon = _item;
		global.item[_pos] = _old;
		audio_play(snd_equip, 0, VOLUME_SOUND);
		msg[0] = string(get_text("item_equip")) + ":Y" + string(item_name(_item, "")) + ";D.)";
	}
}
function itemDropped_add(_item, _x = obj_chara.x, _y = obj_chara.y, _sprite = spr_itemDropped, _image = _item, _image_speed = 0, _depth = -_y)
{
	for (var i = 0; i < global.itemDropped_lengthMax; i++)
	{
		if (struct_names_count(global.itemDropped[i]) <= 0)
		{
			global.itemDropped[i] =
			{
				room : room,
				x : _x,
				y : _y,
				sprite : _sprite,
				image : _image,
				image_speed : _image_speed,
				item : _item,
			}
			break;
		}
	}
	return i;
}
function itemDropped_create(_index)
{
	var _itemDropped = global.itemDropped[_index];
	create(_itemDropped.x, _itemDropped.y, obj_interact_block);
	thisobj.visible = 1;
	//thisobj.depth = _itemDropped.depth;
	thisobj.sprite_index = _itemDropped.sprite;
	thisobj.image_speed = _itemDropped.image_speed;
	thisobj.image_index = _itemDropped.image;
	thisobj.result = 5;
	thisobj.itemDropped_arrayPos = _index;
}