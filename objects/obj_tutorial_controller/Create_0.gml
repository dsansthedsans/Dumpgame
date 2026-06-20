
con = 0;
time = 150;
delay = 0;
alpha = 0;
alpha_amt = 1//0.05;
text_scale = 0.75;
text_xadd = (8 * text_scale);
image_alpha = 0;
depth = -9000;

// definir texto para mostrar e a flag para mudar
flag = 64;
text[0] = "Press ;S[" + string_upper(key_name(global.keybind[04])) + "];D or ;S[" + string_upper(key_name(global.keybind[05])) + "];D to";
text[1] = "interact with objects";
if (room == room_corridors_1_5)
{
	flag = 65;
	text[0] = "Hold ;S[" + string_upper(key_name(global.keybind[08])) + "];D or ;S[" + string_upper(key_name(global.keybind[09])) + "]";
	text[1] = "to start running";
	if (global.autorun == 1)
		text[1] = "to stop running";
}

// pegar texto sem caracteres especiais
for (var i = 0; i < 2; i++)
{
	text_visible[i] = string_replace_all(text[i], ";S", "");
	text_visible[i] = string_replace_all(text_visible[i], ";D", "");
	debug("--- obj_tutorial_controller | text[" + string(i) + "]:			" + string(text[i]));
	debug("--- obj_tutorial_controller | text_visible[" + string(i) + "]:	" + string(text_visible[i]));
}
