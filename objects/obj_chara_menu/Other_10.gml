/// @descr opções

option[0, 0] = "ITEM";
option[0, 1] = "STAT";
option[0, 2] = "CELL";
option_length[0] = 2;

for (var i = 0; i < global.item_length; i++)
	option[1, i] = item_name(global.item[i], "");
option_length[1] = global.item_length;

option[2, 0] = "USE";
option[2, 1] = "INFO";
option[2, 2] = "DROP";
option_length[2] = 3;

option[3, 0] = "";
option_length[3] = 0;