
depth = -9500;
move = 1;
alpha = 1;
title = get_text("charapause_title");


// posições
draw_set_font(fnt_main_spaced);

bg_x[0] = 20; // fundo principal
bg_y[0] = 20;
bg_w[0] = (320 - 40);
bg_h[0] = (240 - 40);

bg_x[1] = bg_x[0]; // fundo do título
bg_y[1] = bg_y[0];
bg_w[1] = bg_w[0];
bg_h[1] = (10 + string_height("ABC") + 10);

title_x = (bg_x[1] + (bg_w[1] / 2));
title_y = (bg_y[1] + (bg_h[1] / 2));


// opções
option_length = 3;
for (var i = 0; i < option_length; i++)
{
	option[i] = string_upper(get_text("charapause_" + string(i)));
	option_x[i] = round(bg_x[0] + (bg_w[0] / 2));
	option_y[i] = round(bg_y[0] + (bg_h[0] / 2) - 6 + (20 * i));
}
option_pos = 0;


// warning
warning = 0;
warning_title = get_text("charapause_warning_title");
warning_title_x = (bg_x[0] + (bg_w[0] / 2));
warning_title_y = (bg_y[0] + (bg_h[0] / 2) - 10);
for (var i = 0; i < 2; i++)
{
	warning_option[i] = get_text("charapause_warning_" + string(i));
	warning_option_x[i] = (bg_x[0] + (bg_w[0] / 2) - 40 + (80 * i));
	warning_option_y[i] = (warning_title_y + 40);
}
warning_option_pos = 0;



