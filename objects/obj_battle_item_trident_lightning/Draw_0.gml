var _sprite = sprite_get_nineslice(sprite_index);
_sprite.enabled = false;
draw_self();
//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
_sprite.enabled = true;