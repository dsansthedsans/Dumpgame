
//////////// this code was stolen from undertale bits and pieces. sorry.

draw_self();
w = (sprite_get_width(sprite_index) * image_xscale);
h = (sprite_get_height(sprite_index) * image_yscale);
xoff = (sprite_get_xoffset(sprite_index) * image_xscale);
yoff = (sprite_get_yoffset(sprite_index) * image_yscale);
x -= xoff;
y -= yoff;
surf = surface_create(w, h);
pixel = 0;
z = 0;
r = 0;
g = 0;
b = 0;
col = c_black;
delay = 0;

surface_set_target(surf)
draw_clear_alpha(c_black, 0)
draw_sprite(sprite_index, image_index, xoff, yoff)
surface_reset_target()
buff = buffer_create(((4 * w) * h), buffer_fixed, 1)
buffer_get_surface(buff, surf, 0)
surface_free(surf)

blarg = 0
if (image_xscale == 2)
    blarg = 1
else
    blarg = 2

for (j = 0; j < h; j += blarg)
{
    for (i = 0; i < w; i += blarg)
    {
        pixel = buffer_peek(buff, (4 * (i + (j * w))), buffer_u32)
        z = ((pixel >> 24) & 255);
        r = (pixel & 255);
        g = ((pixel >> 8) & 255);
        b = ((pixel >> 16) & 255);
        obj = noone;
		
        if (z == 255)
        {
            obj = obj_battle_vaporpixel;
            col = make_colour_rgb(r, g, b);
        }
        if (obj != noone)
        {
            trueobj = instance_create_layer((x + (i * image_xscale)), (y + (j * image_yscale)), "Instances", obj);
            trueobj.image_blend = other.col;
			trueobj.delay = floor((other.delay / 3));
        }
    }
    delay += 1;
}
buffer_delete(buff);
destroy(id);
