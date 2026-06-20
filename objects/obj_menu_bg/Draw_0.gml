
// ácido
acid_siner += 0.05;
var _acid_y = (sin(acid_siner) * 25);
var _acid_c0 = c_black;
var _acid_c1_amt = (0.75 + (_acid_y / 150));
var _acid_c1 = merge_color(c_white, global.c_dump, _acid_c1_amt);
draw_set_alpha(controller.alpha);
draw_rectangle_color(0, room_height, room_width, ((room_height / 3) - _acid_y + controller.scroll_y), _acid_c0, _acid_c0, _acid_c1, _acid_c1, 0);	

// corações
for (var i = 0; i < instance_number(obj_menu_bg_heart); ++i;)
{
	var h = instance_find(obj_menu_bg_heart, i);
	draw_sprite_ext(spr_dumpparticle_heart, 0, h.x, h.y, h.image_xscale, h.image_yscale, h.image_angle, h.image_blend, h.image_alpha);
}

// lixo
var _trash_y = (room_height + 3 + controller.scroll_y);
trash_color = _acid_c1;
draw_sprite_ext(spr_menu_trash, 0, (room_width / 2), _trash_y, /*(2 + (_acid_c1_amt / 12)), (2 + ((_acid_c1_amt / 12) * -1))*/ 2, 2, 0, trash_color, controller.alpha);
draw_set_color(c_black);
draw_rectangle(0, _trash_y, room_width, room_height, 0);