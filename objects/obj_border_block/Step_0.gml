
event_inherited();

// appear/disappear
mydist = abs(distance_to_object(obj_chara));
if (global.chara_cutscene == 0)
	image_alpha = (1 - (mydist / mindist));
