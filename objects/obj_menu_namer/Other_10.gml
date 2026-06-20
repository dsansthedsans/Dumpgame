
// vertical, horizontal
option[0, 0] = "a";
option[0, 1] = "b";
option[0, 2] = "c";
option[0, 3] = "d";
option[0, 4] = "e";
option[0, 5] = "f";
option[0, 6] = "g";
option[0, 7] = "h";
option[0, 8] = "i";
option[0, 9] = "j";
option[0, 10] = "k";
option[0, 11] = "l";
option[0, 12] = "m";

option[1, 0] = "n";
option[1, 1] = "o";
option[1, 2] = "p";
option[1, 3] = "q";
option[1, 4] = "r";
option[1, 5] = "s";
option[1, 6] = "t";
option[1, 7] = "u";
option[1, 8] = "v";
option[1, 9] = "w";
option[1, 10] = "x";
option[1, 11] = "y";
option[1, 12] = "z";

if (upper == 1)
{
	option[0, 0] = "A";
	option[0, 1] = "B";
	option[0, 2] = "C";
	option[0, 3] = "D";
	option[0, 4] = "E";
	option[0, 5] = "F";
	option[0, 6] = "G";
	option[0, 7] = "H";
	option[0, 8] = "I";
	option[0, 9] = "J";
	option[0, 10] = "K";
	option[0, 11] = "L";
	option[0, 12] = "M";

	option[1, 0] = "N";
	option[1, 1] = "O";
	option[1, 2] = "P";
	option[1, 3] = "Q";
	option[1, 4] = "R";
	option[1, 5] = "S";
	option[1, 6] = "T";
	option[1, 7] = "U";
	option[1, 8] = "V";
	option[1, 9] = "W";
	option[1, 10] = "X";
	option[1, 11] = "Y";
	option[1, 12] = "Z";
}

option[2, 0] = "0";
option[2, 1] = "1";
option[2, 2] = "2";
option[2, 3] = "3";
option[2, 4] = "4";
option[2, 5] = "5";
option[2, 6] = "6";
option[2, 7] = "7";
option[2, 8] = "8";
option[2, 9] = "9";
option[2, 10] = "_";
option[2, 11] = "!";
option[2, 12] = "#";

for (var i = 0; i < 3; i++)
	option[3, i] = string_upper(get_text("menu_namer_" + string(i)));




