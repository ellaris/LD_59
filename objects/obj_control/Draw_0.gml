/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

// lighing handling
if( not surface_exists(surface_lighting))
	surface_lighting = surface_create(room_width,room_height);
	
surface_set_target(surface_lighting);
draw_clear_alpha(c_black,0.5);
gpu_set_blendmode(bm_subtract);

draw_set_alpha(0.5);
draw_sprite(spr_vignette,0,0,0);

with obj_light
{
	var _r = range * (0.9+0.1*sin(life/obj_control.game_speed))
	var _b = 1-floor(sin(life/obj_control.interval))/2;
	if(max_life > 0)
		_b = _b * life/max_life;
	draw_set_alpha(0.5*_b);
	draw_circle(x,y,_r,false);
	draw_set_alpha(0.5*_b);
	draw_circle(x,y,_r*0.9,false);
	draw_set_alpha(0.5*_b);
	draw_circle(x,y,_r*0.2,false);
}



draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
surface_reset_target();


draw_surface(surface_lighting,0,0);

if(game_state == "menu")
{
	button("Map 1",80,38,start_map_1, map_scores.map_1);
	//if(map_scores.map_1 != "" and string_digits((map_scores.map_1)) >= 80)
	button("Map 2",136,38,start_map_2, map_scores.map_2, map_availability("map_1"));
	//if(map_scores.map_2 != "" and string_digits((map_scores.map_2)) >= 80)
	button("Map 3",192,38,start_map_3, map_scores.map_3, map_availability("map_2"));
	//if(map_scores.map_3 != "" and string_digits((map_scores.map_3)) >= 80)
	button("Map 4",80,96,start_map_4, map_scores.map_4, map_availability("map_3"));
	//if(map_scores.map_3 != "" and string_digits((map_scores.map_4)) >= 80)
	button("Map 5",136,96,start_map_5, map_scores.map_5, map_availability("map_4"));
	//if(map_scores.map_3 != "" and string_digits((map_scores.map_5)) >= 80)
	button("Map 6",192,96,start_map_6, map_scores.map_6, map_availability("map_5"));
	button("Quit",136,144,quit_game);
	
}
else{
	//var _c = c_white;

	//if(last_strike > grace/2)
	//	_c = c_yellow;
	
	//if(last_strike > grace)
	//	_c = c_red;

	//draw_set_color(_c);
	//draw_text(32,32,last_strike);

	//var _r = cos((life % (interval))/(interval)*2*pi)
	//draw_line(32,64+32,32,64+32*_r)

	if(array_length(work) >= tries)
	{
		end_game_counter += 1;
		var _score = 0;
		for(var i = 0; i < array_length(work); i++)
		{
			var _l = work[i];
			_score += _l >= grace ? _l/(interval*0.5) : _l/grace*0.1;
		}
		_score = _score;
		if debug_tries
		show_debug_message(_score);
		_score = (tries-_score)/(tries)*100;
		if debug_tries
		show_debug_message(_score);
		draw_set_color(c_white);
		if(_score < 90)
			draw_set_color(c_yellow);
		if(_score < 80)
			draw_set_color(c_red);
		draw_text(room_width/2,room_height/2-32,string("{0}%",round(_score)));
		debug_tries = false;
		
		if(variable_struct_get(map_scores,game_state) == "" or string_digits(variable_struct_get(map_scores,game_state)) < _score)
			variable_struct_set(map_scores,game_state,string("{0}%",round(_score)));
			
		if(end_game_counter > game_speed*0.25 and end_game_counter < game_speed*4 and mouse_check_button_pressed(mb_left))
			end_game_counter = game_speed*4;
	}
	
	draw_set_color(c_white);
	if(end_game_counter > game_speed*4 )
	{
		if( life % 60 < 30)
			draw_text(room_width/2,room_height/2,"Return");
		if( mouse_check_button_pressed(mb_left))
		{
			end_game_counter = 0;
			transition = true;
			transition_to = "menu";
		}
	}
}


// transition
if(transition and transition_anim > 0)
{
	draw_set_color(c_black);
	draw_rectangle(0,0,room_width,room_height*transition_anim,false);
	//draw_set_color(c_white);
	//draw_line(0,room_height*transition_anim,room_width,room_height*transition_anim);
}