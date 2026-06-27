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
name_block[8] = 0;


// checar nome
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






/*
if (name == "CARLINHOS")
	msg = "The true name.";
if (name == "DUMPGAME") || (name == "DUMPGAMER")
	msg = "<3";
if (name == "DALMAK")
	msg = "Dalmak Momento Galera";



if (name == "MEE6")
{
	msg = "I suggest you choose\na different name.";
	block = 1;
}
if (name == "ARMSGUY")
{
	msg = "I Know, My Name Is Awesome.\nBut It's Not For You.";
	block = 1;
}
if (name == "BROKENCLOCK")
{
	msg = "AND I THOUGHT YOU COULDN'T MAKE IT WORSE.";
	block = 1;
}
if (name == "GABEE")
{
	msg = "xiu ae mlk";
	block = 1;
}
if (name == "DSANS")
{
	msg = "não";
	block = 1;
}
if (name == "GUILHERME")
{
	msg = "Cala a boca";
	block = 1;
}
if (name == "FER10TANB")
{
	msg = "porra velho";
	block = 1;
}
if (name == "DUMPBOT")
{
	msg = "Me desculpe, mas acho que não será\npossível para você usar esse nome.";
	block = 1;
}
if (name == "MIGEL")
{
	msg = "Mano, FODA";
	block = 1;
}
if (name == "COMUNISTA")
{
	msg = "fds";
	block = 1;
}
if (name == "SAM06TANB")
{
	msg = "Aí não né man";
	block = 1;
}
if (name == "MAARI")
{
	msg = "Pode tirar ae";
	block = 1;
}
if (name == "CAWE")
{
	msg = "";
	block = 0;
}
if (name == "BABAKINHA")
{
	msg = "no";
	block = 1;
}

if (name == "")
	block = 1;
if (msg == "")
	vspace = 0;
*/