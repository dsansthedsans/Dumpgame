myalpha = lerp(myalpha, !fade, (0.25 - (0.125 * fade)));
if (fade == true && abs(0 + myalpha) <= 0.1)
	destroy(id);
// bar
if (drawbar == 1)
{
	apphp = lerp(apphp, curhp, 0.15);
	draw_battle_bar($"{clamp(round((apphp / maxhp) * 100), 0, 100)}%", apphp, controller.enemy_maxhp[target], myx, myy, controller.enemy_obj[target].hpwidth, mycolor_cur, mycolor_max, myalpha);
}
// dmg
if (y > ystart)
{
	y = ystart;
	vspeed = 0;
	gravity = 0;
}
draw_set_font(global.fnt_dmg);
draw_set_valign(fa_bottom);
draw_set_halign(fa_center);
draw_text_color((myx + (controller.enemy_obj[target].hpwidth / 2)), (myy - 10 + y), dmg, mycolor_max, mycolor_max, mycolor_max, mycolor_max, myalpha);
draw_set_alpha(1);
debug("i want a wife.");