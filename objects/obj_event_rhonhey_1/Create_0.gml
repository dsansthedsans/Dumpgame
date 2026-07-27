event_inherited();
chara = obj_chara;
if (global.flag[66] < 3)
{
	thing =
	{
		spr : spr_event_rhonhey_thing,
		images : [0, 1, 1],
		x : [40, 260, 160],
		y : [(980 - 90), 580, 80],
		objects : [undefined, undefined, undefined],
		colors : [c_white, c_white, c_black],
		alphas : [0.35, 0.35, 1],
		speeds : [5, 4, 5],
		directions : [180, 90, undefined],
		audio :
		{
			assets : [snd_pedronstro, snd_pedronstro, snd_879],
			volumes : [1, 1, 1],
			pitches : [1, 1.25, 0.5],
		},
	}
	thing_length = 3;
	for (var t = global.flag[66]; t < thing_length; t++)
	{
		marker(thing.x[t], thing.y[t], thing.spr, thing.alphas[t], 1, 1, 0, thing.images[t], 0, thing.colors[t], -100);
		thing.objects[t] = thismarker;
	}
	
}
else
	destroy(id);