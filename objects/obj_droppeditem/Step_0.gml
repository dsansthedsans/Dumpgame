
if (active == 1)
{
	if (myinteract == 1)
	{
		if (global.item[global.item_last] == -1)
		{
			droppeditem_remove();
			writer("droppeditem_pickup", -1, -1);
			global.droppeditem_pickupname = "";
			audio_play(snd_item, 0, 0);
			image_alpha = 0;
		}
		else
			writer("droppeditem_cantpickup", -1, -1);
		
		myinteract = 2;
	}
	else if (myinteract == 2 && exists(thiswriter) == 0)
	{
		global.chara_move = 1;
		myinteract = 0;
		if (image_alpha == 0)
			destroy(id);
	}
}