
chara = obj_chara;
if (exists(chara) == 1 && global.chara_camera_move == 1)
{
	var _cam_spd = cam_spd;
	cam_charax = (chara.x - 160);
	cam_charay = (chara.y - round(chara.sprite_height / 2) - 120);
	if (global.chara_cutscene == true && global.chara_facing == SIT && chara.lastcol.object_index == obj_interact_block && chara.lastcol.result == 1)
	{
		_cam_spd /= 2;
		cam_charax = (chara.lastcol.x + (chara.lastcol.sprite_width / 2) - 160);
		cam_charay = (chara.lastcol.y + (chara.lastcol.sprite_height / 2) - 120);
	}
	if (cam_spdJump == true)
		_cam_spd = 1;
	cam_x = lerp(cam_x, clamp(cam_charax, 0, (room_width - 320)), _cam_spd);
	cam_y = lerp(cam_y, clamp(cam_charay, 0, (room_height - 240)), _cam_spd);
	if (exists(obj_room_transition) == false) || (exists(obj_room_transition) == true && obj_room_transition.altcon >= 2)
		cam_spdJump = false;
	
	// custom
	if (room == unused_room_corridors_11)
	{
		hstairs = obj_hstairsfloor_controller;
		if (chara.x < 220 && !(hstairs.active == 1 && hstairs.infloor == 1))
			cam_y = clamp(cam_y, 0, 40);
	}
	if (room == room_corridors_18 && global.flag[60] == 1 && global.flag[61] == 0)
		cam_y = clamp(cam_y, 60, (room_height - 240));
}
var _xx = cam_x;
var _yy = cam_y;
if (cam_shake_stage == 1) || (cam_shake_stage == 2)
{
	_xx += round(cam_shake_xint * choose(1, -1));
	_yy += round(cam_shake_yint * choose(1, -1));
	
	if (cam_shake_xint > 0)
		cam_shake_xint -= 0.2;
	else
		cam_shake_xint = 0;		
	if (cam_shake_yint > 0)
		cam_shake_yint -= 0.2;
	else
		cam_shake_yint = 0;			
	cam_shake_stage = 2;
	if (cam_shake_xint == 0 && cam_shake_yint == 0)
		cam_shake_stage = 0;
}
camera_set_view_pos(view_camera[0], _xx, _yy);