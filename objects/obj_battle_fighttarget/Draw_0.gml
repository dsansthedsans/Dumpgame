xscale = lerp(xscale, 1, scalespd);
yscale = lerp(yscale, 1, scalespd);
blend = lerp(blend, 1, blendspd);
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, merge_color(#DD2929, c_white, blend), image_alpha);