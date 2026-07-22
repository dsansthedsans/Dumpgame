
// folhas das árvores
for (var i = 0; i < instance_number(obj_overworld_solid); i++)
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
if (room == room_corridors_18 && global.flag[61] == 0 && global.flag[2] == 0 && global.party[0] != -1)
{
	m6 = global.party[0];
	
	if (delay <= 0 && num < particle_length)
	{
		marker((m6.x - (m6.sprite_width / 4) + 2), (m6.y - (m6.sprite_height / 2) - 4), spr_particle_smoke, 1, 1, 1, 0, 0, 0, c_white, (m6.depth + 1));
		thismarker.speed = choose(0.4, 0.65);
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