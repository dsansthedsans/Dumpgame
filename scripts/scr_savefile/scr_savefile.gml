
function savefile_write()
{
	var _file_name = "savefile" + string(global.savefile_selected) + ".txt";
	var _file = file_text_open_write(global.game_directory + string(_file_name));
	if (_file != -1)
	{
	file_text_write_string(_file, global.chara_name);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_money);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_lvl);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_exp);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_spares);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_kills);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_heals);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_deaths);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_weapon);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_armor);
	file_text_writeln(_file);
	
	file_text_write_string(_file, room_get_name(global.chara_room));
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_world);
	file_text_writeln(_file);
	
	file_text_write_real(_file, global.chara_murder);
	file_text_writeln(_file);
	
		// flags
	file_text_writeln(_file);
	for (var i = 0; i < array_length(global.flag); i++)
	{
		file_text_write_string(_file, global.flag[i]);
		file_text_writeln(_file);
	}
	
	file_text_close(_file);
	}
	else
		debug("!!!!!!!!!!!!!!!!!!!!!!!!!! HELP MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
}
function savefile_read(_savefile)
{
	var _file_name = "savefile" + string(argument0) + ".txt";
	var _file = file_text_open_read(global.game_directory + string(_file_name));
	if (_file != -1)
	{
		savefile_name = file_text_read_string(_file);
		file_text_readln(_file);
		savefile_money = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_lvl = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_exp = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_spares = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_kills = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_heals = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_deaths = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_weapon = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_armor = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_room = asset_get_index(file_text_read_string(_file));
		file_text_readln(_file);
		savefile_world = file_text_read_real(_file);
		file_text_readln(_file);
		savefile_murder = file_text_read_real(_file);
		file_text_readln(_file);
		file_text_readln(_file);
		for (var i = 0; i < array_length(global.flag); i++)
		{
			savefile_flag[i] = file_text_read_string(_file);
			file_text_readln(_file);
		}
		file_text_close(_file);
	}
	else
		debug("!!!!!!!!!!!!!!!!!!!!!!!!!! HELP MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
	thisfile = _file;
	return thisfile;
}

function savefile_load(_savefile)
{
	savefile_read(argument0);
	if (thisfile != -1)
	{
		global.chara_name = savefile_name;
		global.chara_money = savefile_money;
		global.chara_lvl = savefile_lvl;
		global.chara_exp = savefile_exp;
		global.chara_spares = savefile_spares;
		global.chara_kills = savefile_kills;
		global.chara_heals = savefile_heals;
		global.chara_deaths = savefile_deaths;
		global.chara_weapon = savefile_weapon;
		global.chara_armor = savefile_armor;
		global.chara_room = savefile_room;
		global.chara_world = savefile_world;
		global.chara_murder = savefile_murder;
		for (var i = 0; i < array_length(global.flag); i++)
			global.flag[i] = savefile_flag[i];
	}
}

function savefile_erase(_savefile)
{
	var z = argument0;
	var i = 0;
	while (file_exists($"{global.game_directory}savefile" + string(z) + "_erased" + string(i) + ".txt") == 1)
		i += 1;
	file_rename($"{global.game_directory}savefile" + string(z) + ".txt", $"{global.game_directory}savefile" + string(z) + "_erased" + string(i) + ".txt");
}
