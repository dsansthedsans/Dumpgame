
// definir sprite
event_user(0);
//global.chara_room = room;

// criar MEE6
if (global.flag[2] == 1 && exists(obj_party) == 0) // create MEE6
{
	if (exists(obj_room_transition) == 0) || (exists(obj_room_transition) && obj_room_transition.altcon >= 2)
	{
		start_party();
		party_create(x, y, "m6", -1);
	}
}

// iniciar batalha
global.chara_encounter = 1;
var r = room;
if (r == room_corridors_1)
|| (r == room_corridors_1_5)
|| (r == room_corridors_2)
|| (r == room_corridors_3 && global.flag[17] == 0)
|| (r == room_corridors_4 && global.flag[18] == 0)
|| (r == room_corridors_3_5 && global.flag[17] == 0)
|| (r == room_corridors_5 && global.flag[15] == 1 && global.flag[16] == 0)
|| (r == room_corridors_5_A && global.flag[11] == 0)
|| (r == room_corridors_5_B && global.flag[14] == 0)
|| (r == room_corridors_9 && global.flag[42] == 0)
|| (r == unused_room_corridors_12 && global.flag[41] == 0)
|| (r == room_corridors_14 && global.flag[50] < 1)
|| (r == unused_room_corridors_16_A)
|| (r == unused_room_corridors_16_B)
|| (r == unused_room_corridors_17)
|| (r == room_corridors_17)
|| (r == room_corridors_18)
|| (r == room_caverns_1)
|| (r == room_caverns_2)
|| (r == room_caverns_3)
|| (global.world_sparedpopulation[global.chara_world] == global.world_maxpopulation[global.chara_world] && global.world_curpopulation[global.chara_world] == global.world_maxpopulation[global.chara_world])
	global.chara_encounter = 0;
if (global.chara_encounter == 1)
{
	maxsteps = (2000 - (40 * (global.world_maxpopulation[global.chara_world] - global.world_curpopulation[global.chara_world])));
	if (chara_murder() >= 2 && chara_world() == WORLD_CORRIDORS)
		maxsteps = 1000;
	maxsteps = clamp(maxsteps, 1000, 9999);
	if (global.chara_steps >= maxsteps)
	{
		if (battlecon == 0 && global.chara_move == 1 && global.chara_interact == true && global.chara_cutscene == 0)
		{
			chara_change(-1, 0, 0, 0, 0, 0, 1);
			chara_stop();
			surprise(obj_chara);
			audio_play(snd_surprise, 0, VOLUME_SOUND);
			battlecon = 1;
		}
		if (battlecon > 0 && battlecon < (1 + 45))
			battlecon += 1;
		if (battlecon >= (1 + 45))
		{
			global.chara_steps = 0;
			destroy(thissurprise);
			battle();
			battlecon = -1;
		}
	}
}