/// @descr desenhar indicador
var l = global.menu_lvl;
draw_sprite_ext(spr_battle_heart, 0, option_heartx[l, option_pos], (option_hearty[l, option_pos] + scroll_y - 1), (option_heartscale[l, option_pos] / 2), (option_heartscale[l, option_pos] / 2), 0, global.c_dump, ((option_alpha * alpha) * option_heartalpha[l, option_pos]));