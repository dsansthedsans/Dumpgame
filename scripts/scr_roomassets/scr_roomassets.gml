
function room_interact()
{
	var r = room;
	
	// save point
	if (r == room_corridors_3 && x == 150 && y == 270) || (r == room_corridors_4 && x == 150 && y == 185) ||  (room == room_corridors_8 && x == 90 && y == 325) || (room == room_corridors_11 && x == 130 && y == 120) || (room == room_corridors_13 && x == 370 && y == 160) || (room == room_corridors_16 && x == 170 && y == 200) || (room == room_caverns_3 && x == 150 && y == 225)
	{
		text = "savepoint";
		result = 0.1;
	}
	// bench
	if (room == room_corridors_7 && ((x == 240 || x == 560) && y == 95)) || (room == room_corridors_11 && ((x == 130 || x == 290) && y == 95))
		result = 1;	
	
	// corridors
	if (r == room_corridors_1)
	{
		// lamp
		if (x == 80 && y == 420) || (x == 220 && y == 420) || (x == 90 && y == 80)
			text = "room_lamp";
		
		// pillar
		if (x == 50 && y == 455) || (x == 250 && y == 455) || (x == 50 && y == 555) || (x == 250 && y == 555) || (x == 120 && y == 80) || (x == 180 && y == 80)
			text = "room_pillar";
		
		// broken lamp
		if (x == 210 && y == 90)
			text = "room_brokenlamp";
	}
	if (r == room_corridors_1_5)
	{
		if (x == 120)
		{
			// rock pile
			if (y == 530)
				text = "room_rockpile_0";
			
			// impressive rock pile
			if (y == 485)
				text = "room_rockpile_1";
		}
	}
	if (r == room_corridors_2)
	{
		// banner
		if (x == 85 && y == 100)
			text = "room_m6_banner";
		
		// poster
		if (x == 215 && y == 60)
			text = "room_m6_poster";
		
		// papers
		if (x == 120 && y == 140)
			text = "room_m6_papers";
	}
	if (r == room_corridors_3)
	{
		// mini6
		if (x == 260 && y == 260)
			text = "room_m6_brokenwall";
		
		// dead lamp
		if (x == 80 && y == 80)
			text = "room_deadlamp";
	}
	if (r == room_corridors_3_5)
	{
		// dummy
		if (x == 160 && y == 140)
		{
			text = "npc_dummy";
			sprite_index = spr_npc_dummy;
		}
	}
	if (r == room_corridors_4)
	{
		// armsguy npc
		if (x == 750 && y == 130)
		{
			text = "npc_armsguy1";
			sprite_index = spr_npc_armsguy;
			if (global.world_curpopulation[WORLD_CORRIDORS] < global.world_maxpopulation[WORLD_CORRIDORS])
				destroy(id);
		}
	}
	if (r == room_corridors_4_5 && x == 150 && y == 125)
		text = "room_rulesbook";
	if (room == room_corridors_5 && x == 60 && y == 60)
		text = "room_captcha_mainsign_1";
	if (room == room_corridors_5_A && x == 260 && y == 140) || (room == room_corridors_5_B && x == 20 && y == 140)
		text = "room_captcha_guidesign_1";
	if (room == room_corridors_6)
	{
		if (x == 150 && y == 125)
			text = "room_candybowl";
		if (x == 140 && y == 60)
			text = "room_candysign";
	}
	if (room == room_corridors_7) // trashguy npc
	{
		if (x == 50 && y == 95)
			text = "room_relaxsign";
		if (x == 685 && y == 125) // trashguy npc
		{
			text = "npc_trashguy";
			sprite_index = spr_npc_trashguy_closed;
			if (global.world_curpopulation[WORLD_CORRIDORS] < global.world_maxpopulation[WORLD_CORRIDORS])
				destroy(id);
		}
	}
	if (room == room_corridors_8) // lost npcs
	{
		// rat hole
		if (x == 220 && y == 280)
			result = 3;	
		
		// armsguy npc (lost)
		if (x == 190 && y == 350)
		{
			text = "npc_armsguy_lost";
			sprite_index = spr_npc_armsguy;
			if (global.world_curpopulation[WORLD_CORRIDORS] <= 0)
				destroy(id);
		}
		
		// trashguy npc 2 (lost)
		if (x == 215 && y == 360)
		{
			text = "npc_trashguy_lost2";
			sprite_index = spr_npc_trashguy;
			if (global.world_curpopulation[WORLD_CORRIDORS] <= 0) || (global.flag[46] == 0)
				destroy(id);
		}
	}
	if (room == room_corridors_9)
	{
		// main sign
		if (x == 80 && y == 840)
			text = "room_captcha_mainsign_2";	
			
		// guide sign
		if (x == 170 && y == 630)
			text = "room_captcha_guidesign_2";
		
		// trashguy npc 1 (lost)
		if (x == 200 && y == 480)
		{
			text = "npc_trashguy_lost1";
			result = 4;
			sprite_index = spr_npc_trashguy_closed;
			if (global.world_curpopulation[WORLD_CORRIDORS] <= 0) || (global.flag[46] == 1)
				destroy(id);
		}
	}
	if (room == room_corridors_10 && x == 130 && y == 110)
		text = "room_chocobowl";
	if (room == room_corridors_11)
	{
		if (x == 470 && y == 175)
			text = "room_preclocksign";
	}
	if (room == room_corridors_12 && x == 150 && y == 60)
		text = "room_clock";
	if (room == room_corridors_13)
	{
		// sign
		if (x == 60 && y == 355)
			text = "room_postclocksign";
		
		// maurice
		if (x == 360 && y == 437)
			text = "room_maurice";
			
		// armsguy
		if (x == 160 && y == 370)
		{
			text = "npc_armsguy_postbc";
			sprite_index = spr_npc_armsguy;
			if (global.flag[38] == 1) || (global.world_curpopulation[WORLD_CORRIDORS] <= 0)
				destroy(id);
		}
	}
	if (room == room_corridors_14)
	{
		// main sign
		if (x == 140 && y == 1440)
			text = "room_captcha_mainsign_3";
			
		// guide sign
		if (x == 250 && y == 1145)
			text = "room_captcha_guidesign_3_1";
		if (x == 250 && y == 845)
			text = "room_captcha_guidesign_3_2";
		if (x == 250 && y == 545)
			text = "room_captcha_guidesign_3_3";
		
		// final sign
		if (x == 140 && y == 240)
			text = "room_captcha_endsign_3";
	}
	if (room == room_corridors_15 && x == 150 && y == 125)
		text = "room_nobowl";
	if (room == room_corridors_16_A)
	{
		// sign
		if (x ==  80 && y == 60)
			text = "room_cavernssign";
		
		// door
		if (x == 140 && y == 60)
			text = "room_cavernsdoor";
	}
	if (room == room_corridors_16_B)
	{
		// sign
		if (x == 105 && y == 60)
			text = "room_subwaysign";
		
		// broken button
		if (x == 140 && y == 60)
			text = "room_subwaybutton";
	}
	if (room == room_corridors_17)
	{
		// first armsguy
		if (x == 505 && y == 370)
		{
			text = "npc_armsguy_exitfirst";
			sprite_index = spr_npc_armsguy;
		}
		
		// trashguy
		if (x == 106 && y == 425)
		{
			text = "npc_trashguy_exitfishing";
			sprite_index = spr_npc_trashguy_fishing;
		}
		
		// armsguy gym
		if (x == 740 && y == 150)
		{
			text = "npc_armsguy_exitlifting";
			sprite_index = spr_npc_armsguy_lifting;
			image_speed = 1;
		}
		
		// flitcher
		if (x == 430 && y == 240)
		{
			text = "npc_flitcher_exit";
			sprite_index = spr_npc_flitcher;
		}
		
		if (global.world_curpopulation[global.chara_world] <= 0) || (global.flag[38] == 1)
			destroy(id);
	}
	if (room == room_corridors_18)
	{
		// first sign
		if (x == 140 && y == 120)
			text = "room_finalcorridor_sign";
	}
}

