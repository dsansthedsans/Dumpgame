hp_alpha = lerp(hp_alpha, exists(obj_overworld_heart), 0.1);
if (hp_alpha > 0)
{
	if (hp_surface == -1) || (surface_exists(hp_surface) == false)
		hp_surface = surface_create(640, 480);
	surface_set_target(hp_surface);
	draw_clear_alpha(c_black, 0);
	var _bar_widthMax = 100;
	draw_battle_bar($"{global.chara_curhp} / {global.chara_maxhp}", global.chara_curhp, global.chara_maxhp, round(320 - (_bar_widthMax / 2)), round(240 + 120 + 60 + 30), _bar_widthMax, #F29948, #DD2929, 1);
	surface_reset_target();
	draw_surface_ext(hp_surface, game.cam_x, game.cam_y, 0.5, 0.5, 0, c_white, hp_alpha);
}