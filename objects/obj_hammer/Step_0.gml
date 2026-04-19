/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


image_index = 0;
if(player)
{
	
	
	if(mouse_check_button_pressed(mb_left) and obj_control.can_strike and obj_control.working)
		struck_value = 4;
		
	image_index = struck_value % 4;
	if(struck_value > 0)
		struck_value -= 1;
}
else
{

	var _val = (obj_control.life+obj_control.game_speed+interval_offset+3-obj_control.game_speed*1.25)
	if( _val % obj_control.interval <= 3)
	{
		image_index = _val % obj_control.interval;
		if( _val % obj_control.interval == 0)
			instance_nearest(x,y,obj_anvil).create_sparks();
	}
}