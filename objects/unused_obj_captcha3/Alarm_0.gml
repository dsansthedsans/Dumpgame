/// @descr timer

timer[1] -= 1;
if (timer[1] < 0)
{
	timer[0] -= 1;
	timer[1] = 60;
	timer_color = 130;
}
if (stage < 8 && ((timer[0] > 0) || (timer[0] == 0 && timer[1] > 0)))
	alarm[0] = 1;