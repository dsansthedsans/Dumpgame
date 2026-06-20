
upper = 0;
typing = 0;
controller = obj_menu_controller;
depth = (controller.depth - 1);

// definir opções
event_user(0);
option_pos[0] = 3; // vertical
option_oldpos[0] = -1;
option_pos[1] = 2; // horizontal
option_oldpos[1] = -1;

// definir posições das opções
base_dist = 44;
base_x = (77 - 21);
base_y = (room_height - (base_dist * 4) + 15);
for (var z = 0; z < array_length(option); z++)
{
	for (var i = 0; i < array_length(option[z]); i++)
	{
		draw_set_font(fnt_main_spaced_big);
		
		// pegar posição
		option_x[z, i] = (base_x + (base_dist * i));
		option_y[z, i] = (base_y + (base_dist * z));
		if (z == 3) // uppercase, backspace e confirm
		{
			var _half_letter = (string_width("A") / 2);
			
			if (i == 0) || (i == 1) // uppercase
			{
				option_x[z, i] = (base_x + (string_width(option[z, 0]) / 2) - _half_letter);
				var _x0 = option_x[z, i];
			}
			if (i == 2) || (i == 1) // backspace
			{
				option_x[z, i] = (base_x + (base_dist * (array_length(option[0]) - 1)) - (string_width(option[z, 2]) / 2) + _half_letter);
				var _x2 = option_x[z, i];
			}
			if (i == 1) // confirm (pega as posições dos outros para ficar no meio)
				option_x[z, i] = (_x0 + ((_x2 - _x0) / 2));
		}
	}
}










