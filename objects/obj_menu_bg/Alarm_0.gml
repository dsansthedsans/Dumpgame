/// @descr criar partículas

if (global.visualeff == 1)
{
	for (var i = 0; i < 2; i++)
	{
		var hang = (irandom_range(80, 100) - 90);
		var hsc = ((i + 1) / 2);
		var hx = irandom_range(-20, (room_width + 20));
		var hy = (room_height - 20);
	
		var h = instance_create_layer(hx, hy, "Instances", obj_menu_bg_heart);
		h.image_alpha = controller.alpha;
		h.image_xscale = hsc;
		h.image_yscale = hsc;
		h.image_angle = hang;
		h.image_speed = 0;
		h.image_index = 0;
		h.direction = (image_angle + 90);
		h.speed = (irandom_range(1.2, 2) / (!i + 1));
		h.dir = choose(1, -1);
		h.fade = 0;
		h.alpha = (1 / (i + 1));
	}
}

alarm[0] = 20;