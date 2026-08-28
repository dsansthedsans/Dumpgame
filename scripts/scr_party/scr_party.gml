
function party_create(_x, _y, _type, _startside)
{
	create(argument0, argument1, obj_party);
	thisobj.type = argument2;
	thisobj.startside = argument3;
	thisparty = thisobj;

	var i = 0;
	while (global.party[i] != -1)
		i += 1;
	global.party[i] = thisparty;
	thisparty.index = i;
}

function party_type(_type)
{
	sprite[LEFT, 0] = -1;
	sprite[RIGHT, 0] = -1;
	sprite[UP, 0] = -1;
	sprite[DOWN, 0] = -1;
	sprite[LEFT, 1] = -1;
	sprite[RIGHT, 1] = -1;
	sprite[UP, 1] = -1;
	sprite[DOWN, 1] = -1;
	if (argument0 == "m6")
	{
		sprite[LEFT, 0] = spr_m6_l_default;
		sprite[RIGHT, 0] = spr_m6_r_default;
		sprite[UP, 0] = spr_m6_u;
		sprite[DOWN, 0] = spr_m6_d_default;
		sprite[LEFT, 1] = spr_m6_l_defaultTalk;
		sprite[RIGHT, 1] = spr_m6_r_defaultTalk;
		sprite[UP, 1] = spr_m6_u_talk;
		sprite[DOWN, 1] = spr_m6_d_defaultTalk;
		sprite[SIT, 0] = spr_m6_d_defaultSit;
		sprite[SIT, 1] = sprite[SIT, 0];
		if (global.flag[37] == true && global.flag[38] == false)
		{
			sprite[LEFT, 0] = spr_m6_l_neutral;
			sprite[RIGHT, 0] = spr_m6_r_neutral;
			sprite[DOWN, 0] = spr_m6_d_neutral;
			sprite[LEFT, 1] = spr_m6_l_neutralTalk;
			sprite[RIGHT, 1] = spr_m6_r_neutralTalk;
			sprite[DOWN, 1] = spr_m6_d_neutralTalk;
			sprite[SIT, 0] = spr_m6_d_neutralSit;
			sprite[SIT, 1] = sprite[SIT, 0];
		}
	}
	debug("--- Created obj_party with type \"" + string(argument0) + "\"");
}

function party_change(_index, _movetype, _movetype_targetside)
{
	var i = argument0;
	global.party[i].movetype = argument1;
	global.party[i].targetside = argument2;
}

function party_facing(_index, _face)
{
	global.party[argument0].facing = argument1;
}
function party_stop(_index)
{
	var i = argument0;
	global.party[i].image_speed = 0;
	global.party[i].image_index = 0;
}


/*
function party_create(_x, _y, _id)
{
	i = 0;
	while (global.party[i] != -1)
		i += 1;
	
	global.party[i] = instance_create_layer(argument0, argument1, "Instances", obj_party);
	global.party[i].myself = i;
	global.party[i].type = argument2;
}
function party_type()
{
	// pegar sprites
	controller = obj_writer_controller;
	var _talking = 0;
	if (exists(controller) == 1 && controller.msg_talker[controller.page] == id)
		_talking = 1;
	
	sprite[LEFT]	= spr_chara_l;
	sprite[RIGHT]	= spr_chara_r;
	sprite[UP]		= spr_chara_u;
	sprite[DOWN]	= spr_chara_d;
	sprite[SIT]		= spr_chara_sit;
	
	if (type == "m6")
	{
		pos = 20;
		sprite[LEFT]	= spr_m6_l_default;
		sprite[RIGHT]	= spr_m6_r_default;
		sprite[UP]		= spr_m6_u;
		sprite[DOWN]	= spr_m6_d_default;
		sprite[SIT]		= spr_m6_d_defaultSit;
		if (_talking == 1)
		{
			sprite[LEFT]	= spr_m6_l_defaultTalk;
			sprite[RIGHT]	= spr_m6_r_defaultTalk;
			sprite[UP]		= spr_m6_u_talk;
			sprite[DOWN]	= spr_m6_d_defaultTalk;	
		}
	}
	
	// definir sprite
	var _facing = chara_face[pos];
	if (movement == 0)
		_facing = global.party_facing[myself];
	sprite_index = sprite[_facing];
}

function party_facing(_pos, _direction)
{
	global.party_facing[argument0] = argument1;
}
function party_change(_pos, _movement, _following, _flyside, _flylook)
{
	i = argument0;
	global.party[i].movement = argument1;
	global.party[i].following = argument2;
	global.party[i].flyside = argument3;
	global.party[i].flylook = argument4;
}
function party_stop(_pos)
{
	i = argument0;
	global.party[i].image_speed = 0;
	global.party[i].image_index = 0;
}
*/
