/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

if(keyboard_check_pressed(vk_f12))
	map_scores = { map_1:"90",map_2:"90",map_3:"90",map_4:"90",map_5:"80",map_6:"10"};

if(not audio_is_playing(snd_music))
	audio_play_sound(snd_music,2,true,1,(life % game_speed*4)/ game_speed*4);

if(transition_to != "" and transition_anim >= 1)
{
	game_state = transition_to;
	transition_to = "";
	
	// reset variables
	end_game_counter = 0;
	work = [];
	working = true;
	end_sound = false;
	
	// handle creation of objects
	with obj_anvil
		instance_destroy();
	with obj_hammer
		instance_destroy();
		
	switch(game_state){
	default:
	case "menu":
		var _anvil = instance_create_layer(60,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = 1.5;
		_anvil.interval_offset = game_speed;
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		_anvil = instance_create_layer(268,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		
	
		if(map_scores[$ "map_6"] != "")
		{
			_anvil = instance_create_layer(224,148,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
			_anvil.image_index = 0.75;
			_anvil.interval_offset = game_speed*0.5;
			_anvil.anvil_mode = "other";
			_anvil.create_hammer();
			_anvil = instance_create_layer(108,148,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
			_anvil.image_index = 2.25;
			_anvil.interval_offset = game_speed*1.5;
			_anvil.anvil_mode = "other";
			_anvil.create_hammer();
		}
	break;
	case "map_1":
		var _anvil = instance_create_layer(64,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = 1.5;
		_anvil.interval_offset = game_speed;
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		_anvil = instance_create_layer(200,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"correct",visible:false});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "correct";
		_anvil= instance_create_layer(160,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"player"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "player";
		_anvil.create_hammer(true);
	break;
	
	case "map_2":
		var _anvil = instance_create_layer(64,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = 1.5;
		_anvil.interval_offset = game_speed;
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		_anvil = instance_create_layer(200,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"correct",visible:false});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "drunk";
		_anvil= instance_create_layer(160,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"player"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "player";
		_anvil.create_hammer(true);
	break;
	
	case "map_3":
		var _anvil = instance_create_layer(64,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = 1.5;
		_anvil.interval_offset = game_speed;
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		//_anvil = instance_create_layer(224,32,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"correct",visible:false});
		//_anvil.image_index = 0;
		//_anvil.interval_offset = 0;
		//_anvil.anvil_mode = "correct";
		_anvil= instance_create_layer(160,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"player"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "player";
		_anvil.create_hammer(true);
	break;
	
	case "map_4":
		var _anvil = instance_create_layer(64,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = 1.5;
		_anvil.interval_offset = game_speed;
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		_anvil = instance_create_layer(200,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"correct",visible:false});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "wrong";
		_anvil= instance_create_layer(160,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"player"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "player";
		_anvil.create_hammer(true);
	break;
	
	case "map_5":
		var _anvil = instance_create_layer(64,112,layer,obj_anvil,{image_index:1.5,interval_offset:game_speed,anvil_mode:"other"});
		_anvil.image_index = round(interval/3)*5;
		_anvil.interval_offset = round(interval/3);
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		_anvil = instance_create_layer(268,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"correct"});
		_anvil.image_index = round(interval/3*2)*5;
		_anvil.interval_offset = round(interval/3*2);
		_anvil.anvil_mode = "other";
		_anvil.create_hammer();
		_anvil= instance_create_layer(160,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"player"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "player";
		_anvil.create_hammer(true);
	break;
	
	case "map_6":
		_anvil= instance_create_layer(160,112,layer,obj_anvil,{image_index:0,interval_offset:game_speed,anvil_mode:"player"});
		_anvil.image_index = 0;
		_anvil.interval_offset = 0;
		_anvil.anvil_mode = "player";
		_anvil.create_hammer(true);
	break;
	}
}

if(transition and transition_to != "")
{
	transition_anim = lerp(transition_anim,1,0.05);
	if(transition_anim > 0.9)
		transition_anim += 0.03;
}
else
if(transition and transition_anim > 0)
{
	transition_anim = lerp(transition_anim,0,0.05);
	if(transition_anim < 0.1)
		transition_anim -= 0.03;
}
else
	transition = false;


life += 1;

if((life+game_speed) % interval == 0)
{
	//audio_play_sound(snd_strike,4,false,gain_randomize(),0,pitch_randomize());
	drunk_available = true;
	can_strike = true;
}
if(working and array_length(work) >= tries)
{
	show_debug_message(work)
	working = false;
}
	
	
// correct strike time
//if(round(life+game_speed*0.4) % interval == 0)
//	audio_play_sound(snd_speech_now,3,false);
	
// drunk strike time
//if(drunk_available and round(life+game_speed*0.6+drunk_interval) % interval == 0)
//{
//	drunk_interval = irandom(30);
//	if(not audio_is_playing(snd_speech_drunk_now))
//		audio_play_sound(snd_speech_drunk_now,3,false,1,0,pitch_randomize());
//	drunk_available = false;
//}

// incorrect strike time
//if(drunk_available and round(life-game_speed*0.6) % interval == 0)
//{
//	if(not audio_is_playing(snd_speech_now))
//		audio_play_sound(snd_speech_drunk_now,3,false,gain_randomize(),0,pitch_randomize());
//}
	
//if(mouse_check_button_pressed(mb_left))
//{
//	audio_play_sound(snd_strike,4,false,gain_randomize(),0,pitch_randomize());
//	last_strike = life % interval;
//	if(last_strike > interval/2)
//		last_strike = interval - last_strike;
//}

