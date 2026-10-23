
if (global.inrecording == true)
	destroy(id);
con = 0;
time = 150;
delay = 0;
alpha = 0;
alpha_amt = 0.05;
text_scale = 0.75;
text_xadd = (8 * text_scale);
image_alpha = 0;
depth = -9000;

// definir texto para mostrar e a flag para mudar
var _textPostfix = ["", ""];
flag = 64;
textIndex = 0;
keys = [global.keybind[04], global.keybind[05]];
if (room == room_corridors_1_5)
{
	flag = 65;
	textIndex = 1;
	keys = [global.keybind[08], global.keybind[09]];
	_textPostfix = ["", $"_{global.autorun}"];
}
for (var i = 0; i < 2; i++)
{
	text[i] = text_get($"tutorial_{textIndex}_{i}{_textPostfix[i]}");
	text[i] = string_replace(text[i], "{key0}", string_upper(key_name(keys[0])));
	text[i] = string_replace(text[i], "{key1}", string_upper(key_name(keys[1])));
}
for (var i = 0; i < 2; i++)
{
	text_visible[i] = string_replace_all(text[i], ";S", "");
	text_visible[i] = string_replace_all(text_visible[i], ";D", "");
}
