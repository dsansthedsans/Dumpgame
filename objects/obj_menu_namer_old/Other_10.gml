/// @descr get options

// get letters
if (capslock == 0)
{
	letter1[0] = "a";
	letter1[1] = "b";
	letter1[2] = "c";
	letter1[3] = "d";
	letter1[4] = "e";
	letter1[5] = "f";
	letter1[6] = "g";
	letter1[7] = "h";
	letter1[8] = "i";
	letter1[9] = "j";
	letter1[10] = "k";
	letter1[11] = "l";
	letter1[12] = "m";
	letter2[0] = "n";
	letter2[1] = "o";
	letter2[2] = "p";
	letter2[3] = "q";
	letter2[4] = "r";
	letter2[5] = "s";
	letter2[6] = "t";
	letter2[7] = "u";
	letter2[8] = "v";
	letter2[9] = "w";
	letter2[10] = "x";
	letter2[11] = "y";
	letter2[12] = "z";	
}
else if (capslock == 1)
{
	letter1[0] = "A";
	letter1[1] = "B";
	letter1[2] = "C";
	letter1[3] = "D";
	letter1[4] = "E";
	letter1[5] = "F";
	letter1[6] = "G";
	letter1[7] = "H";
	letter1[8] = "I";
	letter1[9] = "J";
	letter1[10] = "K";
	letter1[11] = "L";
	letter1[12] = "M";
	letter2[0] = "N";
	letter2[1] = "O";
	letter2[2] = "P";
	letter2[3] = "Q";
	letter2[4] = "R";
	letter2[5] = "S";
	letter2[6] = "T";
	letter2[7] = "U";
	letter2[8] = "V";
	letter2[9] = "W";
	letter2[10] = "X";
	letter2[11] = "Y";
	letter2[12] = "Z";
}

// get numbers
number[0] = "0";
number[1] = "1";
number[2] = "2";
number[3] = "3";
number[4] = "4";
number[5] = "5";
number[6] = "6";
number[7] = "7";
number[8] = "8";
number[9] = "9";
number[10] = "_";
number[11] = "!";
number[12] = "#";

// bonus
bonus[0] = string_upper(get_text("menu_namer_0"));
bonus[1] = string_upper(get_text("menu_namer_1"));
bonus[2] = string_upper(get_text("menu_namer_2"));

letter_length = array_length(letter1);
number_length = array_length(number);
bonus_length = array_length(bonus);

// pegar localização dos caracteres
base_x = 117;
var _target = (controller.option_y[1, 0] - 80);
if (shoulddestroy == 1)
{
	_target = orig_base_y;
	if (base_y == orig_base_y)
		destroy(id);
}
base_y = lerp(base_y, _target, 0.2);
var _base_xdist = 32;
var _base_ydist = 37;
var _charwidth = 16;
draw_set_font(fnt_main_spaced_big);
for (var i = 0; i < letter_length; i++)
{
	// option, floor
	letter_x[i, 0] = (base_x + (_base_xdist * i));
	letter_y[i, 0] = base_y;
	
	letter_x[i, 1] = (base_x + (_base_xdist * i));
	letter_y[i, 1] = (base_y + _base_ydist);
	
	// option, floor
	heart_optx[i, 0] = (letter_x[i, 0] + (string_width(letter1[i]) / 2));
	heart_opty[i, 0] = (letter_y[i, 0] + (string_height(letter1[i]) / 2));
	
	heart_optx[i, 1] = (letter_x[i, 1] + (string_width(letter2[i]) / 2));
	heart_opty[i, 1] = (letter_y[i, 1] + (string_height(letter2[i]) / 2));
}
for (var i = 0; i < number_length; i++)
{
	number_x[i] = (base_x + (_base_xdist * i));
	number_y[i] = (base_y + (_base_ydist * 2));
	
	// option, floor
	heart_optx[i, 2] = (number_x[i] + (string_width(number[i]) / 2));
	heart_opty[i, 2] = (number_y[i] + (string_height(number[i]) / 2));
}
for (var i = 0; i < bonus_length; i++)
{
	bonus_x[0] = base_x;
	bonus_x[2] = (letter_x[(letter_length - 1), 1] - string_width(bonus[2]) + _charwidth);
	bonus_x[1] = base_x + ((bonus_x[2] - base_x + _charwidth) / 2);
	
	//if (i > 0)
		//bonus_x[i] = (bonus_x[(i - 1)] + string_width(bonus[(i - 1)]) + _base_xdist);
	bonus_y[i] = (base_y + (_base_ydist * 3));
		
	// option, floor
	heart_optx[i, 3] = (bonus_x[i] + (string_width(bonus[i]) / 2));
	heart_opty[i, 3] = (bonus_y[i] + (string_height(bonus[i]) / 2));
}

// get background position
bg_x = (base_x - _base_xdist);
bg_y = (base_y - _base_xdist);
bg_w = (room_width - (bg_x * 2));
bg_h = (room_height - bg_y + 40);