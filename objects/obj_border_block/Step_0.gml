
event_inherited();

// appear/disappear
if (instance_exists(obj_chara) == true)
{
	mydist = abs(distance_to_object(obj_chara));
	if (round(global.chara_cutscene) == false)
		image_alpha = lerp(image_alpha, clamp((1 - (mydist / mindist)), 0, 1), 0.1);
}