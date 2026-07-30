
draw_set_color(c_black);
draw_set_alpha(image_alpha);
draw_rectangle(-40, -40, (room_width + 40), (room_height + 40), 0);

heart = obj_battle_heart;
if (exists(heart) == 1)
	draw_sprite_ext(heart.sprite_index, heart.image_index, heart.x, heart.y, heart.image_xscale, heart.image_yscale, heart.image_angle, heart.image_blend, 1);

image_alpha -= 0.05;
if (image_alpha <= 0)
	destroy(id);