event_inherited();
if (room == room_corridors_17 && sprite_index == spr_npc_flitcher && global.flag[44] == 0.5)
	sprite_index = spr_npc_flitcher_front;
else if (room == room_corridors_17 && sprite_index == spr_npc_flitcher_front && global.flag[44] != 0.5)
	sprite_index = spr_npc_flitcher;