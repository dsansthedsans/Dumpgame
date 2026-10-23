if (con == 1 && exists(thiswriter) == false)
{
	chara_facing(DOWN);
	chara_change(-1, true, true, false, true, true, -1);
	party_change(0, 0, -1);
	con += 1;
}