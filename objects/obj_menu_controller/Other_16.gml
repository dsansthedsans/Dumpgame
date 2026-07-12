/// @descr desenhar título do nível

// fundo do título
var _title = string_upper(get_text("menu_" + string(global.menu_lvl) + "_title"));
var _title_stw = string_width(_title);
var _title_sth = string_height(_title);
var _title_xdi = 33;
var _title_ydi = 22;
	
var _title_bgx = round((room_width / 2) - (_title_stw / 2) - _title_xdi);
var _title_bgy = -10;
var _title_bgw = round(_title_xdi + _title_stw + _title_xdi);
var _title_bgh = round(10 + _title_ydi + _title_sth + _title_ydi + 8);
	
draw_sprite_stretched(spr_menu_optbg, 0, _title_bgx, _title_bgy, _title_bgw, _title_bgh)
	
// título
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_text(round(room_width / 2), _title_ydi, _title);



