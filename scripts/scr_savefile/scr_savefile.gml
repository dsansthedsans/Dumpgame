
function savefile_write()
{
	var _file_name = "savefile" + string(global.savefile_selected) + ".txt";
	var _file = file_text_open_write(working_directory + string(_file_name));
	
	file_text_write_string(_file, "[" + string(global.savefile_msg[irandom(array_length(global.savefile_msg) - 1)]) + "]");
	
	file_text_writeln(_file);
	file_text_writeln(_file);
	
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
function savefile_read(_savefile)
{
	var _file_name = "savefile" + string(argument0) + ".txt";
	var _file = file_text_open_read(working_directory + string(_file_name));
	if (_file != -1)
	{
		file_text_readln(_file);
		file_text_readln(_file);
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
	while (file_exists("savefile" + string(z) + "_erased" + string(i) + ".txt") == 1)
		i += 1;
	file_rename("savefile" + string(z) + ".txt", "savefile" + string(z) + "_erased" + string(i) + ".txt");
}





/*
function start_savefiles()
{
	// criar arquivos
	for (var i = 0; i < 3; i++)
	{
		var _file_name = "save_file" + string(i);
		if (file_exists(_file_name) == 0)
		{
			file_msg[i] = "";
			while (file_msg[i] == "") || (i > 0 && file_msg[i] == file_msg[(i - 1)])
			{
				file_msg[i] = 
				choose(
				// UNDERTALE/DELTARUNE
				"Despite everything, it's still you.",
				"It's hard to think anybody would want to flirt with me.",
				"You should be smiling, too. Aren't you excited? Aren't you happy? You're going to be free.",
				"Have you ever thought about a world where everything is exactly the same, except you don't exist?",
				"I can't go to hell. I'm all out of vacation days.",
				"TAKE A GOD DAMN VACATION STRAIGHT TO HELL",
				"... can anyone hear me? Help...",
				"[Hyperlink blocked]",
				"But nobody came.",
				"Big boner down the lane",
				"I'm Wing Gaster! The royal scientist .",
			
				// ULTRAKILL
				"Machine, turn back now.",
				"Ahh... Free at last.",
				"A visitor? Hmm... Indeed, I have slept long enough.",
				"You're not getting away this time.",
				"Something wicked this way comes.",
				"Full Auto",
				"Fuller Auto",
				
				// Dumpster Friends
				"BIZALOUCA MANDA DALVE",
				"Romp Spip",
				"Beto Bomial",
				"Bob Bazmal",
				"manda o arguivo",
				"OI ANINHA",
				"limpeza anal",
				"EU TO NO PASSADO",
				"garry's mod Fuckgame",
				"garry's game Fuckmod",
				"J'SUIS PAS CONTENT !!!",
				"Cara voce GOSTA do meu SETUP ?",
				"Everybody Loves Somebody Sometime",
				"\"incrível\" como Dsans diria, se estivesse conosco..",
				"Carambolas... Essas mensagens aleatórias são bem... estranhas e ao mesmo tempo, esquisitas..."
				)
			}
			file_msg[i] = "[" + string(file_msg[i]) + "]";
			
			var _file = file_text_open_write(_file_name);
			file_text_write_string(_file, file_msg[i]);
			file_text_close(_file);
		}
	}
	
	global.savefile_selected = 0;
}

function savefile_write()
{
	var _file_name = "save_file" + string(global.savefile_selected);
	var _file = file_text_open_write(_file_name);
	
	file_text_writeln(_file);
	file_text_write_string(_file, "CARA MANDA DALVE!!!!!!!");
	
	file_text_close(_file);
}	
function savefile_read()
{
	var _file_name = "save_file" + string(global.savefile_selected);
	var _file = file_text_open_read(_file_name);
	
	file_text_readln(_file);
	var _string = file_text_read_string(_file);
	debug("adhajashdj: "  + string(_string));
	
	file_text_close(_file);
}
*/