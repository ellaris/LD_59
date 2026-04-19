/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


//image_speed = 0.5;
image_speed = 0;
interval = obj_control.interval;
grace = obj_control.grace;
//last_strike = 0;

drunk_interval = 0;
//drunk_available = true;

start = true;

create_hammer = function(_player = false){
	//if(anvil_mode == "other")
	{
		var _hammer = instance_create_layer(x+12,y-16,layer,obj_hammer);
		_hammer.interval_offset = interval_offset;
		_hammer.player = _player;
	}
}

play_sound = function(_sound){
	var _dist = point_distance(x,y,room_width/2,room_height/2);
	var _r = max(0.5,_dist/point_distance(0,0,room_width/2,room_height/2));
	audio_play_sound_at(_sound,room_width/2-x,room_height/2-y,0,100,300,1,false,4,_r*obj_control.gain_randomize(),0,obj_control.pitch_randomize());
}

create_sparks = function(){
	var _light = instance_create_layer(x,y-8,layer,obj_light);
	_light.init(80,obj_control.game_speed*0.5);
	var _num = 3;
	if(anvil_mode == "player")
		_num = 1+(obj_control.last_strike<obj_control.grace) + (obj_control.last_strike<obj_control.grace/2)
	switch(_num)
	{
		case 3:
		part_particles_create(obj_control.particle_system,x,y-8,obj_control.particle_red,10);
		case 2:
		part_particles_create(obj_control.particle_system,x,y-8,obj_control.particle_yellow,10);
		case 1:
		default:
		part_particles_create(obj_control.particle_system,x,y-8,obj_control.particle_white,10);
		break;
	}
}