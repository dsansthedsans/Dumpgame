
event_inherited();

con = 0;
text = "";
result = 0;
chara = obj_chara;
if (object_get_name(object_index) == "obj_moveable_block")
{
	result = 2;
	mydist = 20;
	myspeed = 0.15;
	myfacing = -1;
	mytargetx = -1;
	mytargety = -1;
}
room_interact();

/*
event_inherited();
chara = obj_chara;

myid = "";
myinteract = 0;
myresult = 0;
mydelay = 0
if (object_get_name(object_index) == "obj_moveable_block")
{
	myresult = 2;

	mydist = 20;
	myspeed = 0.15;

	myfacing = -1;
	mytargetx = -1;
	mytargety = -1;
}

middle_stage = 0
middle_delay = 0;

readable_room();
*/