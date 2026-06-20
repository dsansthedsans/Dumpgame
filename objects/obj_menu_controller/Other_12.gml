/// @descr desenhar indicador

var l = global.menu_lvl;
draw_sprite_ext(spr_heart_small, 0, option_heartx[l, option_pos], (option_hearty[l, option_pos] + scroll_y - 1), option_heartscale[l, option_pos], option_heartscale[l, option_pos], 0, c_white, ((option_alpha * alpha) * option_heartalpha[l, option_pos]));

