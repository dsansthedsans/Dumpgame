/// @descr get chara menu options

// main
for (var i = 0; i < mainopt_length; i++)
{
	mainopt[0] = "ITEM";
	mainopt[1] = "STAT";
	mainopt[2] = "CELL";
	mainopt_x[i] = (mainbox_x + 40);
	mainopt_y[i] = (mainbox_opt_y + 18 + (18 * i));
	mainopt_color[i] = c_white;	
	if (i == mainopt_pos)
	{
		mainopt_color[i] = c_yellow;
		if (global.charamenu_lvl != 0)
			mainopt_color[i] = global.c_dump;
	}
}

// in-level
for (var i = 0; i < levelopt_length; i++)
{
	levelopt[i] = "";
	if (global.item[i] != -1 && (global.charamenu_lvl == 1 || global.charamenu_lvl == 1.5))
		levelopt[i] = item_name(global.item[i], "");
	
	levelopt_x[i] = (bigbox_x + 26);
	levelopt_y[i] = ((bigbox_y + 22) + (18 * i))
	levelopt_color[i] = c_white;
	if (i == levelopt_pos)
		levelopt_color[i] = c_yellow;
	if (global.charamenu_lvl == 1.5)
		levelopt_color[levelopt_pos] = global.c_dump;
}
for (var i = 0; i < 3; i++)
{
	otheropt[0] = get_text("charamenu_item_other_0");
	otheropt[1] = get_text("charamenu_item_other_1");
	otheropt[2] = get_text("charamenu_item_other_2");
	otheropt_x[0] = (bigbox_x + 24);
	otheropt_x[1] = (bigbox_x + (bigbox_w / 2) - 14);
	otheropt_x[2] = (bigbox_x + bigbox_w - 20 - 28);
	otheropt_y[i] = (bigbox_y + bigbox_h + 10);
	otheropt_color[i] = c_white;
	if (global.charamenu_lvl == 1.5 && i == otheropt_pos)
		otheropt_color[i] = c_yellow;
	if (global.lang == "pt")
		otheropt_x[0] = (bigbox_x + 22);
}

var _num = 0;

levelinfo_stat[_num++] = "HP   " + string(global.chara_curhp) + "/" + string(global.chara_maxhp);
levelinfo_stat[_num++] = "LVL  " + string(global.chara_lvl);
levelinfo_stat[_num++] = "EXP  " + string(global.chara_exp) + "/" + string(global.chara_nextexp);

levelinfo_stat[_num++] = "";

levelinfo_stat[_num++] = get_text("charamenu_stat_spares") + "  " + string(global.chara_spares);
levelinfo_stat[_num++] = get_text("charamenu_stat_kills") + "  " + string(global.chara_kills);

levelinfo_stat[_num++] = "";

var _wnumber = " (+" + string(global.chara_wstrength) + ")";
if (global.chara_weapon == -1)
	_wnumber = "";
levelinfo_stat[_num++] = get_text("charamenu_stat_weapon") + "  " + string(global.chara_wname) + string(_wnumber);
var _anumber = " (+" + string(global.chara_astrength) + ")";
if (global.chara_armor == -1)
	_anumber = "";
levelinfo_stat[_num++] = get_text("charamenu_stat_armor") + "  " + string(global.chara_aname) + string(_anumber);

var _atk = ((global.chara_atk + global.chara_wstrength) - 10);
var _def = ((global.chara_def + global.chara_astrength) - 10);
var _mon = global.chara_money;
var _max = max(_atk, _def, _mon);
var _space_atk = "";
var _space_def = "";
var _space_mon = "";	
for (var z = 0; z < (string_length(_max) - 1); z++)
{
	if (_max != _atk && z < ((string_length(_max) - 1) - (string_length(_atk) - 1)))
		_space_atk += " ";
	if (_max != _def && z < ((string_length(_max) - 1) - (string_length(_def) - 1)))
		_space_def += " ";
	if (_max != _mon && z < ((string_length(_max) - 1) - (string_length(_mon) - 1)))
		_space_mon += " ";
}
levelinfo_stat[_num++] = "ATK  " + string(_space_atk) + string(_atk);
levelinfo_stat[_num++] = "DEF  " + string(_space_def) + string(_def);
levelinfo_stat[_num++] = "$    " + string(_space_mon) + string(_mon);

levelinfo_stat[_num++] = "";

var _heals = global.chara_heals;
var _deaths = global.chara_deaths;
var _max = max(_heals, _deaths);
var _space_heals = "";
var _space_deaths = "";
for (var z = 0; z < (string_length(_max) - 1); z++)
{
	if (_max != _heals)
		_space_heals += " ";
	if (_max != _deaths)
		_space_deaths += " ";;
}
levelinfo_stat[_num++] = string(get_text("charamenu_stat_heals")) + "  " + string(_space_heals) + string(global.chara_heals);
levelinfo_stat[_num++] = string(get_text("charamenu_stat_deaths")) + "  " + string(_space_deaths) + string(global.chara_deaths);