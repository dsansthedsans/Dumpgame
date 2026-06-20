
// crazy cat
if (cat_speed == 1)
	cat_index += (sprite_get_speed(cat_spr) / fps);
draw_sprite_ext(cat_spr, cat_index, cat_x, cat_y, 1, 1, 0, c_white, 1);

// trigger dancing
if (cat_singing == 1 && audio_playing(snd_meowmeowmeow) == 0)
{
	cat_singing = 0;
	cat_speed = 0;
	cat_index = 0;
	alarm[1] = 120;
}