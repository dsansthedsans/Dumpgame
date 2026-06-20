
if (con == 0)
{
	if (global.flag[flag] == 0 && global.hidenotif == 0)
	{
		global.flag[flag] = 1;
		con = 1;
	}
	else
		destroy(id);
}