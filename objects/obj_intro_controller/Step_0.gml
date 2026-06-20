
if (active == 1)
{
	// pular página
	if (con == 0 && thiswriter.writing == 0)
	{
		alarm[2] = 132;
		con = 1;
	}
	if (con == 2) // botar para imagem desaparecer
	{
		alpha_type = 1;
		alarm[2] = 20;
		con = 3;
	}
	if (con == 4)
	{
		with (thiswriter)
			event_user(1);
		con = 5;
	}
	if (con == 5 && alpha_type == 0)
	{
		if (exists(thiswriter) == 1)
		{
			alpha_type = 2;
			con = 0;
		}
		else
			active = 0;
	}	
	
	
	
	// imagem desaparecer
	if (alpha_type == 1)
	{
		image_alpha -= alpha_amt;
		if (image_alpha <= 0)
			alpha_type = 0;
	}
	
	// imagem aparecer
	if (alpha_type == 2)
	{
		image_alpha += alpha_amt;
		if (image_alpha >= 1)
			alpha_type = 0;
	}
	
}	