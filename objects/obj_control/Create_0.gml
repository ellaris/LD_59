/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

draw_set_font(fnt_font);

// particles
particle_system = part_system_create();

particle_white = part_type_create();
part_type_life(particle_white,30,30);
part_type_color1(particle_white,c_white);
part_type_gravity(particle_white,0.05,270);
part_type_direction(particle_white,90-45,90+45,0,0);
part_type_speed(particle_white,1,1.5,0,0);
part_type_size(particle_white,1,1,-0.01,0);
part_type_alpha2(particle_white,1,0.5);

particle_yellow = part_type_create();
part_type_life(particle_yellow,45,45);
part_type_color1(particle_yellow,c_yellow);
part_type_gravity(particle_yellow,0.05,270);
part_type_direction(particle_yellow,90-45,90+45,0,0);
part_type_speed(particle_yellow,1,1.5,0,0);
part_type_size(particle_yellow,1,1,-0.01,0);
part_type_alpha2(particle_yellow,1,0.5);

particle_red = part_type_create();
part_type_life(particle_red,60,60);
part_type_color1(particle_red,c_red);
part_type_gravity(particle_red,0.05,270);
part_type_direction(particle_red,90-45,90+45,0,0);
part_type_speed(particle_red,1,1.5,0,0);
part_type_size(particle_red,1,1,-0.01,0);
part_type_alpha2(particle_red,1,0.5);


life = 0;
game_speed = game_get_speed(gamespeed_fps);
interval = game_speed*2;
grace = game_speed*0.25;
last_strike = 0;
last_strike_life = 0;
can_strike = true;

drunk_interval = 0;
drunk_available = true;

work = [];
working = true;
tries = 5//15;
debug_tries = true;

game_state = "menu";
map_scores = { map_1:"",map_2:"",map_3:"",map_4:"",map_5:"",map_6:""};
//map_scores = { map_1:"90",map_2:"90",map_3:"90",map_4:"90",map_5:"80",map_6:"10"};

transition = true;
transition_anim = 1;
transition_to = "menu";

end_game_counter = 0;

pitch_randomize = function(){
	return 1.0-0.05+0.01*irandom(10)
}

gain_randomize = function(){
	return 1.0-0.1+0.02*irandom(10)
}

quit_game = function(){
	game_end();
}

start_map_1 = function(){
	transition_to = "map_1";
	transition = true;
	audio_play_sound(snd_strike,4,false);
}

start_map_2 = function(){
	transition_to = "map_2";
	transition = true;
	audio_play_sound(snd_strike,4,false);
}

start_map_3 = function(){
	transition_to = "map_3";
	transition = true;
	audio_play_sound(snd_strike,4,false);
}

start_map_4 = function(){
	transition_to = "map_4";
	transition = true;
	audio_play_sound(snd_strike,4,false);
}

start_map_5 = function(){
	transition_to = "map_5";
	transition = true;
	audio_play_sound(snd_strike,4,false);
}

start_map_6 = function(){
	transition_to = "map_6";
	transition = true;
	audio_play_sound(snd_strike,4,false);
}

map_availability = function(_map_name){
	return (map_scores[$ _map_name] != "" and string_digits((map_scores[$ _map_name])) >= 80)	
}

button = function(_label,_x,_y,_func,_info="",_available=true,_w=48,_h=24){
	var _clicked = mouse_check_button_pressed(mb_left);
	var _hovered = point_in_rectangle(mouse_x,mouse_y,_x,_y,_x+_w,_y+_h);
	
	if(_hovered and _available)
	{
		draw_set_color(c_ltgray);
		
		
		if(_clicked and _available)
		{
			method_call(_func,[])
			
		}
		if transition
			draw_rectangle(_x,_y,_x+_w+1,_y+_h+1,true);
		else
			draw_rectangle(_x-1,_y-1,_x+_w+1,_y+_h+1,true);
	}
	
	draw_set_color(c_dkgray);
	draw_rectangle(_x,_y,_x+_w,_y+_h,false);
	draw_set_color(c_white);
	if(not _available)
		draw_set_color(c_ltgray);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_text(_x+_w/2,_y+_h/2,_label);
	
	if(_info != "")
	{
		if(string_digits(_info) < 90)
			draw_set_color(c_yellow);
		if(string_digits(_info) < 80)
			draw_set_color(c_red);
		draw_text(_x+_w/2,_y-string_height(_info)/2-4,_info);
	}
	
	//draw_set_valign(fa_top);
	//draw_set_halign(fa_left);
	
}