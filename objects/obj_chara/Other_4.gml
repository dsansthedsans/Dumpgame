for (var i = 0; i < global.itemDropped_lengthMax; i++)
{
	if (struct_names_count(global.itemDropped[i]) >= 1 && global.itemDropped[i].room == room)
		itemDropped_create(i);
}