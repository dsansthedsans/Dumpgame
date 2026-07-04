/// @descr extra das opções

// configurações
option_key[2, 2] = get_text("menu_key_2_3");
if (option_pos == 2)
	option_key[2, 2] = "< " + string(option_key[2, 2]) + " >";
option_key[2, 3] = get_text("menu_key_2_" + string(global.fullscreen));
option_key[2, 4] = get_text("menu_key_2_" + string(global.visualeff));

option_key[2, 5] = string(round(global.volume[VOLUME_MASTER] * 100)) + "%";
option_key[2, 6] = string(round(global.volume[VOLUME_MUSIC] * 100)) + "%";
option_key[2, 7] = string(round(global.volume[VOLUME_SOUND] * 100)) + "%";
if (option_pos >= 5 && option_pos <= 7)
	option_key[2, option_pos] = "< " + string(option_key[2, option_pos]) + " >";
	
option_key[2, 8] = get_text("menu_key_2_" + string(global.autorun));
option_key[2, 9] = get_text("menu_key_2_" + string(global.showfps));
option_key[2, 10] = get_text("menu_key_2_" + string(global.showsw));
option_key[2, 11] = get_text("menu_key_2_" + string(global.hidenotif));
option_key[2, 12] = get_text("menu_key_2_" + string(global.drpenabled));
option_key[2, 13] = get_text("menu_key_2_" + string(global.fastmenu));

// controles
option_key[6, 1] = "[F10]";
for (var i = 0; i < 14; i++)
	option_key[6, (i + 2)] = "[" + string(key_name(global.keybind[i])) + "]";

settings_write();