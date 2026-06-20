
normaltime = 0;
var _length = 0;
for (var i = 0; i < controller.enemy_length; i++)
{
	if (controller.enemy_type[i] != 0)
		_length += 1;
}
normaltime = (8 * (_length - 1));

time = 1;
box_x = controller.box_x;
box_y = controller.box_y;
box_w = controller.box_w;
box_h = controller.box_h;
box_borderw = controller.box_borderw;
battle_attack();
alarm[0] = time;