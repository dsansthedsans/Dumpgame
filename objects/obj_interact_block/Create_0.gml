event_inherited();
con = 0;
text = "";
result = 0;
chara = obj_chara;
if (object_get_name(object_index) == "obj_moveable_block")
{
	result = 2;
	mydist = 20;
	myspeed = 0.2;
	myfacing = -1;
	mytargetx = -1;
	mytargety = -1;
}
room_interact();