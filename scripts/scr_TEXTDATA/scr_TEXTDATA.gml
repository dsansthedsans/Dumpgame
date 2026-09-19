function TEXTDATA()
{
	/*
	
	TRADUZIR PARA PORTUGUES::::::::::::FAZER FUNÇÃO COM TRES ARGUMENTOS::::UM TEXT_ID, OS OUTROS DOIS TEXT VALUE (PARA "i++" FUNCIONAR)
	
	
	RAT NPC
	TEXT_SPEED 1
	* Hello.
	* Hello Hello.
	
	WAIT A SECOND, 
	lose track of the time
	bundão
	cabeça oca
	perna frouxa
	*/
	
	global.textdata_en = ds_map_create();
	global.textdata_pt = -1;
	var t = global.textdata_en;
	var i, z;
	// Rooms
	ds_map_add(t, "room_corridors_1",			"Fallen Angel");
	ds_map_add(t, "room_corridors_1_5",			"First Corridor");
	ds_map_add(t, "room_corridors_2",			"MEE6's Desk");
	ds_map_add(t, "room_corridors_3",			"Entrance");
	ds_map_add(t, "room_corridors_3_5",			"Dummy Training");
	ds_map_add(t, "room_corridors_4",			"Dusty Staircase"/*Save*/);
	ds_map_add(t, "room_corridors_5",			"reCAPTCHA: Stage 1/3");
	ds_map_add(t, "room_corridors_5_A",			"reCAPTCHA: Stage 1/3");
	ds_map_add(t, "room_corridors_5_B",			"reCAPTCHA: Stage 1/3");
	ds_map_add(t, "room_corridors_6",			"reCAPTCHA: Stage 1/3");
	ds_map_add(t, "room_corridors_7",			"Break Corridor"); // "Break" references both the broken lamp on the bench and Broken Clock
	ds_map_add(t, "room_corridors_8",			"Infested Staircase"/*Save*/);
	ds_map_add(t, "room_corridors_9",			"reCAPTCHA: Stage 2/3");
	ds_map_add(t, "room_corridors_10",			"reCAPTCHA: Stage 2/3");
	ds_map_add(t, "room_corridors_11",			"Split Corridor"/* Save + Broken Clock*/); // "Split" references Broken Clock's death animation
	ds_map_add(t, "room_corridors_13",			"Bricked Bridge"/*Save*/); // "Bricked" references Broken Clock and his brick attacks, and room_corridors_11's sign; "Bridge" references room_corridors_11's sign
	ds_map_add(t, "room_corridors_14",			"reCAPTCHA: Stage 3/3");
	ds_map_add(t, "room_corridors_17",			"Exit" /*Save*/);
	ds_map_add(t, "room_corridors_18",			"Last Corridor");
	ds_map_add(t, "room_cave_1",				"Rock Bottom");
	ds_map_add(t, "room_cave_2",				"I Really Hope You Like the Darkness Because This Is Just the Beginning (Actually It's the End but Whatever)");
	ds_map_add(t, "room_cave_3",				"Towering Pillars");
	ds_map_add(t, "unused_room_corridors_16_A",	"Cave Entrance");
	ds_map_add(t, "unused_room_corridors_16_B",	"Subway Entrance");
	// Discord Rich Presence & Main Menu
	ds_map_add(t, "drp_description", "A game by dsansthedsans and migel8022");
	ds_map_add(t, "start",	"A game by dsans\nand migel8022");
	ds_map_add(t, "warning", "This game is unaffiliated\nwith Toby Fox.");
	ds_map_add(t, "menu_hidehud", "hold [ALT] to hide menu");
	ds_map_add(t, "menu_0_0",	"Play");
	ds_map_add(t, "menu_0_1",	"Settings");
	i = 2;
	if (global.ACHIEVEMENT_ENABLED == true)
		ds_map_add(t, $"menu_0_{i++}","Achievements");
	ds_map_add(t, $"menu_0_{i++}",	"Credits");
	ds_map_add(t, $"menu_0_{i++}",	"Quit");
	ds_map_add(t, "menu_1_title",	"Choose a File");
	ds_map_add(t, "menu_1_0",		"Back");
	ds_map_add(t, "menu_1_1",		"File 1");
	ds_map_add(t, "menu_1_2",		"File 2");
	ds_map_add(t, "menu_1_3",		"File 3");
	ds_map_add(t, "menu_2_0",		"Back");
	ds_map_add(t, "menu_2_1",		"Controls");
	ds_map_add(t, "menu_2_2",		"Language");
	ds_map_add(t, "menu_2_3",		"Fullscreen");
	ds_map_add(t, "menu_2_4",		"Visual Effects");
	ds_map_add(t, "menu_2_5",		"Master Volume");
	ds_map_add(t, "menu_2_6",		"Music Volume");
	ds_map_add(t, "menu_2_7",		"Sound Volume");
	ds_map_add(t, "menu_2_8",		"Auto-Run");
	ds_map_add(t, "menu_2_9",		"Show FPS");
	ds_map_add(t, "menu_2_10",		"Show Stopwatch");
	i = 11;
	if (global.ACHIEVEMENT_ENABLED == true)
		ds_map_add(t, $"menu_2_{i++}","Hide Notifications");
	ds_map_add(t, $"menu_2_{i++}",		"Enable Discord RPC");
	ds_map_add(t, $"menu_2_{i++}",		"Fast Start");
	ds_map_add(t, "menu_key_2_0",	"No");
	ds_map_add(t, "menu_key_2_1",	"Yes");
	ds_map_add(t, "menu_key_2_3",	"English");
	ds_map_add(t, "menu_3_0", "Back");
	ds_map_add(t, "menu_4_0",		"Back");
	ds_map_add(t, "menu_4_info_0_0",	"--- dsans ---");
	ds_map_add(t, "menu_4_info_0_1",	"Programming, Art, Story, Characters,\nMap, Translation, Itch.io page");
	ds_map_add(t, "menu_4_info_0_2",	"--- migel8022 ---");
	ds_map_add(t, "menu_4_info_0_3",	"Soundtrack, extra sound effects, Broken\nClock's idea and design,\nofficial site");
	ds_map_add(t, "menu_4_info_1_0",	"--- Maari ---");
	ds_map_add(t, "menu_4_info_1_1",	"Armsguy and Trashguy designs");
	ds_map_add(t, "menu_4_info_1_2",	"--- Babakinha ---");
	ds_map_add(t, "menu_4_info_1_3",	"Logo help");
	ds_map_add(t, "menu_4_info_1_4",	"--- Comunista ---");
	ds_map_add(t, "menu_4_info_1_5",	"MEE6's design help");
	ds_map_add(t, "menu_4_info_1_6",	"--- fer10tanb ---");
	ds_map_add(t, "menu_4_info_1_7",	"Broken Clock's concept art");
	ds_map_add(t, "menu_4_info_2_0",	"UNDERTALE and DELTARUNE\nby Toby Fox\n\n\nDiscord bot MEE6\nby Anis Belkacem");
	ds_map_add(t, "menu_5_0", "Back");
	ds_map_add(t, "menu_5_1", "Continue");
	ds_map_add(t, "menu_5_2", "Erase");
	ds_map_add(t, "menu_5_2_erase", "Sure?");
	ds_map_add(t, "menu_6_0",		"Back");
	ds_map_add(t, "menu_6_1",		"Reset Keybinds");
	ds_map_add(t, "menu_6_2",		"* Move Left");
	ds_map_add(t, "menu_6_3",		"* Move Right");
	ds_map_add(t, "menu_6_4",		"* Move Up");
	ds_map_add(t, "menu_6_5",		"* Move Down");
	ds_map_add(t, "menu_6_6",		"* Select");
	ds_map_add(t, "menu_6_7",		"* Select (ALT)");
	ds_map_add(t, "menu_6_8",		"* Unselect");
	ds_map_add(t, "menu_6_9",		"* Unselect (ALT)");
	ds_map_add(t, "menu_6_10",		"* Run");
	ds_map_add(t, "menu_6_11",		"* Run (ALT)");
	ds_map_add(t, "menu_6_12",		"* In-Game Menu");
	ds_map_add(t, "menu_6_13",		"* In-Game Menu (ALT)");
	ds_map_add(t, "menu_6_14",		"* In-Game Pause");
	ds_map_add(t, "menu_6_15",		"* Fullscreen");
	ds_map_add(t, "menu_7_title",		"Enter the name others will see");
	ds_map_add(t, "menu_7_0",			"Back");
	ds_map_add(t, "menu_7_1",			"Write");
	ds_map_add(t, "menu_7_2",			"Done");
	ds_map_add(t, "menu_namer_0",		"Uppercase");
	ds_map_add(t, "menu_namer_1",		"Backspace");
	ds_map_add(t, "menu_namer_2",		"Confirm");
	ds_map_add(t, "menu_namer_f10",	"TYPING MODE ENABLED\nPRESS [F10] TO QUIT");
	ds_map_add(t, $"menu_name_0",		"Dumpgame");
	ds_map_add(t, $"menu_namemsg_0",		"<3");
	ds_map_add(t, $"menu_name_1",		"Fuckgame");
	ds_map_add(t, $"menu_namemsg_1",		"</3");
	ds_map_add(t, $"menu_name_2",		"Carlinhos");
	ds_map_add(t, $"menu_namemsg_2",		"The true name.");
	ds_map_add(t, $"menu_name_3",		"MEE6");
	ds_map_add(t, $"menu_namemsg_3",		"I suggest you choose\na different name.");
	ds_map_add(t, $"menu_name_4",		"Armsguy");
	ds_map_add(t, $"menu_namemsg_4",		"I Know, Me Name Cool.\nBut Not For Ya.");
	ds_map_add(t, $"menu_name_5",		"Trashguy");
	ds_map_add(t, $"menu_namemsg_5",		"...okay, i guess...");
	ds_map_add(t, $"menu_name_6",		"Flitcher");
	ds_map_add(t, $"menu_namemsg_6",		"You make me sick");
	ds_map_add(t, $"menu_name_7",		"Clock");
	ds_map_add(t, $"menu_namemsg_7",		"AND I THOUGHT YOU COULDN'T MAKE IT WORSE.");
	ds_map_add(t, $"menu_name_8",		"Brock");
	ds_map_add(t, $"menu_namemsg_8",		"AND I THOUGHT YOU COULDN'T MAKE IT WORSE.");
	ds_map_add(t, $"menu_name_9",		"BrokenClock");
	ds_map_add(t, $"menu_namemsg_9",		"AND I THOUGHT YOU COULDN'T MAKE IT WORSE.");
	ds_map_add(t, $"menu_name_10",		"BrokenCock");
	ds_map_add(t, $"menu_namemsg_10",		"...WHAT?!?");
	ds_map_add(t, $"menu_name_11",		"CrazyCat");
	ds_map_add(t, $"menu_namemsg_11",		";)");
	ds_map_add(t, $"menu_name_12",		"dsans");
	ds_map_add(t, $"menu_namemsg_12",		"Zero shits given.");
	ds_map_add(t, $"menu_name_13",		"migel");
	ds_map_add(t, $"menu_namemsg_13",		"No Judgement");
	ds_map_add(t, $"menu_name_14",		"migel8022");
	ds_map_add(t, $"menu_namemsg_14",		"No Judgement");
	ds_map_add(t, $"menu_name_15",		"Frisk"); // from "UNDERTALE"
	ds_map_add(t, $"menu_namemsg_15",		"WARNING: This name will make the\ngame ridiculously easier."); // from "UNDERTALE"
	// Achievements (UNUSED)
	var a = 0;
	ds_map_add(t, $"unused_achievement_name_{a}",		"MINI6");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Find the MEE6 toy that's hidden somewhere in the Corridors");
	ds_map_add(t, $"unused_achievement_name_{a}",		"Unbelievable");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Draw a smiley face.");
	ds_map_add(t, $"unused_achievement_name_{a}",		"Fashion Statement");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Get the armor that smells like strawberry");
	ds_map_add(t, $"unused_achievement_name_{a}",		"");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Get a weapon by completing a monster's request");
	ds_map_add(t, $"unused_achievement_name_{a}",		"Local Celebrity");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Spare every monster from the Corridors");
	ds_map_add(t, $"unused_achievement_name_{a}",		"");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Kill Dummy and all monsters in the Corridors before fighting Broken Clock");
	ds_map_add(t, $"unused_achievement_name_{a}",		"Out of Time");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Spare or kill Broken Clock");
	ds_map_add(t, $"unused_achievement_name_{a}",		"");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Complete reCAPTCHA's third stage in under 30 seconds");
	ds_map_add(t, $"unused_achievement_name_{a}",		"Not The Real One");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Battle a monster sent by a greater force");
	ds_map_add(t, $"unused_achievement_name_{a}",		"The Real One");
	ds_map_add(t, $"unused_achievement_desc_{a++}",		"Find and defeat the forgotten creature\nof this world");
	ds_map_add(t, $"unused_achievement_name_{a}",		"");
	ds_map_add(t, $"unused_achievement_desc_{a++}",			"Kill every monster from Caverns before reaching its exit");
	ds_map_add(t, $"unused_achievement_name_{a}",		"A Great Partner");
	ds_map_add(t, $"unused_achievement_desc_{a++}",			"Erase a save file");
	// Opening story
	i = 0;
	ds_map_add(t, $"event_story_{i++}", "Long ago,^1 a group of&!high school students&!made a Discord server."); // "Not long ago" references "Long ago, [...]" from "UNDERTALE"
	ds_map_add(t, $"event_story_{i++}", "Year after year,^1 the&!community grew as new&!members joined the server.\\");
	ds_map_add(t, $"event_story_{i++}", "One day,^1 the owner of the server did someting bazooingas.");
	ds_map_add(t, $"event_story_{i++}", "A few years later..."); // "A few years later" references "Many years later" from "UNDERTALE"
	/*
	ds_map_add(t, "intro_0", "Long ago,^1 three friends had met each other during class.^2");
	ds_map_add(t, "intro_1", "After some time,^1 they decided to create a server in Discord.^2");
	ds_map_add(t, "intro_2", "As the years went by,^1 new members had joined the server.^2");
	ds_map_add(t, "intro_3", "One day,^1 the owner was testing a new Discord feature.^2");
	ds_map_add(t, "intro_4", "But it went very,^1 very wrong.^2^2^2^1");
	ds_map_add(t, "intro_5", "Many years later^2.^2.^2.^2^2^1");
	ds_map_add(t, "intro_6", "FORTALEZA - \\11/14/2022");
	ds_map_add(t, "intro_7", "A brazilian boy was practing soccer in&a football pitch.");
	ds_map_add(t, "intro_8", "By mistake,^1 the ball fell inside a strange dumpster nearby.");
	ds_map_add(t, "intro_9", "When the boy was trying to get the ball,^1 he fell inside the dumpster.");
	ds_map_add(t, "intro_10", "The bottom of the dumpster opened,^1 revealing a giant portal.");
	ds_map_add(t, "intro_11", "The boy fell inside the portal and he was taken to another world.^2");
	*/
	/*
	msg[0] = "Long ago,^1 three friends&!met each other&!during class."; //"Long ago,^1 two races&!ruled over Earth:^1&!HUMANS and MONSTERS."
	msg[1] = "After some time,^1 they&!decided to create a&!server in Discord.";
	msg[2] = "As months went by,^1&!new members joined&!the server.";
	msg[3] = "One day,^1 the server's&!owner was conducting&!experiments in his room.";
	msg[4] = "But it went very,^1&!very wrong.";
	msg[5] = "Many years later^2^3.^2^3.^2^3.";
	msg[6] = "    CEARÁ,^1 BRAZIL";
	msg[7] = "A brazilian boy was&!playing soccer alone&!in a football pitch.";
	msg[8] = "Suddenly,^1 a white flash&!of light came from a&!dumpster nearby.";
	msg[9] = "Curious, the boy approached the&!dumpster to search the&!origin of the light."
	msg[10] = "He was then gone as if&!nothing happened.";
	*/
	/*
	msg[0] = "Long ago,^1 a group of&!three friends created&!a server in Discord.^2^3";
	msg[1] = "As the months went by,^1&!new members joined&!the server.^2^3";
	msg[2] = "One day,^1 the server's&!owner was conducting&!experiments in his room.^2^3";
	msg[3] = "But it all went very,^1&!very wrong.^2^3";
	msg[4] = "Several years later^2^3.^2^3.^2^3.^2^1";
	msg[5] = "        BRAZIL&       2022^2^3";
	msg[6] = "A boy was playing soccer&!alone in a football&!pitch.";
	msg[7] = "Suddenly,^1 a white flash&!of light came from a&!dumpster nearby.";
	msg[8] = "The boy&!slowly approached the dumpster.";
	msg[9] = "He was then gone as if&!nothing had happened.";
	*/
	// Items
	ds_map_add(t, "item_name_none",			"None");
	ds_map_add(t, "item_name_stick",		"Broomstick");
	ds_map_add(t, "item_name_bandage",		"Bandage");
	ds_map_add(t, "item_name_candy",		"Cheap Candy");
	ds_map_add(t, "item_name_bowl",			"Candy Bowl");
	ds_map_add(t, "item_name_choco",		"Chocolate Bar");
	ds_map_add(t, "item_name_trident",		"Enchanted Trident"); // references "Minecraft"
	ds_map_add(t, "item_name_pace",			"Temporary Pacemaker");
	ds_map_add(t, "item_name_brick",		"Concrete Brick");
	ds_map_add(t, "item_name_none_small",			"");
	ds_map_add(t, "item_name_stick_small",			"");
	ds_map_add(t, "item_name_bandage_small",		"");
	ds_map_add(t, "item_name_candy_small",			"Cheap Cndy");
	ds_map_add(t, "item_name_bowl_small",			"");
	ds_map_add(t, "item_name_choco_small",			"Choco Bar");
	ds_map_add(t, "item_name_trident_small",		"Ench Tride");
	ds_map_add(t, "item_name_pace_small",			"Temp Pace");
	ds_map_add(t, "item_name_brick_small",			"Conc Brick");
	ds_map_add(t, "item_name_none_serious",			"");
	ds_map_add(t, "item_name_stick_serious",		"Broom");
	ds_map_add(t, "item_name_bandage_serious",		"");
	ds_map_add(t, "item_name_candy_serious",		"Candy");
	ds_map_add(t, "item_name_bowl_serious",			"Bowl");
	ds_map_add(t, "item_name_choco_serious",		"Chocolate");
	ds_map_add(t, "item_name_trident_serious",		"Trident");
	ds_map_add(t, "item_name_pace_serious",			"Pacemaker");
	ds_map_add(t, "item_name_brick_serious",		"Brick");
	ds_map_add(t, "item_desc_stick",		"* \"Broomstick\" [:R0 ATK;D]^3&* (Feels like it's&about to break.)");
	ds_map_add(t, "item_desc_bandage",		"* \"Bandage\" [:B0 DEF;D]^3&* (There's a drawing of&a blonde woman on it.)"); // references "Barbie"
	ds_map_add(t, "item_desc_candy",		"* \"Cheap Candy\" [:Y+\\7 HP;D]^3&* (:U1/7;D chance to restore additional :YHP;D when eaten.)"); // "+7 HP" and "1/7 chance" references the Brazilian candy "7-Belo"
	ds_map_add(t, "item_desc_bowl",			"* \"Candy Bowl\" [:B3 DEF;D]^3&* (:U1/7;D chance to fully block damage when hurt.)");// "1/7 chance" references the Brazilian candy "7-Belo"
	ds_map_add(t, "item_desc_choco",		"* \"Chocolate Bar\" [:Y+\\14 HP;D]^3&* (Very sticky,^3 but lactose-free.)"); // "+14 HP" is the double of Cheap Candy's "+7 HP", and this item references "Nestlé Classic Duo" (double chocolate bar)
	ds_map_add(t, "item_desc_trident",		"* \"Enchanted Trident\" [:R3 ATK;D]^3&* (Summons a lightning when :RATTACKing;D at the center mark.)"); // references Minecraft's "Trident" item with "Channeling" enchantment;
	ds_map_add(t, "item_desc_pace",			"* \"Temporary Pacemaker\" [:B6 DEF;D]^3&* (Increases the duration of :PINVINCIBILITY FRAMES;D by :U50%;D.)"); // "Temporary" references Broken Clock, but also explains why the player can equip the item without surgery; "Pacemaker" references both Broken Clock and the player's SOUL
	ds_map_add(t, "item_desc_brick",		"* \"Concrete Brick\" [:Y+\\0 HP;D]^3&* (Tasty,^1 delicious,^1 divine.)");
	ds_map_add(t, "item_equip", "* (You equipped ");
	ds_map_add(t, "item_use_0", "* (You used ");
	ds_map_add(t, "item_use_1", "&* (You restored :Y");
	ds_map_add(t, "item_use_2", "&* (Your :YHP;D was maxed out.)");
	i = 0;
	ds_map_add(t, $"item_brick_use_{i}_0", "* (You shoved :YConcrete Brick;D in&your mouth and swallowed&it whole...)");
	ds_map_add(t, $"item_brick_use_{i}_1", "* (You forcefully threw :YConcrete Brick;D against the floor.)");
	i += 1;
	ds_map_add(t, $"item_brick_use_{i}_0", "* (Nothing happened.)");
	ds_map_add(t, $"item_brick_use_{i}_1", "*^4 ?");
	ds_map_add(t, "item_drop_0.0", "* (");
	ds_map_add(t, "item_drop_0.1_0", " was dumped.)");
	ds_map_add(t, "item_drop_0.1_1", " was put away.)");
	ds_map_add(t, "item_drop_0.1_2", " was thrown away.)");
	ds_map_add(t, "item_drop_0.1_3", " was tossed away.)");
	ds_map_add(t, "item_drop_0.1_4", " was kicked out.)");
	ds_map_add(t, "item_drop_0.1_5", " was banned.)");
	ds_map_add(t, "item_drop_0.1_6", " was discarded.)");
	ds_map_add(t, "item_drop_0.1_7", " was evicted.)");
	ds_map_add(t, "item_drop_0.1_8", " was abandoned.)");
	ds_map_add(t, "item_drop_0.1_9", " was forgotten.)");
	ds_map_add(t, "item_pickup", "* (You got :Y");
	ds_map_add(t, "item_cantpickup", "* (You have too many items.)");
	// Worlds
	ds_map_add(t, "world_name_corridors",	"Corridors");
	ds_map_add(t, "world_name_caverns",	"Caverns");
	// Chapters
	ds_map_add(t, "chapter_main", "Chapter");
	ds_map_add(t, "chapter_number_0", "I");
	ds_map_add(t, "chapter_number_1", "II");
	ds_map_add(t, "unused_chapter_number_2", "III");
	ds_map_add(t, "chapter_name_0", "FALLEN ANGEL");
	ds_map_add(t, "chapter_name_1", "ROCK BOTTOM");
	ds_map_add(t, "unused_chapter_name_2", "CIVILIZED CHAOS");
	// Inventory & Pause Menus
	ds_map_add(t, "charamenu_main_info_3", "$");
	ds_map_add(t, "charamenu_item_title_0", "YOUR ITEMS");
	ds_map_add(t, "charamenu_item_title_1", "YOUR STATS");
	ds_map_add(t, "charamenu_item_title_2", "CELLPHONE");
	ds_map_add(t, "charamenu_item_other_0", "USE");
	ds_map_add(t, "charamenu_item_other_1", "INFO");
	ds_map_add(t, "charamenu_item_other_2", "DROP");
	ds_map_add(t, "charamenu_stat_spares", "SPARES");
	ds_map_add(t, "charamenu_stat_kills", "KILLS");
	ds_map_add(t, "charamenu_stat_heals", "HEALS");
	ds_map_add(t, "charamenu_stat_deaths", "DEATHS");
	ds_map_add(t, "charamenu_stat_weapon", "WEAPON");
	ds_map_add(t, "charamenu_stat_armor", "ARMOR");
	ds_map_add(t, "charapause_title", "GAME PAUSED");
	ds_map_add(t, "charapause_0", "Resume");
	ds_map_add(t, "charapause_1", "Main Menu");
	ds_map_add(t, "charapause_2", "Quit Game");
	ds_map_add(t, "charapause_warning_title", "Are you sure?\nUnsaved progress\nwill be ERASED."); // inspired by "ERASE" and "DO NOT" from "UNDERTALE"
	ds_map_add(t, "charapause_warning_0", "No");
	ds_map_add(t, "charapause_warning_1", "Yes");
	// Game Over
	ds_map_add(t, "gameover_0", "TRY AGAIN");
	ds_map_add(t, "gameover_1", "GIVE UP");
	ds_map_add(t, "gameover_skip_0", "press [");
	ds_map_add(t, "gameover_skip_1", " or ");
	ds_map_add(t, "gameover_skip_2", "] to skip");
	// Save Points
	ds_map_add(t, "savepoint_all_0", "* (Your :YHP;D has been&fully restored.)");
	ds_map_add(t, "savepoint_all_1", "");
	ds_map_add(t, "savepoint_all_1_1", "Save");
	ds_map_add(t, "savepoint_all_1_2", "Back");
	ds_map_add(t, "savepoint_all_2", "File saved.");
	// room_corridors_1
	ds_map_add(t, "room_lamp_0","* (It's a lamp.)^1&* (An exotic blue fire is lighting up the room...)");
	ds_map_add(t, "room_lamp_0_geno","* (It's a lamp.)");
	ds_map_add(t, "room_brokenlamp", "* (This lamp appears to have been forcefully thrown&against the floor...)");
	ds_map_add(t, "room_brokenlamp_geno", "* (It's a broken lamp.)");
	// room_corridors_1_5
	ds_map_add(t, "room_rockpile_0_0", "* (It's a pile of rocks.)");
	ds_map_add(t, "room_rockpile_1_0", "* (Oh,^3 my God!^1 It can't be!)^2&* (It's a pile of rocks.)");
	i = 0;
	ds_map_add(t, $"event_rhonhey_battle_0_{i++}", "* My apologies for not interrupting earlier.");
	ds_map_add(t, $"event_rhonhey_battle_0_{i++}", "* I was not expecting&a :Onew member;D to&join the server!");
	ds_map_add(t, $"event_rhonhey_battle_0_{i++}", "* Hmmm...^1&* I assume you did not receive an invite...?");
	ds_map_add(t, $"event_rhonhey_battle_0_{i++}", "* You must be so lost&and confused.^1 Come with me to the next room!"); // inspired by "You must be so lost and confused" from "UNDERTALE"
	ds_map_add(t, $"event_rhonhey_battle_0_{i++}", "* All of your questions will be answered."); // inspired by "Bear with me, Marty, all your questions will be answered" from "Back to the Future" (1985)
	// room_corridors_2
	z = 0;
	i = 0;
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* Hey there,^3 :@@[name];D!");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* Welcome to the :E+F0trashiest+D0;D :@Discord server;D you have ever seen...");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* ");
	z += 1;
	i = 0;
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* My name is :6MEE6;D.^1&* I am a :6ROBOT;D designed&to guide and assist you!");
	ds_map_add(t, $"event_m6_meet_{z}_{i}", "* My mission is to help you not need my help.");
	ds_map_add(t, $"unused_event_m6_meet_{z}_{i}", "* My mission is to help you not need my help.");
	ds_map_add(t, $"unused_event_m6_meet_{z}_{i++}", "* My mission is to fulfill your requests and help you accomplish your goals.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* To begin with,^1 let us analyze the anatomy behind this world.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* :UDumpster Friends;D can be divided into three primary regions\\:");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* The :GCorridors;D,^1 where&:Onew members;D appear and verify their identity.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* The :BCentral City;D,^1 a friendly neighborhood for all members alike."); // "friendly heighborhood" inspired by "Spider-Man: Brand New Day"
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* And the :YAdmin Realm;D,^1 restricted to those&who manage the server.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* If you wish to return to your world,^1 we must reach :YAdmin Realm;D.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* There,^3 we will find the only known exit in :UDumpster Friends;D.");
	i = 0;
	ds_map_add(t, $"event_m6_meet_teachInfo_{i++}", "Corridors");
	ds_map_add(t, $"event_m6_meet_teachInfo_{i++}", "Central\nCity");
	ds_map_add(t, $"event_m6_meet_teachInfo_{i++}", "Admin\nRealm");
	z += 1;
	i = 0;
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* It has been precisely&12 months,^1 23 days,^3&and 6 hours, ..."); // I was born on December (12th month) 23rd, at 6 a.m.
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* ... since the :YAdmins;D publicly declared the :GCorridors;D as abandoned.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* Puzzles I am unable to solve have blocked me from exiting the :GCorridors;D.");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* You,^1 however,^1 may be able to solve them!");
	ds_map_add(t, $"event_m6_meet_{z}_{i++}", "* I strongly believe that .");
	ds_map_add(t, $"unused_event_m6_meet_{z}_{i++}", "* Hey.^1 Look.^1 My system does not understand sarcasm,^1 all right?");
	// My knowledge and your strength together could ease our adventure.
	// 
	/*
	ds_map_add(t, "event_m6_start_1_0", "* Hello,^3 new member.^1&* Welcome to the world&of ;UDumpster Friends;D!");
	ds_map_add(t, "event_m6_start_1_1", "* My name is :6MEE6;D.^1&* I am a :6ROBOT;D made&to help you.");
	ds_map_add(t, "event_m6_start_1_2", "* And as far as I can understand,^1 you probably should not be here.");
	ds_map_add(t, "event_m6_start_1_3", "* We are at :RCORRIDORS;D,^1 a longtime abandoned place in this world.");
	ds_map_add(t, "event_m6_start_1_4", "* Even though there is an exit,^1 it is dangerous for you to get there.");
	ds_map_add(t, "event_m6_start_1_5", "* That is because this place is full of monsters and creatures.");
	ds_map_add(t, "event_m6_start_1_6", "* Besides,^1 :RCORRIDORS;D are full of puzzles&and old mechanisms.");
	ds_map_add(t, "event_m6_start_1_7", "* Those puzzles are what are keeping me trapped in this place.");
	ds_map_add(t, "event_m6_start_1_8", "* When I say that you should not be here,^1 it is all because of that.");
	ds_map_add(t, "event_m6_start_1_9", "* I will not stop you from leaving,^1 but you should know the danger of it.");
	ds_map_add(t, "event_m6_start_1_10", "* Well,^1 I wish you good luck on your adventure.");
	ds_map_add(t, "event_m6_start_1_11", "* Goodbye,^1 new member.");
	ds_map_add(t, "event_m6_start_2_0", "* ... Wait.");
	ds_map_add(t, "event_m6_start_3_0", "* I have an idea.");
	ds_map_add(t, "event_m6_start_3_1", "* If we go together,^1 we could reach the end of :RCORRIDORS;D.");
	ds_map_add(t, "event_m6_start_3_2", "* My knowledge and your strength together could ease our adventure.");
	ds_map_add(t, "event_m6_start_3_3", "* The exit would take us to this world's city,^1 a safe and populated area.");
	ds_map_add(t, "event_m6_start_3_4", "* And from there,^1 you can leave this world.");
	ds_map_add(t, "event_m6_start_3_5", "* So now I ask you,^1&new member.");
	ds_map_add(t, "event_m6_start_3_6", "* May I please follow you in your adventure?");
	ds_map_add(t, "event_m6_start_3_7", "* You are my only chance to leave this place.");
	ds_map_add(t, "event_m6_start_3_8", "* (Let MEE6 come with you?)");
	ds_map_add(t, "event_m6_start_3_8_1", "Yes");
	ds_map_add(t, "event_m6_start_3_8_2", "No");
		ds_map_add(t, "event_m6_start_3_9_1", "* Well,^1 thank you,^1&new member.");
		ds_map_add(t, "event_m6_start_3_10_1", "* I am pleased that you accepted my request.");
			ds_map_add(t, "event_m6_start_3_9_2", "* Hey.^1 Look.^1 My system does not understand sarcasm,^1 all right?");
			ds_map_add(t, "event_m6_start_3_10_2", "* But I am grateful that you accepted my request.");
	ds_map_add(t, "event_m6_start_3_11", "* I will do everything in my power to help you when necessary.");
	ds_map_add(t, "event_m6_start_4_0", "* Now,^1 let us go,^1 we have an adventure to live!");
	
	Hm. I feel that you are uncertain of your current situation.
	You are in Corridors, one of the three main areas of Dumpster Friends.
	This area is where new members complete puzzles to confirm they are suitable to join this world.
	There is a problem, however. Corridors has been abandoned for a long time.
	Even though there is an exit, it is difficult to get there.
	Apart from the fact that there are several puzzles that I cannot solve, ...
	... there are also a large amount of monsters ready to attack.
	And now, I am afraid that you are here stuck with me.
	*/
	i = 0;
	ds_map_add(t, $"unused_event_theguys_meet_0_{i++}", "* Wrap It Up,^1 Shakespear!");
	ds_map_add(t, $"unused_event_theguys_meet_0_{i++}", "* Incoming !!!!!"); // from "Meet the Spy" (2009) by Valve
	i = 0;
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Stop Right There,^1 CowBoy!!!!");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Or Is It CowGirl??^1&* I Can Really Tell!");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* whatever.^1&* \"cowyou\".^1&* it doesnt matter.");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Ya Must Be A New Member!");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Well.^1&* Lucky Ya,^1 We Here!");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Because If It Werent For We...");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "+S1* Dat Blue Head Pain In Da Ass Would Talk For Days!!!!");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "+S3* you should thank us for kicking that guys face.");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Hold Ya Horses!!!^1&* We Forgo To Introduce We!");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* I Am...^2 Da Guy.^1&* Da Real Guy."); // "I'm the guy. The real guy." from "Spy Kids 3-D: Game Over"
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* and im the&other guy.");
	ds_map_add(t, $"unused_event_theguys_meet_1_{i++}", "* Together,^1 We Are...");
	i = 0;
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* ... Da Guys!!!!");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* Dat Right,^1&Fancy Pants!^1&* Da Guys!");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* And Ya Made A Very Bad Mistake!");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* a mistake not even&death can undo.");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* You Invade We Territory!");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* our private,^1&private space.");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* So,^1 In Conclusion ...");
	ds_map_add(t, $"unused_event_theguys_meet_2_{i++}", "* We are going to kill you.");
	ds_map_add(t, "room_m6_banner_0", "* (It's an old banner.)");
	ds_map_add(t, "room_m6_banner_1", "* (The banner depicts MEE6 advertising a product&that you don't know.)");
	ds_map_add(t, "room_m6_poster_0", "* (It's a poster.)");
	ds_map_add(t, "room_m6_poster_1", "* (It says something about MEE6 remembering your birthday.)");
	ds_map_add(t, "room_m6_poster_2", "* (There's also a drawing of&him wearing a birthday hat.)");
	ds_map_add(t, "room_m6_papers_0", "* (It's a pair of&stapled papers.)");
	ds_map_add(t, "room_m6_papers_1", "* (There's a license&agreement in it.)");
	ds_map_add(t, "room_m6_papers_2", "* (You decide not to read.)");
	ds_map_add(t, "room_m6_brokenwall_0", "* (There's an ant-sized toy&of MEE6 inside the crack&of this wall...)"); // from "UNDERTALE"; references a bug where a tiny MEE6 appeared next to the actual MEE6)
	ds_map_add(t, "room_m6_brokenwall_1", "* (Strangely,^1 the toy is depicting MEE6 as a&tall robot.)"); // references MEE6's old design
	// room_corridors_3
	ds_map_add(t, "unused_room_stairssign_0", "* \"Hey!\"^1&* \"It's great to have you here!\"");
	ds_map_add(t, "unused_room_stairssign_1", "* \"Pretty soon you'll be at the city,^3 don't worry.\"^1&* \"This shouldn't take long.\"");
	ds_map_add(t, "unused_room_stairssign_2", "* \"It's kind of a legal thing,^3 you know?\""); // from "Five Nights at Freddy's"
	ds_map_add(t, "unused_room_stairssign_3", "* \"Signed,^1 your local&Dumpster Friend\"");
	ds_map_add(t, "room_rulesbook_0", "* (It's a book titled&\"Server Rules\".)");
	ds_map_add(t, "room_rulesbook_1", "* (Some pages are ripped off and others are full of drawings.)");
	ds_map_add(t, "room_rulesbook_2", "* (There's a pen attached to the pillar with a chain.)");
	ds_map_add(t, "room_rulesbook_3.0", "* (Draw a smiley face?)");
	ds_map_add(t, "room_rulesbook_3.1_0", "* (Draw a ");
	ds_map_add(t, "room_rulesbook_3.1_1", "nd smiley face?)");
	ds_map_add(t, "room_rulesbook_3.1_2", "rd smiley face?)");
	ds_map_add(t, "room_rulesbook_3.1_3", "th smiley face?)");
	ds_map_add(t, "room_rulesbook_3_1", "Yes");
	ds_map_add(t, "room_rulesbook_3_2", "No");
	ds_map_add(t, "room_rulesbook_4.0", "* (You drew a smiley face.)");
	ds_map_add(t, "room_rulesbook_4.1", "* (You drew another&smiley face.)");
	i = 0;
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You feel like you've lived your whole life just for&this moment...)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You feel like you've fulfilled your life purpose...)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You feel like the world has become a better place...)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You feel the smiley faces looking right back at you.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You have become the fastest drawer in the world.)"); // inspired by https://www.youtube.com/watch?v=IqzMUn90tMg
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You show no signs&of stopping.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (MEE6 is visibly confused&by your persistence.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (MEE6 is wondering if he should intervene or not.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (MEE6 would intervene if he wasn't scared of you drawing on his face too.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (MEE6 has begun to question his own life choices.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (MEE6 has grown tired of&you and put himself in&Sleep mode.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (You have successfully given yourself a headache.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (It's a migraine,^3 actually.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (It might be a tumor.)"); // references "Kindergarten Cop" (https://www.youtube.com/watch?v=t_FRWUPcR7Y&t=38s)
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Not only your head hurts,^3&but you can't feel your&hand anymore.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (It's getting progressively harder to draw as your hand loses blood flow.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (\"What am I doing?\",^3 you ask yourself.^1 You couldn't think of an answer.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (\"Why am I doing this?\",^3 you ask yourself.^1 You'd rather not know the answer.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (\"When will I stop?\",^3 you ask yourself.^1 You wish you knew the answer.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Is it because you're bored?)^1&* (Is it because you're crazy?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Is it because it's funny?)^1&* (Is it because you're torturing yourself?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Or is it because you want to see far dialogue goes...?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (It's not worth it,^1 you know.)^1&* (No one will be impressed.)^1&* (Nothing will come from this.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (No one will congratulate you or be proud of you.)^1&* (No one will care.)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Of all things you could do,^3 why would you pick this?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Don't you realize that you're wasting your own time?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Don't you realize that you like to waste your own time?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Don't you realize this was made for those who like to waste their own time?)");
	ds_map_add(t, $"room_rulesbook_5-{i++}", "* (Don't you have anything better to do?)"); // "Don't you have anything better to do?" from "UNDERTALE"
	ds_map_add(t, $"room_rulesbook_6", "* (You tried to draw another smiley face,^1 but the pen ran out of ink...)");
	ds_map_add(t, "room_deadlamp", "* (The flame inside this lamp seems to have gone out...)");
	ds_map_add(t, "room_deadlamp_geno", "* (It's a lamp.)");
	// room_corridors_3_5
	i = 0;
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* An essential component of :UDumpster Friends;D' culture is :VACTIVITIES;D.");
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* An :VACTIVITY;D is a multiplayer game and social experience."); // "Activities are multiplayer games and social experiences [...]" from "Discord Developer Platform"
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* The most relevant :VACTIVITY;D today is :Y[Battle Together];D.");
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* It is crucial that you understand how this :VACTIVITY;D works.");
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* You see,^1 in this world,^1 spontaneous generation is real.");
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* Aggressive beasts commonly arise from non-living matter.");
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* These creatures are wired to submit others to that :VACTIVITY;D.");
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* Therefore,^1 you will need to be prepared for this kind of situation."); // inspired by "You will need to be prepared for this situation" from "UNDERTALE"
	ds_map_add(t, $"event_dummy_battle_0_{i++}", "* Approach the training dummy and subject it&to :Y[Battle Together];D.");
	ds_map_add(t, $"unused_event_dummy_battle_0_{i++}", "* ... similar to how you were assaulted by that snake-like creature.");
	i = 0;
	ds_map_add(t, $"npc_dummy_{i++}", "* (It's a training dummy.)");
	ds_map_add(t, $"npc_dummy_{i}", "* (Battle the dummy?)");
	ds_map_add(t, $"npc_dummy_{i}_1", "Yes");
	ds_map_add(t, $"npc_dummy_{i}_2", "No");
	i = 0;
	ds_map_add(t, $"event_dummy_battle_1_{i++}", "* Excellent work,^3&:Onew member;D!");
	ds_map_add(t, $"event_dummy_battle_1_{i++}", "* It was almost as if you had already played it&somewhere else...!"); // references "UNDERTALE"
	ds_map_add(t, $"event_dummy_battle_1_{i++}", "* Regardless,^1 you are ready to defend yourself in case of danger.");
	ds_map_add(t, $"event_dummy_battle_1_{i++}", "* We may now proceed&with our adventure!"); // inspired by "Let us move to the next room" from "UNDERTALE"
	i = 0;
	ds_map_add(t, $"event_dummy_battle_2_{i++}", "* You may have taken my \"fight back\" statement too literally.");
	ds_map_add(t, $"event_dummy_battle_2_{i++}", "* Nonetheless,^3 you have won :Y[Battle Together];D.^1&* That is what matters.");
	ds_map_add(t, $"event_dummy_battle_2_{i++}", "* Let us proceed with&our adventure!");
	i = 0;
	ds_map_add(t, $"event_dummy_battle_3_{i++}", "* You were not supposed&to :Y[Spare];D it yet.");
	ds_map_add(t, $"event_dummy_battle_3_{i++}", "* Must I remind you to use :U[ITEM];D when necessary?");
	// room_corridors_4
	i = 0;
	ds_map_add(t, $"savepoint_0_{i++}", "* (Seeing dust on the colorless stairs and colorful flowers&in the grass...)\\");
	ds_map_add(t, $"savepoint_0_{i++}", "* (You feel like this is&just the beginning to something big.)");
	ds_map_add(t, $"savepoint_0_{i++}", "* (And that you should've&stayed at home,^3 too.)");
	z = 0;
	i = 0;
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* Yo [name].^3&* Ya A New Member?");
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* Dat Cool.^1&* Me An Armsguy.^1&* Call Me Armsguy.");
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* Why Me Not Fight Ya?^1&* Easy,^1 No Why.");
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* Ya A Kid Bro.^1&* Ya Weak.^1&* Me Stronger Than Ya.");
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* But If Ya Kill,^1 Me Run!");
	z += 1;
	i = 0;
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* Lemme Tell Ya Sumthin Bro."); // inspired by "Let me tell you something, man" from "The Walking Dead"
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* Be Cool With Monsters.^1&* They Hurt Ya Because&They Scared Bro!");
	ds_map_add(t, $"npc_armsguy1_{z}_{i++}", "* If Ya Don Hurt&Em,^1 Ya Cool.");
	// room_corridors_5
	ds_map_add(t, "event_m6_captcha1_0_0", "* This is the door that has trapped me here for all of this time.");
	ds_map_add(t, "event_m6_captcha1_0_1", "* I have never understood the reason behind the puzzles' difficulty.");
	ds_map_add(t, "event_m6_captcha1_0_2", "* Regardless,^1 I believe that you should read the sign next to the door.");
	ds_map_add(t, "event_m6_captcha1_0_3", "* It may help you find the answer to the puzzles!");
	ds_map_add(t, "room_captcha_mainsign_1_0", "* \"reCAPTCHA\\:  Stage 1/3\"");
	ds_map_add(t, "room_captcha_mainsign_1_1", "* \"Before accessing the server,^1 you need to complete a quick verification check.\"");
	ds_map_add(t, "room_captcha_mainsign_1_2", "* \"This helps prevent automated systems from accessing&the platform.\"");
	ds_map_add(t, "room_captcha_mainsign_1_3", "* \"Please solve two simple puzzles to confirm you&are a human.\"");
	i = 0;
	ds_map_add(t, $"event_m6_captcha1_1_{i++}", "* You have solved the puzzles?!");
	ds_map_add(t, $"event_m6_captcha1_1_{i++}", "* I knew you would!^3&* Thank you,^1 :Onew member;D!");
	ds_map_add(t, $"event_m6_captcha1_1_{i++}", "* Unfortunately,^1 there will be more puzzles for you to solve."); //this is not the only door you will have to open
	ds_map_add(t, $"event_m6_captcha1_1_{i++}", "* Nonetheless,^1 let us carry on with our journey!");
	// room_corridors_5_A, room_corridors_5_B
	ds_map_add(t, "room_captcha_guidesign_1_0", "* \"Step on the buttons to&enter what is shown above.\"");
	ds_map_add(t, "room_captcha_guidesign_1_1", "* \"Restart the puzzle by stepping on the 'X' button.\"");
	ds_map_add(t, "room_captcha1_0", "MOTORBIKE");
	ds_map_add(t, "room_captcha1_1", "CELLPHONE");
	ds_map_add(t, "room_captcha1_2", "LIGHTBULB");
	ds_map_add(t, "room_captcha1_3", "CLOWNFISH");
	// room_corridors_6
	ds_map_add(t, "room_candybowl_0_0_0", "* (It's a candy bowl.)");
	ds_map_add(t, "room_candybowl_0_0_1", "^1&* (There ");
	ds_map_add(t, "room_candybowl_0_0_2", "is ");
	ds_map_add(t, "room_candybowl_0_0_3", "are ");
	ds_map_add(t, "room_candybowl_0_0_4", " candy in it.)");
	ds_map_add(t, "room_candybowl_0_0_5", " candies in it.)");
	ds_map_add(t, "room_candybowl_0_1", "* (Take a candy?)");
	ds_map_add(t, "room_candybowl_0_1_1", "Yes");
	ds_map_add(t, "room_candybowl_0_1_2", "No");
	ds_map_add(t, "room_candybowl_0_2", "* (You took a candy.)^3&* (You got :YCheap Candy;D.)");
	ds_map_add(t, "room_candybowl_0_3_0", "* (Press :Y[");
	ds_map_add(t, "room_candybowl_0_3_1", " or ");
	ds_map_add(t, "room_candybowl_0_3_2", "];D to&open your inventory.)");
	ds_map_add(t, "room_candybowl_1_0", "* (It's an empty bowl.)");
	ds_map_add(t, "room_candybowl_1_1", "* (The bowl was full of candy before you took all of it.)");
	ds_map_add(t, "room_candybowl_1_2", "* (By the way,^3 you can take the bowl and use it as armor.)");
	ds_map_add(t, "room_candybowl_1_3", "* (Take the bowl?)");
	ds_map_add(t, "room_candybowl_1_3_1", "Yes");
	ds_map_add(t, "room_candybowl_1_3_2", "No");
	ds_map_add(t, "room_candybowl_1_4", "* (You took the bowl.)^3&* (You got :YCandy Bowl;D.)");
	ds_map_add(t, "room_candybowl_2", "* (Your inventory is full.)");
	ds_map_add(t, "room_candybowl_3_0", "* (It's a small pillar.)");
	ds_map_add(t, "room_candybowl_3_1", "* (The pillar had a candy bowl on it before you took both the candies and the bowl.)");
	ds_map_add(t, "room_candybowl_3_2", "* (By the way,^3 you can take the pillar and use it as...^1 Wait.)^3&* (No,^1 that's wrong.)");
	ds_map_add(t, "room_candybowl_3_3", "* (You can't take the pillar.)^1&* (Sorry!)");
	ds_map_add(t, "room_candysign_0", "* \"Thank you for completing stage one of reCAPTCHA's verification.\"");
	// room_corridors_7
	ds_map_add(t, "room_relaxsign_0", "* \"Hey!\"^1&* \"Getting tired with all the walking and reading?\"");
	ds_map_add(t, "room_relaxsign_1", "* \"Why not take a break?\"^3&* \"Make yourself comfortable!\"");
	ds_map_add(t, "room_relaxsign_2", "* \"Signed,^1 your local&Dumpster Friend\"");
	ds_map_add(t, "room_bench_geno_0", "* (It's a bench.)");
	ds_map_add(t, "room_benchCardboard_0", "* (It's a conveniently-shaped&cardboard cutout.)"); // inspired by "quick, behind that conveniently-shaped lamp" from "UNDERTALE"
	ds_map_add(t, "npc_trashguy_0", "* (It's a normal trash can.)");
	ds_map_add(t, "npc_trashguy_1", "* (Actually,^3 it's a gruesome hungry creature pretending&to be a normal trash can...)");
	ds_map_add(t, "npc_trashguy_2", "* (Life really takes some&wild turns sometimes...!)");
	ds_map_add(t, "room_benchlamp_0", "* (Even a broken lamp needs to take a break sometime...)");
	ds_map_add(t, "room_benchlamp_0_geno", "* (It's a broken lamp.)");
	// room_corridors_8
	i = 0;
	ds_map_add(t, $"savepoint_1_{i++}", "* (Seeing scientifically impossible trees flood the :GCorridors;D with dead leaves...)");
	ds_map_add(t, $"savepoint_1_{i++}", "* (You wonder if this is all just one giant fever dream.)"); // "one giant fever dream" references "DELTARUNE" 
	ds_map_add(t, "room_rat_geno", "* (It's a rat hole.)");
	ds_map_add(t, "npc_armsguy_lost_0_0_0_0", "* Yo Bro,^3 :@@");
	ds_map_add(t, "npc_armsguy_lost_0_0_0_1", ";D.^1&* Ya A New Member Right?");
	ds_map_add(t, "npc_armsguy_lost_0_0_1", "* Me Buddy Is Dumbass!^1&* He Stuck In Capcha 2.^3&* He Need Help.");
	ds_map_add(t, "npc_armsguy_lost_0_0_2", "* Me Give Ya Gift For It.^3&* Very Goo Gift.");
	ds_map_add(t, "npc_armsguy_lost_0_0_3", "* (Do you want to help Armsguy?)");
	ds_map_add(t, "npc_armsguy_lost_0_0_3_1", "Sure");
	ds_map_add(t, "npc_armsguy_lost_0_0_3_2", "No");
	ds_map_add(t, "npc_armsguy_lost_0_1_0", "* Cool.^1 Me Wait Here.");
	ds_map_add(t, "npc_armsguy_lost_0_2_0", "* Eh,^3 Didn Even Need It Anyway.");
	ds_map_add(t, "npc_armsguy_lost_1_0_0", "* Ya Even Know Where It Is Bro?");
	ds_map_add(t, "npc_armsguy_lost_1_0_1", "* It Right Up There.^3&* After Pillar.");
	ds_map_add(t, "npc_armsguy_lost_1_1_0", "* Goo Job Bro.");
	ds_map_add(t, "npc_armsguy_lost_1_1_1", "* Me Said,^3 Me Give Ya Gift.");
	ds_map_add(t, "npc_armsguy_lost_1_1_0__", "* Yo Bro.");
	ds_map_add(t, "npc_armsguy_lost_1_1_1__", "* Ya Helped Me Dumbass Buddy.^3&* Me Give Ya Gift.");
	ds_map_add(t, "npc_armsguy_lost_1_1_2", "* Me Don Know Wat Is,^1 But&Me Found It Around Here.");
	ds_map_add(t, "npc_armsguy_lost_1_1_3", "* Very Weird Thing.");
	ds_map_add(t, "npc_armsguy_lost_1_1_4_0", "* Here.^1&* All Ya.");
	ds_map_add(t, "npc_armsguy_lost_1_1_5_0", "* (You got :YEnchanted Trident;D.)");
	ds_map_add(t, "npc_armsguy_lost_1_1_4_1", "* Ya Have No Space?");
	ds_map_add(t, "npc_armsguy_lost_1_1_5_1", "* Dump Sumthin And Me Give Ya Gift.");
	ds_map_add(t, "npc_armsguy_lost_1_2_0", "* Wat?^3 Didn Like It?^2&* Deal With It");
	ds_map_add(t, "npc_trashguy_lost2", "* ...thanks...");
	// room_corridors_9
	ds_map_add(t, "event_m6_captcha2_0", "* Here comes more extremely difficult puzzles for you.");
	ds_map_add(t, "event_m6_captcha2_1", "* The faster we go,^3&the sooner we leave&this place.");
	ds_map_add(t, "room_captcha_mainsign_2_0", "* \"reCAPTCHA\\:  Stage 2/3\"");
	ds_map_add(t, "room_captcha_mainsign_2_1", "* \"Please solve three puzzles&to confirm you are a human.\"");
	ds_map_add(t, "room_captcha_guidesign_2_0", "* \"Push the box to the 'X'&on the white path.\"");
	ds_map_add(t, "room_captcha_guidesign_1_0", "* \"Enter the name of the image shown above.\"");
	ds_map_add(t, "room_captcha_guidesign_1_1", "* \"Stepping on a button will type its respective letter.\"");
	ds_map_add(t, "room_captcha_guidesign_1_2", "* \"Restart the puzzle by pressing the 'X' button.\"");
	ds_map_add(t, "npc_trashguy_lost1_0", "* ...you solved the puzzle...?");
	ds_map_add(t, "npc_trashguy_lost1_1", "* ...now i can go back and meet my friend...");
	ds_map_add(t, "npc_trashguy_lost1_2", "* ...thank you...");
	ds_map_add(t, "event_m6_postcaptcha2_0", "* How are you able to solve them so easily?!");
	ds_map_add(t, "event_m6_postcaptcha2_1", "* Regardless,^1 let us proceed with our adventure!");
	// room_corridors_10
	ds_map_add(t, "room_chocobowl_0", "* (It's a seriously damaged chocolate bowl.)");
	ds_map_add(t, "room_chocobowl_1", "* (There's only one chocolate left,^1 lying on the floor.)");
	ds_map_add(t, "room_chocobowl_2", "* (Take the chocolate?)");
	ds_map_add(t, "room_chocobowl_2_1", "Yes");
	ds_map_add(t, "room_chocobowl_2_2", "No");
	ds_map_add(t, "room_chocobowl_3_0", "* (You took the chocolate.)^3&* (You got :YChocolate Bar;D.)");
	ds_map_add(t, "room_chocobowl_3_1", "* (Your inventory is full.)");
	ds_map_add(t, "room_chocobowl_4", "* (You already have a&bowl on your head.)");
	ds_map_add(t, "room_chocosign", "* \"          for completing&           f reCAPTCHA's&           n.\"");
	ds_map_add(t, "room_chocosign_geno", "* (The left half of this&sign is missing.)");
	// room_corridors_11
	ds_map_add(t, "room_preclocksign_0", "* \"Hey!\"^1&* \"Don't worry,^3 you're almost there.^3 Just a few rooms away!\"");
	ds_map_add(t, "room_preclocksign_1", "* \"Why not speed up a&bit and finish early?\"^1&* \"Think of it like this\\:\\\"");
	ds_map_add(t, "room_preclocksign_2", "* \"Brick by brick,^3 you make a bridge.^1 In the blink of an eye,^3 you'll save time!\"");
	ds_map_add(t, "room_preclocksign_3", "* \"Does that make sense?\"^1&* \"Don't mind answering,^3&I'm just a sign.\""); // inspired by "does that make sense?" from "UNDERTALE"
	ds_map_add(t, "room_preclocksign_4", "* \"Signed,^1 your local&Dumpster Friend\"");
	i = 0;
	ds_map_add(t, $"savepoint_2_{i++}", "* (hello)");
	i = 0;
	ds_map_add(t, $"unused_genodialog_0_{i++}", "* (You feel the power in your hands...)");
	ds_map_add(t, $"unused_genodialog_0_{i++}", "* (... and the strength crossing through your veins.)");
	ds_map_add(t, $"unused_genodialog_0_{i++}", "* (Your desire to [...])");
	ds_map_add(t, $"unused_genodialog_0_{i++}", "* (But nobody came.)");
	ds_map_add(t, "unused_genofeeling", ";R* (Something tells you that you shouldn't continue yet.)");
	i = 0;
	ds_map_add(t, $"event_brock_battle_0_{i++}", "+F0+S1* DID'YA REALLY THINK&I WOULDN'T SEE YOU?!?");
	ds_map_add(t, $"event_brock_battle_0_{i++}", "+F0+S1* EVEN AFTER EVERYTH()");
	ds_map_add(t, $"event_brock_battle_0_{i++}", "* You are breaking the server's rules,^3 wild clock creature!"); // MEE6 attempts to interrupt Broken Clock the same way he successfully interrupted Rhonhey 
	ds_map_add(t, $"event_brock_battle_0_{i++}", "* You cannot trap us he()");
	var i = 0;
	ds_map_add(t, $"event_brock_battle_1_{i++}", "+F0+S1* SHUT UP!!!!!!!!!!");
	i = 0;
	ds_map_add(t, $"event_brock_battle_2_{i++}", "+F0* So...^2 Where WERE we.^1&* ... HMM,^3 RIGHT!!"); // inspired by "... NOW, WHERE WERE WE? OH YES." and "HMM? So you're ASKIN' me to move over?" from "UNDERTALE"
	ds_map_add(t, $"event_brock_battle_2_{i++}", "+F0+S1* :@@[name];D!!!!!!^1&* DID'YA REALLY THINK I'D JUST LET'YA IGNORE MY EXISTENCE?!?");
	ds_map_add(t, $"event_brock_battle_2_{i++}", "+F0+S1* ABSOLUTELY NO WAY,^1 BUDDY.^3&* NOT AFTER EVERYTHING&YOU HUMANS DID TO ME.");
	ds_map_add(t, $"event_brock_battle_2_{i++}", "+F0+S1* I'VE BEEN COUNTING DOWN&THE SECONDS UNTIL THIS DAY,^1 RIGHT HERE,^3 FOR MONTHS!!!!!!");
	ds_map_add(t, $"event_brock_battle_2_{i++}", "+F0+S1* YOU WOULDN'T WANNA RUIN THIS MOMENT FOR ME,^3 WOULD'YA?!?");
	ds_map_add(t, $"event_brock_battle_2_{i++}", "+F0+S1* TIME TO DIE,^3 LITTLE BUDDY...!"); // inspired by "Time to die" from "Blade Runner"
	i = 0;
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* You...^2 You SPARED me...?");
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* Even after EVERYTHING&I've done to HURT'ya?!?"); // inspired by "After everything I have done to hurt you..." from "UNDERTALE"
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* :@@[name];D...^2&* You shouldn't say&sorry,^1 Y'KNOW...");
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* You REALLY shouldn't.^3^3&* You haven't done&ANYTHING wrong.");
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* But I have,^1 and&I understand if&you hate me."); // inspired by "I understand if you hate me" from "UNDERTALE"
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* There's NO excuse&for how I treat'ya."); // inspired by "There's no excuse for what I've done" from "UNDERTALE"
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* The LEAST I can do&is TRY to make it&up to you."); // inspired by "The least I can do is return them" from "UNDERTALE"
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* You wanna LEAVE&the server,^1 RIGHT?^1&* You could use some help.");
	ds_map_add(t, $"event_brock_battle_3_{i++}", "+F0* Take this.^1&* It's PROBABLY better&than what'ya have there.");
	ds_map_add(t, $"event_brock_battle_3_{i}_1", "* (You got :YTemporary Pacemaker;D.)");
	ds_map_add(t, $"event_brock_battle_3_{i}_0", "+F0* I'll,^1 UH...^2 Leave it in&the brick pile,^1 M'KAY...?"); // inspired by "HMM? So you're ASKIN' me to move over?" from "UNDERTALE"
	ds_map_add(t, $"event_brock_battle_3_{++i}", "+F0* WELL,^2 I've wasted&enough of your time."); // "I've wasted enough of your time" references "waste one's time" idiom
	ds_map_add(t, $"event_brock_battle_3_{++i}", "+F0* Watch your back,^1&little buddy...^1&* ... Sorry for,^1 Y'KNOW..."); // "Watch your back" references a watch, a wristwatch
	i = 0;
	ds_map_add(t, $"event_brock_battle_4_{i++}_0", "* In my opinion,^3 your decision to spare that thing was a mistake.");
	ds_map_add(t, $"event_brock_battle_4_{i++}_0", "* What if it changes its mind and returns to murder us both?");
	ds_map_add(t, $"event_brock_battle_4_{i}_0", "          ");
	ds_map_add(t, $"event_brock_battle_4_{i}_0_1", "Not going\nto happen");
	ds_map_add(t, $"event_brock_battle_4_{i}_0_2", "Sorry");
	ds_map_add(t, $"event_brock_battle_4_{++i}_0", "* ...");
	i = 0;
	ds_map_add(t, $"event_brock_battle_4_{i++}_1", "* I confess I am quite surprised by your fantastic performance!");
	ds_map_add(t, $"event_brock_battle_4_{i++}_1", "* Again,^1 thanks to you,^1&we slowly approach the exit of :GCorridors;D.");
	ds_map_add(t, $"event_brock_battle_4_{i++}_1_geno", "* ...^2 What did you say?^1&* I was not skeptical&of your abilities.");
	ds_map_add(t, $"event_brock_battle_4_{i++}_1_geno", "* You are the one who interpreted it incorrectly.");
	i = 0;
	ds_map_add(t, $"room_trollwall_{i++}", "* (A thick, oily substance is leaking from between the bricks of this wall...)"); // references TROLLFACE's oil attack
	ds_map_add(t, $"room_trollwall_{i++}", "* (It seems irrelevant for now.)");
	// room_corridors_13
	z = 0;
	i = 0;
	ds_map_add(t, $"npc_armsguy_postbrock_{z}_{i++}", "* Ya Da New Member Da&Guys Talk About.");
	ds_map_add(t, $"npc_armsguy_postbrock_{z}_{i++}", "* Me Watch Ya Fight Brock.^3&* Very Epic!");
	ds_map_add(t, $"npc_armsguy_postbrock_{z}_{i++}", "* Me Laugh When Brock&Scare Meeseeks.^1&* Total Clanker.");
	z += 1;
	i = 0;
	ds_map_add(t, $"npc_armsguy_postbrock_{z}_{i++}", "* Brock Is Very Chill.^3&* He A Cool Guy!");
	ds_map_add(t, $"npc_armsguy_postbrock_{z}_{i++}", "* He Got Angry After Da Raid,^1 But He Not Always Angry.");
	ds_map_add(t, $"npc_armsguy_postbrock_{z}_{i++}", "* Why He Angry At Ya?");
	i = 0;
	ds_map_add(t, $"savepoint_3_{i++}", "* (Seeing mythical creatures like muscular slimes and flying clocks...)");
	ds_map_add(t, $"savepoint_3_{i++}", "* (You tell yourself that&it must all just be&a bad dream.)"); // inspired by "It must have all just been a bad dream" from "EarthBound (MOTHER 2)"
	i = 0;
	ds_map_add(t, $"npc_flitcher_postbrock_{i++}", "* (Flitcher is staring into&the abyss,^1 thinking...)^1&* (That is,^3 if it thinks.)");
	ds_map_add(t, $"npc_flitcher_postbrock_{i++}", "* (Perhaps Flitcher is waiting for an answer...)");
	ds_map_add(t, $"npc_flitcher_postbrock_{i++}", "* (Or,^1 perhaps,^1 Flitcher has been carrying the weight&of knowing the answer...)");
	ds_map_add(t, $"npc_flitcher_postbrock_{i++}", "* (...)^4&* (It doesn't really matter.)"); // inspired by "Tra la la. What's my name? ... It doesn't really matter." from "UNDERTALE"
	ds_map_add(t, $"npc_flitcher_postbrock_{i++}_geno", "* (It's a Flitcher.)");
	// room_corridors_14
	ds_map_add(t, "room_captcha_mainsign_3_0", "* \"reCAPTCHA\\:  Stage 3/3\"");
	ds_map_add(t, "room_captcha_mainsign_3_1", "* \"Please solve three puzzles to confirm you are a human.\"");
	ds_map_add(t, "room_captcha_mainsign_3_2", "* \"You have :Rone minute;D&to solve the puzzles.\"");
	ds_map_add(t, "room_captcha_mainsign_3_3", "* \"Pull both levers next&to the door to begin.\"");
	ds_map_add(t, "room_captcha_guidesign_3_3_0", "* \"Activate all plates.\"&* \"Stepping on a plate activates nearby plates.\"");
	ds_map_add(t, "room_captcha_guidesign_3_3_1", "* \"Restart the puzzle by stepping on the 'X' button.\"");
	ds_map_add(t, "room_captcha_endsign_3_0", "* \"Thank you for completing stage three of reCAPTCHA's verification.\"");
	ds_map_add(t, "room_captcha_endsign_3_1", "* \"You are now free to&access the server.\"");
	i = 0;
	ds_map_add(t, $"captcha3_buttonsWord_{i++}", "MISUNDERSTANDING");
	ds_map_add(t, $"captcha3_buttonsWord_{i++}", "INCOMPREHENSIBLE");
	ds_map_add(t, $"captcha3_buttonsWord_{i++}", "RESPONSIBILITIES");
	// room_corridors_17
	i = 0;
	ds_map_add(t, $"savepoint_4_{i++}", "* (Seeing monsters you've met peacefully living their day-to-day lives...)");
	ds_map_add(t, $"savepoint_4_{i++}", "* (You realize this world might not be as weird as you originally thought.)");
	z = 0;
	i = 0;
	ds_map_add(t, $"npc_armsguy_exit_{z}_{i++}", "* Ya Da New Member?^1&* Bro Dat Cool.^3&* Ya Da First Since Da Raid!");
	ds_map_add(t, $"npc_armsguy_exit_{z}_{i++}", "* Sucks You Be Leavin.^1&* Da Exit Right Up There.");
	ds_map_add(t, $"npc_armsguy_exit_{z}_{i++}", "* How Ya Go Through Corridor??^3&* Ya Fly??");
	z += 1;
	i = 0;
	ds_map_add(t, $"npc_armsguy_exit_{z}_{i++}", "* Meeseeks Not Say Of Da Raid??");
	ds_map_add(t, $"npc_armsguy_exit_{z}_{i++}", "* Bro Da Raid Was Nuts!^3&* Da Corridor There&Broken Totally.");
	ds_map_add(t, $"npc_armsguy_exit_{z}_{i++}", "* Da Humans Kill Me Grandma!^1&* But Me Cool Now."); // inspired by "Singing killed my grandma" from "Trolls"
	ds_map_add(t, "npc_trashguy_exit_fishing_0_0", "* ...hi...");
	ds_map_add(t, "npc_trashguy_exit_fishing_0_1", "* ...what...?^1&* ...im not fishing...");
	ds_map_add(t, "npc_trashguy_exit_fishing_0_2", "* ...i was throwing trash down there but i threw something important on accident...");
	ds_map_add(t, "npc_trashguy_exit_fishing_0_3", "* ...now im trying to take it back with a fishing rod...");
	ds_map_add(t, "npc_trashguy_exit_fishing_0_4", "* ...its not working...");
	ds_map_add(t, "npc_trashguy_exit_fishing_1_0", "* ...i think ill&just give up...");
	ds_map_add(t, "npc_armsguy_exit_fishing_0_0", "* Wat Up.^1&* Me Just Waitin This Smartass Here Get Thing Back.");
	ds_map_add(t, "npc_armsguy_exit_fishing_0_1", "* Big Waste Of Time!^3&* How Dat Fall There Anyway!?");
	ds_map_add(t, "npc_armsguy_exit_fishing_0_2", "* ...i already told you&i dont know...");
	ds_map_add(t, "npc_armsguy_exit_fishing_1_0", "* This Intolerable!"); // inspired by "This is intolerable" from "Indiana Jones and the Last Crusade"
	ds_map_add(t, "npc_armsguy_exit_lifting_0_0", "* Me Don Talk Now.^3&* I Gyming.");
	ds_map_add(t, "npc_armsguy_exit_lifting_1_0", "* Me Say Me Don Talk&Now Dumbass!!!");
	ds_map_add(t, "npc_armsguy_exit_lifting_2_0", "* Go Away Bro!!!!!!");
	ds_map_add(t, "npc_armsguy_exit_lifting_3_0", "* I Kill Ya!!!!!!!!!!!!");
	ds_map_add(t, "npc_armsguy_exit_lifting_4_0", "* Ahhhhhh!!!!!!!!!!!!!!!!!!");
	ds_map_add(t, "npc_flitcher_exit_0_0", "* (You wave to Flitcher.)^3&* (It waves back at you.)");
	ds_map_add(t, "npc_flitcher_exit_0_1", "* (How did it wave back if it doesn't even have hands?)");
	ds_map_add(t, "npc_flitcher_exit_0_2", "* (This is one of the weirdest mysteries of All Time.)");
	ds_map_add(t, "npc_flitcher_exit_1_0", "+S3* Kill^2 me,^4 please...!");
	ds_map_add(t, "unused_npc_flitcher_exit_1_0", "* I^4 am^4 deeply disgusted^4 by^4&your existence.^4&* Do^4 me a^4 favor^4^4 and^4^4^4^4 die.");
	ds_map_add(t, "npc_flitcher_exit_geno_0", "* (It's a Flitcher.)");
	ds_map_add(t, "room_corridors_17_egg.0", "* (It's an egg.)");
	ds_map_add(t, "room_corridors_17_egg.1", "* (It's unclear why there's&an egg beside the tree.)"); // from "DELTARUNE"
	// room_corridors_18
	ds_map_add(t, "room_corridors_18_sign.0", "* \"New member,^1 you are at&the Corridors' edge.\"");
	ds_map_add(t, "room_corridors_18_sign.1", "* \"Soon you'll be at the&Central City,^1 the home&of members like you.\"");
	ds_map_add(t, "room_corridors_18_sign.2", "* \"But,^1 before that,^1 there's one&last thing you have to do.\"");
	ds_map_add(t, "room_corridors_18_sign.3", "* \"Face your last challenge before leaving this place.\"");
	ds_map_add(t, "room_corridors_18_sign.4", "* \"Prove yourself worthy&by walking through this unnecessarily long corridor.\"");
	ds_map_add(t, "room_corridors_18_sign.5", "* \"Jokes aside,^1 we're sorry.\"^1&* \"Someone's REALLY bad&at urban planning.\"");
	ds_map_add(t, "room_corridors_18_sign.6", "* \"Signed,^1 your local&Dumpster Friend\"");
	ds_map_add(t, "event_gabee_chase.0.0", "* This is it.");
	ds_map_add(t, "event_gabee_chase.0.1", "* The exit is at the end of this corridor.");
	ds_map_add(t, "event_gabee_chase.0.2", "* Before we continue,^1 I have a question for you.");
	ds_map_add(t, "event_gabee_chase.0.3", "* You do remember how :Y[Battle Together];D&works,^2 correct?");
	ds_map_add(t, "event_gabee_chase.0.4", "* ...");
	ds_map_add(t, "event_gabee_chase.0.5", "* ...^3 No!^1 Nothing!^2&* I was curious,^1&that is all.");
	ds_map_add(t, "event_gabee_chase.0.6_geno", "* ...^2 Excuse me?^1&* I have no reason&to lie to you.");
	ds_map_add(t, "event_gabee_chase.0.7_geno", "* Would you mind treating me with more respect?");
	ds_map_add(t, "event_gabee_chase.1.0", "* I confess.");
	ds_map_add(t, "event_gabee_chase.1.1", "* I lied.");
	ds_map_add(t, "event_gabee_chase.1.2", "* There is a reason I questioned your memory.");
	ds_map_add(t, "event_gabee_chase.1.3", "* You see,^1 I may have not been as hone()");
	i = 0;
	ds_map_add(t, $"unused_event_gabee_chase.3.{i++}", "* (You hear a distant voice.)"); // "You hear a distant voice" from "UNDERTALE"
	ds_map_add(t, $"unused_event_gabee_chase.3.{i++}", "* ele ta ali^1&* ta vendo?");
	ds_map_add(t, $"unused_event_gabee_chase.3.{i++}", "* tu acha q ele morreu?");
	ds_map_add(t, $"unused_event_gabee_chase.3.{i++}", "* ...");
	// room_cave_1
	ds_map_add(t, $"room_leafbed_0", "* (Dead leaves.)^3&* (They must have&broken your fall.)"); // "Golden flowers. They must have broken your fall." from "UNDERTALE"
	// room_cave_2
	i = 0;
	ds_map_add(t, $"cellphone_developer_{i++}", "* (Ring,^1 ring...)");
	ds_map_add(t, $"cellphone_developer_{i++}", "* (It's a voice you have&never heard before.)"); // "It's a voice you have never heard before" from "UNDERTALE"
	ds_map_add(t, $"cellphone_developer_{i++}", "* Hey.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* It must be obvious by now&that I like UNDERTALE.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* But it's more than&that,^1 really.^1&* Way more than that.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* I might've never gotten better at drawing without UNDERTALE.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* I probably would've never gotten into programming without UNDERTALE.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* I definitely would've never even thought of making music without UNDERTALE.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* Basically,^1 I'd have a completely different life and personality without UNDERTALE.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* It's weird,^1 isn't it?");
	ds_map_add(t, $"cellphone_developer_{i++}", "* Knowing someone you've never met,^1 and most certainly never will,^1 has changed you forever.");
	ds_map_add(t, $"cellphone_developer_{i++}", "* In a good way,^3 of course!");
	ds_map_add(t, $"cellphone_developer_{i++}", "* ...");
	ds_map_add(t, $"cellphone_developer_{i++}", "* I just wanted to say...");
	ds_map_add(t, $"cellphone_developer_{i++}", "* You made a snowman&really happy...!"); // from "UNDERTALE"
	ds_map_add(t, $"cellphone_developer_{i++}", "* (Click...)");
	// room_cave_3
	ds_map_add(t, "room_cave_3_npc_armsguy.0.0", "* Ahh!^3 Ya Here Too!");
	ds_map_add(t, "room_cave_3_npc_armsguy.0.1", "* Look Like Me Not Da&Only Dat Try Jump!^3&* Mweheheh!!");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.0", "* If Me Was Lil Closer To Hole,^1 Me Jump To Other Side.");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.1", "* But Ya??^3&* Ya A Human Yes?^1&* Ya Very Weak!");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.2", "* Ya Dumbass Too??");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.2.1", "Yeah");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.2.2", "Not really");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.3.1", "* ...^4^4&* ...^4^4&* ... OK");
	ds_map_add(t, "room_cave_3_npc_armsguy.1.3.2", "* Mweheheheh!!^1 Dat Funny!^1&* Ya Dumbass Yes,^3 Dumbass.^1&* Go Dumbass Away.");
	i = 0;
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (An electrical border is blocking the path.)");
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (You feel like this is the end to some sort of \"demo\"...)");
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (... and that a \"full game\" has been canceled,^3 too...?)");
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (Such strange feelings...)^1&* (What could they mean...?)");
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (Suddenly,^3 your mouth starts moving by itself as if it&was trying to speak.)");
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (Could it be an attempt&at communication from a supernatural entity...?)");
	ds_map_add(t, $"room_cave_3_border.{i++}", "* (You muttered...^2&\"Thanks for playing\".)");
	// room_cave_X
	ds_map_add(t, "unused_genodialog_1_0", "* (Just as before,^1 the sound of emptiness arrives yet again.)");
	ds_map_add(t, "unused_genodialog_1_1", "* (Your strength and patience )");
	ds_map_add(t, "unused_genodialog_1_1", "* (However,^1 your urge is far to being fulfilled.)");
	ds_map_add(t, "unused_genodialog_1_1", "* (But nobody came.)");
	// Battle system
	ds_map_add(t, "battle_main_sparing_0_0", " is sparing you.");
	ds_map_add(t, "battle_main_sparing_0_1", " is tired of you.");
	ds_map_add(t, "unused_battle_main_sparing_0_2", " is hypnotized.");
	ds_map_add(t, "battle_main_sparing_0_3", " has given up&on eating you.");
	ds_map_add(t, "battle_main_sparing_0_4", " is staring&at the floor in silence.");
	ds_map_add(t, "battle_main_sparing_0_5", " is distracted.");
	ds_map_add(t, "battle_main_sparing_1_0", " and ");
	ds_map_add(t, "battle_main_sparing_1_1", " are sparing you.");
	ds_map_add(t, "battle_fight_0", "MISS");
	ds_map_add(t, "battle_fight_1", "BLOCK");
	ds_map_add(t, "battle_act_0", "Check");
	ds_map_add(t, "battle_mercy_0", "Spare");
	ds_map_add(t, "battle_mercy_1", "Flee");
	ds_map_add(t, "battle_won_0", "* (YOU WON!)^1&* (You earned :Y");
	ds_map_add(t, "battle_won_1", " EXP;D and :U$");
	ds_map_add(t, "battle_won_2", "^1&* (Your :YLVL;D increased.)");
	i = 0;
	ds_map_add(t, $"battle_flee_{i++}", "* Waddle waddle."); // from "The Duck Song"
	ds_map_add(t, $"battle_flee_{i++}", "* I'll kill you."); // from "The Office"
	ds_map_add(t, $"battle_flee_{i++}", "* Happy go to hell."); // from "House M.D."
	ds_map_add(t, $"battle_flee_{i++}", "* I have places to go."); // from "UNDERTALE"
	ds_map_add(t, $"battle_flee_{i++}", "* I hope you die in a fire."); // from Living Tombstone's "Five Nights at Freddy's 3 Song"
	ds_map_add(t, $"battle_flee_{i++}", "* I'm too old for this shit."); // from "Lethal Weapon"
	ds_map_add(t, $"battle_flee_{i++}", "* I'm not falling&   for that shit."); // from "UNDERTALE" meme
	ds_map_add(t, $"battle_flee_{i++}", "* Screw you guys,&   I'm going home."); // from "South Park"
	ds_map_add(t, $"battle_flee_{i++}", "* I have to return&   some videotapes."); // from "American Psycho"
	ds_map_add(t, $"battle_flee_{i++}", "* I'll follow you home&   and kill your dog."); // from "Postal 2"
	ds_map_add(t, $"battle_flee_{i++}", "* Maybe later.");
	ds_map_add(t, $"battle_flee_{i++}", "* Worst regards.");
	ds_map_add(t, $"battle_flee_{i++}", "* Good riddance.");
	ds_map_add(t, $"battle_flee_{i++}", "* Hasta la vista.");
	ds_map_add(t, $"battle_flee_{i++}", "* Try again later.");
	ds_map_add(t, $"battle_flee_{i++}", "* Not in the mood.");
	ds_map_add(t, $"battle_flee_{i++}", "* Nice to meet you.");
	ds_map_add(t, $"battle_flee_{i++}", "* Zero shits given.");
	ds_map_add(t, $"battle_flee_{i++}", "* Bother someone else.");
	ds_map_add(t, $"battle_flee_{i++}", "* I'm busy, apparently.");
	ds_map_add(t, $"battle_flee_{i++}", "* See you later, alligator.");
	ds_map_add(t, $"battle_flee_{i++}", "* I'll send you a postcard.");
	ds_map_add(t, $"battle_flee_{i++}", "* We should grab&   coffee sometime.");
	ds_map_add(t, $"battle_flee_{i++}", "* Leave a message&   after the tone.");
	ds_map_add(t, $"unused_battle_flee_{i++}", "* I've got better stuff to do."); // from "UNDERTALE"
	ds_map_add(t, $"unused_battle_flee_{i++}", "* Don't slow me down."); // from "UNDERTALE"
	ds_map_add(t, $"unused_battle_flee_{i++}", "* I'm outta here."); // from "UNDERTALE"
	ds_map_add(t, $"battle_flee_geno", "+S3* In my way."); // from "UNDERTALE"
	ds_map_add(t, "battle_nobody", "* But nobody came."); // from "UNDERTALE"
	// TESTGUY's battle
	ds_map_add(t, "battle_main_test", "* (Ugh...^1 That TESTGUY again?!)");
	i = 0;
	ds_map_add(t, $"battle_main_test_{i++}", "* (You feel TESTGUY crawling on your back.)"); // from "UNDERTALE"
	ds_map_add(t, $"battle_main_test_{i++}", "* (TESTGUY is just standing there...^1 menacingly.)"); // from "SpongeBob SquarePants"
	ds_map_add(t, $"battle_main_test_{i++}", "* (TESTGUY's grin is shining.)");
	ds_map_add(t, $"battle_main_test_{i++}", "* (TESTGUY is singing a beautiful song about slavery.)"); // I have NO IDEA of the meaning of this line I wrote in 2023 or whatever. What the fuck is this referencing.
	ds_map_add(t, $"battle_main_test_{i++}", "* (TESTGUY does something.)^4&* (Something...^2 testable.)");
	ds_map_add(t, "battle_act_result_test_0_0", "* \"TESTGUY\" [:R0 ATK;D | :B0 DEF;D]^3&* (Likes to be tested on.)^1&* (Or not,^3 I don't really care.)");
	ds_map_add(t, "battle_act_result_test_1_0", "* Hello Mr. Jippity");
	ds_map_add(t, "battle_act_result_test_1_1", "GET OUT ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !");
	ds_map_add(t, "battle_act_result_test_1_2", "* Sorry...");
	ds_map_add(t, $"battle_bubble_test_0_0", "Hello there");
	i = 0;
	ds_map_add(t, $"battle_bubble_test_1_{i++}", "Is everything working properly?");
	ds_map_add(t, $"battle_bubble_test_1_{i++}", "... Yeah?^1 Wow.^1 Thanks");
	i = 0;
	ds_map_add(t, $"battle_bubble_test_2_{i++}", "You know what I love the most?");
	ds_map_add(t, $"battle_bubble_test_2_{i++}", "You.^1&Humans.^1&All of you.");
	// Dummy's battle
	z = 0;
	i = 0;
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* There you go!^1&* Now we may begin&our lesson.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Have you noticed the :Ufour buttons;D at the bottom of the menu?");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* You can use them&to interact with&the enemies.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Try :RATTACKing;D the dummy through the leftmost button :U[FIGHT];D.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Following your strike,^1 the opponent's turn&will initiate.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* You will be forced to,^3 once again,^1 helplessly dodge its attacks.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* MEE6 wants you to use \\:U[FIGHT];D.");
	z += 2;
	i = 0;
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* That was great!");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* :RATTACKing;D your opponents to death is one route to win :Y[Battle Together];D..."); // references the Genocide route
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* ... though not&the only one.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Another method is through friendly conversation."); // "[...] strike up a friendly conversation" from "UNDERTALE"
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Within the :U[ACT];D button,^1 you can :Y[Check];D an enemy of your choice.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* The :Y[Check];D option provides more details about the chosen enemy.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Simply put,^1 it is easier for it to like you if you know what it likes.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* MEE6 wants you to use :Y[Check];D.\\");
	z += 2;
	i = 0;
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Thanks to :Y[Check];D,^1 you may know enough about Dummy to :U[ACT];D properly.\\");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Choose an option within :U[ACT];D that reflects Dummy's interests.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* MEE6 wants you to use :Y[???];D.");
	z += 2;
	i = 0;
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* There you go!^1&* The opponent's name&is now :Yyellow;D.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* This means you can :Y[Spare];D that enemy and&win :Y[Battle Together];D!\\");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Prior to that,^1 it is essential that I tell you about :U[ITEM];D.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* The :U[ITEM];D button permits\\&you to equip or consume items mid-game.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Due to your :YINVENTORY;D being empty,^1 the button is unavailable for use.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* I,^1 however,^1 can&concede you&an item.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* (MEE6 picks up and&hands you a brick.)^3&* (You got :YConcrete Brick;D.)");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Proceed with&interacting with&the brick through :U[ITEM];D.\\");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* MEE6 wants you to use :U[ITEM];D.");
	z += 2;
	i = 0;
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Splendid!^1&* Our lesson is complete."); // inspired by "Splendid! I am proud of you, little one." from "UNDERTALE"
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* Head to the rightmost button :U[MERCY];D and :Y[Spare];D Dummy.");
	ds_map_add(t, $"battle_main_dummy_{z}_{i++}", "* MEE6 wants you to use :Y[Spare];D.");
	ds_map_add(t, "battle_enemyname_dummy", "Dummy");
	ds_map_add(t, "battle_act_dummy_1", "Talk");
	ds_map_add(t, "battle_act_dummy_2", "Scream");
	ds_map_add(t, "battle_act_result_dummy_0_0", "* \"Dummy\" [:R0 ATK;D | :B0 DEF;D]^3&* (A training dummy made&to look like a cat.)");
	ds_map_add(t, "battle_act_result_dummy_0_1", "* (Her body is made out of&cloth and artificial fur.)");
	ds_map_add(t, "battle_act_result_dummy_0_2", "* (Even though she don't have much to say,^1 she's a great listener.)");
	ds_map_add(t, "battle_act_result_dummy_1_0", "* (You try to talk with Dummy,^1 but you can't think of any&conversation topics...)"); // from "UNDERTALE"
	ds_map_add(t, "battle_act_result_dummy_1_1_0_0", "* (You have a passing conversation about&");
	ds_map_add(t, "battle_act_result_dummy_1_1_0_1_0", "cats");
	ds_map_add(t, "battle_act_result_dummy_1_1_0_1_1", "dogs");
	ds_map_add(t, "battle_act_result_dummy_1_1_0_1_2", "birds");
	ds_map_add(t, "battle_act_result_dummy_1_1_0_1_3", "bees");
	ds_map_add(t, "battle_act_result_dummy_1_1_0_2", " with Dummy.)");
	ds_map_add(t, "battle_act_result_dummy_1_1_1", "* (The blush on her face&seems to get redder...)^3&* (Dummy's :YMERCY;D up :U100%;D!)");
	ds_map_add(t, "battle_act_result_dummy_2_0", "* (You loudly scream&to Dummy's face.)");
	ds_map_add(t, "battle_act_result_dummy_2_1", "* (Tears flow down&out of her eyes.)");
	i = 0;
	ds_map_add(t, $"battle_act_result_dummy_2_2_{i++}", "* That was the&wrong option.");
	ds_map_add(t, $"battle_act_result_dummy_2_2_{i++}", "* You are an \"interesting\" individual."); // inspired by "You are an... 'interesting' child." from "UNDERTALE"
	ds_map_add(t, $"battle_act_result_dummy_2_2_{i++}", "* I knew your kind was&excessive,^1 but nothing near this.");
	ds_map_add(t, $"battle_act_result_dummy_2_2_{i++}", "* Out of curiosity,^1 were you ever dropped on your head as an infant?");
	ds_map_add(t, $"battle_act_result_dummy_2_2_{i++}", "* ...");
	i = 0;
	ds_map_add(t, $"battle_bubble_m6_dummy_0_{i++}", "When you were tortured by that terrible creature, ..."); // inspired by "What a terrible creature, torturing such a poor, innocent youth" from "UNDERTALE"
	ds_map_add(t, $"battle_bubble_m6_dummy_0_{i++}", "... your only option was to dodge its attacks.");
	ds_map_add(t, $"battle_bubble_m6_dummy_0_{i++}", "I will concede you the ;@@Member;D role,^1 which permits you to fight back.");
	ds_map_add(t, $"battle_bubble_m6_dummy_0_{i++}", "Hold on a moment.");
	// Armsguy's battle
	ds_map_add(t, "battle_main_armsguy", "* (Armsguy jumps in your way!)");
	ds_map_add(t, "battle_main_armsguy_geno", "* (You step into Armsguy's way.)");
	i = 0;
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy flexes his arms&too hard and pukes.)");
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy drinks his own sweat and realizes it isn't sweat.)");
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy kisses his own arm and gets slime around his mouth.)");
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy finds a wet sock inside his mouth and&throws it away.)");
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy pulls rotten&meat out of his mouth&and eats it again.)");
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy is munching&on a dirty needle.)"); // by Mawri
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy is punching the air in an attempt to intimidate you.)");
	ds_map_add(t, $"battle_main_armsguy_{i++}", "* (Armsguy is calling the other monsters in the room to watch him destroy you.)");
	ds_map_add(t, "battle_act_armsguy_1", "Touch Arms");
	ds_map_add(t, "unused_battle_act_armsguy_1", "Take Slime");
	ds_map_add(t, "battle_act_armsguy_2", "Fake Punch"); // "Fake Attack" from "UNDERTALE"
	i = 0;
	ds_map_add(t, $"battle_act_result_armsguy_0_{i++}", "* \"Armsguy\" [:R5 ATK;D | :B4 DEF;D]^3&* (A slime with arms who came&to life inside a trash bag.)");
	ds_map_add(t, $"battle_act_result_armsguy_0_{i++}", "* (He's obsessed with his own arms and can't accept being weaker than you.)");
	ds_map_add(t, $"battle_act_result_armsguy_0_{i++}", "* (He's also a masochist...?)");
	ds_map_add(t, $"unused_battle_act_result_armsguy_0_{i++}", "* (He likes bodybuilding,^3 strength,^3 arms and slime.)");
	ds_map_add(t, "battle_act_result_armsguy_1_0", "* (You try to take some slime from Armsguy's arms,^3 but he slaps your hand away...)");
	ds_map_add(t, "battle_act_result_armsguy_1_1", "* (Armsguy's :YMERCY;D down :R100%;D.)");
	ds_map_add(t, "battle_act_result_armsguy_2_0", "* (You punch Armsguy's face pretending to use your&full strength...)");
	ds_map_add(t, "battle_act_result_armsguy_2_1", "* (Armsguy's :YMERCY;D up :U100%;D!)");
	ds_map_add(t, "battle_bubble_armsguy_0", "+F1Lemme Be Slimy.");
	ds_map_add(t, "battle_bubble_armsguy_1", "+F1Punch Me In Da Face!");
	ds_map_add(t, "battle_bubble_armsguy_2", "+F1Use Ya Strength In Me!");
	ds_map_add(t, "battle_bubble_armsguy_3", "+F1Ya Never Be Strong Like Me.");
	ds_map_add(t, "battle_bubble_armsguy_4", "+F1Bro Ya Gotta Go To Da Gym.");
	ds_map_add(t, "battle_bubble_armsguy_5", "+F1... Wat?^1&\"Leg Day\"?");
	ds_map_add(t, "battle_bubble_armsguy_6", "+F1Me Stronger Than Ya.");
	ds_map_add(t, "battle_bubble_armsguy_7", "+F1Want Break Ya Legs?");
	ds_map_add(t, "battle_bubble_armsguy_8", "+F1Goo Job Bro.");
	ds_map_add(t, "battle_bubble_armsguy_9", "+F1Me Believe In Ya Potential.");
	ds_map_add(t, "battle_bubble_armsguy_10", "+F1That How Ya Do It.");
	ds_map_add(t, "battle_bubble_armsguy_11", "+F1Make Like Tree And Go Outta Here."); // from "Back to the Future Part II"
	ds_map_add(t, "battle_bubble_armsguy_12", "+F1Hit Da Road,^1 Jackass."); // from "Hit the Road Jack"
	ds_map_add(t, "battle_bubble_armsguy_13", "+F1I Kill Ya.");
	ds_map_add(t, "battle_bubble_armsguy_clean_0", "+F1Back Off Dumbass!!!!");
	ds_map_add(t, "battle_bubble_armsguy_clean_1", "+F1Take Ya Hands Off Me Arms!!!!");
	ds_map_add(t, "battle_bubble_armsguy_clean_2", "+F1Don Touch Me Arms!!!!");
	ds_map_add(t, "battle_bubble_armsguy_punch_0", "+F1Ouch!!^1 Keep Going.");
	ds_map_add(t, "battle_bubble_armsguy_punch_1", "+F1Mweheheh!!^1 Me Like It!");
	ds_map_add(t, "battle_bubble_armsguy_punch_2", "+F1Congrats,^1 Me Love It!");
	// Trashguy's battle
	ds_map_add(t, "battle_main_trashguy", "* (Trashguy rolls into your way!)");
	ds_map_add(t, "battle_main_trashguy_geno", "* (You step into Trashguy's way.)");
	i = 0;
	ds_map_add(t, $"battle_main_trashguy_{i++}", "* (Trashguy is crunching&on moldy bread.)");
	ds_map_add(t, $"battle_main_trashguy_{i++}", "* (Trashguy is cleaning themselves with dirty&toilet paper.)");
	ds_map_add(t, $"battle_main_trashguy_{i++}", "* (Trashguy looks like it's&about to fall over.)"); // from "UNDERTALE"
	ds_map_add(t, $"battle_main_trashguy_{i++}", "* (Trashguy finds a plastic&bag with vomit inside and&drinks it.)");
	ds_map_add(t, $"battle_main_trashguy_{i++}", "* (Trashguy takes a rotten egg and throws it at the nearest wall.)");
	ds_map_add(t, "battle_act_trashguy_1", "Empty");
	ds_map_add(t, "battle_act_trashguy_2", "Kick");
	ds_map_add(t, "battle_act_result_trashguy_0_0", "* \"Trashguy\" [:R4 ATK;D | :B7 DEF;D]^3&* (A mysterious creature who lives inside a trash can.)");
	ds_map_add(t, "battle_act_result_trashguy_0_1", "* (Strangely,^1 they seriously&hate the smell of garbage.)");
	ds_map_add(t, "battle_act_result_trashguy_1_0", "* (You reach into Trashguy's trash can and pull some&of the garbage out...)");
	ds_map_add(t, "battle_act_result_trashguy_1_1", "* (Trashguy's :YMERCY;D up :U100%;D!)");
	ds_map_add(t, "battle_act_result_trashguy_2_0", "* (You kick Trashguy's trash can with your full strength...)");
	ds_map_add(t, "battle_act_result_trashguy_2_1", "* (Trashguy's :YMERCY;D up :R100%;D...?)");
	ds_map_add(t, "battle_bubble_trashguy_0", "+F1...i cant handle this smell...");
	ds_map_add(t, "battle_bubble_trashguy_1", "+F1...i just want all this trash to go away...");
	ds_map_add(t, "battle_bubble_trashguy_2", "+F1...this smell is terrible...");
	ds_map_add(t, "battle_bubble_trashguy_3", "+F1...i think im gonna fall over...");
	ds_map_add(t, "battle_bubble_trashguy_4", "+F1...why do they always put trash in here...?");
	ds_map_add(t, "battle_bubble_trashguy_5", "+F1...this is so much better...");
	ds_map_add(t, "battle_bubble_trashguy_6", "+F1...youre a nice person...");
	ds_map_add(t, "battle_bubble_trashguy_7", "+F1...youre different...");
	ds_map_add(t, "battle_bubble_trashguy_8", "+F1...cant you just leave me alone...?");
	ds_map_add(t, "battle_bubble_trashguy_9", "+F1...i shouldve expected this to happen...");
	ds_map_add(t, "battle_bubble_trashguy_10", "+F1...youre just like them...");
	ds_map_add(t, "battle_bubble_trashguy_empty_0", "+F1...thanks...");
	ds_map_add(t, "battle_bubble_trashguy_empty_1", "+F1...you didnt have to...");
	ds_map_add(t, "battle_bubble_trashguy_empty_2", "+F1...youre the best...");
	ds_map_add(t, "battle_bubble_trashguy_kick_0", "+F1...but why,^1 though...?");
	ds_map_add(t, "battle_bubble_trashguy_kick_1", "+F1...what did i do to you...?");
	ds_map_add(t, "battle_bubble_trashguy_kick_2", "+F1...why are you like this...?");
	// Flitcher's battle
	ds_map_add(t, "battle_main_flitcher", "* (Flitcher suddenly&appears in your way!)");
	ds_map_add(t, "battle_main_flitcher_geno", "* (You step into Flitcher's way.)");
	i = 0;
	ds_map_add(t, $"battle_main_flitcher_{i++}", "* (Flitcher stares blankly&to north and south.)");
	ds_map_add(t, $"battle_main_flitcher_{i++}", "* (Flitcher doesn't seem&to know why it's here.)"); // from "UNDERTALE"
	ds_map_add(t, $"battle_main_flitcher_{i++}", "* (Flitcher is moving its&tongue back and forth.)");
	ds_map_add(t, $"battle_main_flitcher_{i++}", "* (Flitcher doesn't think,^3 therefore it isn't.)");
	ds_map_add(t, $"battle_main_flitcher_{i++}", "* (Flitcher is just there.)");
	ds_map_add(t, $"battle_main_flitcher_{i++}", "* (Flitcher is daydreaming.)");
	ds_map_add(t, "battle_act_flitcher_1", "Talk");
	ds_map_add(t, "battle_act_flitcher_2", "Wave");
	ds_map_add(t, "battle_act_result_flitcher_0_0", "* \"Flitcher\" [:R3 ATK;D | :B6 DEF;D]^3&* (This monster doesn't really know what's happening...)");
	ds_map_add(t, "battle_act_result_flitcher_0_1", "* (It hates eye contact and any type of interaction that involves talking.)");
	ds_map_add(t, "battle_act_result_flitcher_1_0", "* (You quietly say \"hello\"&to Flitcher...)");
	ds_map_add(t, "battle_act_result_flitcher_1_1", "* (It seems scared.)^3&* (Flitcher's :YMERCY;D down :R100%;D.)");
	ds_map_add(t, "battle_act_result_flitcher_2_0", "* (You gently wave your hand&to Flitcher...)");
	ds_map_add(t, "battle_act_result_flitcher_2_1", "* (It seems happy.)^3&* (Flitcher's :YMERCY;D up :U100%;D!)");
	// Eyecrush's battle (UNUSED)
	ds_map_add(t, "unused_battle_main_eyecrush", "* (Eyecrush crawls into your way!)");
	ds_map_add(t, "unused_battle_main_eyecrush_0", "* (Eyecrush is looking at you.)");
	ds_map_add(t, "unused_battle_main_eyecrush_1", "* (Eyecrush is focused on your movements.)");
	ds_map_add(t, "unused_battle_main_eyecrush_2", "* (Eyecrush is happy he has more legs than you.)");
	ds_map_add(t, "unused_battle_main_eyecrush_3", "* (Eyecrush likes to drink eye drops for breakfast.)");
	ds_map_add(t, "unused_battle_main_eyecrush_4", "* (Eyecrush has set an unnoficial record for the longest time without blinking.)");
	ds_map_add(t, "unused_battle_act_eyecrush_1", "Hypnotize");
	ds_map_add(t, "unused_battle_act_eyecrush_2", "Dance");
	ds_map_add(t, "unused_battle_act_result_eyecrush_0_0", "* \"Eyecrush\" [:R6 ATK;D | :B0 DEF;D]^3&* (This monster is a big human eye with six red legs._");
	ds_map_add(t, "unused_battle_act_result_eyecrush_0_1", "* (Their inability to verbally communicate makes difficult&to know their interests.)");
	ds_map_add(t, "unused_battle_act_result_eyecrush_1_0", "* (You did something mysterious and hypnotized Eyecrush.)"); // "You did something mysterious" from "UNDERTALE"
	ds_map_add(t, "unused_battle_act_result_eyecrush_1_1", "* (This effect lasts for two turns.)");
	ds_map_add(t, "unused_battle_act_result_eyecrush_2_0", "* (You imitate the movements from a korean music video&you watched.)");
	ds_map_add(t, "unused_battle_act_result_eyecrush_2_1_0", "* (Eyecrush didn't understand what you did,^1 but liked it anyway.)"); // from "UNDERTALE"
	ds_map_add(t, "unused_battle_act_result_eyecrush_2_1_1", "* (Eyecrush couldn't understand what you did due to the hypnotization.)");
	// Broken Clock's battle
	ds_map_add(t, "battle_main_brock", "* (Broken Clock blocks your way!)");
	ds_map_add(t, "battle_main_brock_geno", "* (Broken Clock blocks your way.)");
	i = 0;
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Broken Clock is flying&around the room.)"); // references "time flies" idiom
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Broken Clock is bursting&with electricity.)");
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Broken Clock is having&the time of his life.)"); // references "to have the time of one's life" idiom
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Broken Clock is breaking&laws of time and space.)");
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Broken Clock is the proof that time doesn't heal all wounds.)"); // references "time doesn't heal all wounds" idiom
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Broken Clock's movements&are making you dizzy.)");
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Even Broken Clock is&right twice a day.)"); // references "even a broken clock is right twice a day" idiom
	ds_map_add(t, $"battle_main_brock_{i++}", "* (MEE6 is insulting Broken Clock under his nonexistent breath.)");
	ds_map_add(t, $"battle_main_brock_{i++}", "* (MEE6 throws leaves at&Broken Clock and misses&every one of them.)");
	ds_map_add(t, $"battle_main_brock_{i++}", "* (You feel your hair being pulled by static eletricity.)");
	ds_map_add(t, $"battle_main_brock_{i++}", "* (You feel the power of&1.21 gigawatts coursing&through your nervous system.)"); // "1.21 gigawatts" references "Back to the Future" (1985)
	ds_map_add(t, $"battle_main_brock_{i++}", "* (Reading this doesn't seem&like the best use of time.)"); // from "UNDERTALE"
	ds_map_add(t, "battle_act_result_brock_0_0", "* \"Broken Clock\" [:R12 ATK;D | :B0 DEF;D]^3&* (A malfunctioning analog clock possessed by a ghost.)"); // "12" references a 12-hour clock
	ds_map_add(t, "battle_act_result_brock_0_1", "* (He has nothing to lose&besides his life.)");
	ds_map_add(t, "battle_act_brock_1", "Negotiate");
	ds_map_add(t, "battle_act_result_brock_1_0_0", "* (You promise Broken Clock to spare him if he spares you...)");
	ds_map_add(t, "battle_act_result_brock_1_1_0", "* (He considers the possibility.)^3&* (Broken Clock's :RATTACK;D down!)");
	ds_map_add(t, "battle_act_result_brock_1_0_1", "* (You propose handing over your weapon to Broken Clock...)");
	ds_map_add(t, "battle_act_result_brock_1_1_1", "* (He declines it,^3 but likes&that you tried anyway.)^3&* (Broken Clock's :FSPEED;D down!)");
	ds_map_add(t, "battle_act_brock_2", "Insult"); // inspired by "Insult" and "Threat" from "UNDERTALE"
	var m = 0;
	ds_map_add(t, $"battle_act_result_brock_2_{m}", "* (You stare Broken Clock right in the eyes and shout...)"); 
	ds_map_add(t, $"battle_act_result_brock_2_{++m}", "* (... \"You're [insult]\".)");
	i = 0;
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "a stupid&doodoo butt"); // from "UNDERTALE"
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "&the legendary&fartmaster"); // from "UNDERTALE"
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "a filthy&single minder"); // from "UNDERTALE"
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "a goofy goober"); // from "Spongebob SquarePants"
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "nothing&but a little chicken"); // from "Back to the Future Part II"
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "&a seedling&of Satan"); // from "South Park"
	ds_map_add(t, $"battle_act_result_brock_2_{m}_{i++}", "a teeny&tiny ding-a-ling");
	ds_map_add(t, $"unused_battle_act_result_brock_2_{m}_{i++}", "a dirty brother killer"); // from "UNDERTALE"
	ds_map_add(t, $"unused_battle_act_result_brock_2_{m}_{i++}", "a miserable creature"); // from "UNDERTALE"
	ds_map_add(t, $"unused_battle_act_result_brock_2_{m}_{i++}", "a fool of a took"); // from "Lord of the Rings"
	ds_map_add(t, $"unused_battle_act_result_brock_2_{m}_{i++}", "a worthless&cock nugget");
	ds_map_add(t, $"battle_act_result_brock_2_{++m}", "* (Broken Clock seems to be unsure on how to react...)");
	ds_map_add(t, $"battle_act_result_brock_2_{++m}", "* (Broken Clock's :FSPEED;D&down for two turns!)");
	ds_map_add(t, "battle_act_brock_3", "Convince"); // from "DELTARUNE"
	ds_map_add(t, "battle_act_result_brock_3_0", "* (What will you say?)");
	ds_map_add(t, "battle_act_result_brock_3_1_0_1", "I don't want\nto hurt you");
	ds_map_add(t, "battle_act_result_brock_3_1_0_2", "You're going\nto be okay");
	ds_map_add(t, "battle_act_result_brock_3_1_1_1", "I don't know\nwhere I am");
	ds_map_add(t, "battle_act_result_brock_3_1_1_2", "I just want\nto help you");
	ds_map_add(t, "battle_act_result_brock_3_1_2_1", "I didn't do\nanything");
	ds_map_add(t, "battle_act_result_brock_3_1_2_2", "I just want\nto go home");
	ds_map_add(t, "battle_act_result_brock_3_1_3_1", "I didn't want\nto bother you");
	ds_map_add(t, "battle_act_result_brock_3_1_3_2", "I know how you\nare feeling");
	ds_map_add(t, "battle_act_result_brock_3_1_4_1", "I'm sorry");
	ds_map_add(t, "battle_act_result_brock_3_1_4_2", "You are\noverreacting")
	ds_map_add(t, "battle_act_result_brock_3_2_0", "* (Wrong choice...?)"); // from "DELTARUNE"
	ds_map_add(t, "battle_act_result_brock_3_2_1_prefix", "* (Broken Clock seems to be willing to trust you...)^3&");
	ds_map_add(t, "battle_act_result_brock_3_2_1", "* (Broken Clock's :YMERCY;D up :U20%;D!)");
	ds_map_add(t, "battle_act_result_brock_convinced", "* (It doesn't matter anymore.)");
	z = 0;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU KNOW WHAT I HATE THE MOST?!?");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU.^1 HUMANS.^1&ALL OF YOU!!!!");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2HUMANS ARE ALL&THE SAME.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2THEY DON'T CARE ABOUT ANYBODY&OR ANYTHING.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2ALL THEY WANT IS POWER,^1 MONEY,^1 FAME,^1 WOMEN,^2 ...^2&+D0+F1Or whatever.");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2LET ME GIVE'YA AN EXAMPLE.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2TWO NEW MEMBERS CAME IN AND DESTROYED THE CORRIDORS.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2AND IF THAT&WASN'T ENOUGH,^1&THEY BROKE ME.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2WITHOUT ANY REGRET!!!!");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2THEN,^3 THE LEADERS&OF THIS WORLD ABANDONED THIS PLACE.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2THE CORRIDORS WERE DESTROYED AND ALMOST USELESS.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2ALL THOSE NEW MEMBERS DID WAS&DESTROY PART OF&OUR WORLD!!!!");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2DO YOU UNDERSTAND WHAT I'M TRY'NA TO SAY?!?");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2HUMANS WILL DO THE WORST THINGS IF THEY FEEL ENTITLED ENOUGH.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2BESIDES,^3 THOSE NEW MEMBERS HAD ABSOLUTELY NO REASON WHATSOEVER.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2THEY DID ALL THAT JUST FOR FUN!!!!");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU'RE A&NEW MEMBER,^3&JUST LIKE'EM.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2HOW WOULD I KNOW IF YOU DIDN'T C'MERE TO&KILL ME?!?");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2TO BE HONEST,^1 I DON'T WANNA&KILL'YA.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2BUT I ALSO DON'T WANT'YA TO TAKE AN INNOCENT LIFE.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2WHETHER IT'S MINE OR ANY OTHER MONSTER'S.");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2ALL I'M DOING&IS STOPPING A DISASTER BEFORE&IT EVEN HAPPENS.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2I'M STOPPING MYSELF FROM REGRETTING EVER TRUSTING YOU.");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2IT'S NOT MY FAULT IF YOU'RE NOT CONVINCING&ENOUGH."); // hints convincing Broken Clock to win the battle
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU'RE NOT A BOOK.^1 I CAN'T EXACTLY \"READ\" YOU.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2I HAVE NO OPTION BUT TO JUDGE'YA&BY YOUR COVER.");
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2NOTHING IS GONNA CHANGE IF'YA DO NOTHING!!!!"); // hints convincing Broken Clock to win the battle
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2I HAVE ALL THE&TIME IN THE WORLD,^3 Y'KNOW.");
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2I CAN STAND HERE AND FIGHT'YA UNTIL THE END OF TIME."); // inspired by "even if it means we have to stand here until the end of time" from "UNDERTALE"
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S2YOUR LIFE IS&IN YOUR OWN&HANDS NOW."); // references the hands of an analog clock
	z += 1;
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_{z}_{i++}", "+F1+S4...");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_fight_{i++}", "+F1+S2WHAT?!^1 DID'YA REALLY TRY TO&HURT ME?!?");
	ds_map_add(t, $"battle_bubble_brock_fight_{i++}", "+F1+S2ARE YOU BLIND?!?!^1 ;RYOU CAN'T HIT ME WHILE IM FLYING;D!!!");
	ds_map_add(t, $"battle_bubble_brock_fight_{i++}", "+F1+S2NOT WITH THAT&USELESS THING&YOU HAVE.");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_0_1_{i++}", "+F1+S2YOU DON'T WANNA HURT ME?!?");
	ds_map_add(t, $"battle_bubble_brock_convince_0_1_{i++}", "+F1+S2IF THAT'S TRUE,^3&WHY DO YOU HAVE A WEAPON WITH YOU?!?");
	ds_map_add(t, $"battle_bubble_brock_convince_0_1_{i++}", "+F1+S2IS IT...^2^1&+D0+F1Is it just for SELF-DEFENSE...?");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_0_2_{i++}", "+F1+S2I'M GONNA BE&OKAY?!^1 REALLY?!?^1&HOW D'YA KNOW?!?\\");
	ds_map_add(t, $"battle_bubble_brock_convince_0_2_{i++}", "+F1+S2BECAUSE RIGHT NOW I'M FAR FROM BEING SLIGHTLY \"OKAY\".");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_1_1_{i++}", "+F1+S2HOW DON'T YOU KNOW&WHERE YOU ARE?!?");
	ds_map_add(t, $"battle_bubble_brock_convince_1_1_{i++}", "+F1+S2YOU WEREN'T INVITED BY ANYONE?!?");
	ds_map_add(t, $"battle_bubble_brock_convince_1_1_{i++}", "+F1+S2I...^2^1+D0+F1 I didn't&know THAT..."); // slightly inspired by "You're gonna have to try a little harder than THAT" from "UNDERTALE"
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_1_2_{i++}", "+F1+S2AND HOW WOULD'YA HELP ME,^1 EXACTLY?!?\\");
	ds_map_add(t, $"battle_bubble_brock_convince_1_2_{i++}", "+F1+S2YOU'RE A CHILD,^1 FOR FUCK'S SAKE.");
	ds_map_add(t, $"battle_bubble_brock_convince_1_2_{i++}", "+F1+S2I REALLY DOUBT THAT YOU CAN&FIX ME.");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_2_1_{i++}", "+F1+S2OH,^1 BUT YOU WILL.^1&IT'S JUST&A MATTER&OF TIME."); // references "be [only/just] a matter of time" idiom
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_2_2_{i++}", "+F1+S2YOU...^2&+D0+F1You just wanna&go HOME...?");
	ds_map_add(t, $"battle_bubble_brock_convince_2_2_{i++}", "+F1Well,^2 THEN...");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_3_1_{i++}", "+F1B-but you DIDN'T,^1 you didn't BOTHER me at ALL...");
	ds_map_add(t, $"battle_bubble_brock_convince_3_1_{i++}", "+F1It's just...");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_3_2_{i++}", "+F1+S2TELL ME,^1 HOW COULD'YA POSSIBLY KNOW HOW I'M FEELING?!?");
	ds_map_add(t, $"battle_bubble_brock_convince_3_2_{i++}", "+F1+S2IF THAT WERE TRUE,^1 YOU WOULD'VE LET ME KILL'YA ALREADY!!!!");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1D-did'ya...");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1Did'ya say&you're SORRY...?");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1But,^2 WHY?!?^1 You...");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1You haven't done ANYTHING to me.");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1You're NOT the one who broke me.");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1You're just a KID.\\");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1I'M the one that's HURTING you.");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1I'M the one that's TRY'na KILL you.\\");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1I-I'M the one that's...");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4T-that's,^2 uh...");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4That's...");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4I'm...");
	ds_map_add(t, $"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4...");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_convince_4_2_{i++}", "+F1+S2OVERREACTING?!?^1&I'M OVERREACTING?!?\\");
	ds_map_add(t, $"battle_bubble_brock_convince_4_2_{i++}", "+F1+S2OH,^1 GO FUCK YOURSELF.");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_0_{i++}", "+F1+S2... SERIOUSLY?!");
	ds_map_add(t, $"battle_bubble_brock_insult_0_{i++}", "+F1+S2YOU'RE AT THE PEAK OF YOUR IMMATURITY AND THAT'S WHAT'YA SAY?!?");
	ds_map_add(t, $"battle_bubble_brock_insult_0_{i++}", "+F1...^2 Way to go,^1&I GUESS...?");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_1_{i++}", "+F1... Bwahahah!^1&What does THAT&even MEAN?!");
	ds_map_add(t, $"battle_bubble_brock_insult_1_{i++}", "+F1Are'ya just saying RANDOM things to make me LAUGH?!");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_2_{i++}", "+F1... No,^3 seriously,^1 WHAT does&THAT mean?!");
	ds_map_add(t, $"battle_bubble_brock_insult_2_{i++}", "+F1Are'ya saying that I'm SINGLE because I'm FILTHY?!");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_3_{i++}", "+F1... Oh,^1 PLEASE.^1 You're not&even TRYING.");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_4_{i++}", "+F1... Okay,^1 OKAY.^1 You're getting&the HANG of IT!!!^1 FINALLY!!!!");
	ds_map_add(t, $"battle_bubble_brock_insult_4_{i++}", "+F1You'll be yelling SWEAR WORDS in&NO TIME!!!");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_5_{i++}", "+F1... Wow.^2 That's a powerful one.");
	ds_map_add(t, $"battle_bubble_brock_insult_5_{i++}", "+F1I'm speechless,^1 honestly.");
	ds_map_add(t, $"battle_bubble_brock_insult_5_{i++}", "+F1That was beautiful.");
	i = 0;
	ds_map_add(t, $"battle_bubble_brock_insult_6_{i++}", "+F1+S2... OH,^1 FOR&FUCK'S SAKE.^3&YOU WERE DOING&SO WELL!!!!");
	ds_map_add(t, $"battle_bubble_brock_insult_6_{i++}", "+F1+S2HOW COULD'YA POSSIBLY GO FROM SATAN TO FUCKING DING-A-LING??!?!?");
	// Armsguy, Trashguy, Flitcher & Eyecrush's battles
	ds_map_add(t, "battle_main_armsguy_armsguy", "* (Armsguys jump in your way!)");
	ds_map_add(t, "battle_main_armsguy_armsguy_geno", "* (You step into Armsguys' way.)");
	ds_map_add(t, "battle_main_trashguy_armsguy", "* (Trashguy rolls into your way!)^3&* (Armsguy gets jealous and&jumps in to save the day!)");
	ds_map_add(t, "battle_main_trashguy_armsguy_geno", "* (You step into Trashguy's way.)^3&* (Armsguy jumps in&to protect them.)");
	ds_map_add(t, "battle_main_armsguy_flitcher", "* (Armsguy jumps in your way!)^3&* (Flitcher is here,^3 somehow.)\\");
	ds_map_add(t, "battle_main_armsguy_flitcher_geno", "* (You step into Armsguy's way.)^3&* (Flitcher was caught&in the crossfire.)");
	ds_map_add(t, "unused_battle_main_eyecrush_armsguy", "* (Eyecrush crawls into your way!)^3&* (Armsguy jumps in to help them!)");
	ds_map_add(t, "unused_battle_main_eyecrush_flitcher", "* (Eyecrush crawls into your way!)^3&* (Also,^3 one big eye isn't enough.)");
	ds_map_add(t, "battle_main_armsguy_trashguy_flitcher", "* (The whole gang shows up!)");
	ds_map_add(t, "battle_main_armsguy_trashguy_flitcher_geno", "* (You step into their way.)");
	// Rhonhey's semi-battle
	i = 0;
	ds_map_add(t, $"battle_bubble_m6_rhonhey_0_{i++}", "Hey!^3 Hey!!^3 You!^1 You over there!!");
	ds_map_add(t, $"battle_bubble_m6_rhonhey_0_{i++}", "Stop!^1 Freeze!!^1 Cease and desist!!");
	i = 0;
	ds_map_add(t, $"battle_bubble_m6_rhonhey_1_{i++}", "Leave the&baby alone,^3&you foul beast!");
	ds_map_add(t, $"battle_bubble_m6_rhonhey_1_{i}", "You do not&belong here!^1&Your presence&is unwanted!");
	ds_map_add(t, $"unused_battle_bubble_m6_rhonhey_1_{i++}", "You are not welcome here!^1 Your presence is unwanted!");
	ds_map_add(t, $"battle_bubble_m6_rhonhey_1_{i++}", "Leave!");
	i = 0;
	ds_map_add(t, $"battle_bubble_m6_rhonhey_2_{i++}", "Leave!!!!");
	// Rhonhey's battle
	ds_map_add(t, "battle_main_rhonhey", "* (Rhonhey is ready to eat you alive.)");
	ds_map_add(t, "battle_main_rhonhey_0", "* (Rhonhey is drooling.)");
	ds_map_add(t, "battle_main_rhonhey_1", "* (Rhonhey is getting closer.)");
	ds_map_add(t, "battle_main_rhonhey_2", "* (Rhonhey's cousin lives in a popular plumbing game about turtles.)"); // references Pokey from "Super Mario Bros."
	ds_map_add(t, "battle_main_rhonhey_3", "* (Rhonhey accidentally crushes an insect with his body.)");
	ds_map_add(t, "battle_main_rhonhey_4", "* (You feel the worst smell imaginable coming from Rhonhey's mouth.)");
	ds_map_add(t, "battle_act_rhonhey_1", "Punch");
	ds_map_add(t, "battle_act_rhonhey_2", "Threat"); // from "UNDERTALE"
	ds_map_add(t, "battle_act_rhonhey_3", "Terrorize");  // from "UNDERTALE"
	ds_map_add(t, "battle_act_result_rhonhey_0", "* \"Rhonhey\" [:R?? ATK;D | :B?? DEF;D]^3&* [No data available.]"); // "No data available" from "UNDERTALE"
	ds_map_add(t, "battle_act_result_rhonhey_1_0", "* (You punch Rhonhey in the face with all the strength you have...)");
	ds_map_add(t, "battle_act_result_rhonhey_1_1_0", "* (Rhonhey is getting uncomfortable around you.)");
	ds_map_add(t, "battle_act_result_rhonhey_1_1_1", "* (You've made Rhonhey uncomfortable.)");
	ds_map_add(t, "battle_act_result_rhonhey_1_1_2", "* (But punching Rhonhey won't make him any more uncomfortable.)");
	ds_map_add(t, "battle_act_result_rhonhey_2_0", "* (You tell Rhonhey that you're going to rip one of his eyeballs out.)");
	ds_map_add(t, "battle_act_result_rhonhey_2_1", "* (Rhonhey didn't understand&what you said.)^1&* (Nothing happened.)"); // from "UNDERTALE"
	ds_map_add(t, "battle_act_result_rhonhey_3_0", "* (You scream at the top of your lungs while throwing rocks at Rhonhey.)");
	ds_map_add(t, "battle_act_result_rhonhey_3_1_0", "* (Rhonhey is getting miserable around you.)");
	ds_map_add(t, "battle_act_result_rhonhey_3_1_1", "* (You've made Rhonhey miserable.)");
	ds_map_add(t, "battle_act_result_rhonhey_3_2_2", "* (But terrorizing Rhonhey won't make him any more miserable.)");
	// TROLLFACE's battle (WORK IN PROGRESS, v0.6.0)
	ds_map_add(t, "battle_main_troll", "* (TROLLFACE stands in the way.)");
	i = 0;
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE is laughing&at his own jokes.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE is laughing uncomfortably loud.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE is blatantly&staring at your hips.)"); // inspired by "Quit staring at my hips" from "EarthBound (MOTHER 2)"
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE is sharing overly intimate secrets.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE is whispering inappropriate compliments.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE is chanting&words in an language&you don't recognize.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE sneezes and&doesn't cover his nose.)"); // inspired by "Jerry sneezes without covering its nose" from "UNDERTALE
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE spits in his&hands and fixes his hair.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE suddenly proposes going somewhere more private.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE does something explicit and acts like&nothing happened.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE exhales deeply.)^3&* (The smell of sour&milk fills the air.)") // inspired by "The smell of [...] fills the air" from "UNDERTALE"
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE starts gently&playing with your hair.)^3&* (You slap his hand away.)"); // references Armsguy's "Take Slime"
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE's behavior fills&you with hate and despair.)") // references "[...] fills you with determination" from "UNDERTALE"
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE's behavior makes&you question your own moral principles.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (TROLLFACE's behavior makes&you consider legalizing the&death penalty.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (You feel a shiver run&down your spine.)");
	ds_map_add(t, $"battle_main_troll_{i++}", "* (You feel TROLLFACE's sins crawling on your back.)"); // references "You felt your sins crawling on your back" from "UNDERTALE"
	ds_map_add(t, $"battle_main_troll_{i++}", "* (You feel hands wrap around your waist from behind.)^3&* (But no one was there.)");
	ds_map_add(t, "battle_act_result_troll_0_0", "* \"TROLLFACE\" [:R?? ATK;D | :B?? DEF;D]^3&* (Something.)");
	/*
	OF COURSE IM RACIST, I LOVE RACING.
	"Of course im racist, i love racing."
	"YEAH thats enough internet for me today."
	ds_map_add(t, "battle_bubble_tfk_3_0", "Yes,^1 I Am Racist");
	ds_map_add(t, "battle_bubble_tfk_3_1", "I Love Races And Race Cars");
	ds_map_add(t, "battle_bubble_tfk_5_0", "Who's Watching In " + string(current_year - irandom_range(12, 3)));
	ds_map_add(t, "battle_bubble_tfk_0_0", "I Am The REAL One");
	ds_map_add(t, "battle_bubble_tfk_1_0", "Don't Listen&To The News");
	ds_map_add(t, "battle_bubble_tfk_1_1", "It's All Liberal Propaganda");
	ds_map_add(t, "battle_bubble_tfk_2_0", "I'm Giving Free Candy");
	ds_map_add(t, "battle_bubble_tfk_2_1", "Just Get Into&My White Van");
	ds_map_add(t, "battle_bubble_tfk_4_0", "Wanna See My Divorce Selfie");
	ds_map_add(t, "battle_bubble_tfk_6_0", "Top 10 Most Epic Anime Battles");
	ds_map_add(t, "battle_bubble_tfk_7_0", "Nobody:\\^1&Literally Nobody:\\^1&Me:\\ *Joke*");
	ds_map_add(t, "battle_bubble_tfk_8_0", "I Also Choose This Guy's Dead Wife");
	ds_map_add(t, "battle_bubble_tfk_9_0", "First");
	ds_map_add(t, "battle_bubble_tfk_10_0", $"{irandom_range(287, 581)} Likes And No Comments?^1 Let's Fix That");
	ds_map_add(t, "battle_bubble_tfk_joke_0", "Take My Damn Upvote");
	ds_map_add(t, "battle_bubble_tfk_joke_1", "I Laughed A Lot Harder Than I Should've");
	ds_map_add(t, "battle_bubble_tfk_joke_2", "Funniest [!&\\$#] I Have Ever Seen");
	ds_map_add(t, "battle_bubble_tfk_threat_0", "I Feel Personally Attacked");
	ds_map_add(t, "battle_bubble_tfk_threat_1", "That's Enough Internet For Today");
	ds_map_add(t, "battle_bubble_tfk_threat_2", "This Had Me In Tears");
	ds_map_add(t, "battle_bubble_tfk_compliment_0", "Edit:\\^1 Thank You For The Gold");
	ds_map_add(t, "battle_bubble_tfk_compliment_1", "Like If You Agree");
	ds_map_add(t, "battle_bubble_tfk_compliment_2", "I'm Not Crying,^1&You Are");
	*/
	// Toilet's battle
	ds_map_add(t, "battle_main_toilet", "* (A toilet stands in the way.)");
	ds_map_add(t, "battle_main_toilet_0", "* (The toilet glares at you.)");
	i = 0;
	ds_map_add(t, $"battle_act_result_toilet_0_{i++}", "* Toilet - [?? ATK | ?? DEF]^3&* A giant toilet.");
	ds_map_add(t, $"battle_act_result_toilet_0_{i++}", "* A disgusting smell is coming from inside.");
	ds_map_add(t, $"battle_act_result_toilet_0_{i++}", "* The toilet is too big for you to see what is causing the smell.");
	i = 0;
	ds_map_add(t, $"battle_act_result_toilet_1_{i++}", "* (You flushed the toilet.)^1&* (Suddenly,^1 the smell stops.)");
	ds_map_add(t, $"battle_act_result_toilet_1_{i++}", "* (Then,^1 you understand.)");
	ds_map_add(t, $"battle_act_result_toilet_1_{i++}", "* (The toilet^4 is finally^4 free.)");
	ds_map_add(t, $"battle_act_result_toilet_1_{i++}", "* (It smiles and thanks you.)");
	ds_map_add(t, $"battle_act_result_toilet_1_{i++}", "* (You feel like a weight has been lifted from your shoulders...)");
}