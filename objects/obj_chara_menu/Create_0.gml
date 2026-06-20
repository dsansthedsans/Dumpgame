
depth = -9500;

lvl = 0;
/*
	0 = Main
	1 = ITEM (Main)
	2 = ITEM (Other)
	3 = STAT
	4 = CELL
*/
alpha = 1;


// opções
item_organize();
event_user(0);
option_pos = 0;
option_pos_orig = 0;
option_pos_old = 0;


// fundo
bg_x[0] = 16//15; // informações principais
bg_y[0] = 4//25;
bg_w[0] = 72//73;
bg_h[0] = 57;

bg_x[1] = bg_x[0]; // opções principais
bg_y[1] = (bg_y[0] + bg_h[0] + 2);
bg_w[1] = bg_w[0];
bg_h[1] = (11 + (8 * option_length[0]) + (10 * (option_length[0] - 1)) + 11 + 11) //(11 + h + (18 - h) + h + (18 - h) + h + 11);

bg_x[2] = (bg_x[0] + bg_w[0] + 2); // inventário
bg_y[2] = bg_y[0];
bg_w[2] = (320 - (bg_x[0] * 2) - bg_w[0] - 1);
bg_h[2] = (240 - (bg_y[2] * 2) - 41)			+ 7;

bg_x[3] = bg_x[2]; // status
bg_y[3] = bg_y[2];
bg_w[3] = bg_w[2];
bg_h[3] = (bg_h[2] + 9)				- 2;


// títulos
title[0] = "INVENTORY";
title[1] = "YOUR STATS";
title[2] = "CELLPHONE";
draw_set_font(fnt_main_spaced);
title_bgh = (10 + string_height(title[0]) + 10);


// posições das opções
for (var i = 0; i < option_length[0]; i++)
{
	option_x[0, i] = (bg_x[1] + (bg_w[1] / 2) - 9);
	option_y[0, i] = (bg_y[1] + 11 + (18 * i));
}
for (var i = 0; i < option_length[1]; i++)
{
	option_x[1, i] = (bg_x[2] + 5 + 22);
	option_y[1, i] = (bg_y[2] + title_bgh + 10 + (20 * i))
}
for (var i = 0; i < option_length[2]; i++)
{
	draw_set_font(fnt_main_spaced);
	option_x[2, 0] = (bg_x[2] + 5 + 22);
	option_x[2, 1] = (bg_x[2] + (bg_w[2] / 2) - (string_width(option[2, 1]) / 2) - (string_width("A") / 2));
	option_x[2, 2] = (bg_x[2] + bg_w[2] - 5 - 22 - string_width(option[2, 2]));
	option_y[2, i] = (bg_y[2] + bg_h[2] - (title_bgh / 2) - (string_height(option[2, 0]) / 2));
}


// itens
item_pos = 0;

thiswriter = -1;





















