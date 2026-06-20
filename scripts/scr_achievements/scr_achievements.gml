
function achievements_write()
{
	var _file_name = "achievements.txt";
	var _file = file_text_open_write(working_directory + string(_file_name));
	
	file_text_write_string(_file, "[Did you know that if you turn all the zeros into ones you'll have all of the achievements? Yeah, I bet you already knew that.]")
	file_text_writeln(_file);
	
	file_text_writeln(_file);
	for (var i = 0; i < global.achievement_total; i++)
	{
		file_text_write_real(_file, global.achievement[i]);
		file_text_writeln(_file);
	}
	
	file_text_close(_file);
}

function achievements_read()
{
	var _file_name = "achievements.txt";
	var _file = file_text_open_read(working_directory + string(_file_name));
	
	file_text_readln(_file);
	
	file_text_readln(_file);
	for (var i = 0; i < global.achievement_total; i++)
	{
		global.achievement[i] = file_text_read_real(_file);
		file_text_readln(_file);
	}
	
	file_text_close(_file);	
}

function achievement_add(_id)
{
	var i = argument0;
	if (global.achievement[i] == 0)
	{
		global.achievement[i] = 1;
		achievements_write();
		audio_play(snd_notification_achievement, 0, VOLUME_SOUND);
	}
}
function achievement_achieved()
{
	var _achieved = 0;
	for (var a = 0; a < global.achievement_total; a++)
	{
		if (global.achievement[a] == true)
			_achieved += 1;	
	}
	return _achieved;
}