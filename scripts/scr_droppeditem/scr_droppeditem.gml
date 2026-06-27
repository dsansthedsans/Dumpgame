function droppeditem_add(_item)
{
	var i = 0;
	while (global.droppeditem[i] != -1)
		i += 1;
	
	global.droppeditem[i] = argument0;
	global.droppeditem_x[i] = obj_chara.x;
	global.droppeditem_y[i] = obj_chara.y;
	global.droppeditem_room[i] = room;
	
	create(global.droppeditem_x[i], global.droppeditem_y[i], obj_droppeditem);
	thisobj.type = argument0;
	thisobj.pos = i;
}
function droppeditem_createall()
{
	for (var i = 0; i < global.droppeditem_length; i++)
	{
		if (room == global.droppeditem_room[i])
		{
			create(global.droppeditem_x[i], global.droppeditem_y[i], obj_droppeditem);
			thisobj.type = global.droppeditem[i];
		}
	}
}
function droppeditem_remove()
{
	global.item[global.item_last] = global.droppeditem[pos];
	global.droppeditem_pickupname = item_name(global.droppeditem[pos], "");
	
	global.droppeditem[pos] = -1;
	global.droppeditem_x[pos] = -20;
	global.droppeditem_y[pos] = -20;
	global.droppeditem_room[pos] = -1;
}