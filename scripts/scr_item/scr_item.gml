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
	switch (_item)
	{
		// "Broomstick"
		case ITEM_STICK:
		return "stick";
		break;
		// "Bandage"
		case ITEM_BANDAGE:
		return "bandage";
		break;
		// "Concrete Brick"
		case ITEM_BRICK:
		return "brick";
		break;
		// "Cheap Candy"
		case ITEM_CANDY:
		return "candy";
		break;
		// "Candy Bowl"
		case ITEM_BOWL:
		return "bowl";
		break;
		// "Enchanted Trident"
		case ITEM_TRIDENT:
		return "trident";
		break;
		// "Chocolate Bar"
		case ITEM_CHOCO:
		return "choco";
		break;
		// "Temporary Pacemaker"
		case ITEM_PACE:
		return "pace";
		break;
		// "Metal Brick"
		case ITEM_BRICK2:
		return "brick2";
		break;
		// None
		default:
		return "none";
		break;
	}
}
function item_type(_item)
{
	switch (_item)
	{
		// "Concrete Brick"; "Cheap Candy"; "Chocolate Bar"
		case ITEM_BRICK:
		case ITEM_CANDY:
		case ITEM_CHOCO:
		return ITEM_TYPE_CONSUMABLE;
		break;
		// "Broomstick"; "Enchanted Trident"
		case ITEM_STICK:
		case ITEM_TRIDENT:
		return ITEM_TYPE_WEAPON;
		break;
		// "Bandage"; "Candy Bowl"; "Temporary Pacemaker"
		case ITEM_BANDAGE:
		case ITEM_BOWL:
		case ITEM_PACE:
		return ITEM_TYPE_ARMOR;
		break;
		// None
		default:
		return ITEM_TYPE_NONE;
		break;
	}
}
function item_value(_item)
{
	switch (_item)
	{
		// "Broomstick"; "Bandage"
		case ITEM_STICK:
		case ITEM_BANDAGE:
		return 0;
		break;
		// "Cheap Candy"
		case ITEM_CANDY:
		var _extra = irandom_range(1, 7);
		if (_extra == 7)
			audio_play(snd_jingleSpell, false, VOLUME_SOUND);
		return (7 + (3 * (_extra == 7)));
		break;
		// "Candy Bowl"; "Enchanted Trident"
		case ITEM_BOWL:
		case ITEM_TRIDENT:
		return 3;
		break;
		// "Chocolate Bar"
		case ITEM_CHOCO:
		return 14;
		break;
		// "Temporary Pacemaker"
		case ITEM_PACE:
		return 6;
		break;
	}
}
function item_name(_item, _type)
{
	var _textID = $"item_name_{item_id(_item)}";
	var _textID_type = $"{_textID}_{_type}";
	if (_type != "" && textdata_get(_textID_type) != "")
		return textdata_get(_textID_type);
	return textdata_get(_textID);
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
		switch(_item)
		{
			// Brick
			case ITEM_BRICK:
			for (var i = 0; i < (1 + (chara_murder() < 1)); i++)
			{
				var _text_postfix = "_0";
				if (i == 0 && chara_murder() >= 1) || (i == 1 && exists(obj_battle_controller) == true && obj_battle_controller.battle_group == 1)
				{
					_text_postfix = "_1";
					if (i == 1)
					{
						msg_face[i] = spr_dialogface_m6_thinking;
						msg_sound[i] = snd_writer_m6_tense;
					}
				}
				msg[i] = textdata_get($"item_use_brick_{i}{_text_postfix}");
			}
			audio_play(snd_jingleHypnosis, false, VOLUME_SOUND);
			break;
			// All
			default:
			global.chara_heals += 1;
			chara_hp(item_value(_item));
			msg[0] = $"{textdata_get("item_use_0")} :Y{item_name(_item, "")};D.)^3&" + string((global.chara_curhp < global.chara_maxhp) ? $"{textdata_get("item_use_1")} :Y{item_value(_item)} HP;D.)" : $"{textdata_get("item_use_2")}");
			break;
		}
		global.item[_pos] = -1;
	}
	if (item_type(_item) == ITEM_TYPE_WEAPON) || (item_type(_item) == ITEM_TYPE_ARMOR)
	{
		if (item_type(_item) == ITEM_TYPE_WEAPON)
		{
			global.item[_pos] = global.chara_weapon;
			global.chara_weapon = _item;
		}
		else
		{
			global.item[_pos] = global.chara_armor;
			global.chara_armor = _item;
		}
		msg[0] = $"{textdata_get("item_equip")} :Y{item_name(_item, "")};D.)";
		audio_play(snd_equip, 0, VOLUME_SOUND);
	}
}
function item_info()
{
	for (var i = 0; i < 99; i++)
	{
		var _textID = $"item_info_{item_id(global.item[obj_chara_menu.option_pos_old])}_{i}";
		var _text = textdata_get(_textID);
		if (_text == undefined) || (_text == "Salenis")
			break;
		msg[i] = _text;
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