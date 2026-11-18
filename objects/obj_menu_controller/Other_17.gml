savefile = [];
for (var i = 0; i < (option_length[1] - 1); i++)
{
	if (file_exists($"{global.game_directory}savefile{i}.txt") == 1)
	{
		savefile_read(i);
		savefile[i] =
		{
			name : savefile_name,
			money : savefile_money,
			lvl : savefile_lvl,
			exp : savefile_exp,
			spares : savefile_spares,
			kills : savefile_kills,
			heals : savefile_heals,
			deaths : savefile_deaths,
			weapon : savefile_weapon,
			armor : savefile_armor,
			room : savefile_room,
			world : savefile_world,
			murder : savefile_murder,
			item : savefile_item,
			flag : savefile_flag,
			curpop : savefile_curpop,
			sparedpop : savefile_sparedpop,
		}
	}
}