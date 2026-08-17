/// @descr nomes secretos e bloqueados
msg = "";
name = global.chara_name;
block = 0;
if (name == "")
	block = 1;
name_block[0] = 0;
name_block[1] = 0;
name_block[2] = 0;
name_block[3] = 1;
name_block[4] = 1;
name_block[5] = 0;
name_block[6] = 1;
name_block[7] = 1;
name_block[8] = 1;
name_block[9] = 1;
name_block[10] = 0;
name_block[11] = 0;
name_block[12] = 0;
name_block[13] = 0;
name_block[14] = 0;
name_block[15] = 0;
name_list[0] = undefined;
var i = 0;
while (i < 16)
{
	if (get_text($"menu_name_{i}") != undefined)
	{
		name_list[i] = get_text($"menu_name_{i}");
		i += 1;
	}
	else
		break;
}
for (var i = 0; i < array_length(name_list); i++)
{
	if (string_upper(name) == string_upper(name_list[i]))
	{
		msg = get_text("menu_namemsg_" + string(i));
		block = name_block[i];
	}
}