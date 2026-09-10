
active = 1;
xscale = 1;
yscale = 1;
visible = 1;
party_type(type);
party_stop(0);


chara = obj_chara;
chara_length = 1000;

pos = 20;
movetype = 0;
moving = 0;
targetside = -1;
facing = DOWN;
event_user(2);
x = chara_x[pos];
y = chara_y[pos];
event_user(0);

stepplay = false;
stepstage = 1;