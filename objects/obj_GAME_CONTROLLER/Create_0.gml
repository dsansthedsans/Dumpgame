
START_GAME();
CHANGE_GAME();
window_center();	
window_set_caption("");
create(-20, -20, obj_MUSIC_CONTROLLER);
create(-20, -20, obj_PARTICLE_CONTROLLER);
create(-20, -20, obj_DRP_CONTROLLER);
active = 0;

fullscreen = 0;
fullscreen_delay = 0;
fullscreen_delaymax = 30;

cam_x = 0;
cam_y = 0;
cam_shake_xint = 0;
cam_shake_yint = 0;
cam_shake_stage = 0;

for (var i = 0; i < 4; i++)
{
	sw_time[i] = 0;
	sw_zero[i] = 0;
}

depth = -15500;
alarm[0] = load_time;
image_alpha = 0;
