/// @descr get infloor

chara_x = obj_chara.x;
chara_y = obj_chara.y;
if (room == room_corridors_4)
{
	if (chara_x > 648.5)
		infloor = 1;
	else if (chara_y < 181 && chara_y > 139) || (chara_x < 590)
		infloor = 0;
}
if (room == unused_room_corridors_11)
{
	if (chara_x < 211.5)
		infloor = 1;
	else if (chara_y < 181 && chara_y > 139) || (chara_x > 277)
		infloor = 0;
}