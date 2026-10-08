
// folhas das árvores
for (var i = 0; i < instance_number(obj_overworld_solid) * global.visualeff; i++)
{
	treeobj = instance_find(obj_overworld_solid, i);
	if (treeobj.leaf_fall == 1 && treeobj.leaf_create == 1)
	{
		var _x = (treeobj.x + 30 + choose(irandom_range(-11, -20), irandom_range(11, 20)));
		var _y = (treeobj.y + 35);
		create(_x, _y, obj_particle_leaf);
		thisobj.maxy = (treeobj.y + treeobj.sprite_height - 4);
		treeobj.leaf_create = 0;
	}
}

// fumaça do mee6
if (room == room_corridors_18 && global.flag[60] == true && global.flag[61] == 0 && global.flag[2] == 0 && global.party[0] != -1 && global.visualeff == true)
{
	m6 = global.party[0];
	
	if (delay <= 0 && num < particle_length)
	{
		marker((m6.x - (m6.sprite_width / 4) + 2), (m6.y - (m6.sprite_height / 2) - 4), spr_particle_smoke, 1, 1, 1, 0, 0, 0, c_white, (m6.depth + 1));
		thismarker.speed = choose(0.4, 0.65) * 0.75;
		thismarker.direction = (90 + irandom_range(-20, 20));
		particle[num] = thismarker;
		num += 1;
		delay = 18;
	}
	else
		delay -= 1;
	
	for (var i = 0; i < particle_length; i++)
	{
		if (particle[i] != -1 && exists(particle[i]) == 1)
		{
			particle[i].image_index += 0.05;
			particle[i].image_xscale -= 0.005;
			particle[i].image_yscale -= 0.005;
			particle[i].image_alpha -= 0.01;
			if (particle[i].image_alpha <= 0) || (particle[i].image_index >= 4)
			{
				destroy(particle[i]);
				particle[i] = -1;
			}
		}
	}
}
var _control = obj_battle_controller;
if (room == room_battle && exists(_control) == true && global.visualeff == true)
{
	if (_control.heart_type == 1 && _control.heart_move == true && delay <= 0)
	{
		var _marker = marker((_control.heart.x + irandom_range(-5, 5)), (_control.heart.y + irandom_range(-5, 5)), spr_singlepixel, 1, 2, 2, 0, 0, 0, global.c_yellow, (_control.heart.depth - 1));
		_marker.hspeed = (_control.heart.press_r - _control.heart.press_l);
		_marker.gravity = 0.1;
		array_push(particle2, _marker);
		delay = choose(15, 30);
	}
	else
		delay -= 1;
	for (var i = 0; i < array_length(particle2); i++)
	{
		if (exists(particle2[i]) == 1)
		{
			var _ymax = (_control.box_x + (_control.box_h / 2));
			if (_control.heart_move == false)
				_ymax = room_height;
			if (_control.heart_move == true && (particle2[i].x <= (_control.box_x - (_control.box_w / 2)) || particle2[i].x >= (_control.box_x + (_control.box_w / 2)))) || (particle2[i].y >= _ymax)
			{
				destroy(particle2[i]);
				array_delete(particle2, i, 1);
			}
		}
		else
			array_delete(particle2, i, 1);
	}
}