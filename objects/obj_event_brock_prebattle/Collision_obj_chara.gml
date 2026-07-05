
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && global.flag[37] == 0 && con == 0)
	{
		x = -20;
		y = -20;
		depth = -room_height;
		image_xscale = 1;
		image_yscale = 1;
		con = 1;
		aftercon = 1;
		alarm[8] = 15;
		global.flag[37] = 0.25;
		audio_play(snd_bigcut, 0, VOLUME_SOUND);
		shakescreen(3, 3);
		
		chara = obj_chara;
		chara_surprise = undefined;
		chara_stop();
		chara_change(-1, 0, 0, 1, 0, 0, 0);
		chara_facing(UP);
		m6 = global.party[0];
		m6dist = 0;
		party_stop(0);
		party_change(0, -1, -1);
		party_facing(0, RIGHT);
		brockx = 500;
		brocky = 140;
		marker(brockx, brocky, spr_npc_brock, 0.5, 0.75, 0.75, 0, 0, 0, c_white, 450);
		brock = thismarker;
		//brock.hspeed = distance_to_point(chara.x, chara.y) / 20
		brock.vspeed = -2;
		brockspd = 0.2;
		brocksiner = 0.1;
		shock = 1;
		shock_x = 0;
		shock_y = 0;
		shock_ind = 0;
		shock_delay = 4;
		shock_delay_orig = shock_delay;
		shock_amount = 6;
		brickamount = 4;
		for (var i = 0; i < brickamount; i++)
		{
			marker(brockx, (brocky - 40), spr_npc_brock_brick, 1, 1, 1, 0, 0, irandom(360), c_white, 0);
			brick[i] = thismarker;
			brick[i].gravity = 0.1;
			brick[i].hspeed = random_range(-0.5, 0.5);
			brick[i].vspeed = random_range(-1.5, -2.5);
			brickanglemult[i] = choose(-1, 1);
		}		
		gate_spr = spr_overworld_sidegate;
		gate_w = sprite_get_width(gate_spr);
		gate_x[0] = 40;
		gate_y[0] = 180;
		gate_x[1] = 270;
		gate_y[1] = 180;
		gate_yamt = 2;
	}
	else if (con == 0)
		instance_destroy();
}