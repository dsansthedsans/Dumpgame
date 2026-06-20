
function START_GAME()
{		
	randomize();
	display_gui_fix();
	load_time = irandom_range(180, 240);
	
	global.game_version = "v1.5.0-demo";
	global.game_startroom[0] = room_menu;
	global.game_startroom[1] = room_corridors_1 //room_intro;
	
	TEXTDATA_EN();
	TEXTDATA_PT();
	start_maininfo();
	start_music();
	start_party();
	start_writer();
	start_settings();
	start_savefile();
	start_achievements();
	
	global.c_dump = #32FF62;
	global.fnt_dmg = font_add_sprite_ext(spr_fnt_dmg, "BCEIKLMOQRSU 0123456789", 1, 0);
	global.fnt_dotum = font_add_sprite_ext(spr_fnt_dotum, "aáâãbcdeéêfghiíjklmnoóôpqrstuúvwxyzAÁÂÃBCDEÉÊFGHIÍJKLMNOÓÔPQRSTUÚVWXYZ0123456789!?.,'\":()[]&$#*- ", 0, 0);
	global.fnt_dsans = font_add_sprite_ext(spr_fnt_dsans, "wZ]`aM.z<*L-STs:\";ç5!9yVhpD0K&Wxm[X7cfl>(éFH49ãIájB8´}6v1oR|NCk^gO{wG2n#E%q=íu?t@~UAYQ/_de3,Jb'\\)r+Pi$ê óô", 0, 1);
	global.indebug = 0;
	
		// notification
	for (var i = 0; i < 10; i++)
		global.notification[i] = 0;
	
	/*

	
	// others
	global.ingame = 0;
	global.inmenu = 0;
	global.inintro = 0;
	global.inbattle = 0;
	global.ingameover = 0;
	global.ingameend = 0;
	global.indebug = 0;
	global.leavingbattle = 0;
	global.fastmenu = 0;
	global.resetfile = 0;
	global.hasfile = 0;
	*/
	
	
	
	
	
	
	
	
	
	
	/*
	// dropped item
	global.droppeditem_length = 99;
	global.droppeditem_pickupname = "";
	for (var i = 0; i < 99; i++)
	{
		global.droppeditem[i] = -1;
		global.droppeditem_x[i] = -20;
		global.droppeditem_y[i] = -20;
		global.droppeditem_room[i] = -1;
	}
	*/
	
	/*
	#macro ITEM_BROOMSTICK 1
	#macro ITEM_BANDAGE 2
	#macro ITEM_7BELO 3
	#macro ITEM_CANDYBOWL 4
	#macro ITEM_BATONGAROTO 5
	#macro ITEM_KUNAI 6
	#macro ITEM_OLDHAMMER 7
	#macro INVENTORY_SLOT_TYPE_WEAPON 1
	#macro INVENTORY_SLOT_TYPE_ARMOR 2
	#macro INVENTORY_SLOT_TYPE_CONSUMABLE 3
	
	global.inventory_length = 6;
	global.inventory_lastslot = (global.inventory_length - 1);
	for (var i = 0; i < global.inventory_length; i++)
	{
		global.inventory_slot[i] = 0;
		global.inventory_slot_type[i] = 0; // 1 = WEAPON; 2 = ARMOR; 3 = CONSUMABLE;
		global.inventory_slot_name[i] = "";
		global.inventory_slot_desc[i] = "";
	}
	
	// dropped item
	global.droppeditem_myid = -1;
	global.droppeditem_mypos = -1;
	global.droppeditem_maxlength = 999;
	global.droppeditem_pickupname = "";
	for (var i = 0; i < global.droppeditem_maxlength; i++)
	{
		global.droppeditem[i] = 0;
		global.droppeditem_x[i] = -20;
		global.droppeditem_y[i] = -20;
		global.droppeditem_room[i] = 0;
		global.droppeditem_name[i] = "Salenis";
		global.droppeditem_exists[i] = 0;
	}
	*/
	
	// camera
	
	/*
	global.camera_shake_active = 0gl
	obal.camera_shake_intensity = 0;
	*/
	
	// writer
	
	// music
	/*
	#macro MUSIC_NORMAL 0
	#macro MUSIC_AMBIENCE 1
	global.music_length = 2;
	for (var i = 0; i < global.music_length; i++)
	{
		global.music[i] = -1;
		global.music_loop[i] = 0;
		global.music_gain[i] = 0;
		global.music_pitch[i] = 0;
		global.music_volume[i] = 0;
		global.music_audio[i] = -1;
		global.music_pos[i] = 0;
	}
	*/
}

function start_maininfo()
{
	start_chara();
	start_item();
	start_flags();
	start_worlds();
	
	// start settings
	// load settings
	
	start_savefile();
	
	// start achievements
	// load achievements
}

