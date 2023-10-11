#region//controles
key_right = keyboard_check(ord("D"))
key_left = keyboard_check(ord("A"))
key_jump = keyboard_check(vk_space)
key_shoot = keyboard_check_pressed(ord("X"))//tiro
#endregion

#region//movimentação
var move = key_right - key_left

hspd = move * spd;

vspd = vspd + grv;

if(hspd != 0) image_xscale = sign(hspd);

//colisãoH
if place_meeting(x+hspd,y,obj_wall)
{
while(!place_meeting(x+sign(hspd),y,obj_wall))
{
x = x + sign(hspd)
}
hspd= 0;
}
x = x + hspd;

//corçosãoV
if place_meeting(x,y+vspd,obj_wall)
{
while(!place_meeting(x,y+sign(vspd),obj_wall))
{
y = y + sign(vspd)
}
vspd = 0;
}
y = y + vspd;


//jump
if place_meeting(x,y+1,obj_wall) and key_jump
{
vspd -=8;
}
#endregion

#region//tiro
var flipped = direction;
var gun_x = (x+4)*(flipped)
var _xx = x + lengthdir_x(15, image_angle)
var y_offset = lengthdir_y(-20, image_angle)

if key_shoot and global.bullets > 0 
{
	with(instance_create_layer(_xx,y+10,"Shoot",obj_shoot))
	{
		//dados do tiro
	global.bullets--;
	speed = 20;
	direction = -90 + 90 * other.image_xscale;
	image_angle = direction
	}
}

#endregion

#region//life
if global.life < 1 {
	game_restart();
}
#endregion

