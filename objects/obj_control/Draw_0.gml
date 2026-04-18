/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _c = c_white;

if(last_strike > grace)
	_c = c_yellow;

draw_set_color(_c);
draw_text(32,32,last_strike);

var _r = cos((life % (interval))/(interval)*2*pi)
draw_line(32,64+32,32,64+32*_r)
