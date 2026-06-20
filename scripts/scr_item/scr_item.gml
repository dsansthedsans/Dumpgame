	
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

function item_id(_item) // manual
{
	var _id = argument0;
	var _idname = "";
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
	if (_id == ITEM_HELMET)
		_idname = "helmet";
	return _idname;
}
function item_type(_item)
{
	var _id = argument0;
	var _type = ITEM_TYPE_CONSUMABLE;
	if (_id == ITEM_STICK) || (_id == ITEM_KUNAI)
		_type = ITEM_TYPE_WEAPON;
	if (_id == ITEM_BANDAGE) || (_id == ITEM_BOWL) || (_id == ITEM_HELMET)
		_type = ITEM_TYPE_ARMOR;
	return _type;
}
function item_value(_item)
{
	var _id = argument0;
	var _value = 0;
	
	if (_id == ITEM_CANDY) || (_id == ITEM_HELMET)
		_value = 7;
	if (_id == ITEM_BOWL) || (_id == ITEM_KUNAI)
		_value = 3;
	if (_id == ITEM_CHOCO)
		_value = 12;
		
	return _value;
}

function item_name(_item, _type) // auto
{
	var _name = "item_name_" + string(item_id(argument0));
	if (argument1 != "" && get_text(string(_name) + "_" + string(argument1)) != "")
		_name += "_" + string(argument1);
	return get_text(_name);
}
function item_desc(_item)
{
	var _desc = "item_desc_" + string(item_id(argument0));
	return get_text(_desc);
}

function item_usepos()
{
	return obj_chara_menu.option_pos_old;
}
function item_use()
{
	var _pos = item_usepos();
	if (global.inbattle == 1)
		_pos = obj_battle_controller.level_pos;
	var _item = global.item[_pos];
	
	if (item_type(_item) == ITEM_TYPE_CONSUMABLE)
	{
		var _amt = item_value(_item);
		chara_hp(_amt);
		global.chara_heals += 1;
		
		var _rest = string(get_text("item_use_1")) + string(_amt) + " HP.)";
		if (global.chara_curhp >= global.chara_maxhp)
			_rest = get_text("item_use_2")
		msg[0] = string(get_text("item_use_0")) + string(item_name(_item, "")) + ".)^1" + string(_rest);
	
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
		
		msg[0] = string(get_text("item_equip")) + string(item_name(_item, "")) + ".)";
	}
}









































