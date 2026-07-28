
ball[0] = -1;
ball_amt = 5;
for (var i = 1; i < ball_amt; i++)
{
	create(0, 0, unused_obj_rhonheyattacktest_ball);
	ball[i] = thisobj;
	ball[i].depth = depth;
}
active = 1;
siner = 0;
heart = obj_battle_heart;
heart_oldx = 0;
heart_oldy = 0;
heart_shake = 1;
con = 0;
can_damage = 1;
outside_box = true; // if 0, image_scale won't matter
destroy_on_impact = false;
stage = 0;
delay = 0;
dmg = 3;