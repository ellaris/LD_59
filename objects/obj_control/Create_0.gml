/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod



life = 0;
game_speed = game_get_speed(gamespeed_fps);
interval = game_speed*2;
grace = game_speed*0.25;
last_strike = 0;

drunk_interval = 0;
drunk_available = true;

pitch_randomize = function(){
	return 1.0-0.05+0.01*irandom(10)
}

gain_randomize = function(){
	return 1.0-0.1+0.02*irandom(10)
}