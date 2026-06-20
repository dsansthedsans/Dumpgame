
active = 1;
image_xscale = 1;
image_yscale = 1;
image_alpha = 1;
image_speed = 0;
image_index = 0;
image_angle = 0;
image_blend = c_white;
persistent = 0;
visible = 1;
solid = 0;
speed = 0;
chara = obj_chara;
depth = (chara.depth + 1);
if (global.chara_facing == UP)
	depth = (chara.depth - 2);
xscale = image_xscale;
yscale = image_yscale;

chara_length = 100;
chara_moving = 0;
chara_running = 0;
for (var i = chara_length; i >= 0; i--)
{
	chara_x[i] = chara.x;
	chara_y[i] = chara.y;
	chara_face[i] = global.chara_facing;
	chara_speed[i] = chara.curspeed;
}

pos = 0;
moving = 0;
if (variable_instance_exists(id, "movement") == 0)
{
	movement = 1;
	following = 1;
	flyside = -1;
	flylook = -1;
}
party_type();


/*
chara = obj_chara;
chara_moving = 0;
chara_running = 0;

talking = 0;
turned = 0;

mypos = (20 * (myself + 1));
maxlength = 100;
event_user(0);
event_user(1);

active = 1;
myxscale = 1;
myyscale = 1;
solid = 0;
depth = (chara.depth + 1);
visible = 1;
persistent = 0;
image_alpha = 1;
image_speed = 0;
image_index = 0;
image_angle = 0;
image_blend = c_white;
image_xscale = 1;
image_yscale = 1;
if (global.chara_facing == UP)
	depth = (chara.depth - 2);
	*/