function room_solid()
{
	// corridors
	if (room == room_corridors_1)
	{
		// lamp
		if (x == 80 && y == 400) || (x == 220 && y == 400) || (x == 90 && y == 60) || (x == 210 && y == 87)
		{
			sprite_index = spr_overworld_lamp;
		
			if (x == 210 && y == 87)
				image_index = 1;
		}	
	
		// pillar
		if (x == 50 && y == 415) || (x == 250 && y == 415) || (x == 50 && y == 515) || (x == 250 && y == 515) || (x == 120 && y == 40) || (x == 180 && y == 40)
			sprite_index = spr_overworld_pillar;
	}
	if (room == room_corridors_1_5)
	{		
		// rock pile
		if (x == 120 && y == 450)
			sprite_index = spr_overworld_rockpile;		
		
		// rocks
		if (x == 220 && y == 570) || (x == 270 && y == 530) || (x == 230 && y == 440) || (x == 210 && y == 350)
		{
			sprite_index = spr_overworld_caverns_rock;
			if (x == 220 && y == 570)
				image_index = 4;
			if (x == 230 && y == 440)
				image_index = 3;
			if (x == 210 && y == 350)
				image_index = 1;
		}
		
		// lamp
		if (x == 119 && y == 40) || (x == 180 && y == 40)
			sprite_index = spr_overworld_lamp;
	}
	if (room == room_corridors_2)
	{
		// lamp
		if (x == 110 && y == 40) || (x == 190 && y == 40)
			sprite_index = spr_overworld_lamp;
		
		// banner
		if (x == 85 && y == 30)
			sprite_index = spr_overworld_m6_banner;
		
		// poster
		if (x == 215 && y == 40)
			sprite_index = spr_overworld_m6_poster;
			
		// table
		if (x == 180 && y == 80)
			sprite_index = spr_overworld_m6_table;
	}
	if (room == room_corridors_3)
	{
		// lamp
		if (x == 80 && y == 420) || (x == 220 && y == 420) || (x == 150 && y == 240) || (x == 70 && y == 60) || (x == 230 && y == 60)
		{
			sprite_index = spr_overworld_lamp;
		
			if (x == 70 && y == 60)
				image_index = 2;
		}
		
		// pillar door
		if (x == 110 && y == 10)
			sprite_index = spr_overworld_pillardoor;
		
		// pilar
		if (x == 50 && y == 240) || (x == 250 && y == 240) || (x == 85 && y == 230)
		{
			sprite_index = spr_overworld_pillar;
			if (x == 50)
				image_index = 1;
			if (x == 85 && y == 230)
			{
				image_index = 4;
				image_xscale = -1;
			}
		}
	}
	if (room == room_corridors_3_5)
	{
		// lamp
		if (x == 85 && y == 40) || (x == 215 && y == 40)
			sprite_index = spr_overworld_lamp;	
	
		// pillar door
		if (x == 110 && y == -10)
			sprite_index = spr_overworld_pillardoor;
		
		// door
		if (x == 140 && y == 0)
			sprite_index = spr_overworld_bigdoor_closed;
	}
	if (room == room_corridors_4)
	{
		// lamp
		if (x == 280 && y == 160) || (x == 400 && y == 100) || (x == 520 && y == 100) || (x == 650 && y == 40) || (x == 770 && y == 70)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 770 && y == 70)
				image_index = 1;
			if (x == 400 && y == 100)
				image_index = 2;
		}
		
		// tree
		if (x == 380 && y == 110) || (x == 480 && y == 90) || (x == 480 && y == 210) || (x == 630 && y == 40) || (x == 740 && y == 150)
		{
			sprite_index = spr_overworld_tree;	
			leaf_fall = 1;
		}
		
		if (x == 110 && y == 130) || (x == 190 && y == 130)
			sprite_index = spr_overworld_pillar;
		
	}
	if (room == room_corridors_4_5)
	{
		// lamp
		if (x == 85 && y == 40) || (x == 215 && y == 40)
			sprite_index = spr_overworld_lamp;
		
		// book pillar
		if (x == 150 && y == 85)
		{
			sprite_index = spr_overworld_pillar;
			image_index = 7;
		}
	
		// pillar door
		if (x == 110 && y == -10)	
			sprite_index = spr_overworld_pillardoor;
	}
	if (room == room_corridors_5)
	{
		// lamp
		if (x == -10 && y == 80) || (x == 230 && y == 40) || (x == 310 && y == 80)
			sprite_index = spr_overworld_lamp;
		
		// pillar door
		if (x == 110 && y == -10)
			sprite_index = spr_overworld_pillardoor;
		
		// big door
		if (x == 140 && y == 0)
		{
			sprite_index = spr_overworld_bigdoor_closed;
			if (global.flag[11] == 1 && global.flag[14] == 1)
				sprite_index = spr_overworld_bigdoor_open;
		}
	}
	if (room == room_corridors_5_A)
	{
		// lamp
		if (x == 50 && y == 60) || (x == 210 && y == 60) || (x == 310 && y == 120)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 210 && y == 60)
				image_index = 2;
		}
	}
	if (room == room_corridors_5_B)
	{
		// lamp
		if (x == -10 && y == 120) || (x == 90 && y == 60) || (x == 250 && y == 60)
			sprite_index = spr_overworld_lamp;
	}	
	if (room == room_corridors_6)
	{
		// lamp
		if (x == 90 && y == 40) || (x == 210 && y == 40) || (x == 300 && y == 80)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 210 && y == 40)
				image_index = 2;
		}
	
		// pillar
		if (x == 150 && y == 85)
		{
			sprite_index = spr_overworld_pillar;
			image_index = 8;
		}
	}
	if (room == room_corridors_7)
	{
		// lamp
		if (x == 170 && y == 60) || (x == 330 && y == 60) || (x == 490 && y == 87) || (x == 650 && y == 60) || (x == 820 && y == 80)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 490 && y == 87)
				image_index = 1;
		}
	
		// pillar
		if (x == 90 && y == 40) || (x == 90 && y == 130) || (x == 410 && y == 40) || (x == 410 && y == 130) || (x == 730 && y == 40) || (x == 717 && y == 30) || (x == 730 && y == 130)
		{
			sprite_index = spr_overworld_pillar;
			if (x == 730 && y == 40)
				image_index = 1;
			if (x == 717 && y == 30)
				image_index = 4;
		}
	
		// tree
		if (x == 230 && y == 20) || (x == 550 && y == 20)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
		
		// bench
		if (x == 230 && y == 75) || (x == 230 && y == 135) || (x == 550 && y == 75) || (x == 550 && y == 135)
		{
			sprite_index = spr_overworld_bench;
			if (x == 230 && y == 135) || (x == 550 && y == 135)
				image_index = 1;
		}
	
		// sign
		if (x == 50 && y == 95)
			sprite_index = spr_overworld_sign;
	}
	if (room == room_corridors_8)
	{
		// lamp
		if (x == 10 && y == 300) || (x == 90 && y == 260) || (x == 210 && y == 260) || (x == 80 && y == 60) || (x == 220 && y == 60)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 80 && y == 60)
				image_index = 2;
		}
		
		// tree
		if (x == 70 && y == 100) || (x == 180 && y == 60)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
		
		// pillar door
		if (x == 110 && y == 10)
			sprite_index = spr_overworld_pillardoor;
	}
	if (room == room_corridors_9)
	{
		// lamp	
		if (x == 30 && y == 820) || (x == 150 && y == 820) || (x == 270 && y == 820) || (x == 60 && y == 80) || (x == 240 && y == 80)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 150 && y == 820)
				image_index = 2;
		}

		// lamp 2
		if (x == 40 && y == 600) || (x == 120 && y == 600) || (x == 40 && y == 420) || (x == 120 && y == 420) || (x == 40 && y == 240) || (x == 120 && y == 240)
		{
			sprite_index = spr_overworld_lamp2;	
			if (x == 40 && y == 420)
				image_index = 1;
			if (x == 40 && y == 240)
				image_index = 2;
		}

		// pillar door
		if (x == 110 && y == -15)
			sprite_index = spr_overworld_pillardoor;
	
		// sign
		if (x == 170 && y == 630)
			sprite_index = spr_overworld_sign;
	}
	if (room == room_corridors_10)
	{
		// lamp
		if (x == 90 && y == 40) || (x == 210 && y == 40)
			sprite_index = spr_overworld_lamp;

		// pillar
		if (x == 150 && y == 85)
		{
			sprite_index = spr_overworld_pillar;
			image_index = 2;
		}
	
		// chocolate bowl
		if (x == 130 && y == 110)
			sprite_index = spr_overworld_captcha_chocobowl;
	}
	if (room == room_corridors_11)
	{
		// lamp
		if (x == 80 && y == 40) || (x == 220 && y == 40) || (x == 320 && y == 100) || (x == 440 && y == 100)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 440 && y == 100)
				image_index = 2;
		}
		
		// tree
		if (x == 50 && y == 120) || (x == 90 && y == 30) || (x == 190 && y == 40) || (x == 320 && y == 90) || (x == 410 && y == 110) || (x == 350 && y == 210)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
		
		// sign
		if (x == 470 && y == 175)
			sprite_index = spr_overworld_sign;
	}
	if (room == room_corridors_12)
	{
		// lamp
		if (x == 20 && y == 100) || (x == 290 && y == 100) || (x == 90 && y == 40) || (x == 210 && y == 40)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 20 && y == 100)
				image_index = 2;
			if (x == 210 && y == 40)
				x -= 1;
		}
	}
	if (room == room_corridors_13)
	{
		// lamp
		if (x == 70 && y == 280) || (x == 230 && y == 280) || (x == 390 && y == 280) || (x == 270 && y == 60) || (x == 390 && y == 60)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 270 && y == 60)
				image_index = 2;
		}
		
		// tree
		if (x == 55 && y == 280) || (x == 100 && y == 390) || (x == 240 && y == 260) || (x == 350 && y == 370) || (x == 250 && y == 145) || (x == 370 && y == 60)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
		
		// rock
		if (x == 130 && y == 445) || (x == 190 && y == 310) || (x == 270 && y == 330) || (x == 360 && y == 437) || (x == 380 && y == 130)
		{
			sprite_index = spr_overworld_rock;
			if (x == 130 && y == 445)
				image_index = 3;
			if (x == 270 && y == 330)
				image_index = 1;
			if (x == 360 && y == 437)
				image_index = 2;
		}
		
		// sign
		if (x == 60 && y == 355)
			sprite_index = spr_overworld_sign;
		
		// pillar door
		if (x == 290 && y == 5)
			sprite_index = spr_overworld_pillardoor;
	}
	if (room == room_corridors_14)
	{
		// lamp
		if ((x == 100 || x == 200) && y == 1420) || ((x == 60 || x == 240) && y == 1260) || ((x == 80 || x == 220) && (y == 960 || y == 360 || y == 60)) || (x == 80 && y == 660) || (x == 220 && y == 690) || ((x == 100 || x == 200) && y == 220)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 100 && y == 1420) || (x == 80 && y == 60)
				image_index = 2;
			if (x == 220 && y == 690)
				image_index = 1;
		}
		
		// sign
		if (x == 250 && (y == 1145 || y == 845 || 545)) || (x == 150 && y == 200)
			sprite_index = spr_overworld_sign;
			
		// pillar
		if (x == 150 && y == 155)
		{
			sprite_index = spr_overworld_pillar;
			image_index = 2;
		}
		
		// pillar door
		if (x == 110 && y == 5)
			sprite_index = spr_overworld_pillardoor;
	}
	if (room == room_corridors_15)
	{
		// pillar
		if (x  == 150 && y == 85)
		{
			sprite_index = spr_overworld_pillar;
			image_index = 2;
		}
		
		// lamp
		if ((x == 90 || x == 210) && y == 40)
			sprite_index = spr_overworld_lamp;
	}
	if (room == room_corridors_16)
	{
		// lamp
		if (x == 90 && y == 60) || ((x == -10 || x == 350) && y == 160)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 350 && y == 160)
				image_index = 2;
		}
		
		// tree
		if (x == 205 && y == 50) || (x == 50 && y == 70) || (x == 255 && y == 105) || (x == 90 && y == 190) || (x == 250 && y == 220) || (x == 50 && y == 250)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
		
		// rock
		if (x == 80 && y == 140) || (x == 285 && y == 160) || (x == 120 && y == 260) || (x == 260 && y == 290)
		{
			sprite_index = spr_overworld_rock;
			if (x == 285 && y == 160)
				image_index = 1;
			if (x == 120 && y == 260)
				image_index = 3;
		}
	}
	if (room == room_corridors_16_A)
	{
		// door
		if (x == 140 && y == 0)
			sprite_index = spr_overworld_bigdoor_closed;
		
		// lamp
		if (x == 210 && y == 40) || (x == 290 && y == 80)
			sprite_index = spr_overworld_lamp;
	}
	if (room == room_corridors_16_B)
	{
		// lamp
		if (x == -10 && y == 80) || (x == 60 && y == 70)
		{
			sprite_index = spr_overworld_lamp;
			if (x == -10 && y == 80)
				image_index = 2;
			if (x == 60 && y == 70)
				image_index = 1;
		}
		
		// button
		if (x == 140 && y == 40)
			sprite_index = spr_overworld_brokenbutton;
	}
	if (room == room_corridors_17)
	{
		// lamp
		if ((x == 130 || x == 250 || x == 410 || x == 530 || x == 690 || x == 810) && (y == 60 || y == 280)) || (x == 410 && y == 90)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 410 && y == 90)
				image_index = 1;
			if (x == 810 && y == 60) || (x == 250 && y == 280)
				image_index = 2;
		}
		
		// tree
		if (x == 100 && y == 90) || (x == 270 && y == 60) || (x == 290 && y == 150) || (x == 520 && y == 160) || (x == 650 && y == 50) || (x == 800 && y == 150) || (x == 420 && y == 270) || (x == 510 && y == 370)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
	
		// rock
		if (x == 130 && y == 205) || (x == 280 && y == 125) || (x == 530 && y == 215) || (x == 750 && y == 95) || (x == 820 && y == 215) || (x == 450 && y == 340) || (x == 520 && y == 420)
		{
			sprite_index = spr_overworld_rock;
			if (x == 750 && y == 95) || (x == 520 && y == 420)
				image_index = 1;
			if (x == 130 && y == 205) || (x == 530 && y == 215)
				image_index = 3;
		}
	
		// pillar door
		if (x == 430 && y == 5)
			sprite_index = spr_overworld_pillardoor;
	}
	if (room == room_corridors_18)
	{
		// lamp
		if (x == 100 && y == 100) || (x == 200 && y == 130) || (x == 270 && y == 140) || ((x == 340 || x == 470 || x == 720 || x == 840 || x == 960 || x == 1200 || x == 1320 || x == 1440 || x == 1560 || x == 1680 || x == 1800 || x == 2040 || x == 2160 || x == 2280 || x == 2400 || x == 2640 || x == 2880 || x == 3000 || x == 3120 || x == 3600 || x == 3720) && y == 120) || ((x == 600 || x == 1080 || x == 1920 || x == 2520 || x == 2760 || x == 3240) && y == 150)
		{
			sprite_index = spr_overworld_lamp;
			
			// broken
			if (y == 130) || (y == 150)
				image_index = 1;
				
			// dead
			if ((x == 340 || x == 960 || x == 1320 || x == 1680 || x == 2280 || x == 2880 || x == 3720) && y == 120)
				image_index = 2;
		}
	}
	
	// caverns
	if (room == room_caverns_1)
	{
		if (x == 90 && y == 70) || (x == 60 && y == 90) || (x == 175 && y == 90) || (x == 250 && y == 90) || (x == 150 && y == 180) || (x == 100 && y == 190)
		{
			sprite_index = spr_overworld_caverns_rock;
			
			if (x == 60 && y == 90)
				image_index = 5;
			if (x == 175 && y == 90)
				image_index = 3;
			if (x == 250 && y == 90)
				image_index = 2;
			if (x == 150 && y == 180)
				image_index = 1;
			if (x == 100 && y == 190)
				image_index = 4;
		}
	}
	if (room == room_caverns_2)
	{
		if (x == 30 && y == 400) || (x == 90 && y == 350) || (x == 170 && y == 400) || (x == 190 && y == 230) || (x == 150 && y == 130) || (x == 190 && y == 50)
		{
			sprite_index = spr_overworld_caverns_rock;
			if (x == 30 && y == 400)
				image_index = 3;
			if (x == 170 && y == 400) || (x == 190 && y == 50)
				image_index = 1;
			if (x == 190 && y == 230)
				image_index = 4;
			if (x == 150 && y == 130)
				image_index = 2;
		}
	}
	if (room == room_caverns_3)
	{
		if (x == 180 && y == 320) || (x == 210 && y == 270) || (x == 60 && y == 250) || (x == 180 && y == 180) || (x == 20 && y == 170) || (x == 270 && y == 170) || (x == 130 && y == 110)
		{
			sprite_index = spr_overworld_caverns_rock;
			if (x == 180 && y == 320) || (x == 180 && y == 180)
				image_index = 3;
			if (x == 210 && y == 270) || (x == 270 && y == 170)
				image_index = 1;
			if (x == 25 && y == 170)
				image_index = 4;
			if (x == 130 && y == 110)
				image_index = 2;
		}
	}
	
	// old
	/*
	if (room == room_corridors_3_old)
	{
		// lamp
		if (x == 90 && y == 420) || (x == 210 && y == 420) || (x == 150 && y == 240) || (x == 90 && y == 60) || (x == 210 && y == 60)
		{
			sprite_index = spr_overworld_lamp;
		
			if (x == 90 && y == 60)
				image_index = 2;
		}

		// pillar
		if (x == 110 && y == 50) || (x == 190 && y == 50) || (x == 224 && y == 60) || (x == 240 && y == 56)
			sprite_index = spr_overworld_pillar;
	}
	if (room == room_corridors_4_old)
	{
		// lamp
		if (x == 60 && y == 200) || (x == 200 && y == 200) || (x == 290 && y == 60) || (x == 410 && y == 60) || (x == 500 && y == 100) || (x == 640 && y == 130)
		{
			sprite_index = spr_overworld_lamp;
		
		
			if (x == 200 && y == 200) // deactivated
				image_index = 2;
			if (x == 640 && y == 130) // broken
				image_index = 1;
		}

		// tree
		if (x == 250 && y == 120) || (x == 370 && y == 40) || (x == 400 && y == 190)
		{
			sprite_index = spr_overworld_tree;
			tree = 1;
		}
	}
	if (room == room_corridors_8_old)
	{
		// lamp
		if (x == -10 && y == 180) || (x == 80 && y == 40) || (x == 220 && y == 40)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 80 && y == 40)
				image_index = 2;
		}

		// pillar
		if (x == 90 && y == 105) || (x == 210 && y == 105)
			sprite_index = spr_overworld_pillar;
	
		// pillar dooor
		if (x == 110 && y == -15)
			sprite_index = spr_overworld_pillardoor;
	}
	if (room == room_corridors_11_old)
	{
		// lamp
		if (x == 80 && y == 40) || (x == 220 && y == 40) || (x == 360 && y == 70) || (x == 440 && y == 80)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 360 && y == 70)
				image_index = 1;
			if (x == 80 && y == 40)
				image_index = 2;
		}	
	
		// tree
		if (x == 80 && y == 30) || (x == 260 && y == 20) || (x == 180 && y == 110)
		{
			sprite_index = spr_overworld_tree;
			leaf_fall = 1;
		}
		
		// bench
		if (x == 120 && y == 75) || (x == 280 && y == 75) || (x == 120 && y == 130) || (x == 280 && y == 130)
		{
			sprite_index = spr_overworld_bench;	
			if (x == 120 && y == 130) || (x == 280 && y == 130)
				image_index = 1;
		}

		// sign
		if (x == 390 && y == 95)
			sprite_index = spr_overworld_sign;
	}
	if (room == room_corridors_12_old)
	{	
		// lamp
		if (x == 20 && y == 100) || (x == 280 && y == 100)
		{
			sprite_index = spr_overworld_lamp;
			if (x == 20 && y == 100)
				image_index = 2;
		}
	
		// lamp2
		if (x == 130 && y == -30)
			sprite_index = spr_overworld_lamp2;
	
		// pillar
		if (x == 90 && y == 30) || (x == 210 && y == 30) || (x == 195 && y == 35)
		{
			sprite_index = spr_overworld_pillar;	
			if (x == 210 && y == 30)
				image_index = 1;
			if ( x == 195 && y == 35)
				image_index = 4;
		}
	}	
	*/
}
function room_nonsolid()
{
	if (room == room_corridors_1_5 && x == 120 && y == 450)
	{
		sprite_index = spr_overworld_rockpile;
		image_index = 1;
		depth = 0;
	}
	if (room == room_corridors_2 && x == 120 && y == 140)
	{
		sprite_index = spr_overworld_m6_papers;
		depth = 0;
	}
	if (room == room_corridors_12)
	{
		// single brick
		if (x == 100 && y == 120) || (x == 180 && y == 100)
		{
			sprite_index = spr_overworld_corridorssinglebrick;
			depth = 999;
			
			if (x == 100 && y == 120)
			{
				image_xscale = -1;
				x += 20;
			}
		}
		
		// bricks
		if (x == 104 && y == 40) || (x == 186 && y == 31) || (x == 158 && y == 40)
		{
			sprite_index = spr_overworld_corridorsbricks;
			depth = 575;
			if (x == 186 && y == 31)
				image_xscale = -1;
		}
		
		// cover
		if (x == 109 && y == 0)
		{
			sprite_index = spr_singlepixel;
			image_blend = c_black;
			image_xscale = 109;
			image_yscale = 99;
			image_alpha = 0.5;
			depth = 525;
		}
	}
	if (room == room_corridors_16_B)
	{
		sprite_index = spr_overworld_corridorssinglebrick;
		depth = -bbox_bottom;
	}
	if (room == room_corridors_18 && x == 3360)
	{
		if (y == 100)
		{
			sprite_index = spr_overworld_finalcorridor_holewall;
			depth = 600;
		}
		else if (y == 240)
		{
			sprite_index = spr_overworld_finalcorridor_wallabove;
			depth = -1000;
		}
	}
}

