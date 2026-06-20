
controller = obj_menu_controller;
depth = (controller.depth - 1);
namer_move = 1;
namer_enter = 1;
myalpha = controller.alpha;
myfloor = 3;
myfloor_length = 0;
mypos = 2;
old_mypos = -1;
shake = 0;
shoulddestroy = 0;

// get options
capslock = 0;
base_y = (room_height + 40);
orig_base_y = base_y;
event_user(0);