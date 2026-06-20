
function TEXTDATA_EN()
{
	global.textdata_en = ds_map_create();
	// ds_map_add(global.textdata_en, "", "");
	
	// start
	ds_map_add(global.textdata_en, "start",	"Loading...");
	
	// menu
	ds_map_add(global.textdata_en, "menu_0_0",	"Play");
	ds_map_add(global.textdata_en, "menu_0_1",	"Settings");
	ds_map_add(global.textdata_en, "menu_0_2",	"Achievements");
	ds_map_add(global.textdata_en, "menu_0_3",	"Credits");
	ds_map_add(global.textdata_en, "menu_0_4",	"Quit");
	
	ds_map_add(global.textdata_en, "menu_1_title",	"Select a save file to use");
	ds_map_add(global.textdata_en, "menu_1_0",		"Back");
	ds_map_add(global.textdata_en, "menu_1_1",		"File 1");
	ds_map_add(global.textdata_en, "menu_1_2",		"File 2");
	ds_map_add(global.textdata_en, "menu_1_3",		"File 3");
	
	ds_map_add(global.textdata_en, "menu_2_0",		"Back");
	ds_map_add(global.textdata_en, "menu_2_1",		"Controls");
	ds_map_add(global.textdata_en, "menu_2_2",		"Language");
	ds_map_add(global.textdata_en, "menu_2_3",		"Fullscreen");
	ds_map_add(global.textdata_en, "menu_2_4",		"Visual Effects");
	ds_map_add(global.textdata_en, "menu_2_5",		"Master Volume");
	ds_map_add(global.textdata_en, "menu_2_6",		"Music Volume");
	ds_map_add(global.textdata_en, "menu_2_7",		"Sound Volume");
	ds_map_add(global.textdata_en, "menu_2_8",		"Auto-Run");
	ds_map_add(global.textdata_en, "menu_2_9",		"Show FPS");
	ds_map_add(global.textdata_en, "menu_2_10",		"Show Stopwatch");
	ds_map_add(global.textdata_en, "menu_2_11",		"Hide Notifications");
	ds_map_add(global.textdata_en, "menu_2_12",		"Enable Discord RPC");
	ds_map_add(global.textdata_en, "menu_2_13",		"Blood and Gore");
	ds_map_add(global.textdata_en, "menu_2_14",		"Fast Start");
	ds_map_add(global.textdata_en, "menu_key_2_0",	"No");
	ds_map_add(global.textdata_en, "menu_key_2_1",	"Yes");
	ds_map_add(global.textdata_en, "menu_key_2_3",	"English");
	
	ds_map_add(global.textdata_en, "menu_3_0", "Back");

	ds_map_add(global.textdata_en, "menu_4_0",		"Back");
	ds_map_add(global.textdata_en, "menu_4_info_0_0",	"--- dsans ---");
	ds_map_add(global.textdata_en, "menu_4_info_0_1",	"Programming, Art, Story, Characters,\nMap, Translation, Itch.io page");
	ds_map_add(global.textdata_en, "menu_4_info_0_2",	"--- migel8022 ---");
	ds_map_add(global.textdata_en, "menu_4_info_0_3",	"Soundtrack, extra sound effects, Broken\nClock's idea and design,\nofficial site");
	
	ds_map_add(global.textdata_en, "menu_4_info_1_0",	"--- Maari ---");
	ds_map_add(global.textdata_en, "menu_4_info_1_1",	"Armsguy and Trashguy designs");
	ds_map_add(global.textdata_en, "menu_4_info_1_2",	"--- Babakinha ---");
	ds_map_add(global.textdata_en, "menu_4_info_1_3",	"Logo help");
	ds_map_add(global.textdata_en, "menu_4_info_1_4",	"--- Comunista ---");
	ds_map_add(global.textdata_en, "menu_4_info_1_5",	"MEE6's design help");
	ds_map_add(global.textdata_en, "menu_4_info_1_6",	"--- fer10tanb ---");
	ds_map_add(global.textdata_en, "menu_4_info_1_7",	"Broken Clock's concept art");
	
	ds_map_add(global.textdata_en, "menu_4_info_2_0",	"UNDERTALE and DELTARUNE\nby Toby Fox\n\n\nDiscord bot MEE6\nby Anis Belkacem");

	ds_map_add(global.textdata_en, "menu_5_0", "Back");
	ds_map_add(global.textdata_en, "menu_5_1", "Continue");
	ds_map_add(global.textdata_en, "menu_5_2", "Erase");
	ds_map_add(global.textdata_en, "menu_5_2_erase", "Sure?")

	ds_map_add(global.textdata_en, "menu_6_0",		"Back");
	ds_map_add(global.textdata_en, "menu_6_1",		"Reset Keybinds");
	ds_map_add(global.textdata_en, "menu_6_2",		"* Move Left");
	ds_map_add(global.textdata_en, "menu_6_3",		"* Move Right");
	ds_map_add(global.textdata_en, "menu_6_4",		"* Move Up");
	ds_map_add(global.textdata_en, "menu_6_5",		"* Move Down");
	ds_map_add(global.textdata_en, "menu_6_6",		"* Select");
	ds_map_add(global.textdata_en, "menu_6_7",		"* Select (ALT)");
	ds_map_add(global.textdata_en, "menu_6_8",		"* Unselect");
	ds_map_add(global.textdata_en, "menu_6_9",		"* Unselect (ALT)");
	ds_map_add(global.textdata_en, "menu_6_10",		"* Run");
	ds_map_add(global.textdata_en, "menu_6_11",		"* Run (ALT)");
	ds_map_add(global.textdata_en, "menu_6_12",		"* In-Game Menu");
	ds_map_add(global.textdata_en, "menu_6_13",		"* In-Game Menu (ALT)");
	ds_map_add(global.textdata_en, "menu_6_14",		"* In-Game Pause");
	ds_map_add(global.textdata_en, "menu_6_15",		"* Fullscreen");
	
	ds_map_add(global.textdata_en, "menu_7_title",		"Give a nickname to\nthe fallen child");
	ds_map_add(global.textdata_en, "menu_7_0",			"Back");
	ds_map_add(global.textdata_en, "menu_7_1",			"Write");
	ds_map_add(global.textdata_en, "menu_7_2",			"Done");
	ds_map_add(global.textdata_en, "menu_namer_0",		"Uppercase");
	ds_map_add(global.textdata_en, "menu_namer_1",		"Backspace");
	ds_map_add(global.textdata_en, "menu_namer_2",		"Confirm");
	ds_map_add(global.textdata_en, "menu_namer_f10",	"TYPING MODE ENABLED\nPRESS [F10] TO QUIT");
	
	ds_map_add(global.textdata_en, $"menu_name_0",		"Dumpgame");
	ds_map_add(global.textdata_en, $"menu_namemsg_0",		"<3");
	ds_map_add(global.textdata_en, $"menu_name_1",		"Fuckgame");
	ds_map_add(global.textdata_en, $"menu_namemsg_1",		"...?");
	ds_map_add(global.textdata_en, $"menu_name_2",		"Carlinhos");
	ds_map_add(global.textdata_en, $"menu_namemsg_2",		"The true name.");
	ds_map_add(global.textdata_en, $"menu_name_3",		"MEE6");
	ds_map_add(global.textdata_en, $"menu_namemsg_3",		"I suggest you choose\na different name.");
	ds_map_add(global.textdata_en, $"menu_name_4",		"Armsguy");
	ds_map_add(global.textdata_en, $"menu_namemsg_4",		"I Know, My Name Is Awesome.\nBut It's Not For You.");
	ds_map_add(global.textdata_en, $"menu_name_5",		"Trashguy");
	ds_map_add(global.textdata_en, $"menu_namemsg_5",		"...okay, i guess...");
	ds_map_add(global.textdata_en, $"menu_name_6",		"BrokenClock");
	ds_map_add(global.textdata_en, $"menu_namemsg_6",		"AND I THOUGHT YOU COULDN'T MAKE IT WORSE.");
	
	// conquistas
	ds_map_add(global.textdata_en, "achievement_name_0",		"MINI6");
	ds_map_add(global.textdata_en, "achievement_name_1",		"Strawberry Helmet");
	ds_map_add(global.textdata_en, "achievement_name_2",		"Ninja Cosplay");
	ds_map_add(global.textdata_en, "achievement_name_3",		"Stage 1: Enthusiasm");
	ds_map_add(global.textdata_en, "achievement_name_4",		"Ran Out of Time");
	ds_map_add(global.textdata_en, "achievement_name_5",		"Puzzle Master");
	ds_map_add(global.textdata_en, "achievement_name_6",		"Stage 2: Satisfaction");
	ds_map_add(global.textdata_en, "achievement_name_7",		"Not The Real One");
	ds_map_add(global.textdata_en, "achievement_name_8",		"The Real One");
	ds_map_add(global.textdata_en, "achievement_name_9",		"Here We Go Again");
	
	ds_map_add(global.textdata_en, "achievement_desc_0",		"Find the MEE6 toy that's hidden somewhere in the Corridors");
	ds_map_add(global.textdata_en, "achievement_desc_1",		"Get the armor that smells like strawberry");
	ds_map_add(global.textdata_en, "achievement_desc_2",		"Get a weapon used by ninjas by completing a monster's request");
	ds_map_add(global.textdata_en, "achievement_desc_3",		"Kill every monster\nfrom Corridors before challenging Broken Clock");
	ds_map_add(global.textdata_en, "achievement_desc_4",		"Defeat Broken Clock");
	ds_map_add(global.textdata_en, "achievement_desc_5",		"Complete CAPTCHA's last stage in under 30 seconds");
	ds_map_add(global.textdata_en, "achievement_desc_6",		"Kill every monster from Caverns before reaching its exit");
	ds_map_add(global.textdata_en, "achievement_desc_7",		"Battle a monster sent by a greater force");
	ds_map_add(global.textdata_en, "achievement_desc_8",		"Find and defeat the forgotten creature\nof this world");
	ds_map_add(global.textdata_en, "achievement_desc_9",		"Reset a save file for the first time");
	
	/*	ESTÁGIOS GENOCIDA
	estágio 1: entusiasmo	(corredores) (corredores achados)
	estágio 2: satisfação	(cavernas) (música das cavernas estilo corredores achados mas nem tanto)
	estágio 3: necessidade	(pré-cidade OU cidade central)
	*/
	
	// intro
	/*
	ds_map_add(global.textdata_en, "intro_0", "Long ago,^1 three friends had met each other during class.^2");
	ds_map_add(global.textdata_en, "intro_1", "After some time,^1 they decided to create a server in Discord.^2");
	ds_map_add(global.textdata_en, "intro_2", "As the years went by,^1 new members had joined the server.^2");
	ds_map_add(global.textdata_en, "intro_3", "One day,^1 the owner was testing a new Discord feature.^2");
	ds_map_add(global.textdata_en, "intro_4", "But it went very,^1 very wrong.^2^2^2^1");
	ds_map_add(global.textdata_en, "intro_5", "Many years later^2.^2.^2.^2^2^1");
	ds_map_add(global.textdata_en, "intro_6", "FORTALEZA - \\11/14/2022");
	ds_map_add(global.textdata_en, "intro_7", "A brazilian boy was practing soccer in&a football pitch.");
	
	ds_map_add(global.textdata_en, "intro_8", "By mistake,^1 the ball fell inside a strange dumpster nearby.");
	ds_map_add(global.textdata_en, "intro_9", "When the boy was trying to get the ball,^1 he fell inside the dumpster.");
	ds_map_add(global.textdata_en, "intro_10", "The bottom of the dumpster opened,^1 revealing a giant portal.");
	ds_map_add(global.textdata_en, "intro_11", "The boy fell inside the portal and he was taken to another world.^2");
	*/
	
	// game over
	ds_map_add(global.textdata_en, "gameover_0", "CONTINUE");
	ds_map_add(global.textdata_en, "gameover_1", "GIVE UP");
	
	// worlds
	ds_map_add(global.textdata_en, "world_name_corridors",	"Corridors");
	ds_map_add(global.textdata_en, "world_name_caverns",	"Caverns");
	
	// rooms
	ds_map_add(global.textdata_en, "room_corridors_1",			"The Room of the New Members");
	ds_map_add(global.textdata_en, "room_corridors_1_5",		"First Corridor");
	ds_map_add(global.textdata_en, "room_corridors_2",			"MEE6's Room");
	ds_map_add(global.textdata_en, "room_corridors_3",			"Entrance"); // Save
	ds_map_add(global.textdata_en, "room_corridors_3_5",		"Dummy Training Room");
	ds_map_add(global.textdata_en, "room_corridors_4",			"Grass Pathway"); // Save
	ds_map_add(global.textdata_en, "room_corridors_5",			"CAPTCHA (Stage 1)");
	ds_map_add(global.textdata_en, "room_corridors_5_A",		"CAPTCHA (Stage 1 - Puzzle 1)");
	ds_map_add(global.textdata_en, "room_corridors_5_B",		"CAPTCHA (Stage 1 - Puzzle 2)");
	ds_map_add(global.textdata_en, "room_corridors_6",			"CAPTCHA's Reward (Stage 1)");
	ds_map_add(global.textdata_en, "room_corridors_7",			"Relaxing Corridor");
	ds_map_add(global.textdata_en, "room_corridors_8",			"Mouse Hole"); // Save
	ds_map_add(global.textdata_en, "room_corridors_9",			"CAPTCHA (Stage 2)");
	ds_map_add(global.textdata_en, "room_corridors_10",			"CATPCHA's Reward (Stage 2)");
	ds_map_add(global.textdata_en, "room_corridors_11",			"Relaxing Pathway"); // Save
	ds_map_add(global.textdata_en, "room_corridors_12",			"The Clock");
	ds_map_add(global.textdata_en, "room_corridors_13",			"Rocks Pathway"); // Save
	ds_map_add(global.textdata_en, "room_corridors_14",			"CAPTCHA (Last Stage)");
	ds_map_add(global.textdata_en, "room_corridors_15",			"CAPTCHA's Reward (Last Stage)");
	ds_map_add(global.textdata_en, "room_corridors_16",			"Checkpoint"); // Save
	ds_map_add(global.textdata_en, "room_corridors_16_A",		"Caverns' Entrance");
	ds_map_add(global.textdata_en, "room_corridors_16_B",		"Corridors' Subway Entrance");
	ds_map_add(global.textdata_en, "room_corridors_17",			"Last Pathway");
	ds_map_add(global.textdata_en, "room_corridors_18",			"Final Corridor");
	ds_map_add(global.textdata_en, "room_caverns_1",			"Rock Bottom");
	ds_map_add(global.textdata_en, "room_caverns_2",			"I Hope You Like the Darkness Because This is Just the Beginning");
	ds_map_add(global.textdata_en, "room_caverns_3",			"Tall Pillars"); // Save
	
	ds_map_add(global.textdata_en, "room_corridors_4_5",		"Rules");
	ds_map_add(global.textdata_en, "unused_room_happybirthday",		"Happy Birthday");
	
	// items
	ds_map_add(global.textdata_en, "item_name_none",		"(Empty)");
	
	ds_map_add(global.textdata_en, "item_name_stick",		"Broomstick");
	ds_map_add(global.textdata_en, "item_name_bandage",		"Bandage");
	ds_map_add(global.textdata_en, "item_name_candy",		"Cheap Candy");
	ds_map_add(global.textdata_en, "item_name_bowl",		"Candy Bowl");
	ds_map_add(global.textdata_en, "item_name_choco",		"Chocolate Bar");
	ds_map_add(global.textdata_en, "item_name_kunai",		"Kunai");
	ds_map_add(global.textdata_en, "item_name_helmet",		"Broken Helmet");
	
	ds_map_add(global.textdata_en, "item_name_stick_small",			"");
	ds_map_add(global.textdata_en, "item_name_bandage_small",		"");
	ds_map_add(global.textdata_en, "item_name_candy_small",			"");
	ds_map_add(global.textdata_en, "item_name_bowl_small",			"");
	ds_map_add(global.textdata_en, "item_name_choco_small",			"Choco Bar");
	ds_map_add(global.textdata_en, "item_name_kunai_small",			"");
	ds_map_add(global.textdata_en, "item_name_helmet_small",		"Brkn Hlmt");
	
	ds_map_add(global.textdata_en, "item_name_stick_serious",		"Stick");
	ds_map_add(global.textdata_en, "item_name_bandage_serious",		"");
	ds_map_add(global.textdata_en, "item_name_candy_serious",		"Candy");
	ds_map_add(global.textdata_en, "item_name_bowl_serious",		"Bowl");
	ds_map_add(global.textdata_en, "item_name_choco_serious",		"Chocolate");
	ds_map_add(global.textdata_en, "item_name_kunai_serious",		"Knife");
	ds_map_add(global.textdata_en, "item_name_helmet_serious",		"Helmet");
	
	ds_map_add(global.textdata_en, "item_desc_stick",		"* Broomstick - [0 ATK]^1&* It feels it's about to break.");
	ds_map_add(global.textdata_en, "item_desc_bandage",		"* Bandage - [0 DEF]^1&* There's a pink-colored character in it.");
	ds_map_add(global.textdata_en, "item_desc_candy",		"* Cheap Candy - [HEALS 7 HP]^1&* Tastes like strawberry.");
	ds_map_add(global.textdata_en, "item_desc_bowl",		"* Candy Bowl - [3 DEF]^1&* Smells like rotten strawberry.");
	ds_map_add(global.textdata_en, "item_desc_choco",		"* Chocolate Bar - [HEALS 12 HP]^1&* It's a lactose free chocolate.");
	ds_map_add(global.textdata_en, "item_desc_kunai",		"* Kunai - [3 ATK]^1&* Looks like a knife.^1&* There's a blood stain in it.");
	ds_map_add(global.textdata_en, "item_desc_helmet",		"* Broken Helmet - [7 DEF]^1&* ");
	
	ds_map_add(global.textdata_en, "item_equip", "* (You equipped the ");
	
	ds_map_add(global.textdata_en, "item_use_0", "* (You used the ");
	ds_map_add(global.textdata_en, "item_use_1", "&* (You restored ");
	ds_map_add(global.textdata_en, "item_use_2", "&* (Your HP was maxed out.)");
	
	ds_map_add(global.textdata_en, "item_drop_0.0", "* (The ");
	ds_map_add(global.textdata_en, "item_drop_0.1", " was throw away.)");
	
	ds_map_add(global.textdata_en, "item_pickup", "* (You picked up the ");
	ds_map_add(global.textdata_en, "item_cantpickup", "* (Your inventory is full.)");
		
	// chara menu
	ds_map_add(global.textdata_en, "charamenu_main_info_3", "$");
	
	ds_map_add(global.textdata_en, "charamenu_item_title_0", "INVENTORY");
	ds_map_add(global.textdata_en, "charamenu_item_title_1", "YOUR STATS");
	ds_map_add(global.textdata_en, "charamenu_item_title_2", "CELLPHONE");
	ds_map_add(global.textdata_en, "charamenu_item_other_0", "USE");
	ds_map_add(global.textdata_en, "charamenu_item_other_1", "INFO");
	ds_map_add(global.textdata_en, "charamenu_item_other_2", "DROP");
	
	ds_map_add(global.textdata_en, "charamenu_stat_spares", "SPARES");
	ds_map_add(global.textdata_en, "charamenu_stat_kills", "KILLS ");
	ds_map_add(global.textdata_en, "charamenu_stat_heals", "HEALS ");
	ds_map_add(global.textdata_en, "charamenu_stat_deaths", "DEATHS");
	ds_map_add(global.textdata_en, "charamenu_stat_weapon", "WEAPON");
	ds_map_add(global.textdata_en, "charamenu_stat_armor", "ARMOR ");
	
	// chara pause
	ds_map_add(global.textdata_en, "charapause_title", "GAME PAUSED");
	ds_map_add(global.textdata_en, "charapause_0", "Resume");
	ds_map_add(global.textdata_en, "charapause_1", "Main Menu");
	ds_map_add(global.textdata_en, "charapause_2", "Quit Game");
	
	ds_map_add(global.textdata_en, "charapause_warning_title", "Are you sure? You will lose\nunsaved progress.");
	ds_map_add(global.textdata_en, "charapause_warning_0", "No");
	ds_map_add(global.textdata_en, "charapause_warning_1", "Yes");
	//ds_map_add(global.textdata_en, "charapause_msg_title", "MESSAGE OF THE DAY");
	
	// battle main
	ds_map_add(global.textdata_en, "battle_main_sparing_0_0", " is sparing you.");
	ds_map_add(global.textdata_en, "battle_main_sparing_0_1", " is tired of you.");
	ds_map_add(global.textdata_en, "battle_main_sparing_0_2", " is hypnotized.");
	ds_map_add(global.textdata_en, "battle_main_sparing_0_3", " has given up&on eating you.");
	ds_map_add(global.textdata_en, "battle_main_sparing_1_0", " and ");
	ds_map_add(global.textdata_en, "battle_main_sparing_1_1", " are sparing you.");
	
	ds_map_add(global.textdata_en, "battle_fight_0", "MISS");
	ds_map_add(global.textdata_en, "battle_fight_1", "BLOCK");
	
	ds_map_add(global.textdata_en, "battle_act_0", "Check");
		
	ds_map_add(global.textdata_en, "battle_mercy_0", "* Spare");
	ds_map_add(global.textdata_en, "battle_mercy_1", "* Flee");
	
	ds_map_add(global.textdata_en, "battle_won_0", "* (YOU WON!)^1&* (You earned :Y");
	ds_map_add(global.textdata_en, "battle_won_1", " EXP;D and :Y$");
	ds_map_add(global.textdata_en, "battle_won_2", "^1&* (Your :YLVL;D increased.)");
	
	ds_map_add(global.textdata_en, "battle_flee_0", "* I've got better stuff to do.");
	ds_map_add(global.textdata_en, "battle_flee_1", "* See you tomorrow.");
	ds_map_add(global.textdata_en, "battle_flee_2", "* Nice to meet you.");
	ds_map_add(global.textdata_en, "battle_flee_3", "* Happy go to hell.");
	ds_map_add(global.textdata_en, "battle_flee_4", "* Buh-bye.");
	
	ds_map_add(global.textdata_en, "battle_nobody", "* But nobody came.");
	
	// save
	ds_map_add(global.textdata_en, "savepoint_0", "* [This save system is temporary.]");
	ds_map_add(global.textdata_en, "savepoint_1", "* [Once you quit the game you will you lose all progress.]");
	ds_map_add(global.textdata_en, "savepoint_2", "* [You won't lose progress by returning to the Menu.]");
	ds_map_add(global.textdata_en, "savepoint_3", "* (Your HP has been fully restored.)");
	ds_map_add(global.textdata_en, "savepoint_4", "");
	ds_map_add(global.textdata_en, "savepoint_4_1", "Save");
	ds_map_add(global.textdata_en, "savepoint_4_2", "Back");
	ds_map_add(global.textdata_en, "savepoint_5", "File saved.");
	
	// border
	ds_map_add(global.textdata_en, "border_0", "* (This eletrical border gives you the feeling the PRE-DEMO ended.)");
	//ds_map_add(global.textdata_en, "border_0", "* (There's an eletrical border preventing you from continuing.)");
	
	// genofeeling
	ds_map_add(global.textdata_en, "genofeeling", ";R* (Something tells you that you shouldn't continue yet.)");
	
	// genodialog
	ds_map_add(global.textdata_en, "genodialog_0_0", "* (You can feel the power in your hands...)");
	ds_map_add(global.textdata_en, "genodialog_0_1", "* (... and the strength crossing through your veins.)");
	ds_map_add(global.textdata_en, "genodialog_0_2", "* (Your desire to end the others lives is so great...)");
	ds_map_add(global.textdata_en, "genodialog_0_3", "* (But nobody came.)");
	
	// ds_map_add(global.textdata_en, "genodialog_1_1", "* ()");
	ds_map_add(global.textdata_en, "genodialog_1_0", "* (Just as before,^1 the sound of emptiness arrives yet again.)");
	ds_map_add(global.textdata_en, "genodialog_1_1", "* (Your strength and patience only rises )");
	ds_map_add(global.textdata_en, "genodialog_1_1", "* (However,^1 your urge is far to being fulfilled.)");
	ds_map_add(global.textdata_en, "genodialog_1_1", "* (But nobody came.)");
	
	// room_corridors_1
	ds_map_add(global.textdata_en, "room_lamp_0","* (It's a lamp.)");
	ds_map_add(global.textdata_en, "room_lamp_1","* (Its light comes from a strange-looking blue fire.)");
	ds_map_add(global.textdata_en, "room_pillar","* (It's a pillar.)");
	ds_map_add(global.textdata_en, "room_brokenlamp", "* (This lamp appears to have been forcefully thrown against the floor.)");
	
	// obj_event_m6_start	
	ds_map_add(global.textdata_en, "event_m6_start_0_0", "* Are you a new member?");
	ds_map_add(global.textdata_en, "event_m6_start_0_1", "* You are not with them,^1 are you?");
	ds_map_add(global.textdata_en, "event_m6_start_0_2", "* ...");
	ds_map_add(global.textdata_en, "event_m6_start_0_3", "* Alright.");
	
	ds_map_add(global.textdata_en, "event_m6_start_1_0", "* Hello,^3 new member.^1&* Welcome to the world&of ;UDumpster Friends;D!");
	ds_map_add(global.textdata_en, "event_m6_start_1_1", "* My name is :6MEE6;D.^1&* I am a :6ROBOT;D made&to help you.");
	ds_map_add(global.textdata_en, "event_m6_start_1_2", "* And as far as I can understand,^1 you probably should not be here.");
	ds_map_add(global.textdata_en, "event_m6_start_1_3", "* We are at :RCORRIDORS;D,^1 a longtime abandoned place in this world.");
	ds_map_add(global.textdata_en, "event_m6_start_1_4", "* Even though there is an exit,^1 it is dangerous for you to get there.");
	ds_map_add(global.textdata_en, "event_m6_start_1_5", "* That is because this place is full of monsters and creatures.");
	ds_map_add(global.textdata_en, "event_m6_start_1_6", "* Besides,^1 :RCORRIDORS;D are full of puzzles&and old mechanisms.");
	ds_map_add(global.textdata_en, "event_m6_start_1_7", "* Those puzzles are what are keeping me trapped in this place.");
	ds_map_add(global.textdata_en, "event_m6_start_1_8", "* When I say that you should not be here,^1 it is all because of that.");
	ds_map_add(global.textdata_en, "event_m6_start_1_9", "* I will not stop you from leaving,^1 but you should know the danger of it.");
	ds_map_add(global.textdata_en, "event_m6_start_1_10", "* Well,^1 I wish you good luck on your adventure.");
	ds_map_add(global.textdata_en, "event_m6_start_1_11", "* Goodbye,^1 new member.");
	
	ds_map_add(global.textdata_en, "event_m6_start_2_0", "* ... Wait.");
	
	ds_map_add(global.textdata_en, "event_m6_start_3_0", "* I have an idea.");
	ds_map_add(global.textdata_en, "event_m6_start_3_1", "* If we go together,^1 we could reach the end of :RCORRIDORS;D.");
	ds_map_add(global.textdata_en, "event_m6_start_3_2", "* My knowledge and your strength together could ease our adventure.");
	ds_map_add(global.textdata_en, "event_m6_start_3_3", "* The exit would take us to this world's city,^1 a safe and populated area.");
	ds_map_add(global.textdata_en, "event_m6_start_3_4", "* And from there,^1 you can leave this world if you want.");
	ds_map_add(global.textdata_en, "event_m6_start_3_5", "* So now I ask you,^1&new member.");
	ds_map_add(global.textdata_en, "event_m6_start_3_6", "* May I please follow you in your adventure?");
	ds_map_add(global.textdata_en, "event_m6_start_3_7", "* You are my only chance to leave this place.");
	ds_map_add(global.textdata_en, "event_m6_start_3_8", "* (Let MEE6 come with you?)");
	ds_map_add(global.textdata_en, "event_m6_start_3_8_1", "Yes");
	ds_map_add(global.textdata_en, "event_m6_start_3_8_2", "No");
		ds_map_add(global.textdata_en, "event_m6_start_3_9_1", "* Well,^1 thank you,^1&new member.");
		ds_map_add(global.textdata_en, "event_m6_start_3_10_1", "* I am pleased that you accepted my request.");
			ds_map_add(global.textdata_en, "event_m6_start_3_9_2", "* Hey.^1 Look.^1 My system does not understand sarcasm,^1 all right?");
			ds_map_add(global.textdata_en, "event_m6_start_3_10_2", "* But I am grateful that you accepted my request.");
	ds_map_add(global.textdata_en, "event_m6_start_3_11", "* I will do everything in my power to help you when necessary.");
	
	ds_map_add(global.textdata_en, "event_m6_start_4_0", "* Now,^1 let us go,^1 we have an adventure to live!");
	
	// room_corridors_2
	ds_map_add(global.textdata_en, "room_m6_banner_0", "* (It's an old banner.)");
	ds_map_add(global.textdata_en, "room_m6_banner_1", "* (The banner depicts MEE6 advertising a product&that you don't know.)");
		
	ds_map_add(global.textdata_en, "room_m6_poster_0", "* (It's a poster.)");
	ds_map_add(global.textdata_en, "room_m6_poster_1", "* (It says something&about MEE6 remembering&your birthday.)");
	ds_map_add(global.textdata_en, "room_m6_poster_2", "* (There's also a drawing of him wearing a birthday hat.)");

	ds_map_add(global.textdata_en, "room_m6_papers_0", "* (It's a pair of stapled papers.)");
	ds_map_add(global.textdata_en, "room_m6_papers_1", "* (There's a license&agreement in it.)");
	ds_map_add(global.textdata_en, "room_m6_papers_2", "* (You decide not to read.)");
	
	// room_corridors_3
	ds_map_add(global.textdata_en, "room_m6_brokenwall_0", "* (There's an ant-sized toy&of MEE6 inside the crack&of this wall.)");
	ds_map_add(global.textdata_en, "room_m6_brokenwall_1", "* (Strangely,^1 the toy is depicting MEE6 as a&tall robot.)");
	
	ds_map_add(global.textdata_en, "room_deadlamp", "* (The light of this lamp seems to be deactivated.)");
	
	// obj_event_m6_predummy
	ds_map_add(global.textdata_en, "event_m6_predummy_0_0", "* As I said before,^1 the rooms of :RCORRIDORS;D are full of creatures.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_1", "* It is necessary that you learn how to protect yourself from them.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_2", "* Usually,^1 they would not be dangerous to you in any way.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_3", "* However,^1 the monsters can start :YBATTLES;D with you whenever they like.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_4", "* A :YBATTLE;D is a challenge between two or more users.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_5", "* The objective of each player is to :Rkill;D or&:Yspare;D the opponent.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_6", "* If you enter in a :YBATTLE;D and the enemy wants&to :Rkill;D you, ...");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_7", "* ... you might not survive if you do not know how to win.");
	ds_map_add(global.textdata_en, "event_m6_predummy_0_8", "* It is crucial that you understand how this challenge works.");
	
	ds_map_add(global.textdata_en, "event_m6_predummy_1_0", "* This dummy here is used to practice :YBATTLES;D.");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_1", "* Would you like to enter in a :YBATTLE;D with the dummy?");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_2", "* I would guide you throughout the entire challenge.");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_3", "* (Battle the dummy?)");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_3_1", "Yes");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_3_2", "No");
	
	ds_map_add(global.textdata_en, "event_m6_predummy_1_1_4", "* Great!");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_1_5", "* Get near them and interact with the dummy to start the :YBATTLE;D.");
		//ds_map_add(global.textdata_en, "event_m6_predummy_1_1_6_0", "* (Press :Y[");
		//ds_map_add(global.textdata_en, "event_m6_predummy_1_1_6_1", " or ");
		//ds_map_add(global.textdata_en, "event_m6_predummy_1_1_6_2", "];D to interact with overworld objects.)");
	
	ds_map_add(global.textdata_en, "event_m6_predummy_1_2_4", "* ... Alright.");
	ds_map_add(global.textdata_en, "event_m6_predummy_1_2_5", "* Let us go to that door,^1 then.");
	
	// room_corridors_3_5
	ds_map_add(global.textdata_en, "npc_dummy_0", "* (There's a dummy here.)");
	ds_map_add(global.textdata_en, "npc_dummy_1", "* (Battle the dummy?)");
	ds_map_add(global.textdata_en, "npc_dummy_1_1", "Yes");
	ds_map_add(global.textdata_en, "npc_dummy_1_2", "No");
		ds_map_add(global.textdata_en, "npc_dummy_2", "* (It's strangely quiet.)");
	
	// obj_event_m6_postdummy
	ds_map_add(global.textdata_en, "event_m6_postdummy_0", "* You are very good at this.");
	ds_map_add(global.textdata_en, "event_m6_postdummy_1", "* It is almost like you already had seen this somewhere else...!");
	ds_map_add(global.textdata_en, "event_m6_postdummy_2", "* In any way,^1 let us go to that door.");
	
	// obj_event_m6_dummydoor
	ds_map_add(global.textdata_en, "event_m6_dummydoor_0", "* From now on,^1 we will encounter monsters.");
	ds_map_add(global.textdata_en, "event_m6_dummydoor_1_1", "* I hope you understood how :YBATTLES;D work.");
	ds_map_add(global.textdata_en, "event_m6_dummydoor_1_2", "* I really hope you know how :YBATTLES;D work.");
	ds_map_add(global.textdata_en, "event_m6_dummydoor_2", "* Well,^1 let us just keep going.");
	
	// room_corridors_4	
	ds_map_add(global.textdata_en, "npc_armsguy1_0_0", "* Are You A New Member?");
	ds_map_add(global.textdata_en, "npc_armsguy1_0_1", "* Awesome.^1 &* I'm Armsguy,^1 A Monster.");
	ds_map_add(global.textdata_en, "npc_armsguy1_0_2", "* ... Why I'm The Only Armsguy Not Attacking You?");
	ds_map_add(global.textdata_en, "npc_armsguy1_0_3", "* There's No Such Reason.^1&* You're A Kid.^1&* How Harmful Can You Be?");
	ds_map_add(global.textdata_en, "npc_armsguy1_0_4", "* Unless You Kill Another Monster.^1&* Then I'll Run.");
		ds_map_add(global.textdata_en, "npc_armsguy1_1_0", "* Try Befriending The Other Monsters.");
		ds_map_add(global.textdata_en, "npc_armsguy1_1_1", "* They're Just Attacking You Because They're Scared.");
		ds_map_add(global.textdata_en, "npc_armsguy1_1_2", "* If You Show You Won't Hurt Them,^1 You're Fine.");
	
	// room_corridors_4_5
	ds_map_add(global.textdata_en, "room_rulesbook_0", "* (It's an old book.)");
	ds_map_add(global.textdata_en, "room_rulesbook_1", "* (The title of the&book is \"Rules\".)");
	ds_map_add(global.textdata_en, "room_rulesbook_2", "* (Some pages are ripped off and others are full of drawings.)");
	ds_map_add(global.textdata_en, "room_rulesbook_3", "* (Someone kept drawing the same smiley face a hundred times.)");
	
	// obj_event_m6_precaptcha1
	ds_map_add(global.textdata_en, "event_m6_precaptcha1_0", "* This is the door that has made stay here for all of this time.");
	ds_map_add(global.textdata_en, "event_m6_precaptcha1_1", "* I wanted to ask them why they made the puzzles so hard.");
	ds_map_add(global.textdata_en, "event_m6_precaptcha1_2", "* In any way,^1 I believe you should read that sign next to the door.");
	ds_map_add(global.textdata_en, "event_m6_precaptcha1_3", "* It may help you understand on how to open the door!");
	
	// room_corridors_5
	ds_map_add(global.textdata_en, "room_captcha_mainsign_1_0", "* \"[CAPTCHA - STAGE 1]\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_1_1", "* \"For you to enter the server,^1 it's necessary to check if you're not a robot.\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_1_2", "* \"You can confirm you're not a robot by completing two puzzles.\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_1_3", "* \"One in the left and one in the right.\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_1_4", "* \"When both puzzles have been completed,^1 the door will open.\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_1_5", "* \"Good luck!\"");
	
	// room_corridors_5_A, room_corridors_5_B
	ds_map_add(global.textdata_en, "room_captcha_guidesign_1_0", "* \"[CAPTCHA - INSTRUCTIONS]\"");	
	ds_map_add(global.textdata_en, "room_captcha_guidesign_1_1", "* \"Your objective is to write the name of what is in the image.\"");
	ds_map_add(global.textdata_en, "room_captcha_guidesign_1_2", "* \"You need to use all of the buttons displayed to write.\"");
	ds_map_add(global.textdata_en, "room_captcha_guidesign_1_3", "* \"You can press the buttons by stepping on them.\"");
	ds_map_add(global.textdata_en, "room_captcha_guidesign_1_4", "* \"Press the button with an 'X' to reset the puzzle.\"");
	
	ds_map_add(global.textdata_en, "room_captcha1_0", "MOTORBIKE");
	ds_map_add(global.textdata_en, "room_captcha1_1", "CELLPHONE");
	ds_map_add(global.textdata_en, "room_captcha1_2", "LIGHTBULB");
	ds_map_add(global.textdata_en, "room_captcha1_3", "CLOWNFISH");

	// obj_event_m6_postcaptcha1
	ds_map_add(global.textdata_en, "event_m6_postcaptcha1_0", "* You opened the door?!");
	ds_map_add(global.textdata_en, "event_m6_postcaptcha1_1", "* I knew you could do this.");
	ds_map_add(global.textdata_en, "event_m6_postcaptcha1_2", "* Thank you,^1 new member.");
	ds_map_add(global.textdata_en, "event_m6_postcaptcha1_3", "* Unfortunately,^1 this is not the only door you will have to open.");
	ds_map_add(global.textdata_en, "event_m6_postcaptcha1_4", "* But let us keep going,^1 we have no time to lose!");
		
	// room_corridors_6
	ds_map_add(global.textdata_en, "room_candybowl_0_0_0", "* (It's a candy bowl.)");
	ds_map_add(global.textdata_en, "room_candybowl_0_0_1", "^1&* (There ");
	ds_map_add(global.textdata_en, "room_candybowl_0_0_2", "is ");
	ds_map_add(global.textdata_en, "room_candybowl_0_0_3", "are ");
	ds_map_add(global.textdata_en, "room_candybowl_0_0_4", " candy&in the bowl.)");
	ds_map_add(global.textdata_en, "room_candybowl_0_0_5", " candies&in the bowl.)");
	ds_map_add(global.textdata_en, "room_candybowl_0_1", "* (Take a candy?)");
	ds_map_add(global.textdata_en, "room_candybowl_0_1_1", "Yes");
	ds_map_add(global.textdata_en, "room_candybowl_0_1_2", "No");
	ds_map_add(global.textdata_en, "room_candybowl_0_2", "* (You took a candy from the bowl.)");
	ds_map_add(global.textdata_en, "room_candybowl_0_3", "* (You got a :YCheap Candy;D.)");
	ds_map_add(global.textdata_en, "room_candybowl_0_4_0", "* (Press :Y[");
	ds_map_add(global.textdata_en, "room_candybowl_0_4_1", " or ");
	ds_map_add(global.textdata_en, "room_candybowl_0_4_2", "];D to open the menu.)");
	ds_map_add(global.textdata_en, "room_candybowl_1_0", "* (It was a candy bowl.)");
	ds_map_add(global.textdata_en, "room_candybowl_1_1", "* (But you took all of it.)");
	ds_map_add(global.textdata_en, "room_candybowl_1_2", "* (Actually,^1 you could take the bowl and use it as armor.)");
	ds_map_add(global.textdata_en, "room_candybowl_1_3", "* (Take the bowl?)");
	ds_map_add(global.textdata_en, "room_candybowl_1_3_1", "Yes");
	ds_map_add(global.textdata_en, "room_candybowl_1_3_2", "No");
	ds_map_add(global.textdata_en, "room_candybowl_1_4", "* (You took the bowl.)");
	ds_map_add(global.textdata_en, "room_candybowl_1_5", "* (You got the :YCandy Bowl;D.)");
	ds_map_add(global.textdata_en, "room_candybowl_2", "* (Your inventory is full.)");
	
	ds_map_add(global.textdata_en, "room_candysign_0", "* \"Congrats for finishing our CAPTCHA's STAGE 1 verification!\"");
	ds_map_add(global.textdata_en, "room_candysign_1", "* \"The verification isn't over,^1 this is only the first stage.\"");
	ds_map_add(global.textdata_en, "room_candysign_2", "* \"But as reward,^1 you can take some candy from the bowl.\"");
	
	// room_corridors_7
	ds_map_add(global.textdata_en, "room_relaxsign_0", "* \"Hey!^1 Got tired after all of this?\"");
	ds_map_add(global.textdata_en, "room_relaxsign_1", "* \"If you want,^1 you could relax in here as much as you like.\"");
	ds_map_add(global.textdata_en, "room_relaxsign_2", "* \"Then,^1 after you're rested,^1 you can continue!\"");
	
	// room_corridors_8
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_0", "* Hey,^1 You.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_1", "* You're A New Member,^1 Right?");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_2", "* Can You Help Me With Something?");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_3", "* My Buddy Got Stuck In The Middle Of Captcha's Stage 2.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_4", "* I'm Here Because He Asked Me To Look For Help.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_5", "* I'll Give You A Reward For It.^1&* Don't Worry.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_6", "* (Do you want to help Armsguy?)");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_6_1", "Yes");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_0_6_2", "No");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_1_0", "* Sweet.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_1_1", "* I'll Be Waiting For You Guys Right Here.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_1_2", "* I'm Too Afraid Of Heights To Get Near Those Puzzles.");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_2_0", "* That's Alright.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_0_2_1", "* I'll Look For Someone Else.");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_0_0", "* Do You Even Know Where The Captcha's Second Stage Is?");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_0_1", "* It's Right Up There.^1&* After That Door With Pillars.");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_0", "* Thank You,^1 Human.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_1", "* As I Promised,^1 I'll Give You A Reward.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_0__", "* Hey,^1 Human.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_1__", "* You Helped My Friend.^1&* You Deserve A Reward.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_2", "* I'm Not Sure If You'll Use This,^1 But I Found It Around Here.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_3", "* It's Like A Knife,^1 But Weirder.");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_4_0", "* Here.^1&* It's All Yours.");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_5_0", "* (You got the :YKunai;D.)");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_6_0", "* Hope You Enjoy It.");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_4_1", "* Wait,^1 You Don't Have Space To Take It?");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_1_5_1", "* Get Rid Of Some Stuff Then I'll Give You The Reward.");
	
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_2_0", "* What?^1&* Didn't Like It?");
	ds_map_add(global.textdata_en, "npc_armsguy_lost_1_2_1", "* ...^2 Sorry.");
	
	ds_map_add(global.textdata_en, "npc_trashguy_lost2", "* ...thanks...");
	
	// obj_event_m6_precaptcha2
	ds_map_add(global.textdata_en, "event_m6_precaptcha2_0", "* Great!^1&* There is another&CAPTCHA already.");
	ds_map_add(global.textdata_en, "event_m6_precaptcha2_1", "* The faster we go the sooner we can get out&of this place.");
	ds_map_add(global.textdata_en, "event_m6_precaptcha2_2", "* Well,^1 I will leave it up to you now.");

	// room_corridors_9
	ds_map_add(global.textdata_en, "room_captcha_mainsign_2_0", "* \"[CAPTCHA - STAGE 2]\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_2_1", "* \"This is the second stage of the CAPTCHA's verification.\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_2_2", "* \"You need to complete all the next three puzzles to reach the end of the room.\"");
	ds_map_add(global.textdata_en, "room_captcha_mainsign_2_3", "* \"Good luck!\"");
	
	ds_map_add(global.textdata_en, "room_captcha_guidesign_2_0", "* \"[CAPTCHA - INSTRUCTIONS]\"");
	ds_map_add(global.textdata_en, "room_captcha_guidesign_2_1", "* \"Your objective is to take the box from the :Fpink;D floor to the :Lgreen;D floor.\"");
	ds_map_add(global.textdata_en, "room_captcha_guidesign_2_2", "* \"The box can only be moved through the white path inside the mechanism.\"");
	ds_map_add(global.textdata_en, "room_captcha_guidesign_2_3", "* \"You can move the box by interacting with it.\"");
	
	ds_map_add(global.textdata_en, "npc_trashguy_lost1_0", "* ...you solved the puzzle...?");
	ds_map_add(global.textdata_en, "npc_trashguy_lost1_1", "* ...now i can go back and meet my friend...");
	ds_map_add(global.textdata_en, "npc_trashguy_lost1_2", "* ...thank you...");
	
	// obj_event_m6_postcaptcha2
	ds_map_add(global.textdata_en, "event_m6_postcaptcha2_0", "* Why are you so good at this?!");
	ds_map_add(global.textdata_en, "event_m6_postcaptcha2_1", "* In any way,^1 let us keep going!");
	
	// room_corridors_10
	ds_map_add(global.textdata_en, "room_chocobowl_0", "* (It's a chocolate bowl.)");
	ds_map_add(global.textdata_en, "room_chocobowl_1", "* (It seems that something happened that the bowl broke.)");
	ds_map_add(global.textdata_en, "room_chocobowl_2", "* (All the chocolate were smashed,^1 but one.)");
	ds_map_add(global.textdata_en, "room_chocobowl_3", "* (Take the chocolate?)");
	ds_map_add(global.textdata_en, "room_chocobowl_3_1", "Yes");
	ds_map_add(global.textdata_en, "room_chocobowl_3_2", "No");
	ds_map_add(global.textdata_en, "room_chocobowl_4_0", "* (You took the chocolate.)");
	ds_map_add(global.textdata_en, "room_chocobowl_5_0", "* (You got the :YBaton Garoto;D.)");
	ds_map_add(global.textdata_en, "room_chocobowl_4_1", "* (Your inventory is full.)");
	
	// room_corridors_11
	ds_map_add(global.textdata_en, "npc_trashguy_0_0", "* (It's a normal trashcan.)");
	ds_map_add(global.textdata_en, "npc_trashguy_0_1", "* (Actually,^1 it's a gruesome creature pretending to be a normal trashcan.)");
	ds_map_add(global.textdata_en, "npc_trashguy_0_2", "* (Life really takes some wild turns sometimes.)");
	
	ds_map_add(global.textdata_en, "room_preclocksign_0", "* \"Hey!\"^1&* \"Wanna see something cool?\"");
	ds_map_add(global.textdata_en, "room_preclocksign_1", "* \"It's in the next room,^1&go take a look!\"");
	ds_map_add(global.textdata_en, "room_preclocksign_2", "* \"Unless you're out of time.\"^1&* \"You could just get ticked off.\"");
	
	// obj_event_bc_prebattle
	ds_map_add(global.textdata_en, "event_bc_prebattle_0_0", "* DID YOU REALLY THINK I WOULDN'T SEE YOU?");
	ds_map_add(global.textdata_en, "event_bc_prebattle_0_1", "* EVEN AFTER EVERYTH()");
	ds_map_add(global.textdata_en, "event_bc_prebattle_0_2", "* Hey,^1 you stupid clock!^1&* You cannot trap us here!");
	ds_map_add(global.textdata_en, "event_bc_prebattle_0_3", "* SHUT UP!!!");
	
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_0", "* FINALLY,^1 JUST THE TWO OF US.");
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_1", "* YOU THINK YOU CAN JUST PASS BY ME AND IGNORE MY EXISTENCE?!");
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_2", "* ABSOLUTELY NO WAY,^1 BUDDY.");
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_3", "* NOT AFTER EVERYTHING YOU HUMANS DID TO ME.");
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_4", "* NOW,^1 IN CASE YOU'RE WONDERING WHAT I'M GONNA DO TO YOU EXACTLY...");
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_5", "* WELL...^1&* FOR THE SAKE OF ARGUMENT...^1&* LET'S SAY THAT...");
	ds_map_add(global.textdata_en, "event_bc_prebattle_1_6", "* YOU'LL FIND OUT VERY SOON...!");

	// obj_event_bc_postbattle
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_0", "* WELL,^1 THANK YOU LITTLE BUDDY.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_1", "* I DIDN'T ACTUALLY WANT TO KILL YOU.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_2", "* I THOUGHT YOU WANTED TO KILL ME,^1 OR SOMETHING LIKE THAT.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_3", "* ANYWAYS,^3 THERE'S SOMETHING YOU NEED TO KNOW ABOUT.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_4", "* AFTER THEY INVADED THE CORRIDORS,^1 THE LEADERS&CREATED A NEW RULE.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_5", "* A TERRYING RULE,^1 ACTUALLY.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_6", "* IT SAYS THAT EVERY UNINVITED NEW MEMBER SHOULD BE KILLED BEFORE LEAVING THE CORRIDORS.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_7", "* IF YOU STEP NEAR THE LAST DOOR,^1 YOU'LL PROBABLY GET&SHOT OR SOMETHING.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_8", "* I'LL TRY TO TALK TO GABEE ABOUT LETTING YOU GO.^1&* NO PROMISES,^3 THOUGH.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_9", "* ... GABEE?^1&* HE'S THE GUARDIAN OF THE CORRIDORS.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_10", "* HE'S THE ONE KEEPING THE RULE IN CHECK.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_11", "* MAYBE I CAN CONVINCE HIM TO LET YOU GO TO THE CITY.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_12", "* AND THEN YOU CAN LEAVE THE SERVER,^1 IF YOU WANT.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_13", "* WELL,^3 I SHOULD PROBABLY GO NOW.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_14", "* THERE'S NOT MUCH LEFT FOR ME TO DO HERE.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_15", "* IT WAS NICE MEETING YOU,^1 LITTLE BUDDY.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_0_16", "* SEE YOU AROUND!!!!");
	
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_0", "* Where is it?");
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_1", "* Where did that clock go?");
	
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_2_0", "* ... What?^1&* You let it go?");
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_3_0", "* That was not very smart of you.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_4_0", "* It could come back to kill both of us.");
	
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_2_1", "* ... What?^1&* You killed it?");
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_3_1", "* That is a surprise.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_1_4_1", "* However,^1 it is an welcome one,^1 for sure.");
	
	ds_map_add(global.textdata_en, "event_bc_postbattle_2_0_0", "* Let us just keep going.");
	ds_map_add(global.textdata_en, "event_bc_postbattle_2_0_1", "* Well,^1 let us keep going!");

	// hopped, approached, drew, comes, enters, crawled, came, appeared

	// Dummy battle
	ds_map_add(global.textdata_en, "battle_main_dummy_0_0", "* Here we are!");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_1", "* Do you see those four buttons in the bottom?");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_2", "* Each one of them has its own function.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_3", "* You will have to use them to interact with the opponent.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_4", "* Your ;USOUL;D,^1 depicted with a :Rheart;D,^1 marks your position.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_5", "* In a :YBATTLE;D,^1 there are two ways to win.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_6", "* The first way is by&:YFIGHTING;D the enemy&to death.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_7", "* Try attacking the&dummy by using&the button :Y[FIGHT];D.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_8", "* After you use the button,^1 the opponent's turn will begin.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_9", "* You will have to dodge&a series of bullets.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_10", "* You can dodge by controlling your ;USOUL;D.");
	ds_map_add(global.textdata_en, "battle_main_dummy_0_11", "* Try using the button \\:Y[FIGHT];D!");
	
	ds_map_add(global.textdata_en, "battle_main_dummy_2_0", "* That was great!");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_1", "* The other way to end&a :YBATTLE;D is by :YSPARING;D&the opponent.");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_2", "* However,^1 you can only&:YSPARE;D the opponent if&it likes you.");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_3", "* You can make it like you by :YACTING;D in a certain way.");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_4", "* Try using the button&:Y[ACT];D then :YCHECK;D the opponent.");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_5", "* The :YCHECK;D option tells you the main data about the enemy.");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_6", "* Basically,^1 you can only make it like you if know what it likes.");
	ds_map_add(global.textdata_en, "battle_main_dummy_2_7", "* Try using :Y[ACT];D -> :YCHECK;D!");
	
	ds_map_add(global.textdata_en, "battle_main_dummy_4_0", "* Now that you have used&:YCHECK;D,^1 you have to make it like you.");
	ds_map_add(global.textdata_en, "battle_main_dummy_4_1", "* You can make it like you by using the other options in :Y[ACT];D.");
	ds_map_add(global.textdata_en, "battle_main_dummy_4_2", "* You have to interact with it based on&what it likes.");
	ds_map_add(global.textdata_en, "battle_main_dummy_4_3", "* Try using :Y[ACT];D -> :Y???;D");
	
	ds_map_add(global.textdata_en, "battle_main_dummy_6_0", "* There you go!");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_1", "* You may see the enemy's name is now :Yyellow;D.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_2", "* That is because you can now :YSPARE;D the opponent!");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_3", "* If you :YSPARE;D the enemy,^1 this :YBATTLE;D will end.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_4", "* Another important button is the :Y[ITEM];D.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_5", "* You can use items from your inventory with&this button.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_6", "* You can heal yourself and equip weapons or armors.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_7", "* However,^1 since you have no items,^1 you cannot press the button.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_8", "* But do not forget to use it when necessary.");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_9", "* Now use :Y[MERCY];D and&:YSPARE;D the enemy to&win this :YBATTLE;D!");
	ds_map_add(global.textdata_en, "battle_main_dummy_6_10", "* Try using :Y[MERCY];D -> :YSPARE;D!");
	
	ds_map_add(global.textdata_en, "battle_enemyname_dummy", "Dummy");
	
	ds_map_add(global.textdata_en, "battle_act_dummy_1", "Talk");
	ds_map_add(global.textdata_en, "battle_act_dummy_2", "Scream");
	
	ds_map_add(global.textdata_en, "battle_act_result_dummy_0_0", "* Dummy - [0 ATK | 0 DEF]^1 &* A dummy with an appearance&of a cat.");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_0_1", "* Their body is made out of cloth and artificial fur.");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_0_2", "* Even though they don't have much to say,^1 they're a great listener.");
	
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_0", "* (You try to talk with Dummy,^1 but you couldn't think of any conversation topics...)");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_1_0_0", "* (You have a passing conversation about ");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_1_0_1_0", "video games");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_1_0_1_1", "skeletons");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_1_0_1_2", "apples");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_1_0_2", "&with Dummy.)");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_1_1_1", "* (The blush on their face seems to get redder...)");
	
	ds_map_add(global.textdata_en, "battle_act_result_dummy_2_0", "* (You loudly scream to Dummy's face.)");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_2_1", "* (Tears flows down out of their eyes.)");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_2_2_0", "* That is the wrong option.");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_2_2_1", "* You are an interesting person.");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_2_2_2", "* I knew your kind was&know to be excessive,^1 but nothing near this.");
	ds_map_add(global.textdata_en, "battle_act_result_dummy_2_2_3", "* ...");

	// Armsguy battle
	ds_map_add(global.textdata_en, "battle_main_armsguy", "* Armsguy jumped in your way!");
	
	ds_map_add(global.textdata_en, "battle_main_armsguy_0", "* Armsguy flexes so hard that he pukes.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_1", "* Armsguy kisses his own arm and gets slime around his mouth.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_2", "* Armsguy drinks his own sweat and realizes it isn't sweat.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_3", "* Armsguy pulls a rotten meat out of his mouth and eats it again.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_4", "* Armsguy munches on a dirty needle.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_5", "* Armsguy calls the other monsters in the room to&watch him destroy you.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_6", "* Armsguy is punching the air as an attempt to scare you.");
	ds_map_add(global.textdata_en, "battle_main_armsguy_7", "* Armsguy finds a wet sock inside his mouth and throws it away.");
	
	ds_map_add(global.textdata_en, "battle_act_armsguy_1", "Take Slime");
	ds_map_add(global.textdata_en, "battle_act_armsguy_2", "Fake Punch");
	
	ds_map_add(global.textdata_en, "battle_act_result_armsguy_0_0", "* Armsguy - [5 ATK | 4 DEF]^1 &* An alive slime with arms inside a garbage bag.");
	ds_map_add(global.textdata_en, "battle_act_result_armsguy_0_1", "* Likes bodybuilding,^1 strength,^1 arms and slime.");
	ds_map_add(global.textdata_en, "battle_act_result_armsguy_1", "* (You try to take some slime from Armsguy's arms,^1 but he slaps your hand away.)");
	ds_map_add(global.textdata_en, "battle_act_result_armsguy_2", "* (You punch Armsguy's face pretending to use your full strength.)");

	ds_map_add(global.textdata_en, "battle_bubble_armsguy_0", "+F1Let Me Be Slimy.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_1", "+F1Punch Me In The Face.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_2", "+F1Use Your Strength In Me.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_3", "+F1You Are Never Gonna Be Strong As Me.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_4", "+F1You Should Go To The Gym.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_5", "+F1What?^1&\"Leg day\"?");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_6", "+F1I Am Stronger.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_7", "+F1Wanna Break Your Legs?");
	
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_8", "+F1Thank You So Much.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_9", "+F1I Believe In Your Potential.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_10", "+F1You're Good.");
	
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_clean_0", "+F1Hey,^1 Back Off.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_clean_1", "+F1Take Your Hands Off Me.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_clean_2", "+F1Don't Touch&My Arms.");
		
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_punch_0", "+F1Ouch.^1 Keep Going.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_punch_1", "+F1That's How&You Do It.");
	ds_map_add(global.textdata_en, "battle_bubble_armsguy_punch_2", "+F1Congrats,^1 I Loved It.");
	
	// Trashguy battle
	ds_map_add(global.textdata_en, "battle_main_trashguy", "* Trashguy rolled in your way!");
	
	ds_map_add(global.textdata_en, "battle_main_trashguy_0", "* You can hear Trashguy eating old bread.");
	ds_map_add(global.textdata_en, "battle_main_trashguy_1", "* Trashguy takes an rotten egg and throws it away.");
	ds_map_add(global.textdata_en, "battle_main_trashguy_2", "* Trashguy finds a plastic bag with vomit and they drink it.");
	ds_map_add(global.textdata_en, "battle_main_trashguy_3", "* Trashguy is using dirty toilet paper to clean themselves.");
	ds_map_add(global.textdata_en, "battle_main_trashguy_4", "* Trashguy almost falls out of the trashcan.");
	
	ds_map_add(global.textdata_en, "battle_act_trashguy_1", "Empty");
	ds_map_add(global.textdata_en, "battle_act_trashguy_2", "Kick");
	
	ds_map_add(global.textdata_en, "battle_act_result_trashguy_0_0", "* Trashguy - [6 ATK | 7 DEF]^1 &* An mysterious entity living inside a trashcan.");
	ds_map_add(global.textdata_en, "battle_act_result_trashguy_0_1", "* Hates trash and it's smell.^3 &* Too scared to live outside a trashcan.");
	ds_map_add(global.textdata_en, "battle_act_result_trashguy_1_0", "* (You take the trash from Trashguy's trashcan out.)");
	ds_map_add(global.textdata_en, "battle_act_result_trashguy_1_1", "* (Trashguy's trashcan already is empty.)");
	ds_map_add(global.textdata_en, "battle_act_result_trashguy_2", "* (You kick Trashguy's trashcan.)");
	
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_0", "+F1...i can't handle this smell...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_1", "+F1...i just want all this trash to go away...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_2", "+F1...this smell is horrible...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_3", "+F1...i think i'm going to fall over...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_4", "+F1...why do they always put trash in here...?");
	
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_5", "+F1...this is so much better...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_6", "+F1...you're a nice person...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_7", "+F1...you're different from them...");
	
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_8", "+F1...can't you just leave me alone...?");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_9", "+F1...i should've expected this to happen...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_10", "+F1...you're just like them...");
	
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_empty_0", "+F1...thanks...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_empty_1", "+F1...you didn't have to...");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_empty_2", "+F1...you're the best...");
		
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_kick_0", "+F1...but why,^1 though...?");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_kick_1", "+F1...what did i do to you...?");
	ds_map_add(global.textdata_en, "battle_bubble_trashguy_kick_2", "+F1...why are you like this...?");

	// Flitcher battle
	ds_map_add(global.textdata_en, "battle_main_flitcher", "* Flitcher appeared from nowhere.");
	
	ds_map_add(global.textdata_en, "battle_main_flitcher_0", "* Flitcher stares blankly to north and south.");
	ds_map_add(global.textdata_en, "battle_main_flitcher_1", "* Flitcher is moving his tongue unconsciously.");
	ds_map_add(global.textdata_en, "battle_main_flitcher_2", "* Flitcher is daydreaming.");
	ds_map_add(global.textdata_en, "battle_main_flitcher_3", "* Flitcher doesn't really know why he's here.");
	
	ds_map_add(global.textdata_en, "battle_act_flitcher_1", "Talk");
	ds_map_add(global.textdata_en, "battle_act_flitcher_2", "Wave");
	
	ds_map_add(global.textdata_en, "battle_act_result_flitcher_0_0", "* Flitcher - [4 ATK | 6 DEF]^1&* This monster doesn't really know what's happening.");
	ds_map_add(global.textdata_en, "battle_act_result_flitcher_0_1", "* His body is made out of a thin and moist skin,^1 along with scales in some areas.");
	ds_map_add(global.textdata_en, "battle_act_result_flitcher_0_2", "* He hates eye contact and any type of conversation that envolves talking.");
	ds_map_add(global.textdata_en, "battle_act_result_flitcher_1", "* (You talk to Flitcher.)^1&* (He seems scared.)");
	ds_map_add(global.textdata_en, "battle_act_result_flitcher_2", "* (You wave to Flitcher.)^1&* (He seems happy.)");
	
	// Eyecrush battle
	ds_map_add(global.textdata_en, "battle_main_eyecrush", "* Eyecrush crawled into your way!");
	
	ds_map_add(global.textdata_en, "battle_main_eyecrush_0", "* Eyecrush is looking at you.");
	ds_map_add(global.textdata_en, "battle_main_eyecrush_1", "* Eyecrush is focused on your movements.");
	ds_map_add(global.textdata_en, "battle_main_eyecrush_2", "* Eyecrush is happy he has more legs than you.");
	ds_map_add(global.textdata_en, "battle_main_eyecrush_3", "* Eyecrush likes to drink eye drops for breakfast.");
	ds_map_add(global.textdata_en, "battle_main_eyecrush_4", "* Eyecrush has set an unnoficial record for the longest time without blinking.");
	
	ds_map_add(global.textdata_en, "battle_act_eyecrush_1", "Hypnotize");
	ds_map_add(global.textdata_en, "battle_act_eyecrush_2", "Dance");
	
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_0_0", "* Eyecrush - [6 ATK | 0 DEF]^1 &* A big human eye with six red legs.");
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_0_1", "* Their inability to verbally communicate makes difficult&to know their interests.");
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_1_0", "* (You did something mysterious and hypnotized Eyecrush.)");
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_1_1", "* (This effect lasts for one turn.)");
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_2_0", "* (You imitated the movements from a korean music video&you watched.)");
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_2_1_0", "* (Eyecrush is very confused,^1 but liked what you did anyways.)");
	ds_map_add(global.textdata_en, "battle_act_result_eyecrush_2_1_1", "* (Eyecrush couldn't understand what you did due to the hypnotization.)");
	
	// Broken Clock battle
	ds_map_add(global.textdata_en, "battle_main_bc", "* Broken Clock blocks your way!");
	
	ds_map_add(global.textdata_en, "battle_main_bc_0", "* Broken Clock is bursting with electricity.");
	ds_map_add(global.textdata_en, "battle_main_bc_1", "* Broken Clock is flying around the room.");
	ds_map_add(global.textdata_en, "battle_main_bc_2", "* Broken Clock's movements are making you dizzy.");
	ds_map_add(global.textdata_en, "battle_main_bc_3", "* Broken Clock has nothing to lose besides his life.");
	ds_map_add(global.textdata_en, "battle_main_bc_4", "* Broken Clock is breaking laws of time and space.");
	ds_map_add(global.textdata_en, "battle_main_bc_5", "* Even Broken Clock is right twice a day.");
	ds_map_add(global.textdata_en, "battle_main_bc_6", "* Time clearly didn't heal all wounds.");
	ds_map_add(global.textdata_en, "battle_main_bc_7", "* Time flies when you're having fun.");
	ds_map_add(global.textdata_en, "battle_main_bc_8", "* Broken Clock is a broken clock.");
	//ds_map_add(global.textdata_en, "battle_main_bc_", "* Broken Clock is breaking bad.");
	//ds_map_add(global.textdata_en, "battle_main_bc_", "* Broken Clock is clocked in.");
	
	ds_map_add(global.textdata_en, "battle_act_bc_1", "Scream");
	ds_map_add(global.textdata_en, "battle_act_bc_2", "Deal");
	ds_map_add(global.textdata_en, "battle_act_bc_3", "Convince");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_0_0_0", "* Broken Clock - [10 ATK | 6 DEF]^1&* A clock permanently possessed by a ghost.");
	ds_map_add(global.textdata_en, "battle_act_result_bc_0_1_0", "* He's scared and just wants&to survive.");
		//genocide
		//ds_map_add(global.textdata_en, "battle_act_result_bc_0_0_1", ds_map_find_value(global.textdata_en, "battle_act_result_bc_0_0_0"));
		//ds_map_add(global.textdata_en, "battle_act_result_bc_0_1_1", "* He can't fly forever.^1&* He'll probably get tired at some point.");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_1_0_0", "* (You scream for help,^1 hoping someone listens to you...)");
	ds_map_add(global.textdata_en, "battle_act_result_bc_1_1_0", "* (But nobody came.)");
		//genocide
		//ds_map_add(global.textdata_en, "battle_act_result_bc_1_0_1", "* (You cussed Broken Clock...)");
		//ds_map_add(global.textdata_en, "battle_act_result_bc_1_1_1", "* (He laughed.)");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_2_0", "* (You tried to deal your way out,^1 but Broken Clock ignored you completely.)");
		//genocide
		//ds_map_add(global.textdata_en, "battle_act_result_bc_2_1", "* (You threat Broken Clock,^1 but he ignores you completely.)");;
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_0_0", "* (What will you say?)");
		//genocide
		//ds_map_add(global.textdata_en, "battle_act_result_bc_3_0_1", ds_map_find_value(global.textdata_en, "battle_act_result_bc_3_1_0"));
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_0_1_0", "I don't wanna\nhurt you");
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_0_2_0", "You're gonna\nbe okay");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_1_1_0", "I don't know\nwhere I am");
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_1_2_0", "I just wanna\nhelp you");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_2_1_0", "I've never done\nanything to you");
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_2_2_0", "I just wanna\ngo home");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_3_1_0", "I'm sorry");
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_3_2_0", "I know how\nyou're\nfeeling");
	ads
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_4_1_0", "I'm sorry");
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_1_4_2_0", "You're overreacting")
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_2_0", "* (Broken Clock's anger seems to have decreased...)");
	ds_map_add(global.textdata_en, "battle_act_result_bc_3_2_1", "* (Wrong choice...?)");
	
	ds_map_add(global.textdata_en, "battle_act_result_bc_convinced", "* (It just doesn't really matter anymore.)");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_0_0_0", "YOU KNOW WHAT I HATE THE MOST?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_0_1_0", "YOU.^1 HUMANS.^1&ALL OF YOU.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_1_0_0", "HUMANS ARE ALL&THE SAME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_1_1_0", "THEY DON'T CARE ABOUT ANYBODY&OR ANYTHING.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_1_2_0", "ALL THEY WANT IS POWER,^1 MONEY,^1 RECOGNITION,^1 ...^2^1&OR WHATEVER.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_0_0", "LET ME GIVE YOU AN EXAMPLE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_1_0", "TWO NEW MEMBERS CAME IN AND DESTROYED THE CORRIDORS.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_2_0", "AND IF THAT&WASN'T ENOUGH,^1&THEY BROKE ME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_3_0", "WITHOUT ANY REGRET!");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_0_0", "THEN THE LEADERS&OF THIS WORLD ABANDONED THIS PLACE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_1_0", "THE CORRIDORS WERE DESTROYED AND ALMOST USELESS.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_2_0", "ALL THOSE NEW MEMBERS DID WAS&DESTROY PART OF&OUR WORLD!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_3_0", "DO YOU UNDERSTAND WHAT I'M TRYING TO SAY?");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_0_0", "HUMANS CAN BE THE WORST AND THE BEST THINGS THAT HAVE EVER HAPPENED.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_1_0", "BESIDES,^1 THOSE NEW MEMBERS HAD ABSOLUTELY NO REASON WHATSOEVER.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_2_0", "THEY DID ALL THAT JUST FOR THE LOVE OF THE GAME!");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_0_0", "AT THIS RATE,^1 YOU SHOULD KNOW WHY I'M DOING THIS.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_1_0", "YOU'RE A NEW MEMBER,^1 JUST&LIKE THEM.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_2_0", "HOW WOULD I KNOW YOU DIDN'T COME HERE TO KILL ME?");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_0_0", "IN REALITY,^1 I DON'T WANNA KILL YOU.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_1_0", "BUT I ALSO DON'T WANT YOU TAKING AN INNOCENT LIFE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_2_0", "MAY IT MINE OR ANY OTHER MONSTER'S.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_7_0_0", "...");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_0_0", "WHAT?^1 DID YOU REALLY TRY TO&HURT ME?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_1_0", "ARE YOU BLIND?^1&;RYOU CAN'T HIT ME WHILE IM FLYING;D!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_2_0", "NOT WITH THAT&STUPID WEAPON&YOU HAVE.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_0_0", "I'M GONNA BE OKAY?^1&REALLY?^1&HOW DO YOU KNOW?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_0_1", "BECAUSE RIGHT NOW, I'M FAR FROM BEING SLIGHTLY \"OKAY\".");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_1_0", "YOU DON'T WANNA HURT ME?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_1_1", "IF THAT'S TRUE,^1&WHY DO YOU HAVE A WEAPON WITH YOU?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_1_2", "OR IS IT JUST FOR SELF-DEFENSE...?");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_0_0", "AND HOW ARE YOU GOING TO HELP ME,^1 EXACTLY?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_0_1", "YOU'RE A CHILD,^1 FOR FUCK'S SAKE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_0_2", "I REALLY DOUBT THAT YOU CAN&FIX ME.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_1_0", "HOW YOU DON'T KNOW WHERE YOU ARE?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_1_1", "... YOU GOT HERE&BY MISTAKE?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_1_2", "THAT'S...^2 AWFUL.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_0_0", "OH,^1 BUT YOU WILL.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_1_0", "WHAT?^1&THAT'S ALL&YOU WANT?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_1_1", "WELL,^1 THEN I SAY GOOD LUCK.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_1_2", "NOT EVERYBODY IS FRIENDLY,^1 AS YOU CAN SEE.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_0_0", "REALLY?!^1&YOU KNOW HOW I'M FEELING?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_0_1", "THAT'S THE MOST RIDICULOUS SENTENCE I'VE&EVER HEARD.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_0", "I GUESS...^2&I GUESS YOU'RE RIGHT.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_1", "YOU DON'T SEEM TO ACTUALLY WANT TO HURT ME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_2", "IT'S JUST...");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_3", "EVER SINCE THEY BROKE ME,^1 ALL I CAN THINK ABOUT&IS MY DEATH.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_4", "ON HOW ONE DAY SOMEONE WOULD COME TO FINISH THE JOB,^1 OR WHATEVER.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_5", "AND IT'S NOT LIKE I WANT TO KILL YOU,^1 AFTER ALL.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_6", "BUT IF THE THINGS YOU SAID ARE TRUE,^1 THERE'S NO REASON TO KILL YOU.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_7", "I'M GONNA SPARE YOU NOW,^1 ALL RIGHT?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_8", "I'M SORRY ABOUT&ALL THIS.^1&I'M REALLY SORRY.");
	
	/*
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_0_0", "I'M GONNA BE OKAY?^1&REALLY?^1&HOW DO YOU KNOW?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_0_1", "BECAUSE RIGHT NOW I'M FAR FROM BEING SLIGHTLY \"OKAY\".");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_1_0", "YOU DON'T WANNA HURT ME?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_1_1", "IF THAT'S TRUE,^1&WHY DO YOU HAVE A WEAPON WITH YOU?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_0_1_2", "OR IS IT JUST FOR SELF-DEFENSE?");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_0_0", "AND HOW ARE YOU GOING TO HELP ME,^1 EXACTLY?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_0_1", "YOU'RE A CHILD,^1 FOR FUCK'S SAKE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_0_2", "I REALLY DOUBT THAT YOU CAN FIX ME.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_1_0", "HOW YOU DON'T KNOW WHERE YOU ARE?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_1_1", "YOU GOT HERE&BY MISTAKE?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_1_1_2", "THAT'S...^2 AWFUL.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_0_0", "BE MY FRIEND?^1&REALLY?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_0_1", "FRIENDSHIP DOESN'T WORK LIKE THAT.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_0_2", "AND IT'S NOT LIKE I WANT,^1 AFTER ALL.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_1_0", "WHAT?^1&THAT'S ALL&YOU WANT?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_1_1", "WELL,^1 I'D SAY&GOOD LUCK.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_2_1_2", "NOT EVERYBODY IS FRIENDLY,^1 AS YOU CAN SEE.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_0_0", "REALLY?!^1&YOU KNOW HOW I'M FEELING?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_0_1", "THAT'S THE MOST RIDICULOUS SENTENCE I'VE EVER HEARD.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_0", "I GUESS...^2&I GUESS YOU'RE RIGHT.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_1", "YOU DON'T SEEM TO ACTUALLY WANT TO HURT ME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_2", "IT'S JUST...^2 EVER SINCE THEY BROKE ME,^1 ALL I CAN THINK ABOUT IS MY DEATH.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_3", "ON HOW ONE DAY SOMEONE WOULD COME TO FINISH THE JOB,^1 OR WHATEVER.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_4", "AND IT'S NOT LIKE I WANT TO KILL YOU,^1 AFTER ALL.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_5", "BUT IF THE THINGS YOU SAID ARE TRUE,^1 THERE'S NO REASON TO KILL YOU.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_6", "I'M GONNA SPARE YOU NOW,^1 ALL RIGHT?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince_3_1_7", "I'M SORRY ABOUT&ALL THIS.^1&I'M REALLY SORRY.");
	*/

	/*
		// bubble
	ds_map_add(global.textdata_en, "battle_bubble_bc_0_0_0", "YOU KNOW WHAT I HATE THE MOST?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_0_1_0", "YOU.^1 HUMANS.^1&ALL OF YOU.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_1_0_0", "HUMANS ARE ALL&THE SAME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_1_1_0", "THEY DON'T CARE ABOUT ANYBODY&OR ANYTHING.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_1_2_0", "ALL THEY WANT IS POWER,^1 MONEY,^1 RECOGNITION,^1 ...^2^1&OR WHATEVER.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_0_0", "IF I WERE TO GUESS,^1 I'D SAY YOU MUST BE JUST LIKE THEM.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_1_0", "AND IF I'M RIGHT,^1&IT WOULDN'T MAKE SENSE TO SPARE YOU.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_2_0", "YOU WOULD NEVER DO&THE SAME WITH ME.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_0_0", "LET ME GIVE YOU A REAL EXAMPLE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_1_0", "FOUR NEW MEMBERS CAME IN AND DESTROYED THE CORRIDORS.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_2_0", "AND IF THAT&WASN'T ENOUGH,^1&THEY BROKE ME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_3_0", "WITHOUT A LITTLE&OF REGRET!");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_0_0", "THEN THE LEADERS&OF THIS WORLD ABANDONED THIS PLACE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_1_0", "THE CORRIDORS WERE DESTROYED AND ALMOST USELESS.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_2_0", "ALL THOSE NEW MEMBERS DID WAS&TO DESTROY PART&OF OUR WORLD!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_3_0", "AND THEN YOU WANT ME TO SPARE YOU,^1 BUDDY?");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_0_0", "IT JUST WOULDN'T MAKE A LOT OF SENSE,^1 WOULD IT?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_1_0", "YOU SHOULD BE HAPPY I STILL DIDN'T DO THE RIGHT THING.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_2_0", "BECAUSE DIFFERENT FROM YOU,^1 I'M NOT&A PSYCHOPATH.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_0_0", "ACTUALLY,^1 I&HAVE AN IDEA.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_1_0", "I'LL GIVE YOU&A CHANCE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_2_0", "CONVINCE ME TO LET YOU GO.^1 I DARE YOU.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_3_0", "LET'S SEE IF YOU REALLY HAVE SUCH&A PURE SOUL.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_0_0", "WHAT?^1 DID YOU REALLY TRY TO&HURT ME?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_1_0", "ARE YOU BLIND?^1&;RYOU CAN'T HIT ME WHILE IM FLYING;D!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_2_0", "NOT WITH THAT&STUPID WEAPON&YOU HAVE.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince0_0_0", "HELLO?^1&ANYBODY HOME?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince0_1_0", "I JUST SAID YOU CAN TRY TO CONVINCE ME.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince1_0_0", "ARE YOU CRAZY OR JUST PLAIN STUPID?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince1_1_0", "I SAID YOU CAN TRY TO CONVINCE ME.^1 RIGHT NOW.^1&IN ;R[ACT];D.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince1_2_0", "THEN MAYBE I LET YOU GO.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_0_0", "ARE YOU SERIOUS...?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_1_0", "I REALLY THOUGHT YOU WERE LIKE THEM.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_2_0", "AND THAT YOU WANTED TO KILL ME.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_3_0", "WELL...^2&I GUESS I&WAS WRONG.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_4_0", "I'LL SPARE YOU NOW,^1 ALL RIGHT?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_5_0", "I'M SORRY.^1&I'M REALLY SORRY.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_6_0", "AND BY THE WAY,^1 MEE6 IS PROBABLY ALIVE.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_convince2_7_0", "YOU DON'T REALLY HAVE TO WORRY&ABOUT HIM.");
	
		// bubble (geno)
	for (var i = 0; i < 2; i++)
	{
		for (var z = 0; z < 99; z++)
		{
			var _curmsg = ds_map_find_value(global.textdata_en, "battle_bubble_bc_" + string(i) + "_" + string(z) + "_0");
			if (_curmsg != undefined)
				ds_map_add(global.textdata_en, "battle_bubble_bc_" + string(i) + "_" + string(z) + "_1", _curmsg);
		}
	}

	ds_map_add(global.textdata_en, "battle_bubble_bc_2_0_1", "AND YOU ARE THE PERFECT EXAMPLE&OF THEM.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_1_1", "WHY WOULD YOU EVEN DO ALL OF THIS,^1 AFTER ALL?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_2_2_1", "BECAUSE YOU'RE A PSYCHOPATH.^3&THAT'S WHY.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_0_1", "YOU'RE WORST OF ALL OF THEM.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_1_1", "THEY WOULDN'T KILL EVERYBODY JUST TO PLEASE THEMSELVES.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_3_2_1", "BUT EVEN SO,^1&HERE WE ARE.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_0_1", "I GUESS YOU'RE&JUST THAT KIND&OF A FREAK,^1 HUH?");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_1_1", "NOT JUST A FREAK,^1 BUT AN IDIOT TOO.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_2_1", "YOU REALLY THINK THIS WHOLE GENOCIDE THING IS GONNA WORK?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_4_3_1", "THAT'S BECAUSE HAVEN'T MET THE HUMANS OUTSIDE&THIS PLACE.");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_0_1", "YOU STILL HAVE T-TIME TO STOP THIS.^1&YOU REALLY DO.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_1_1", "I CAN JUST FORGET WHAT YOU DID AND LET YOU GO.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_5_2_1", "BUT Y-YOU'RE NOT GONNA DO THAT,^1&ARE YOU?!");

	ds_map_add(global.textdata_en, "battle_bubble_bc_6_0_1", "L-LOOK...^1&I-I DON'T WANT TO KILL TO YOU.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_1_1", "ESPECIALLY I-IF I HAD THE CHANCE TO NOT HAVE T-TO DO IT.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_2_1", "BESIDES,^1 I-I'M TOO MUCH TIRED F-FOR THIS.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_3_1", "SO P-PLEASE,^1 HUMAN.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_4_1", "JUST SPARE ME AND I-I'LL LET YOU GO.");
	ds_map_add(global.textdata_en, "battle_bubble_bc_6_5_1", "NO HARD FEELINGS,^1 RIGHT?");
	
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_0_1", "WHAT?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_1_1", "YOU THOUGHT IT WOULD BE THAT EASY TO KILL ME?!");
	ds_map_add(global.textdata_en, "battle_bubble_bc_fight_2_1", ";RYOU CAN'T HURT ME WHILE I'M FLYING;D,^1 YOU MORON!");
	*/
	
	// Armsguy, Armsguy battle
	ds_map_add(global.textdata_en, "battle_main_armsguy_armsguy", "* A couple of Armsguys jumped in your way!");
	
	// Trashguy, Armsguy battle
	ds_map_add(global.textdata_en, "battle_main_trashguy_armsguy", "* Trashguy rolled in your way!^1&* Armsguy decided to help them!");
	
	// Armsguy, Flitcher battle
	ds_map_add(global.textdata_en, "battle_main_armsguy_flitcher", "* Armsguy jumped in your way!^1&* Flitcher is somehow here too.");
	
	// Eyecrush, Armsguy battle
	ds_map_add(global.textdata_en, "battle_main_eyecrush_armsguy", "* Eyecrush crawled into your way!^1&* Armsguy decided to jump in!");
	
	// Eyecrush, Flitcher battle
	ds_map_add(global.textdata_en, "battle_main_eyecrush_flitcher", "* Eyecrush crawled into your way!^1&* Flitcher thinks one big eye isn't enough.");
	
	// Rhonhey
	ds_map_add(global.textdata_en, "battle_main_rhonhey", "* Rhonhey is ready to&eat you alive.");
	
	ds_map_add(global.textdata_en, "battle_main_rhonhey_0", "* Rhonhey is drooling.");
	ds_map_add(global.textdata_en, "battle_main_rhonhey_1", "* Rhonhey is slowly approaching.");
	ds_map_add(global.textdata_en, "battle_main_rhonhey_2", "* Rhonhey's cousin lives in some famous plumber game.");
	ds_map_add(global.textdata_en, "battle_main_rhonhey_3", "* Rhonhey accidentally crushed an insect with his body.");
	ds_map_add(global.textdata_en, "battle_main_rhonhey_4", "* You can feel the worst smell ever imaginable coming from Rhonhey's mouth.");
	
	ds_map_add(global.textdata_en, "battle_act_rhonhey_1", "Punch");
	ds_map_add(global.textdata_en, "battle_act_rhonhey_2", "Threat");
	ds_map_add(global.textdata_en, "battle_act_rhonhey_3", "Terrorize");
	
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_0", "* Rhonhey - [?? ATK | ?? DEF]^1 &* [No saved information about this enemy.]");
	
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_1_0_0", "* (You punched Rhonhey in the face with all the strength&you had.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_1_0_1_0", "* (Rhonhey is getting uncomfortable around you.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_1_0_1_1", "* (You've made Rhonhey uncomfortable.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_1_1", "* (Punching Rhonhey won't make him any more uncomfortable.)");
	
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_2_0", "* (You tell Rhonhey that you're going to rip one of his eyeballs out.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_2_1", "* (Rhonhey didn't understand&what you said.)^1&* (Nothing happened.)");
	
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_3_0_0", "* (You screamed at the top of your lungs while throwing&rocks at Rhonhey.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_3_0_1_0", "* (Rhonhey is getting miserable around you.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_3_0_1_1", "* (You've made Rhonhey miserable.)");
	ds_map_add(global.textdata_en, "battle_act_result_rhonhey_3_1", "* (Terrorizing Rhonhey won't make him any more miserable.)");
	
	// TrollFake battle
	ds_map_add(global.textdata_en, "battle_main_tfk", "* TrollFake approached you...?");
	
	ds_map_add(global.textdata_en, "battle_main_tfk_0", "* TrollFake is looking at you.");
	ds_map_add(global.textdata_en, "battle_main_tfk_1", "* TrollFake isn't the real one.");
	ds_map_add(global.textdata_en, "battle_main_tfk_2", "* TrollFake whispers compliments to you.");
	ds_map_add(global.textdata_en, "battle_main_tfk_3", "* TrollFake is laughing at his own jokes.");
	ds_map_add(global.textdata_en, "battle_main_tfk_4", "* TrollFake tries to grab your hand,^1 but you back off.");
	ds_map_add(global.textdata_en, "battle_main_tfk_5", "* TrollFake does something explicit and acts like&nothing happened.");

	ds_map_add(global.textdata_en, "battle_act_tfk_1", "Joke");
	ds_map_add(global.textdata_en, "battle_act_tfk_2", "Threat");
	ds_map_add(global.textdata_en, "battle_act_tfk_3", "Compliment");

	ds_map_add(global.textdata_en, "battle_act_result_tfk_0", "* TrollFake - [5 ATK | 7 DEF]^1 &* Not the real one.^3 &* Sent by a greater force.");
	ds_map_add(global.textdata_en, "battle_act_result_tfk_1", "* (You tell the most mediocre joke you could ever think of.)");
	ds_map_add(global.textdata_en, "battle_act_result_tfk_2", "* (You threat TrollFake.)");
	ds_map_add(global.textdata_en, "battle_act_result_tfk_3", "* (You tell TrollFake that he's funny.)");

	ds_map_add(global.textdata_en, "battle_bubble_tfk_0_0", "I Am The REAL One");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_1_0", "Don't Listen&To The News");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_1_1", "It's All Liberal Propaganda");
	//ds_map_add(global.textdata_en, "battle_bubble_tfk_1_1", "Only WhatsApp Chains Say The Truth");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_2_0", "I'm Giving Free Candy");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_2_1", "Just Get Into&My White Van");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_3_0", "Yes,^1 I Am Racist");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_3_1", "I Love Races And Race Cars");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_4_0", "Wanna See My Divorce Selfie");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_5_0", "Who's Watching In " + string(current_year - irandom_range(12, 3)));
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_6_0", "Top 10 Most Epic Anime Battles");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_7_0", "Nobody:\\^1&Literally Nobody:\\^1&Me:\\ *Joke*");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_8_0", "I Also Choose This Guy's Dead Wife");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_9_0", "First");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_10_0", $"{irandom_range(287, 581)} Likes And No Comments?^1 Let's Fix That");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_joke_0", "Take My Damn Upvote");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_joke_1", "I Laughed A Lot Harder Than I Should've");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_joke_2", "Funniest [!&\\$#] I Have Ever Seen");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_threat_0", "I Feel Personally Attacked");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_threat_1", "That's Enough Internet For Today");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_threat_2", "This Had Me In Tears");
	
	ds_map_add(global.textdata_en, "battle_bubble_tfk_compliment_0", "Edit:\\^1 Thank You For The Gold");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_compliment_1", "Like If You Agree");
	ds_map_add(global.textdata_en, "battle_bubble_tfk_compliment_2", "I'm Not Crying,^1&You Are");
	
	// TROLLFACE PRIME
	ds_map_add(global.textdata_en, "battle_main_tfp", "* TROLLFACE PRIME blocked&your way!");
	
	ds_map_add(global.textdata_en, "battle_main_tfp_0", "* Trollface Primin'");
	
	// Sans & Toilet
	ds_map_add(global.textdata_en, "battle_main_toilet", "* A toilet stands in the way.");
	ds_map_add(global.textdata_en, "battle_main_toilet_0", "* A toilet stands in the way.");
}