function start_chara()
{
	// informações que tem que salvar
	global.chara_name = "";
	global.chara_money = 0;
	
	global.chara_lvl = 1;
	global.chara_exp = 0;
	
	global.chara_spares = 0;
	global.chara_kills = 0;
	
	global.chara_heals = 0;
	global.chara_deaths = 0;
	
	global.chara_weapon = ITEM_STICK;
	global.chara_armor = ITEM_BANDAGE;
	
	global.chara_room = 0;
	global.chara_world = WORLD_CORRIDORS;
	global.chara_murder = 0;
	
	
	// informações que não tem que salvar
	global.chara_maxhp = 20;
	global.chara_curhp = 20;
	
	global.chara_nextexp = 0;
	
	global.chara_atk = 0;
	global.chara_def = 0;
	
	global.chara_wname = "";
	global.chara_aname = "";
	global.chara_wstrength = 0;
	global.chara_astrength = 0;
	
	
	// informações de suporte
	#macro LEFT 0
	#macro RIGHT 1
	#macro UP 2
	#macro DOWN 3
	#macro SIT 4
	#macro FALLEN 5
	
	global.chara_facing = DOWN;
	global.chara_runtime = 0;
	
	
	// informações de cutscene
	global.chara_run = 1;
	global.chara_move = 1;
	global.chara_interact = 1;
	global.chara_cutscene = 0;
	global.chara_open_menu = 1;
	global.chara_pause_game = 1;
	global.chara_camera_move = 1;
	
	global.battle_nextgroup = 0;
	global.battle_heart_x = 0;
	global.battle_heart_y = 0;
	
	/*
	#macro LEFT 0
	#macro RIGHT 1
	#macro UP 2
	#macro DOWN 3
	#macro SIT 4
	#macro FALLEN 5
	
	#macro RIGHT_SIT 6
	#macro UP_SIT 7 // side
	#macro DOWN_SIT 8
	
	global.chara_name = "";
	global.chara_exp = 0;
	global.chara_money = 0;
	global.chara_weapon = ITEM_STICK;
	global.chara_armor = ITEM_BANDAGE;
	global.chara_kills = 0;
	global.chara_spares = 0;
	global.chara_heals = 0;
	global.chara_deaths = 0;
	global.chara_world = WORLD_CORRIDORS;
	global.chara_saveroom = 0;
	global.chara_fun = irandom_range(1, 100);
	
	global.chara_nextexp = 0;	// set in chara_stats()
	global.chara_lvl = 1;		// set in chara_stats()
	global.chara_atk = 8;		// set in chara_stats()
	global.chara_def = 9;		// set in chara_stats()
	global.chara_maxhp = 20;	// set in chara_stats()
	global.chara_curhp = 20;	// set in chara_stats()
	global.chara_wname = "";	// set in chara_stats()
	global.chara_aname = "";	// set in chara_stats()
	global.chara_wstrength = 0;	// set in chara_stats()
	global.chara_astrength = 0;	// set in chara_stats()
	global.chara_murder = 0;	// set in chara_getmurder()
	global.chara_facing = DOWN;
	
	global.chara_move = 1;
	global.chara_interact = 1;
	global.chara_cutscene = 0;
	global.chara_openmenu = 1;
	global.chara_canpause = 1;
	global.chara_cameramove = 1;
	global.chara_hpmenu = 0;
	
	global.chara_menu = 0;
	global.chara_pause = 0;
	global.chara_canrun = 1;
	global.chara_lastx = 0;
	global.chara_lasty = 0;
	global.chara_lastroom = 0;
	global.chara_encounter = 0;	
	global.battle_nextgroup = 0;
	*/
}
function start_item()
{
	#macro ITEM_STICK 0
	#macro ITEM_BANDAGE 1
	#macro ITEM_CANDY 2
	#macro ITEM_BOWL 3
	#macro ITEM_KUNAI 4
	#macro ITEM_CHOCO 5
	#macro ITEM_HELMET 6
	
	#macro ITEM_TYPE_CONSUMABLE 1
	#macro ITEM_TYPE_WEAPON 2
	#macro ITEM_TYPE_ARMOR 3
	
	global.item_length = 6;
	global.item_last = (global.item_length - 1);
	for (var i = 0; i < global.item_length; i++)
		global.item[i] = -1;
}
function start_flags()
{
	// test flags
	global.testflag[0] = 0; // finished event0
	
	// flags
	global.flag[0] = 0; // finished getting up event
	
	global.flag[1] = 0; // finished first MEE6's event
	global.flag[2] = 0; // has MEE6 as side character
	
	global.flag[3] = 0; // left room_corridors_2 after MEE6's event
	
	global.flag[4] = 0; // finished MEE6's pre-dummy event
	global.flag[5] = 0; // MEE6's pre-dummy question result
	global.flag[6] = 0; // started Dummy's battle
	global.flag[7] = 0; // finished MEE6's post-dummy event
	
	global.flag[8] = 0; // finished MEE6's pre-CAPTCHA.1 event
	
	global.flag[9] = ""; // CAPTCHA.1 - puzzle 1 - word
	global.flag[10] = -1; // CAPTCHA.1 - puzzle 1 - way
	global.flag[11] = 0; // completed CAPTCHA.1 - puzzle 1
	
	global.flag[12] = ""; // CAPTCHA.1 - puzzle 2 - word
	global.flag[13] = -1; // CAPTCHA.1 - puzzle 2 - way
	global.flag[14] = 0; // completed CAPTCHA.1 - puzzle 2
	
	global.flag[15] = 0; // completed CAPTCHA.1
	global.flag[16] = 0; // finished MEE6's post-CAPTCHA.1 event
	
	global.flag[17] = 0; // left room_corridors_3_5
	global.flag[18] = 0; // entered in a encounter battle
	
	global.flag[19] = 3; // amount of candy in the candy bowl (room_corridors_6)
	global.flag[20] = 0; // took the candy bowl
	global.flag[21] = 0; // interacted with candy bowl

	global.flag[22] = 0; // got Corridors' "but nobody came"
	global.flag[23] = 0; // created Corridors' genocide dialog
	
	global.flag[24] = 0; // talked with Armsguy in room_corridors_8
	
	global.flag[25] = 60; // CAPTCHA STAGE 2: first moveable x position
	global.flag[26] = 700; // CAPTCHA STAGE 2: first moveable y position
	global.flag[27] = 140; // CAPTCHA STAGE 2: second moveable x position
	global.flag[28] = 520; // CAPTCHA STAGE 2: second moveable y position
	global.flag[29] = 140; // CAPTCHA STAGE 2: third moveable x position
	global.flag[30] = 340; // CAPTCHA STAGE 2: third moveable y position
	global.flag[31] = 0; // completed first puzzle in CAPTCHA.2
	global.flag[32] = 0; // completed second puzzle in CAPTCHA.2
	global.flag[33] = 0; // completed third puzzle in CAPTCHA.2
	global.flag[34] = 0; // completed CAPTCHA.2
	global.flag[35] = 0; // finished MEE6's pre-CAPTCHA.2 event
	
	global.flag[36] = 0; // took chocolate from CAPTCHA's STAGE 2 reward
	
	global.flag[37] = 0; // started Broken Clock's event
	global.flag[38] = 0; // killed Broken Clock
	global.flag[39] = 0; // finished Broken Clock's event
	
	global.flag[40] = 0; // opened door after dummy
	
	global.flag[41] = 0; // left room_corridors_12 after Broken Clock's battle
	
	global.flag[42] = 0; // finished MEE6's post-CAPTCHA.2 event
	
	global.flag[43] = 0; // talked with Trashguy in room_corridors_11
	
	global.flag[44] = 0; // first time playing the genocide corridor music
	
	global.flag[45] = 0; // talked to armsguy before CAPTCHA 2
	global.flag[46] = 0; // left room_corridors_9 after talking to trashguy
	global.flag[47] = 0; // got reward from armsguy
	global.flag[48] = 0; // talked to trashguy
	
	global.flag[49] = 0; // talked to armsguy post-bc
	
	global.flag[50] = 0; // pulled left lever from CAPTCHA.3
	global.flag[51] = 0; // pulled right lever from CAPTCHA.3
	global.flag[52] = 0; // finished pre-CAPTCHA.3 event
	global.flag[53] = 0; // finished CAPTCHA.3 and finished post-CAPTCHA.3 event
	global.flag[54] = 0; // left room_corridors_14 after CAPTCHA.3
	global.flag[55] = ""; // CAPTCHA.3 - puzzle 1 word
	global.flag[56] = -1; // CAPTCHA.3 - puzzle 1 way
	
	global.flag[57] = 0; // talked to the first exit armsguy
	global.flag[58] = 0; // talked to the fishing trashguy
	
	global.flag[59] = 0; // gabee's chase: saw first part of dialog
	global.flag[60] = 0; // started gabee's chase
	global.flag[61] = 0; // finished gabee's chase

	global.flag[62] = 0; // finished caverns start event
	global.flag[63] = 0; // left room_caverns_2
	
	global.flag[64] = 0; // tutorial - interagir
	global.flag[65] = 0; // tutorial - correr
	
	global.flag[66] = 0; // Pre M6 - thing 1
}
function start_music()
{
	global.music_length = 4;
	
	for (var i = 0; i < global.music_length; i++)
	{
		global.music[i] = -1;
		global.music_gain_volume[i] = 0;
		global.music_gain_time[i] = 0;
		global.music_gain_fadein[i] = 0;
		global.music_pitch[i] = 1;
		global.music_loop[i] = 1;
		global.music_fadeouttime[i] = 0.5;
		global.music_volumetype[i] = VOLUME_MUSIC;
	}
}
function start_party()
{
	for (var i = 0; i < 3; i++)
	{
		global.party[i] = -1;
		global.party_facing[i] = -1;
	}	
}
function start_writer()
{
	global.writer = -1;
	global.writer_old = -1;
	global.writer_text = "";
	global.writer_enemy = -1;
}
function start_worlds()
{
	#macro WORLD_CORRIDORS 0
	global.world_curpopulation[WORLD_CORRIDORS] = 16;
	global.world_maxpopulation[WORLD_CORRIDORS] = 16;
	global.world_sparedpopulation[WORLD_CORRIDORS] = 0;
	
	#macro WORLD_CAVERNS 1
	global.world_curpopulation[WORLD_CAVERNS] = 8;
	global.world_maxpopulation[WORLD_CAVERNS] = 8;
	global.world_sparedpopulation[WORLD_CAVERNS] = 0;
}
function start_controls()
{
	global.keybind[00] = vk_left; // move left
	global.keybind[01] = vk_right; // move right
	global.keybind[02] = vk_up; // move up
	global.keybind[03] = vk_down; // move down
	global.keybind[04] = ord("Z"); // select
	global.keybind[05] = vk_enter; // select (alt)
	global.keybind[06] = ord("X"); // unselect
	global.keybind[07] = vk_shift;	// unselect (alt)
	global.keybind[08] = ord("X"); // run
	global.keybind[09] = vk_shift; // run (alt)
	global.keybind[10] = ord("C"); // in-game menu
	global.keybind[11] = vk_control; // in-game menu (alt)
	global.keybind[12] = vk_escape; // pause game
	global.keybind[13] = vk_f4; // fullscreen
}
function start_settings()
{
	global.lang = "en"; // en, pt
	global.fullscreen = 0;
	global.visualeff = 1;
	global.autorun = 0;
	global.showfps = 0;
	global.showsw = 0;
	global.hidenotif = 0;
	global.drpenabled = 1;
	global.bloodgore = 1;
	global.fastmenu = 0;
	
	#macro VOLUME_MASTER 0
	#macro VOLUME_MUSIC 1
	#macro VOLUME_SOUND 2
	global.volume[VOLUME_MASTER] = 1;
	global.volume[VOLUME_MUSIC] = 1;
	global.volume[VOLUME_SOUND] = 1;
	
	start_controls();
	
	if (file_exists("settings.txt") == 0)
		settings_write();
	else
		settings_read();
}
function start_savefile()
{
	m[0] = "";
	
	// mensagens aleatórias
	var i = 0;
		// UNDERTALE/DELTARUNE
	m[i++] = "Despite everything, it's still you.";
	m[i++] = "You should be smiling, too. Aren't you excited? Aren't you happy? You're going to be free.";
	m[i++] = "Have you ever thought about a world where everything is exactly the same, except you don't exist?";
	m[i++] = "You felt your sins crawling on your back."
	m[i++] = "TAKE A GOD DAMN VACATION STRAIGHT TO HELL";
	m[i++] = "I'VE ALWAYS BEEN A MAN OF THE [PIPIS]. A REAL [PIPIS] PERSON!";
	m[i++] = "I can't go to hell. I'm all out of vacation days.";
	m[i++] = "NOW'S YOUR CHANCE TO BE A [[BIG SHOT]]!!"
	m[i++] = "... can anyone hear me? Help...";
	m[i++] = "Dark. Darker. Yet darker.";
	m[i++] = "[Hyperlink blocked]";
	m[i++] = "Potassium"
	m[i++] = "Ribbit."
	m[i++] = "But nobody came.";
	m[i++] = "Big boner down the lane";
	m[i++] = "Sans is Ness";
	m[i++] = "NOW I OWN THE BLACK"
	m[i++] = "my child you are breaking my heart"
	m[i++] = "human... i remember you're genocides.";
	m[i++] = "I'm Wing Gaster! The royal scientist .";
	m[i++] = "Hey kid, do you want a weiner in your mouth?";
		
		// ULTRAKILL
	m[i++] = "dont do that then";
	m[i++] = "Ahh... Free at last.";
	m[i++] = "Machine, turn back now.";
	m[i++] = "yeah well get good asshole";
	m[i++] = "Something wicked this way comes.";
	m[i++] = "I'm gonna fucking poison you! ... What?";
	m[i++] = "May your woes be many, and your days few.";
	m[i++] = "A visitor? Hmm... Indeed, I have slept long enough.";
	
		// Dumpster Friends
	m[i++] = "OI ANINHA"
	m[i++] = "oi jovem";
	m[i++] = "limpeza anal";
	m[i++] = "PIROCA GAMES";
	m[i++] = "manda o argüivo";
	m[i++] = "O REI CHEGOU !!!";
	m[i++] = "garry's mod Fuckgame";
	m[i++] = "garry's game Fuckmod";
	m[i++] = "BIZALOUCA MANDA DALVE";
	m[i++] = "J'SUIS PAS CONTENT !!!";
	m[i++] = "I slightly dislike you."; // https://youtu.be/RyXEATaM8Sc?t=42
	m[i++] = "Profession is FL Studio 20";
	m[i++] = "Profession is GameMaker Studio 2";
	m[i++] = "CARALHO PORRA PORRA CARALHO";
	m[i++] = "Cara voce GOSTA do meu SETUP ?";
	m[i++] = "Everybody Loves Somebody Sometime";
	m[i++] = "romp spip, beto bomial e bob bazmal";
	m[i++] = "I wish someone would make a mod. Garry:";
	m[i++] = "olá, olá. o cara. o cara volta. bom dia.";
	m[i++] = "https://www.youtube.com/watch?v=z-2_OstpR5c";
	m[i++] = "PLAP PLAP PLAP GET BOMIAL GET BOMIAL GET BOMIAL";
	m[i++] = "the joker 2019 segurando placa escrito \"dumpgame\"";
	m[i++] = "\"incrível\" como Dsans diria, se estivesse conosco..";
	m[i++] = "Aninha! É a minha namorada instantânea! Você estragou ela!";
	m[i++] = "Nossa, Como Eu Queria Fazer Uma Copoia De Meu Arquivo. Dsans:";
	m[i++] = "Dsans, Por que Tem Tantos Vídeos De Femboys Nos Seus Recomendados Do YouTube ?";
	m[i++] = "Carambolas... Essas mensagens aleatórias são bem... estranhas e ao mesmo tempo, esquisitas...";
	
		// Jerma985
	m[i++] = "#LootGet"
	m[i++] = "LIFE IS PAIN I HATE";
	m[i++] = "The Giant Enemy Spider";
	m[i++] = "There's blood in the box.";
	m[i++] = "What's the baseball stream?";
	m[i++] = "Rats, rats, we are the rats.";
	m[i++] = "You missed that one, try another!";
	m[i++] = "Do I eat ass? That's the question?";
	m[i++] = "I've been waiting all week to do this one.";

		// Bob Esponja
	m[i++] = "I'm a goofy goober!";
	m[i++] = "Don't touch me, I'm sterile.";
	m[i++] = "Maybe it's the way you're dressed.";
	m[i++] = "Do you want to take a hike with me?";
	m[i++] = "Manager?! This is the greatest day of my life!";
	m[i++] = "I order the food, you cook the food, then the customer gets the food. We do that for forty years, and then we die.";

		// aleatórios
	m[i++] = "5:18:48:05"; // Portal 2 Rádio 10 horas
	m[i++] = "AudioJungle";
	m[i++] = "You're too slow!"; // Sonic
	m[i++] = "Die, potato, die."; // asdfmovie
	m[i++] = "you are an idiot!"; // youareanidiot.cc
	m[i++] = "Do you like waffles?"; // Do You Like Waffles
	m[i++] = "Live long and prosper."; // Star Trek
	m[i++] = "Connection terminated."; // Five Nights at Freddy's
	m[i++] = "I can put you back together."; // Five Nights at Freddy's
	m[i++] = "Tell me the duck story."; // Duck Story
	m[i++] = "The truth is out there."; // Arquivo X
	m[i++] = "Trains rights, or something."; // comenta´rio
	m[i++] = "Green is not a creative color."; // Don't Hug me I'm Scared 1
	m[i++] = "Hey, Apple! Apple! Hey! Hey, Apple!"; // Annoying Orange
	m[i++] = "O melhor meme do mundo é o Trollface."; // Trollface é o melhor meme do mundo
	m[i++] = "She sells sea shells on the seashore."; // Money Game 2
	m[i++] = "I find your lack of faith disturbing."; // Darth Vader
	m[i++] = "OBJECTS THAT I HAVE SHOVED UP MY ARSE";
	m[i++] = "Gettin' Freaky on a Friday Night Yeah"; // FNF
	m[i++] = "That's a pretty fucked up looking dog."; // penguinz0
	m[i++] = "https://www.youtube.com/watch?v=APHcYegE6ns";
	m[i++] = "Já procurou alguma vez um hotel na internet?"; // Trivago
	m[i++] = "Throw the switch on and off. Don't forget off."; // Mission: Impossible III
	m[i++] = "Ew, brother ew, what's that? What's that brother?"; // https://youtu.be/zAJirE10O2g?t=3136
	m[i++] = "God. I guess I was probably returning video tapes."; // American Psycho
	m[i++] = "Face it. The prophecies were wrong. Someone ratted us out."; // Jesus's Betrayal: How It Really Went Down
	m[i++] = "Tonight's the night. And it's going to happen again and again."; // Dexter
	m[i++] = "I want mommy! I want milk! I want to be held! I want to be comforted!";
	m[i++] = "Sorry. There's a reason they call it the white board. It's not my rule."; // House M.D.
	m[i++] = "DUDE those ANIMALS are so FUCKING FUNNY they make wanna MERGE without LOOKING"; // Family Guy

	for (var i = 0; i < array_length(m); i++)
		global.savefile_msg[i] = m[i];
	global.savefile_selected = -1;
}
function start_achievements()
{
	#macro ACHIEVEMENT_M6TOY		0
	#macro ACHIEVEMENT_SBHELMET		1
	#macro ACHIEVEMENT_MONSTNINJA	2
	#macro ACHIEVEMENT_MONSTGENO1	3
	#macro ACHIEVEMENT_BCWIN		4
	#macro ACHIEVEMENT_PUZZLEMASTER 5
	#macro ACHIEVEMENT_MONSTGENO2	6
	#macro ACHIEVEMENT_NOTREALONE	7
	#macro ACHIEVEMENT_REALONE		8
	#macro ACHIEVEMENT_RESTART		9
	
	global.achievement_total = 0;
	
	for (var i = 0; i < 99; i++)
	{
		var z = get_text("achievement_name_" + string(i));
		if (z != undefined)
		{
			global.achievement[i] = 0;
			global.achievement_name[i] = z;
			global.achievement_desc[i] = get_text("achievement_desc_" + string(i));
		}
		else
		{
			global.achievement_total = i;
			break;
		}	
	}
	
	if (file_exists("achievements.txt") == 0)
		achievements_write();
	else
		achievements_read();
	
	/*
	global.achievement_total = 0;
	global.achievement_achieved = 0;
	for (var i = 0; i < 99; i++)
	{
		var _ach = get_text("achievement_name_" + string(i));
		if (_ach != undefined)
		{
			global.achievement[i] = 0;
			if (global.achievement[i] == 1)
				global.achievement_achieved += 1;
			global.achievement_name[i] = _ach;
			global.achievement_desc[i] = get_text("achievement_desc_" + string(i));
		}
		else
		{
			global.achievement_total = i;
			break;
		}
	}
	*/
}

