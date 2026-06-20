
if (exists(obj_battle_fighttarget) == 0)
{
	image_alpha = lerp(image_alpha, 0, 0.1);
	image_xscale = lerp(image_xscale, 0, 0.035);
	if (image_alpha <= 0)
		destroy(id);
}