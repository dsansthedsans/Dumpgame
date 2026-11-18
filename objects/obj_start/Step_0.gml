if (os_browser != browser_not_a_browser)
{
	if (stage == 0 && mouse_check_button_pressed(mb_left) == true && mouse_x >= (x - (sprite_width / 2)) && mouse_x <= (x + (sprite_width / 2)) && mouse_y >= (y - (sprite_height / 2)) && mouse_y <= (y + (sprite_height / 2)))
	{
		alarm[0] = 60;
		image_alpha = 0;
		stage += 1;
		audio_play(snd_shriekCatLong, false, VOLUME_SOUND);
	}
}