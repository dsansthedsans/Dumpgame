if (cutout_active == true)
{
	cutout_alpha = lerp(cutout_alpha, cutout_alphaTarget, cutout_alphaSpeed);
	if (cutout_alpha <= 0)
		cutout_active = false;
	draw_sprite_ext(spr_event_m6_meet_cutout, 0, 0, 0, 1, 1, 0, c_white, (cutout_alpha * (0.5 + 0.125)));
}
if (teach_active == true)
{
	// teachBg
	teachBg_offsetX -= (teachBg_offsetSpeed * global.visualeff);
	if (teachBg_offsetX <= -sprite_get_width(teachBg_sprite))
		teachBg_offsetX = 0;
	teachBg_offsetY -= (teachBg_offsetSpeed * global.visualeff);
	if (teachBg_offsetY <= -sprite_get_height(teachBg_sprite))
		teachBg_offsetY = 0;
	var _teachBg_width = 320;
	var _teachBg_height = 240;
	teachBg_alpha = lerp(teachBg_alpha, teachBg_alphaTarget, teachBg_alphaSpeed);
	if (teachBg_alpha <= 0 && teachBg_alphaTarget == 0)
		teach_active = false;
	for (var v = 0; v < 2; v++)
	{
		for (var h = 0; h < 2; h++)
			draw_sprite_stretched_ext(teachBg_sprite, 0, ((_teachBg_width * h) + teachBg_offsetX), ((_teachBg_height * v) + teachBg_offsetY), _teachBg_width, _teachBg_height, merge_color(c_white, c_black, 0.5), teachBg_alpha);
	}
	// teachInfo
	for (var i = 0; i < teachInfo_length; i++)
	{
		var _teachInfo_x = (round(320 / 4) * (i + 1));
		var _teachInfo_y = round(240 / 3);
		teachInfo_alpha[i] = lerp(teachInfo_alpha[i], teachInfo_alphaTarget[i], teachInfo_alphaSpeed);
		draw_sprite_ext(teachInfo_sprite, i, _teachInfo_x, _teachInfo_y, 1, 1, 0, c_white, teachInfo_alpha[i]);
		draw_set_font(fnt_main_spaced);
		draw_set_valign(fa_top);
		draw_set_halign(fa_center);
		draw_text_outline_color(_teachInfo_x, (_teachInfo_y + (sprite_get_height(teachInfo_sprite) / 2) + 5), textdata_get($"event_m6_meet_teachInfo_{i}"), c_black, c_black, c_black, c_black, teachInfo_alpha[i], 1, c_white);
	}
}
draw_set_alpha(1);