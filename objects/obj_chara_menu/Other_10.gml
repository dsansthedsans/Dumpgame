/// @descr opções

option_length[0] = 2;
for (var o = 0; o < option_length[0]; o++)
	option[0, o] = textdata_get($"charamenu_main_{o}");

for (var i = 0; i < global.item_length; i++)
{
	option[1, i] = item_name(global.item[i], "");
	if (global.item[i] == -1)
		option[1, i] = undefined;
}
option_length[1] = global.item_length;

for (var i = 0; i < 3; i++)
	option[2, i] = textdata_get($"charamenu_item_other_{i}");
option_length[2] = 3;

option[3, 0] = "";
option_length[3] = 0;