
// pegar se pode iniciar uma batalha
var _spared_all = 0;
if (global.world_sparedpopulation[global.chara_world] == global.world_maxpopulation[global.chara_world] && global.world_curpopulation[global.chara_world] == global.world_maxpopulation[global.chara_world])
	_spared_all = 1;

encounter = 1;
var r = room;
if (r == room_corridors_1)
|| (r == room_corridors_1_5)
|| (r == room_corridors_2)
|| (r == room_corridors_3		&& global.flag[17] == 0)
|| (r == room_corridors_4		&& global.flag[18] == 0)
|| (r == room_corridors_3_5		&& global.flag[17] == 0)
|| (r == room_corridors_5		&& global.flag[15] == 1 && global.flag[16] == 0)
|| (r == room_corridors_5_A		&& global.flag[11] == 0)
|| (r == room_corridors_5_B		&& global.flag[14] == 0)
|| (r == room_corridors_9		&& global.flag[42] == 0)
|| (r == room_corridors_12		&& global.flag[41] == 0)
|| (r == room_corridors_14		&& global.flag[54] == 0)
|| (r == room_corridors_16_B)
|| (r == room_corridors_17)
|| (r == room_corridors_18)
|| (r == room_caverns_1)
|| (r == room_caverns_2)
|| (r == room_caverns_3)
|| (_spared_all == 1)
	encounter = 0;

encounter = 0;

// calcular quantidade necessária de passos e iniciar batalha
if (encounter == 1)
{
	// calcular quantidade necessária de passos
	var _curpop = global.world_curpopulation[global.chara_world];
	var _maxpop = global.world_maxpopulation[global.chara_world];
	var _killed = (_maxpop - _curpop);
	maxsteps = (2000 - (_killed * 30));
	maxsteps = clamp(maxsteps, 120, 9999);
	
	// iniciar batalha
	if (chara.steps >= maxsteps)
	{
		if (con == 0 && global.chara_move == 1 && global.chara_cutscene == 0)
		{
			chara_change(-1, 0, 0, 0, 0, 0, 1);
			chara_stop();
			surprise(obj_chara);
			audio_play(snd_surprise, 0, VOLUME_SOUND);
		
			alarm[2] = 45;
			con = 1;
		}
		if (con == 2)
		{
			destroy(thissurprise);
			battle();
		}
	}
}