function CHANGE_GAME()
{
	var _change = 1;
	if (_change == 1)
	{
		global.chara_name = "CRAZYCAT";
		load_time = 1;
		
		var _rm = room_corridors_11;
		if (_rm != -1)
		{
			if (_rm > room_menu)
			{
				global.savefile_selected = 0;
				window_set_caption("Dumpgame");
			}
			global.game_startroom[0] = _rm;
			
			// pegar em qual nível que o jogador está
			var _lvl = 0;
			if (_rm == room_corridors_1) || (_rm == room_corridors_1_5) || (_rm == room_corridors_2)
				_lvl = 1;
			if (_rm == room_corridors_3)
				_lvl = 2;
			if (_rm == room_corridors_4)
				_lvl = 3;
			if (_rm == room_corridors_7) || (_rm == room_corridors_8) || (_rm == room_corridors_9)
				_lvl = 4;
			if (_rm == room_corridors_11) || (_rm == unused_room_happybirthday)
				_lvl = 5;
			if (_rm == room_corridors_13)
				_lvl = 6;
			if (_rm == room_corridors_16)
				_lvl = 7;
			if (_rm == room_corridors_18)
				_lvl = 8;
			if (_rm == room_caverns_1)
				_lvl = 9;
			if (_rm == room_caverns_3)
				_lvl = 10;
			
			// definir flags baseado de onde o jogo vai começar
			if (_lvl >= 1)
			{
				global.flag[0] = 1; // finished getting up event
			
				var _sublvl = 0;
				if (_rm == room_corridors_2)
					_sublvl = 1;
				if (_sublvl == 1)
				{
					global.flag[64] = 1;
					global.flag[65] = 1;	
				}
			}
			if (_lvl >= 2)
			{
				global.flag[1] = 1; // finished first MEE6's event
				global.flag[2] = 1; // has MEE6 as side character
				global.flag[3] = 1; // left room_corridors_2 after MEE6's event
			
				var _sublvl = 0;
				if (_sublvl == 1) // post-dummy
				{
					global.flag[4] = 1; // finished MEE6's pre-dummy event
					global.flag[5] = 1; // MEE6's pre-dummy question result
					global.flag[6] = 1; // started Dummy's battle
				}
			}
			if (_lvl >= 3)
			{
				global.flag[4] = 1; // finished MEE6's pre-dummy event
				global.flag[5] = 1; // MEE6's pre-dummy question result
				global.flag[6] = 1; // started Dummy's battle
				global.flag[7] = 1; // finished MEE6's post-dummy event
				global.flag[17] = 1; // left room_corridors_3_5
				global.flag[18] = 1; // entered in a encounter battle
				global.flag[40] = 1; // opened door after dummy
				global.achievement[ACHIEVEMENT_M6TOY] = 1;
			}
			if (_lvl >= 4)
			{
				global.flag[8] = 1; // finished MEE6's pre-CAPTCHA.1 event
				global.flag[11] = 1; // completed CAPTCHA.1 - puzzle 1
				global.flag[14] = 1; // completed CAPTCHA.1 - puzzle 2
				global.flag[15] = 1; // completed CAPTCHA.1
				global.flag[16] = 1; // finished MEE6's post-CAPTCHA.1 event
				global.flag[19] = 0; // amount of candy in the candy bowl (room_corridors_6)
				global.flag[20] = 1; // took the candy bowl
				global.flag[21] = 1; // interacted with candy bowl
		
				global.item[0] = ITEM_CANDY;
				global.item[1] = ITEM_CANDY;
				global.item[2] = ITEM_CANDY;
				global.item[3] = ITEM_BANDAGE;
				global.chara_armor = ITEM_BOWL;
			
				global.achievement[ACHIEVEMENT_SBHELMET] = 1;
			}
			if (_lvl >= 5)
			{
				global.flag[24] = 1; // talked with Armsguy in room_corridors_8
				global.flag[31] = 1; // completed first puzzle in CAPTCHA.2
				global.flag[32] = 1; // completed second puzzle in CAPTCHA.2
				global.flag[33] = 1; // completed third puzzle in CAPTCHA.2
				global.flag[34] = 1; // completed CAPTCHA.2
				global.flag[35] = 1; // finished MEE6's pre-CAPTCHA.2 event
				global.flag[36] = 1; // took chocolate from CAPTCHA's STAGE 2 reward
				global.flag[42] = 1; // finished MEE6's post-CAPTCHA.2 event
				global.flag[45] = 1; // talked to armsguy before CAPTCHA 2
				global.flag[46] = 1; // left room_corridors_9 after completing CAPTCHA 2 and talking to trashguy
				global.flag[47] = 1; // got reward from armsguy
				global.flag[48] = 1; // talked to trashguy
		
				global.item[4] = ITEM_STICK;
				global.item[5] = ITEM_CHOCO;
				global.chara_weapon = ITEM_KUNAI;
			
				global.achievement[ACHIEVEMENT_MONSTNINJA] = 1;
			}	
			if (_lvl >= 6)
			{
				global.flag[37] = 1; // started Broken Clock's event
				global.flag[39] = 1; // finished Broken Clock's event
				global.flag[41] = 1; // left room_corridors_12 after Broken Clock's battle
			
				global.achievement[ACHIEVEMENT_BCWIN] = 1;
			}
			if (_lvl >= 7)
			{
				global.flag[50] = 1; // pulled left lever from CAPTCHA.3
				global.flag[51] = 1; // pulled right lever from CAPTCHA.3
				global.flag[52] = 1; // finished pre-CAPTCHA.3 event
				global.flag[53] = 1; // finished CAPTCHA.3 and finished post-CAPTCHA.3 event
				global.flag[54] = 1; // left room_corridors_14 after CAPTCHA.3
			
				global.achievement[ACHIEVEMENT_PUZZLEMASTER] = 1;
			}
			if (_lvl >= 8)
			{
				global.flag[57] = 1; // talked to the first exit armsguy
				global.flag[58] = 1; // talked to the fishing trashguy
			
				var _skipchase = 0;
				if (_skipchase == 1)
				{	
					global.flag[59] = 1; // gabee's chase: saw first part of dialog
					var _onlyfirst = 1;
					if (_onlyfirst == 0)
					{
						global.flag[2] = 0;
						global.flag[60] = 1; // started gabee's chase
						global.indebug = 1;
					}
				}
			}
			if (_lvl >= 9)
			{
				global.flag[2] = 0;
				global.flag[59] = 1;
				global.flag[60] = 1;
				global.flag[61] = 1;
				global.chara_world = WORLD_CAVERNS;
			}
			if (_lvl >= 10)
			{
				global.flag[62] = 1;
				global.flag[63] = 1;
			}
		}
	}	
}

