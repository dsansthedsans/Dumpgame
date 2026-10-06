/// @descr start/reset effects

for (var c = 1; c < (string_length(msg[page]) + 2); c++)
{
	shake_x[c] = 0;
	shake_y[c] = 0;
	
	impact_x[c] = 0;
	impact_y[c] = 0;
	impact_time[c] = choose(4, 6, 8);
}
shake_change = 0;
shaking = 0;
floating = 0;
myfloat = 0;
impacting = 0;
impact_change = false;