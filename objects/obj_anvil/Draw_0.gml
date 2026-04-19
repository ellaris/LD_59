/// @description Wstaw opis w tym miejscu
// W tym edytorze możesz zapisać swój kod


if(anvil_mode == "player" and obj_control.can_strike and obj_control.working)
{
	if( point_distance(x,y,mouse_x,mouse_y) < 48)
	{
		gpu_set_blendmode(bm_add);
		draw_sprite_ext(sprite_index,image_index,x,y,1.1,1.1,image_angle,c_green,1);
		gpu_set_blendmode(bm_normal);
	}
}

draw_self();