/*
function readable_room()
{
	if (room == unused_room_test1)
	{
		if (x == 200 && y == 40)
			myid = "test1";
		if (x == 100 && y == 180)
			myid = "test0";
	}
	
	// save point
	if (room == room_corridors_3 && x == 150 && y == 270) || (room == room_corridors_4 && x == 660 && y == 120) || (room == room_corridors_8 && x == 90 && y == 325) || (room == room_corridors_11 && x == 130 && y == 120) || (room == room_corridors_13 && x == 370 && y == 160) || (room == room_corridors_16 && x == 170 && y == 200) || (room == room_caverns_3 && x == 150 && y == 225)
	{
		myid = "savepoint";
		myresult = 0.1;
	}
	
	// border
	if (room == room_corridors_12)
		myid = "border";
	
	// bench
	if (room == room_corridors_7 && ((x == 240 || x == 560) && y == 95)) || (room == room_corridors_11 && ((x == 130 || x == 290) && y == 95))
		myresult = 1;	
	
	// corridors
	if (room == room_corridors_1)
	{
		// lamp
		if (x == 80 && y == 420) || (x == 220 && y == 420) || (x == 90 && y == 80)
			myid = "room_lamp";
		
		// pillar
		if (x == 50 && y == 455) || (x == 250 && y == 455) || (x == 50 && y == 555) || (x == 250 && y == 555) || (x == 120 && y == 80) || (x == 180 && y == 80)
			myid = "room_pillar";
		
		// broken lamp
		if (x == 210 && y == 90)
			myid = "room_brokenlamp";
	}
	if (room == room_corridors_2)
	{
		// banner
		if (x == 85 && y == 100)
			myid = "room_m6_banner";
		
		// poster
		if (x == 215 && y == 60)
			myid = "room_m6_poster";
		
		// papers
		if (x == 120 && y == 140)
			myid = "room_m6_papers";
	}
	if (room == room_corridors_3)
	{
		// mini6
		if (x == 260 && y == 260)
			myid = "room_m6_brokenwall";
		
		// dead lamp
		if (x == 80 && y == 80)
			myid = "room_deadlamp";
	}
	if (room == room_corridors_3_5 && x == 160 && y == 140)
	{
		myid = "npc_dummy";
		sprite_index = spr_npc_dummy;
	}
	if (room == room_corridors_4 && x == 755 && y == 110) // armsguy npc
	{
		myid = "npc_armsguy";
		sprite_index = spr_npc_armsguy;
		if (global.world_curpopulation[WORLD_CORRIDORS] < global.world_maxpopulation[WORLD_CORRIDORS])
			destroy(id);
	}
	

}
*/