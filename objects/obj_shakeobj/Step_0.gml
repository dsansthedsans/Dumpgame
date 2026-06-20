
// start shake
if (active == 0) 
{
	nowx = obj.x;
	nowy = obj.y;
	active = 1;
}

// shake
if (active == 1 and instance_exists(obj) == 1)
{
	intsidex = choose(-1, 1);
	intsidey = choose(-1, 1);
	obj.x = round(nowx + (xint * intsidex));
	obj.y = round(nowy + (yint * intsidey));
	if (xint > 0)
		xint -= intlower;
	if (yint > 0)
		yint -= intlower;
	if (xint <= 0 and yint <= 0)
	{
		obj.x = nowx;
		obj.y = nowy;
		instance_destroy();
	}
}
else 
	instance_destroy();