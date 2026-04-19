/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod

var _r = abs(sin((obj_control.life+interval_offset % (interval*2))/(interval*2)*2*pi));
image_index = round(4*_r);

if(anvil_mode != "other" and anvil_mode != "player" and (obj_control.life-obj_control.last_strike_life) div obj_control.interval > 3 and obj_control.working)
{
	obj_control.last_strike_life = obj_control.life;
	play_sound(snd_speech_usher);
}

if(audio_is_playing(snd_speech_intro) or audio_is_playing(snd_wrong_intro) or audio_is_playing(snd_drunk_intro))
	obj_control.last_strike_life = obj_control.life;


switch(anvil_mode)
{
	case "other":
	// other blacksmith
	if((obj_control.life+interval_offset) % interval == 0)
	{
		//audio_play_sound(snd_strike,4,false,obj_control.gain_randomize(),0,obj_control.pitch_randomize());
		play_sound(snd_strike);
		//create_sparks();
		//drunk_available = true;
	}
	break;
	
	case "correct":
	// correct strike time
	if(start)
	{
		audio_play_sound(snd_speech_intro,2,false);
		start = false;
		exit;
	}
	if(not audio_is_playing(snd_speech_intro) and not audio_is_playing(snd_speech_usher))
	if(round(obj_control.life+obj_control.game_speed*0.4) % interval == 0 and not obj_control.end_game_counter)
		//audio_play_sound(snd_speech_now,3,false,obj_control.gain_randomize(),0,obj_control.pitch_randomize());
		play_sound(snd_speech_now)
	break;
	
	case "drunk":
	// drunk strike time
	if(start)
	{
		audio_play_sound(snd_drunk_intro,2,false);
		start = false;
		exit;
	}
	if(not audio_is_playing(snd_drunk_intro) and not audio_is_playing(snd_speech_usher))
	if(obj_control.drunk_available and round(obj_control.life+obj_control.game_speed*0.6+drunk_interval) % interval == 0 and not obj_control.end_game_counter)
	{
		drunk_interval = irandom(30);
		if(not audio_is_playing(snd_speech_drunk_now))
			//audio_play_sound(snd_speech_drunk_now,3,false,obj_control.gain_randomize(),0,obj_control.pitch_randomize());
			play_sound(snd_speech_drunk_now)
		obj_control.drunk_available = false;
	}
	break;

	case "wrong":
	// incorrect strike time
	if(start)
	{
		audio_play_sound(snd_wrong_intro,2,false);
		start = false;
		exit;
	}
	if(not audio_is_playing(snd_wrong_intro) and not audio_is_playing(snd_speech_usher))
	if(round(obj_control.life-obj_control.game_speed*0.6) % interval == 0)
	{
		//if(not audio_is_playing(snd_speech_now))
		play_sound(snd_speech_now);
			//audio_play_sound(snd_speech_now,3,false,obj_control.gain_randomize(),0,obj_control.pitch_randomize());
	}
	break;
	
	case "player":
	if(mouse_check_button_pressed(mb_left) and obj_control.working and obj_control.can_strike)
	{
		//audio_play_sound(snd_strike,4,false,obj_control.gain_randomize(),0,obj_control.pitch_randomize());
		
		obj_control.last_strike = obj_control.life % interval;
		if(obj_control.last_strike > interval/2)
			obj_control.last_strike = interval - obj_control.last_strike;
		create_sparks();
		var _num = 1+(obj_control.last_strike<obj_control.grace) + (obj_control.last_strike<obj_control.grace*2);
		play_sound(snd_strike,4-_num);
		array_push(obj_control.work,obj_control.last_strike);
		obj_control.can_strike = false;
		obj_control.last_strike_life = obj_control.life;
	}
	break;
	
	default:
	
	break;
}

