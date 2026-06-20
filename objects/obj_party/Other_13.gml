
var _ts = startside;
if (movetype == 1)
	_ts = targetside;
var _ts_v = 0;
if (_ts > 1)
{
	_ts -= 2;
	_ts_v = 1;
}
thisface = ((!_ts) + (2 * _ts_v));
if (_ts == startside && startside == -1)
	thisface = global.chara_facing;
