
if (con == 1)
{
	// abaixar o alpha
	alpha += alpha_amt;
	
	// ir para o próximo quarto
	if (alpha >= 1) 
	{
		room_goto(rr);
		global.inbattle = 0;
		alpha = 1;
		con = 2;
	}
}
else if (con == 2)
{
	// definir posição e movimento do jogador
	if (altcon == 1 && room == rr)
	{
		if (exists(chara) == 1)
		{
			if (xx != -1)
				chara.x = xx;
			if (yy != -1)
				chara.y = yy;
			chara.depth = -chara.bbox_bottom;
		}
		
		altcon = 2;
	}
	else if (altcon == 2)
	{
		if (exists(chara) == 1 && global.chara_cutscene == 0 && alpha <= 0.5)
		{
			chara_change(-1, 1, 1, -1, 1, 1, -1);
			altcon = 3;
		}
	}
	else
		altcon += 0.1;
	
	// abaixar o alpha
	if (altcon >= 2)
		alpha -= alpha_amt;
	
	// terminar
	if (alpha <= 0)
	{
		global.leavingbattle = 0;
		debug("--- Changed rooms with obj_room_transition");
		destroy(id);	
	}
}



/*
if (active == 1)
{
	if (mystage == 1)
	{
		if (myalpha <= 0.5 && setchara == 1 && setmove == 0 && exists(obj_chara_menu) == 0 && global.chara_cutscene == 0 && exists(obj_genodialog_unused) == 0)
		{
			chara_change(-1, 1, 1, -1, 1, 1, -1);
			setmove = 1;
		}
		if (room == myroom && setchara == 0 && exists(obj_chara) == 1)
		{
			if (myx != -1)
				obj_chara.x = myx;
			if (myy != -1)
				obj_chara.y = myy;
			obj_chara.depth = -obj_chara.bbox_bottom;
			setchara = 0.5;
		}
		else if (setchara == 0.5)
			setchara = 1;
		else if (setchara == 1) || (exists(obj_chara) == 0)
		{
			myalpha -= myamount;
			if (myalpha <= 0)
			{
				destroy(id);
				debug("--- Changed rooms with obj_room_transition");
				global.leavingbattle = 0;

			}
		}
	}
	if (mystage == 0)
	{
		myalpha += myamount;
		if (myalpha >= 1)
		{
			myalpha = 1;
			mystage = 1;
			if (myroom == -1)
				myroom = room_crazycat;
			room_goto(myroom);
			global.inbattle = 0;
		}
	}
	
	draw_set_alpha(myalpha);
	draw_set_color(c_red);
	draw_rectangle(-40, -40, (room_width + 40), (room_height + 40), 0);
}

draw_set_alpha(1);
*/