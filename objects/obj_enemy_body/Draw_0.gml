
if (active == 1)
{
	draw_set_alpha(image_alpha);

	if (type == 2000) // Toilet
	{
		draw_self();	
	}
	
	if (type == -1) || (type == -10) // Test
	{	
		draw_self();
	
		if (animation == 1)
			siner += 0.1;
		var _y = (y + (sprite_height / 2) + 20);
		draw_sprite_ext(spr_enemy_test_hand, 0, (x + sprite_width), (_y + (sin(siner / 1.5) * 8)), 2, 2, 0, c_white, image_alpha);
		draw_sprite_ext(spr_enemy_test_hand, 0, x, (_y - (sin(siner / 2) * 8)), 2, 2, 0, c_white, image_alpha);
	}

	if (type >= 1 && type <= 5) // Dummy, Armsguy, Trashguy, Flitcher, Eyecrush
	{
		draw_self();
		if (type == 1) // Dummy
			image_index = stage;
	}

	if (type == 6) // Broken Clock
	{
		// shock
		shock_x = x;
		shock_y = (y - (sprite_height / 2) + 8);
		shock_index += (sprite_get_speed(spr_enemy_brock_shock) / 60);
		draw_sprite_ext(spr_enemy_brock_shock, (shock_index * global.visualeff), shock_x, shock_y, image_xscale, image_yscale, image_angle, image_blend, shock_alpha);
		
		// body
		var _xdist = 0;
		var _ydist = 0;
		
		if (movement == 0) // start and during path
		{
			if (stage == 0)
			{
				path_start(path_enemy_brock, 0, path_action_restart, 0);
				otherimage = 1;
				stage = 1;
			}
			else if (stage == 1)
			{
				if (path_speed < 4)
					path_speed += 0.1;
			}
		}
		if (movement == 1) || (movement == 3) // go to center
		{
			path_end();
			vspeed = 0;
			
			var _x = ((room_width / 2) - 1)
			var _y = (room_height / 3.5);
				
			var _spd = 0.3;
			x = lerp(x, _x, _spd);
			y = lerp(y, _y, _spd);
			image_angle = lerp(image_angle, 0, _spd);
			image_alpha = lerp(image_alpha, 1, _spd);
			
			var _xdist = abs(x - _x);
			var _ydist = abs(y - _y);
			if (_xdist <= 1 && _ydist <= 1)
			{
				x = _x;
				y = _y;
				depth = controller.battle_depth[1];
				image_angle = 0;
				image_alpha = 1;
				
				stage = 0;
				siner = 0;
				delay = 0;
				if (movement == 1)
				{
					otherimage = 0;
					movement = 2;
				}
				else
				{
					movement = 0;
					if (enemy != -1 && enemy.startattack == 1)
					{
						if (controller.enemy_attack[myself] == 0)
							movement = 4;
						if (controller.enemy_attack[myself] == 3)
						{
							movement = 6;
							otherimage = 1;
						}
					}	
				}
			}
		}
		if (movement == 2) // bubble movement
		{
			var _slow = 0;
			var _mult = 0.75;
			if (controller.enemy_spare[myself] >= 100)
			{
				_slow = 2;
				_mult = 0.5;
				if (shock_alpha > 0)
					shock_alpha -= 0.025/2;
			}
			siner += 0.1;
			vspeed = (sin(siner / (_slow + 1)) * _mult);
		}
		if (movement == 4) // movement for attack 0
		{
			if (stage == 0)
			{
				randomx = (enemy.orig_x - 48 + irandom_range(-120, 120));
				randomy = (enemy.orig_y - 60 - irandom(80));
				stage = 1;
			}
			if (stage == 1)
			{
				var _spd = 0.3;
				x = lerp(x, randomx, _spd);
				y = lerp(y, randomy, _spd);
				image_alpha = lerp(image_alpha, 0.5, _spd);
				
				var _xdist = abs(x - randomx);
				var _ydist = abs(y - randomy);
				if (_xdist <= 1 && _ydist <= 1)
				{
					shakeamt = 2;
					delay = 45 - (10 * (controller.battle_round > 0));
					stage = 2;
				}
			}
			if (stage == 2)
			{
				x = randomx;
				y = randomy;
				x += irandom_range(shakeamt, -shakeamt);
				y += irandom_range(shakeamt, -shakeamt);
				shakeamt -= 0.02;
				shakeamt = clamp(shakeamt, 0, 2);
				
				delay -= 1;
				if (delay <= 0)
					stage = 0;
			}
			
			if (enemy.startattack == 0)
			{
				stage = 0;
				movement = 3;
			}
		}
		if (movement == 6) // movement for attack 2
		{
			if (controller.startattack == 1 && exists(controller.attackobj[myself]) == 1 && controller.attackobj[myself].time == 0 && exists(controller.attackobj[myself].thisobj) == 1)
			{
				var _spd = 0.25;
				var _thisobj = controller.attackobj[myself].thisobj;
				x = lerp(x, _thisobj.x, _spd);
				y = lerp(y, _thisobj.y, _spd);
				depth = controller.battle_depth[6];
				image_angle = lerp(image_angle, _thisobj.image_angle, _spd);
				shock_alpha = 0;
			}
			else
			{
				shock_alpha = 1;
				movement = 3;
			}
		}
		if (enemy.thiswriter != 0 && exists(enemy.thiswriter) == true && global.visualeff == true)
		{
			enemy.thiswriter.bubble_x = (x + (sprite_width / 2) + 12);
			enemy.thiswriter.bubble_y = (y + 6);
		}
		
		if (movement == 5) // death movement
		{
			if (stage == 0)
			{
				vspeed = -4;
				hspeed = 0.65;
				gravity = 0.1;
				sprite_index = spr_enemy_brock_dead;
				stage = 1;
			}
			else if (stage == 1)
			{
				var _maxy = (controller.box_y - (controller.box_h / 2) - (sprite_height / 2) + 20);
				image_angle -= 0.5;
				if (y >= _maxy)
				{
					if (global.visualeff == 1)
					{
						for (var i = 0; i < part_length; i++)
						{
							var _rd = 5;
							var _x = (x + irandom_range(-_rd, _rd));
							var _y = (controller.box_y - (controller.box_h / 2) + 40 + irandom(_rd));
							marker(_x, _y, spr_enemy_brock_part, 1, 1.5, 1.5, 0, irandom(7), irandom(360), c_white, (depth + 1));
							part[i] = thismarker;
							part[i].gravity = 0.075;
							part[i].vspeed = random_range(-7, -5);
							part[i].hspeed = random_range(-2, 2);
							part[i].angleamt = choose(-1.5, 1.5);
						}
					}
					
					hspeed = 0;
					vspeed = 0;
					gravity = 0;
					image_alpha = 0;
					audio_play(snd_explosion3, 0, VOLUME_SOUND);
					shakescreen(6, 6);
					stage = 2;
				}
			}
			else if (stage == 2 && explosion_alpha == 0)
			{
				delay += 1;
				if (delay >= 120)
					stage = 3;
			}
			
			if (stage >= 2 && global.visualeff == 1)
			{
				for (var i = 0; i < part_length; i++)
					part[i].image_angle += part[i].angleamt;
			}
		}
		
		if (otherimage == 1) // afterimage
			afterimage();
		
		draw_self();
		
		// lines
		for (var i = 0; i < 3; i++)
		{
			line_time[i] += ((line_amt[i] / (i + 1)) * line_side[i]);
			draw_sprite_ext(line_spr, i, x, y, image_xscale, image_yscale, (line_time[i] + image_angle), c_white, image_alpha);
		}
		
		// explosion
		if (movement == 5 && stage >= 2)
		{	
			var _rd = random(0.3);
			var _yy = (controller.box_y - (controller.box_h / 2) + 4);
			var _xsc = (3.5 - explosion_alpha * 1.8 + _rd);
			var _scy = (3.8 - explosion_alpha * 2 + _rd);
		
			draw_sprite_ext(spr_enemy_brock_explosion, 0, x, _yy, _xsc, _scy, 0, c_white, explosion_alpha);
		
			explosion_alpha -= 0.0075;
			if (explosion_alpha <= 0.05)
				explosion_alpha = 0;
		}
	}
	
	if (type == 7) // Rhonhey
	{
		head_index += (sprite_get_speed(body_spr[0]) / 60);
		siner += 0.1;
		
		// body's outline
		for (var i = (body_length - 1); i >= 1; i--)
			draw_sprite_ext(body_spr[i], 1, body_x[i], (body_y[i] + (sin(siner + i) * 10)), body_scale[i], body_scale[i], 0, c_white, 1);		
		
		// head; body's main
		for (var i = (body_length - 1); i >= 0; i--)
		{
			var _index = 0;
			if (i == 0)
				_index = head_index;
			draw_sprite_ext(body_spr[i], _index, body_x[i], (body_y[i] + (sin(siner + i) * 10)), body_scale[i], body_scale[i], 0, body_color[i], 1);		
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if (type == 1000) // TROLLFACE PRIME
	{
		draw_self();
		
		if (enemy.hurt == 0)
		{
			siner += 0.1;
			body_spd += (sin(siner / 1.5) / 6);
			head_spr = spr_enemy_tfp_head;
		}
		else
			head_spr = spr_enemy_tfp_head_hurt;
		
		// torso
		var _y = (y - sprite_height + 8 + body_spd);
		draw_sprite_ext(torso_spr, 0, x, _y, 2, 2, 0, c_white, 1);
		
		// head
		_y = (_y - (sprite_get_height(torso_spr) * 2) + 32 + (body_spd * 1.5));
		draw_sprite_ext(head_spr, 0, (x - 5 + body_spd), _y, 2, 2, 0, c_white, 1);
	}
}











