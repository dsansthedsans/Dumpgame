
function settings_write()
{
	var _file_name = "settings.txt";
	var _file = file_text_open_write(global.game_directory + string(_file_name));
	if (_file != -1)
	{
		debug("!!!!!!!!!!!!!!!!!!!!! HELL YEAH 1");
		file_text_write_string(_file, "[You know, there's a settings section in the main menu. I think you'll like it there.]");
		file_text_writeln(_file);

		file_text_writeln(_file);

			// opções
		file_text_write_string(_file, global.lang);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.fullscreen);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.visualeff);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.autorun);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.showfps);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.showsw);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.hidenotif);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.drpenabled);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.bloodgore);
		file_text_writeln(_file);
	
		file_text_write_real(_file, global.fastmenu);
		file_text_writeln(_file);
	
			// volume
		file_text_writeln(_file);
		for (var i = 0; i < array_length(global.volume); i++)
		{
			file_text_write_real(_file, global.volume[i]);
			file_text_writeln(_file);
		}
	
			// controls
		file_text_writeln(_file);
		for (var i = 0; i < array_length(global.keybind); i++)
		{
			file_text_write_real(_file, global.keybind[i]);
			file_text_writeln(_file);
		}
	
		file_text_close(_file);
	}
	else
		debug("!!!!!!!!!!!!!!!!!!!!!!!!!! HELP MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
}

function settings_read()
{
	var _file_name = "settings.txt";
	var _file = file_text_open_read(global.game_directory + string(_file_name));
	if (_file != -1)
	{
				debug("!!!!!!!!!!!!!!!!!!!!! HELL YEAH 2");

	file_text_readln(_file);
	file_text_readln(_file);
	
	global.lang = file_text_read_string(_file);
	file_text_readln(_file);
	
	global.fullscreen = file_text_read_real(_file);
	file_text_readln(_file);
	
	global.visualeff = file_text_read_real(_file);
	file_text_readln(_file);
	
	global.autorun = file_text_read_real(_file);
	file_text_readln(_file);

	global.showfps = file_text_read_real(_file);
	file_text_readln(_file);
	
	global.showsw = file_text_read_real(_file);
	file_text_readln(_file);

	global.hidenotif = file_text_read_real(_file);
	file_text_readln(_file);
	
	global.drpenabled = file_text_read_real(_file);
	file_text_readln(_file);
	
	global.bloodgore = file_text_read_real(_file);
	file_text_readln(_file);
	
	global.fastmenu = file_text_read_real(_file);
	file_text_readln(_file);
	
		// volume
	file_text_readln(_file);
	for (var i = 0; i < array_length(global.volume); i++)
	{
		global.volume[i] = file_text_read_real(_file);
		file_text_readln(_file);
	}
	
		// controles
	file_text_readln(_file);
	for (var i = 0; i < array_length(global.keybind); i++)
	{
		global.keybind[i] = file_text_read_real(_file);
		file_text_readln(_file);
	}
	
	file_text_close(_file);
	}
	else
		debug("!!!!!!!!!!!!!!!!!!!!!!!!!! HELP MEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
}















