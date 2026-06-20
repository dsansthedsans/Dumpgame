
depth = -9999;
visible = 1;
persistent = 0;
image_alpha = 0;
alarm[0] = 5;
//droppeditem_create_all();

// chara menu
press_l = 0;
press_r = 0;
press_u = 0;
press_d = 0;
press_ctrl = 0;
press_enter = 0;
press_shift = 0;

mainbox_x = 16;
mainbox_opt_y = 84;
mainbox_info_y = 26;
mainbox_w = 71;
mainbox_opt_h = 74;
mainbox_info_h = 55;
maininfo_x[0] = (mainbox_x + 12);
maininfo_x[1] = (mainbox_x + 32);
maininfo_y[0] = (mainbox_info_y + 6);
maininfo_y[1] = (maininfo_y[0] + 18);
maininfo_y[2] = (maininfo_y[1] + 8);
maininfo_y[3] = (maininfo_y[2] + 8);
mainfont = fnt_main;
mainfont_info = fnt_mars_6;
mainopt_pos = 0;
mainopt_length = 2;
mainalpha = 1;

bigbox_x = (mainbox_x + 78)//(mainbox_x + 75);
bigbox_y = (mainbox_info_y + 27);
bigbox_w = 210//173;
bigbox_h = 132//181;

levelopt_pos = 0;
levelopt_length = global.item_length;
leveltitle[0] = get_text("charamenu_item_title_0");
leveltitle[1] = get_text("charamenu_item_title_1");
leveltitle[2] = get_text("charamenu_item_title_2");
levelalpha = 1;
levelfont = fnt_main_spaced;

otheropt_pos = 0;

event_user(0);

heart_posx = (mainopt_x[mainopt_pos] - 24);
heart_posy = mainopt_y[mainopt_pos];
heart_defaultx = heart_posx;
heart_defaulty = heart_posy

// encounter
maxsteps = 0;
encounter = 1;
encountered = 0;

// pause menu
pause_title = get_text("charapause_title");
pause_option[0] = get_text("charapause_0");
pause_option[1] = get_text("charapause_1");
pause_option[2] = get_text("charapause_2");
pause_option_pos = 0;
pause_option_length = array_length(pause_option);

pause_warning = 0;
pause_warning_pos = 0;
pause_warning_text[0] = get_text("charapause_warning_title_0");
pause_warning_text[1] = get_text("charapause_warning_title_1");
pause_warning_option[0] = get_text("charapause_warning_0");
pause_warning_option[1] = get_text("charapause_warning_1");

pause_alpha = 1;
pause_move = 1;

surfacespr = -1;