/// @descr opções

option[0, 0] = "ITEM";
option[0, 1] = "STAT";
option[0, 2] = "CELL";
option_length[0] = 2;

for (var i = 0; i < global.item_length; i++)
	option[1, i] = item_name(global.item[i], "");
option_length[1] = global.item_length;

for (var i = 0; i < 3; i++)
	option[2, i] = get_text($"charamenu_item_other_{i}");
option_length[2] = 3;

option[3, 0] = "";
option_length[3] = 0;