/*
function start_pause()
{
	// mensagem do dia
	m[0] = "";
	var i = 0;

		// personagens de jogos
	m[i++] = "\"Hehehew\" - Baldi";
	m[i++] = "\"erererererererer\" - Sans";
	m[i++] = "\"human... i remember you're genocides\" - Sans";
	m[i++] = "\"Looks feminine enough\" - Shadow";
	m[i++] = "\"Do you know who's beautiful? Read the first word\" - Sonic";

		// personagens de filmes/séries
	m[i++] = "\"I ate a cat\" - Darth Vader";
	m[i++] = "\"If you design you are making\" - Spongebob";
	m[i++] = "\"I guess I have to spend FNaF at Freddy's\" - Mike";
	m[i++] = "\"August 12 2036 the heat death of the universe\" - Squidward";
	
		// pessoas reais
	m[i++] = "\"Minecraft\" - Bill Gates";
	m[i++] = "\"Fucking hell\" - Paul McCartney";
	m[i++] = "\"Free will is a smith\" - Will Smith";
	m[i++] = "\"Aria Math Minecraft OST\" - jschlatt";
	m[i++] = "\"You should LOVE yourself NOW!\" - LTG";
	m[i++] = "\"Hello Peter, welcome to Fortnite\" - Donald Trump";
	
	global.charapause_msg = m[irandom(array_length(m) - 1)];
}
*/



