/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


life += 1;

if((life+game_speed) % interval == 0)
{
	audio_play_sound(snd_strike,4,false,gain_randomize(),0,pitch_randomize());
	drunk_available = true;
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
if(drunk_available and round(life-game_speed*0.6) % interval == 0)
{
	if(not audio_is_playing(snd_speech_now))
		audio_play_sound(snd_speech_drunk_now,3,false,gain_randomize(),0,pitch_randomize());
}
	
if(mouse_check_button_pressed(mb_left))
{
	audio_play_sound(snd_strike,4,false,gain_randomize(),0,pitch_randomize());
	last_strike = life % interval;
	if(last_strike > interval/2)
		last_strike = interval - last_strike;
}

