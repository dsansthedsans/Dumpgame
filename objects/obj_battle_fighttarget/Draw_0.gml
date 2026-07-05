xscale = lerp(xscale, 1, scalespd + !global.visualeff);
yscale = lerp(yscale, 1, scalespd + !global.visualeff);
blend = lerp(blend, 1, blendspd + !global.visualeff);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, merge_color(#DD2929, c_white, blend), image_alpha);