// temporary save file
/*
function TEMPFILE_SAVE()
{
	// global.file_ = global.
	
	global.file_chara_name = global.chara_name;
	global.file_chara_lvl = global.chara_lvl;
	global.file_chara_exp = global.chara_exp;
	global.file_chara_money = global.chara_money;
	global.file_chara_weapon = global.chara_weapon;
	global.file_chara_armor = global.chara_armor;
	global.file_chara_murder = global.chara_murder;
	global.file_chara_kills = global.chara_kills;
	global.file_chara_spares = global.chara_spares;
	global.file_chara_heals = global.chara_heals;
	global.file_chara_deaths = global.chara_deaths;
	global.file_chara_world = global.chara_world;
	global.file_chara_saveroom = global.chara_saveroom;
	global.file_chara_fun = global.chara_fun;
	
	global.file_lang = global.lang;
	global.file_fullscreen = global.fullscreen;
	global.file_visualeff = global.visualeff;
	global.file_autorun = global.autorun;
	global.file_showfps = global.showfps;
	global.file_showsw = global.showsw;
	global.file_hidenotif = global.hidenotif;
	global.file_discordrpc_enabled = global.discordrpc_enabled;
	global.file_bloodgore = global.bloodgore;
	for (var i = 0; i < 3; i++)
		global.file_volume[i] = global.volume[i];
	
	for (var i = 0; i < global.item_length; i++)
		global.file_item[i] = global.item[i];
	
	for (var i = 0; i < array_length(global.keybind); i++)
		global.file_keybind[i] = global.keybind[i];
	
	for (var i = 0; i < array_length(global.flag); i++)
		global.file_flag[i] = global.flag[i];
	
	for (var i = 0; i < array_length(global.world_curpopulation); i++)
	{
		global.file_world_curpopulation[i] = global.world_curpopulation[i];
		global.file_world_maxpopulation[i] = global.world_maxpopulation[i];
		global.file_world_sparedpopulation[i] = global.world_sparedpopulation[i];	
	}
	
	for (var i = 0; i < array_length(global.achievement); i++)
		global.file_achievement[i] = global.achievement[i];
	
	///////////////////
	for (var i = 0; i < global.droppeditem_maxlength; i++)
	{
		global.file_droppeditem[i] = global.droppeditem[i];
		global.file_droppeditem_x[i] = global.droppeditem_x[i];
		global.file_droppeditem_y[i] = global.droppeditem_y[i];
		global.file_droppeditem_room[i] = global.droppeditem_room[i];
		global.file_droppeditem_name[i] = global.droppeditem_name[i];
		global.file_droppeditem_exists[i] = global.droppeditem_exists[i];
	}
	///////////////////
}
/*
function TEMPFILE_LOAD()
{
	global.chara_name = global.file_chara_name
	global.chara_lvl = global.file_chara_lvl
	global.chara_exp = global.file_chara_exp
	global.chara_money = global.file_chara_money
	global.chara_weapon = global.file_chara_weapon
	global.chara_armor = global.file_chara_armor
	global.chara_murder = global.file_chara_murder;
	global.chara_kills = global.file_chara_kills
	global.chara_spares = global.file_chara_spares
	global.chara_heals = global.file_chara_heals
	global.chara_deaths = global.file_chara_deaths
	global.chara_world = global.file_chara_world
	global.chara_saveroom = global.file_chara_saveroom;
	global.chara_fun = global.file_chara_fun;
	
	global.lang = global.file_lang;
	global.fullscreen = global.file_fullscreen;
	global.visualeff = global.file_visualeff;
	global.autorun = global.file_autorun;
	global.showfps = global.file_showfps;
	global.showsw = global.file_showsw;
	global.hidenotif = global.file_hidenotif;
	global.discordrpc_enabled = global.file_discordrpc_enabled;
	global.bloodgore = global.file_bloodgore;
	for (var i = 0; i < 3; i++)
		global.volume[i] = global.file_volume[i];
	
	for (var i = 0; i < global.item_length; i++)
		global.item[i] = global.file_item[i];
	
	for (var i = 0; i < array_length(global.file_keybind); i++)
		global.keybind[i] = global.file_keybind[i];
	
	for (var i = 0; i < array_length(global.file_flag); i++)
		global.flag[i] = global.file_flag[i];
	
	for (var i = 0; i < array_length(global.file_world_curpopulation); i++)
	{
		global.world_curpopulation[i] = global.file_world_curpopulation[i];
		global.world_maxpopulation[i] = global.file_world_maxpopulation[i];
		global.world_sparedpopulation[i] = global.file_world_sparedpopulation[i];	
	}
	
	for (var i = 0; i < array_length(global.file_achievement); i++)
		global.achievement[i] = global.file_achievement[i];
	
	///////////////////
	for (var i = 0; i < global.droppeditem_maxlength; i++)
	{
		global.droppeditem[i] = global.file_droppeditem[i];
		global.droppeditem_x[i] = global.file_droppeditem_x[i];
		global.droppeditem_y[i] = global.file_droppeditem_y[i];
		global.droppeditem_room[i] = global.file_droppeditem_room[i];
		global.droppeditem_name[i] = global.file_droppeditem_name[i];
		global.droppeditem_exists[i] = global.file_droppeditem_exists[i];
	
	///////////////////

	if (global.chara_name != "")
		global.hasfile = 1;
}
/*
function TEMPFILE_RESET()
{
	global.chara_move = 1;
	global.chara_facing = DOWN;
	global.chara_cutscene = 0;
	
	global.chara_exp = 0;
	global.chara_money = 0;
	global.chara_weapon = ITEM_STICK;
	global.chara_armor = ITEM_BANDAGE;
	global.chara_murder = 0;
	global.chara_kills = 0;
	global.chara_spares = 0;
	global.chara_heals = 0;
	global.chara_deaths = 0;
	global.chara_world = WORLD_CORRIDORS;
	global.chara_saveroom = 0;
	
	for (var i = 0; i < global.item_length; i++)
		global.item[i] = -1;
		
	FLAGS_START();
		
	global.world_curpopulation[WORLD_CORRIDORS] = 16;
	global.world_maxpopulation[WORLD_CORRIDORS] = 16;
	global.world_sparedpopulation[WORLD_CORRIDORS] = 0;
	
	for (var i = 0; i < global.droppeditem_maxlength; i++)
	{
		global.droppeditem[i] = 0;
		global.droppeditem_x[i] = -20;
		global.droppeditem_y[i] = -20;
		global.droppeditem_room[i] = 0;
		global.droppeditem_name[i] = "Salenis";
		global.droppeditem_exists[i] = 0;
	}
	
	sidechara_start();
}
*/

