
if (global.chara_move == 1 && global.chara_cutscene == 0)
{
	if (global.flag[2] == 1 && ((global.flag[5] == 1 && global.flag[7] == 1) || (global.flag[5] == 2)) && global.flag[40] == 0 && con == 0)
	{
		chara_change(-1, 0, 0, 1, 0, 0, 1);
		chara_stop();
		chara = obj_chara;
		chara.image_speed = 0.25;
		
		party_change(0, -1, -1);
		//party_change(0, 0, 0, -1, -1);
		//party_stop(0);
		m6 = global.party[0];
		m6.image_speed = 0.25;
		
		var _chara_x = 150;
		var _chara_y = 110;
		var _m6_x = 170;
		var _m6_y = 110;
		movetopoint(_chara_x, _chara_y, 60, chara);
		movetopoint(_m6_x, _m6_y, 60, m6);
		
		// definir chara_facing e party_facing
		for (var i = 0; i < 2; i++)
		{
			var _curx = chara.x;
			var _cury = chara.y;
			var _targetx = _chara_x;
			var _targety = _chara_y;
			if (i == 1)
			{
				_curx = m6.x;
				_cury = m6.y;
				_targetx = _m6_x;
				_targety = _m6_y;	
			}
			var _xdist = (_curx - _targetx);
			var _ydist = (_cury - _targety);
			
			var _facing = -1;
			if (abs(_xdist) > abs(_ydist))
			{
				_facing = LEFT;
				if (_xdist < 0)
					_facing = RIGHT;
			}
			else
			{
				_facing = DOWN;
				if (_ydist > 0)
					_facing = UP;
			}
			
			if (_facing != -1)
			{
				if (i == 0)
					chara_facing(_facing);
				else
					party_facing(0, _facing);
			}
			else
				debug("--- obj_event_m6_dummydoor: failed to get facing");
		}
		
		con = 1;
	}
	else if (con == 0)
		destroy(id);
}