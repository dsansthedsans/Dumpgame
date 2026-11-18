if (mode == 0)
{
	for (var h = 0; h < surface.height; h++)
	{
		for (var w = 0; w < surface.width; w++)
		{
			if (bufferPixel[h, w].object != undefined && instance_exists(bufferPixel[h, w].object) == true)
				destroy(bufferPixel[h, w].object);
		}
	}
}
destroy(id);