// debug






/* NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO NÃO APAGAR ISSO
function ACHIEVEMENTS_START()
{	
	for (var i = 0; i < 99; i++)
	{
		global.achievement[i] = 0;			// has achievement
		global.achievement_name[i] = 0;	
		global.achievement_desc[i] = 0;
		global.achievement_image[i] = 0;
	}
	
	#macro ACHIEVEMENT_M6TOY 0
	#macro ACHIEVEMENT_CORSPAREDALL 1
	#macro ACHIEVEMENT_BCWIN 2
	#macro ACHIEVEMENT_RESTART 3
	
	
	global.achievement_name[ACHIEVEMENT_M6TOY] = "MINI6";
	global.achievement_desc[ACHIEVEMENT_M6TOY] = get_text("achievement_desc_m6toy");
	global.achievement_image[ACHIEVEMENT_M6TOY] = 0;
	
	global.achievement_name[ACHIEVEMENT_CORSPAREDALL] = "Friend 'Em All";
	global.achievement_desc[ACHIEVEMENT_CORSPAREDALL] = get_text("achievement_desc_corsparedall");
	global.achievement_image[ACHIEVEMENT_CORSPAREDALL] = 2;
	
	global.achievement_name[ACHIEVEMENT_BCWIN] = "Ran Out Of Time";
	global.achievement_desc[ACHIEVEMENT_BCWIN] = get_text("achievement_desc_bcwin");
	global.achievement_image[ACHIEVEMENT_BCWIN] = 1;
	
	global.achievement_name[ACHIEVEMENT_RESTART] = "Here We Go Again";
	global.achievement_desc[ACHIEVEMENT_RESTART] = get_text("achievement_desc_restart");
	global.achievement_image[ACHIEVEMENT_RESTART] = 2;
	
	/////////
	#macro ACHIEVEMENT_M6TOY 0
	#macro ACHIEVEMENT_CORALLMONST 1
	#macro ACHIEVEMENT_CORSPAREDALL 2
	#macro ACHIEVEMENT_BCWIN 3
	#macro ACHIEVEMENT_NOTREAL 4
	#macro ACHIEVEMENT_REALONE 5
	#macro ACHIEVEMENT_GBWIN 6
	#macro ACHIEVEMENT_BEATDEMO 7
	#macro ACHIEVEMENT_RESTART 8
	
	
	global.achievement_name[ACHIEVEMENT_M6TOY] = "MINI6";
	global.achievement_desc[ACHIEVEMENT_M6TOY] = "Find the hidden MEE6 toy";
	global.achievement_image[ACHIEVEMENT_M6TOY] = 0;
	
	global.achievement_name[ACHIEVEMENT_CORALLMONST] = "Monster Expert";
	global.achievement_desc[ACHIEVEMENT_CORALLMONST] = "Battle all the monster combinations from the Corridors";
	global.achievement_image[ACHIEVEMENT_CORALLMONST] = 1;
	
	global.achievement_name[ACHIEVEMENT_CORSPAREDALL] = "Friend 'Em All";
	global.achievement_desc[ACHIEVEMENT_CORSPAREDALL] = "Spare all the monsters from the Corridors";
	global.achievement_image[ACHIEVEMENT_CORSPAREDALL] = 2;
	
	global.achievement_name[ACHIEVEMENT_BCWIN] = "Ran Out Of Time";
	global.achievement_desc[ACHIEVEMENT_BCWIN] = "Defeat Broken Clock";
	global.achievement_image[ACHIEVEMENT_BCWIN] = 3;
	
	global.achievement_name[ACHIEVEMENT_NOTREAL] = "Not The Real One";
	global.achievement_desc[ACHIEVEMENT_NOTREAL] = "Enter in a battle with a monster sent to kill you";
	global.achievement_image[ACHIEVEMENT_NOTREAL] = 4;
	
	global.achievement_name[ACHIEVEMENT_REALONE] = "The Real One";
	global.achievement_desc[ACHIEVEMENT_REALONE] = "Find and defeat the forgotten creature of this world";
	global.achievement_image[ACHIEVEMENT_REALONE] = 5;
	
	global.achievement_name[ACHIEVEMENT_GBWIN] = "Guardian Slayer";
	global.achievement_desc[ACHIEVEMENT_GBWIN] = "Defeat Gabee";
	global.achievement_image[ACHIEVEMENT_GBWIN] = 6;
	
	global.achievement_name[ACHIEVEMENT_BEATDEMO] = "See You Next Summer";
	global.achievement_desc[ACHIEVEMENT_BEATDEMO] = "Complete the Demo";
	global.achievement_image[ACHIEVEMENT_BEATDEMO] = 7;
	
	global.achievement_name[ACHIEVEMENT_RESTART] = "Here We Go Again";
	global.achievement_desc[ACHIEVEMENT_RESTART] = "Restart your save for the first time";
	global.achievement_image[ACHIEVEMENT_RESTART] = 8;
	/////////////////
}







function GAME_START()
{	
	// mainchara and sidechara
	CHARA_START();
	SIDECHARA_START();
	global.battle_nextgroup = 0;
	
	// overworld controller
	global.charamenu_lvl = 0;
	global.charamenu_move = 1;
	
	for (var i = 0; i < 6; i++)
	{
		global.charamenu_cellphone_opt[i] = "";
		global.charamenu_cellphone_opt[i] = "";
		global.charamenu_cellphone_opt_level[0, i] = "";
		global.charamenu_cellphone_opt_level[1, i] = "";
		global.charamenu_cellphone_opt_level[2, i] = "";
	}
	global.charamenu_cellphone_opt[0] = "General";
	global.charamenu_cellphone_opt[1] = "Start Call";
	global.charamenu_cellphone_opt[2] = "List of Friends";
	global.charamenu_cellphone_opt_level[1, 0] = "MEE6";
	
	// inventory
	#macro ITEM_BROOMSTICK 1
	#macro ITEM_BANDAGE 2
	#macro ITEM_7BELO 3
	#macro ITEM_CANDYBOWL 4
	#macro ITEM_BATONGAROTO 5
	#macro ITEM_KUNAI 6
	#macro ITEM_OLDHAMMER 7
	#macro INVENTORY_SLOT_TYPE_WEAPON 1
	#macro INVENTORY_SLOT_TYPE_ARMOR 2
	#macro INVENTORY_SLOT_TYPE_CONSUMABLE 3
	global.inventory_length = 6;
	global.inventory_lastslot = (global.inventory_length - 1);
	for (var i = 0; i < global.inventory_length; i++)
	{
		global.inventory_slot[i] = 0;
		global.inventory_slot_type[i] = 0; // 1 = WEAPON; 2 = ARMOR; 3 = CONSUMABLE;
		global.inventory_slot_name[i] = "";
		global.inventory_slot_desc[i] = "";
	}
	
	// dropped item
	global.droppeditem_myid = -1;
	global.droppeditem_mypos = -1;
	global.droppeditem_maxlength = 999;
	global.droppeditem_pickupname = "";
	for (var i = 0; i < global.droppeditem_maxlength; i++)
	{
		global.droppeditem[i] = 0;
		global.droppeditem_x[i] = -20;
		global.droppeditem_y[i] = -20;
		global.droppeditem_room[i] = 0;
		global.droppeditem_name[i] = "Salenis";
		global.droppeditem_exists[i] = 0;
	}
	
	// camera
	global.camera_shake_active = 0;
	global.camera_shake_intensity = 0;
	
	// music
	#macro MUSIC_NORMAL 0
	#macro MUSIC_AMBIENCE 1
	global.music_length = 2;
	MUSIC_START();

	// world
	#macro WORLD_CORRIDORS 0
	global.world_curpopulation[WORLD_CORRIDORS] = 16;
	global.world_maxpopulation[WORLD_CORRIDORS] = 16;
	global.world_sparedpopulation[WORLD_CORRIDORS] = 0;

	// settings
	global.lang = "en"; // en, pt
	global.fullscreen = 0;
	global.visualeff = 1;
	global.autorun = 0;
	global.showfps = 0;
	global.showsw = 0;
	global.hidenotif = 0;
	global.discordrpc_enabled = 1;
	global.bloodgore = 1;

	#macro VOLUME_MASTER 0
	#macro VOLUME_MUSIC 1
	#macro VOLUME_SOUND 2
	global.volume[VOLUME_MASTER] = 1;	// master
	global.volume[VOLUME_MUSIC] = 0;	// music
	global.volume[VOLUME_SOUND] = 1;	// sound effects
	
	for (var i = 0; i < 10; i++)
		global.notification[i] = 0;
	
	CONTROLS_START();
	
	// other
	global.ingame = 0;
	global.inmenu = 0;
	global.inintro = 0;
	global.inbattle = 0;
	global.ingameover = 0;
	global.inchase = 0;
	global.indebug = 0;
	global.leavingbattle = 0;
	global.fastmenu = 0;
	global.hasfile = 0;
	FLAGS_START();
	global.c_dump = #32FF62;
	global.fnt_dmg = font_add_sprite_ext(spr_fnt_dmg, "BCEIKLMOQRSU 0123456789", 1, 0);
	ACHIEVEMENTS_START();
}
function CHARA_START()
{
	#macro LEFT 0
	#macro RIGHT 1
	#macro UP 2
	#macro DOWN 3
	#macro SIT 4
	#macro FALLEN 5
	#macro UP_KNIFE 6
	
	// info that needs to be saved
	global.chara_name = "";
	global.chara_exp = 0;
	global.chara_money = 0;
	global.chara_weapon = ITEM_BROOMSTICK;
	global.chara_armor = ITEM_BANDAGE;
	global.chara_kills = 0;
	global.chara_spares = 0;
	global.chara_heals = 0;
	global.chara_deaths = 0;
	global.chara_world = WORLD_CORRIDORS;
	
	// important info that doesn't need to be saved
	global.chara_maxhp = 20;	// set in chara_stats()
	global.chara_curhp = 20;	// set in chara_stats()
	global.chara_lvl = 1;		// set in chara_stats()
	global.chara_nextexp = 0;	// set in chara_stats()
	global.chara_atk = 8;		// set in chara_stats()
	global.chara_def = 9;		// set in chara_stats()
	global.chara_wname = "";	// set in chara_stats()
	global.chara_aname = "";	// set in chara_stats()
	global.chara_wstrength = 0;	// set in chara_stats()
	global.chara_astrength = 0;	// set in chara_stats()
	global.chara_murder = 0;	// set in chara_getmurder()
	
	// other info
	global.chara_move = 1;
	global.chara_canrun = 1;
	global.chara_facing = DOWN;
	global.chara_menu = 0;
	global.chara_cutscene = 0;
	global.chara_pause = 0;
	global.chara_lastx = 0;
	global.chara_lasty = 0;
	global.chara_lastroom = 0;
	global.chara_encounter = 0;	
}
function SIDECHARA_START()
{
	for (var i = 0; i < 3; i++)
	{
		global.side[i] = -1;
		global.side_facing[i] = -1;
	}
}
function CONTROLS_START()
{
	global.keybind[00] = vk_left; // move left
	global.keybind[01] = vk_right; // move right
	global.keybind[02] = vk_up; // move up
	global.keybind[03] = vk_down; // move down
	
	global.keybind[04] = "Z"; // select
	global.keybind[05] = vk_enter; // select (alt)
	global.keybind[06] = "X"; // unselect
	global.keybind[07] = vk_shift;	// unselect (alt)
	
	global.keybind[08] = "X"; // run
	global.keybind[09] = vk_shift; // run (alt)
	global.keybind[10] = "C"; // in-game menu
	global.keybind[11] = vk_control; // in-game menu (alt)
	
	global.keybind[12] = vk_f4; // fullscreen
	global.keybind[13] = vk_escape; // pause game
}
function MUSIC_START()
{
	for (var i = 0; i < global.music_length; i++)
	{
		global.music[i] = -1;
		global.music_loop[i] = 0;
		global.music_gain[i] = 0;
		global.music_pitch[i] = 0;
		global.music_volume[i] = 0;
		global.music_fading[i] = 0;
		global.music_fadingaudio[i] = -1;
	}
}
function FLAGS_START()
{
	// test flags
	global.testflag[0] = 0; // finished event0
	
	// flags
	global.flag[0] = 0; // finished getting up event
	
	global.flag[1] = 0; // finished first MEE6's event
	global.flag[2] = 0; // has MEE6 as side character
	
	global.flag[3] = 0; // left room_corridors_2 after MEE6's event
	
	global.flag[4] = 0; // finished MEE6's pre-dummy event
	global.flag[5] = 0; // MEE6's pre-dummy question result
	global.flag[6] = 0; // started Dummy's battle
	global.flag[7] = 0; // finished MEE6's post-dummy event
	
	
	
	global.flag[8] = 0; // finished MEE6's pre-CAPTCHA.1 event
	
	global.flag[9] = ""; // CAPTCHA.1 - puzzle 1 - word
	global.flag[10] = -1; // CAPTCHA.1 - puzzle 1 - way
	global.flag[11] = 0; // completed CAPTCHA.1 - puzzle 1
	
	global.flag[12] = ""; // CAPTCHA.1 - puzzle 2 - word
	global.flag[13] = -1; // CAPTCHA.1 - puzzle 2 - way
	global.flag[14] = 0; // completed CAPTCHA.1 - puzzle 2
	
	global.flag[15] = 0; // completed CAPTCHA.1
	global.flag[16] = 0; // finished MEE6's post-CAPTCHA.1 event
	
	global.flag[17] = 0; // left room_corridors_3_5
	global.flag[18] = 0; // entered in a encounter battle
	
	global.flag[19] = 3; // amount of candy in the candy bowl (room_corridors_6)
	global.flag[20] = 0; // took the candy bowl
	global.flag[21] = 0; // interacted with candy bowl

	global.flag[22] = 0; // got Corridors' "but nobody came"
	global.flag[23] = 0; // created Corridors' genocide dialog
	
	global.flag[24] = 0; // talked with Armsguy in room_corridors_8
	
	global.flag[25] = 60; // CAPTCHA STAGE 2: first moveable x position
	global.flag[26] = 700; // CAPTCHA STAGE 2: first moveable y position
	global.flag[27] = 140; // CAPTCHA STAGE 2: second moveable x position
	global.flag[28] = 520; // CAPTCHA STAGE 2: second moveable y position
	global.flag[29] = 140; // CAPTCHA STAGE 2: third moveable x position
	global.flag[30] = 340; // CAPTCHA STAGE 2: third moveable y position
	global.flag[31] = 0; // completed first puzzle in CAPTCHA.2
	global.flag[32] = 0; // completed second puzzle in CAPTCHA.2
	global.flag[33] = 0; // completed third puzzle in CAPTCHA.2
	global.flag[34] = 0; // completed CAPTCHA.2
	global.flag[35] = 0; // finished MEE6's pre-CAPTCHA.2 event
	
	global.flag[36] = 0; // took chocolate from CAPTCHA's STAGE 2 reward
	
	global.flag[37] = 0; // started Broken Clock's event
	global.flag[38] = 0; // killed Broken Clock
	global.flag[39] = 0; // finished Broken Clock's event
	
	global.flag[40] = 0; // opened door after dummy
	
	global.flag[41] = 0; // left room_corridors_12 after Broken Clock's battle
}
function ACHIEVEMENTS_START()
{	
	for (var i = 0; i < 99; i++)
	{
		global.achievement[i] = 0;			// has achievement
		global.achievement_name[i] = 0;	
		global.achievement_desc[i] = 0;
		global.achievement_image[i] = 0;
	}
	
	#macro ACHIEVEMENT_M6TOY 0
	#macro ACHIEVEMENT_CORALLMONST 1
	#macro ACHIEVEMENT_CORSPAREDALL 2
	#macro ACHIEVEMENT_BCWIN 3
	#macro ACHIEVEMENT_NOTREAL 4
	#macro ACHIEVEMENT_REALONE 5
	#macro ACHIEVEMENT_GBWIN 6
	#macro ACHIEVEMENT_BEATDEMO 7
	#macro ACHIEVEMENT_RESTART 8
	
	
	global.achievement_name[ACHIEVEMENT_M6TOY] = "MINI6";
	global.achievement_desc[ACHIEVEMENT_M6TOY] = "Find the hidden MEE6 toy";
	global.achievement_image[ACHIEVEMENT_M6TOY] = 0;
	
	global.achievement_name[ACHIEVEMENT_CORALLMONST] = "Monster Expert";
	global.achievement_desc[ACHIEVEMENT_CORALLMONST] = "Battle all the monster combinations from the Corridors";
	global.achievement_image[ACHIEVEMENT_CORALLMONST] = 1;
	
	global.achievement_name[ACHIEVEMENT_CORSPAREDALL] = "Friend 'Em All";
	global.achievement_desc[ACHIEVEMENT_CORSPAREDALL] = "Spare all the monsters from the Corridors";
	global.achievement_image[ACHIEVEMENT_CORSPAREDALL] = 2;
	
	global.achievement_name[ACHIEVEMENT_BCWIN] = "Ran Out Of Time";
	global.achievement_desc[ACHIEVEMENT_BCWIN] = "Defeat Broken Clock";
	global.achievement_image[ACHIEVEMENT_BCWIN] = 3;
	
	global.achievement_name[ACHIEVEMENT_NOTREAL] = "Not The Real One";
	global.achievement_desc[ACHIEVEMENT_NOTREAL] = "Enter in a battle with a monster sent to kill you";
	global.achievement_image[ACHIEVEMENT_NOTREAL] = 4;
	
	global.achievement_name[ACHIEVEMENT_REALONE] = "The Real One";
	global.achievement_desc[ACHIEVEMENT_REALONE] = "Find and defeat the forgotten creature of this world";
	global.achievement_image[ACHIEVEMENT_REALONE] = 5;
	
	global.achievement_name[ACHIEVEMENT_GBWIN] = "Guardian Slayer";
	global.achievement_desc[ACHIEVEMENT_GBWIN] = "Defeat Gabee";
	global.achievement_image[ACHIEVEMENT_GBWIN] = 6;
	
	global.achievement_name[ACHIEVEMENT_BEATDEMO] = "See You Next Summer";
	global.achievement_desc[ACHIEVEMENT_BEATDEMO] = "Complete the Demo";
	global.achievement_image[ACHIEVEMENT_BEATDEMO] = 7;
	
	global.achievement_name[ACHIEVEMENT_RESTART] = "Here We Go Again";
	global.achievement_desc[ACHIEVEMENT_RESTART] = "Restart your save for the first time";
	global.achievement_image[ACHIEVEMENT_RESTART] = 8;
}
*/
