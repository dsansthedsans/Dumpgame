
depth = -100;
image_alpha = 0;
acid_y2 = 80;
acid_siner = 0;
acid_alpha = 1;
acid_bonusy = 0;

if (room == room_menu)
{
	controller = obj_menu_controller;	
	acid_alpha = controller.alpha;
	acid_bonusy = controller.scroll_y;
}
else if (room == room_gameover)
{
	controller = obj_over_controller;	
	acid_alpha = 0;
	acid_y2 = 40;
}