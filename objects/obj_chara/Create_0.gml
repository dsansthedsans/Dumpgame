
image_xscale = 1;
image_yscale = 1;
image_alpha = 1;
image_speed = 0;
image_index = 0;
image_angle = 0;
image_blend = c_white;
persistent = false;
visible = true;
solid = false;
speed = 0;
depth = -bbox_bottom;
xscale = image_xscale;
yscale = image_yscale;

// velocidade de movimento e de imagem
wspeed = 1.5;
rspeed[0] = 2.5;
rspeed[1] = 3;
rspeed_party = (rspeed[1] + (rspeed[1] - rspeed[0]));
rspeed_pos = 0;
curspeed = wspeed;

wimgspeed = ((wspeed / 10) + 0.05);
rimgspeed[0] = ((rspeed[0] / 10) + 0.05);
rimgspeed[1] = ((rspeed[1] / 10) + 0.05);
rimgspeed_party = ((rspeed_party / 10) + 0.05);
curimgspeed = wimgspeed;

mycol = 0;
lastcol = undefined;

// variáveis de suporte
stepplay = false;
stepstage = 1;
stepsound = 0;
stepvolume = 1;
afktime = 0;
afkmaxtime = (60 * 60);

// variáveis de estado
moving = 0;
running = 0;
friskdance = 1;
inwater = 0;

maxsteps = 9999;
battlecon = 0;

event_user(0);
global.chara_room = room;
