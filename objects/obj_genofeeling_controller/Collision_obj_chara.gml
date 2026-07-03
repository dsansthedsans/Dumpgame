
if (global.chara_move == 1 && (room == unused_room_corridors_12 && global.chara_murder == 1 && global.flag[37] == 0))
{
	create_writer("genofeeling", -1);
	chara_stop();
}
destroy(id);