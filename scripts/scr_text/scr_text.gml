function text_get(_textID, _textLang = global.lang)
{
	for (var l = 0; l < 2; l++)
	{
		var _text;
		switch (_textLang)
		{
			case "enUS":
			_text = ds_map_find_value(global.text_enUS, _textID);
			break;
			case "ptBR":
			_text = ds_map_find_value(global.text_ptBR, _textID);
			break;
			default:
			return "Salenis";
			break;
		}
		if (_text != undefined && _text != "Salenis")
			return _text;
		else
		{
			if (_textLang != "enUS")
			{
				_textLang = "enUS";
				continue;
			}
			else
				return "Salenis";
		}
	}
}
function text_set(_textID, _text_enUS = "Salenis", _text_ptBR = "Salenis")
{
	ds_map_add(global.text_enUS, _textID, _text_enUS);
	ds_map_add(global.text_ptBR, _textID, _text_ptBR);
}
function textdata()
{
	var i, z, c;
	global.text_enUS = ds_map_create();
	global.text_ptBR = ds_map_create();
	text_set("room_start", "Loading...", "Carregando...");
	text_set("room_menu", "Main Menu", "Menu Principal");
	text_set("room_story", "Opening", "Abertura");
	text_set("room_battle", "Battle Together");
	text_set("room_over", "Game Over");
	text_set("room_corridors_1", "Fallen Angel", "Anjo Caído"); 
	text_set("room_corridors_1_5", "First Corridor", "Primeiro Corredor");
	text_set("room_corridors_2", "MEE6's Room", "Quarto do MEE6");
	text_set("room_corridors_3", "Entrance", "Entrada");
	text_set("room_corridors_3_5", "Training Dummy");
	text_set("room_corridors_4", "Dusty Staircase", "Degraus Empoeirados");
	text_set("room_corridors_5", "reCAPTCHA: Stage 1/3", "reCAPTCHA: Fase 1/3");
	text_set("room_corridors_5_A", text_get("room_corridors_5", "enUS"), text_get("room_corridors_5", "ptBR"));
	text_set("room_corridors_5_B", text_get("room_corridors_5", "enUS"), text_get("room_corridors_5", "ptBR"));
	text_set("room_corridors_6", text_get("room_corridors_5", "enUS"), text_get("room_corridors_5", "ptBR"));
	text_set("room_corridors_7", "Break Corridor", "Corredor Relaxante"); // "Break" references both the broken lamp on the bench and room_corridors_7's sign
	text_set("room_corridors_8", "Infested Staircase", "Degraus Infestados");
	text_set("room_corridors_9", "reCAPTCHA: Stage 2/3", "reCAPTCHA: Fase 2/3");
	text_set("room_corridors_10", text_get("room_corridors_9", "enUS"), text_get("room_corridors_9", "ptBR"));
	text_set("room_corridors_11", "Split Corridor", "Corredor Partido"); // "Split" references Broken Clock's death animation
	text_set("room_corridors_13", "Bricked Bridge", "Ponte de Tijolos"); // "Bricked" references Broken Clock and room_corridors_11's sign; "Bridge" references room_corridors_11's sign
	text_set("room_corridors_14", "reCAPTCHA: Stage 3/3", "reCAPTCHA: Fase 3/3");
	text_set("room_corridors_17", "Exit", "Saída");
	text_set("room_corridors_18", "Last Corridor", "Último Corredor");
	text_set("room_cave_1", "Rock Bottom", "Fundo do Poço");
	text_set("room_cave_2", "I Hope You Like the Darkness Because This Is Just the Beginning (Actually It's the End but Whatever)", "Eu Espero que Você Goste do Escuro Porque Isso É Só o Começo (Na Verdade É o Fim mas Tanto Faz)");
	text_set("room_cave_3", "Towering Pillars", "Caminho entre Colunas");
	text_set("room_cat", "Crazy Cat");
	text_set("unused_room_corridors_16_A", "Cave Entrance");
	text_set("unused_room_corridors_16_B", "Subway Entrance");
	// room_menu
	text_set("warning_0", "A game by\ndsansthedsans\nand migel8022", "Um jogo por\ndsansthedsans\ne migel8022");
	text_set("warning_1", "This game is unaffiliated\nwith Toby Fox", "Este jogo não é afiliado\nà Toby Fox");
	z = 0;
	i = 0;
	text_set($"menu_{z}_{i++}", "Play", "Jogar");
	text_set($"menu_{z}_{i++}", "Settings", "Opções");
	if (global.ACHIEVEMENT_ENABLED == true)
		text_set($"menu_{z}_{i++}", "Achievements", "Conquistas");
	text_set($"menu_{z}_{i++}", "Credits", "Créditos");
	text_set($"menu_{z}_{i++}", "Quit", "Sair");
	z += 1;
	i = 0;
	text_set($"menu_{z}_title", "Choose a File", "Escolha um SAVE"); // inspired by "Choose a File" from "EarthBound (MOTHER 2)"
	text_set($"menu_{z}_{i++}", "Back", "Voltar");
	text_set($"menu_{z}_{i++}", "File 1", "SAVE 1");
	text_set($"menu_{z}_{i++}", "File 2", "SAVE 2");
	text_set($"menu_{z}_{i++}", "File 3", "SAVE 3");
	text_set($"menu_{z}_empty", "[EMPTY]", "[VAZIO]");
	z += 1;
	i = 0;
	text_set($"menu_{z}_{i++}", text_get("menu_1_0", "enUS"), text_get("menu_1_0", "ptBR"));
	text_set($"menu_{z}_{i++}", "Controls", "Controles");
	text_set($"menu_{z}_{i++}", "Language", "Idioma");
	text_set($"menu_{z}_{i++}", "Fullscreen", "Tela Cheia");
	text_set($"menu_{z}_{i++}", "Visual Effects", "Efeitos Visuais");
	text_set($"menu_{z}_{i++}", "Master Volume", "Volume Geral");
	text_set($"menu_{z}_{i++}", "Music Volume", "Volume da Música");
	text_set($"menu_{z}_{i++}", "Sound Volume", "Volume dos Sons");
	text_set($"menu_{z}_{i++}", "Auto-Run");
	text_set($"menu_{z}_{i++}", "Show FPS", "Mostrar FPS");
	text_set($"menu_{z}_{i++}", "Show Stopwatch", "Mostrar Cronômetro");
	if (global.ACHIEVEMENT_ENABLED == true)
		text_set($"menu_{z}_{i++}", "Hide Notifications", "Esconder Notificações");
	text_set($"menu_{z}_{i++}", "Discord Activity", "Atividade do Discord");
	text_set($"menu_{z}_{i++}", "Fast Start", "Inicialização Rápida");
	i = 0;
	text_set($"menu_key_{z}_{i++}", "No", "Não");
	text_set($"menu_key_{z}_{i++}", "Yes", "Sim");
	text_set($"menu_key_{z}_{i++}", "English (US)", "Português (BR)");
	z += 1;
	i = 0;
	text_set($"menu_{z}_{i++}", "Back", "Voltar");
	z += 1;
	i = 0;
	text_set($"menu_{z}_{i++}", "Back", "Voltar");
	c = 0;
	i = 0;
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	c += 1;
	i = 0;
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	text_set($"menu_{z}_info_{c}_{i++}", );
	c += 1;
	i = 0;
	text_set($"menu_{z}_info_{c}_{i++}", );
	z += 1;
	i = 0;
	text_set($"menu_{z}_{i++}", "Back",		"Voltar");
	text_set($"menu_{z}_{i++}", "Continue", "Continuar");
	text_set($"menu_{z}_{i}",	"Erase",	"Apagar");
	text_set($"menu_{z}_{i}_1",	string_upper("Sure?"), string_upper("Mesmo?"));
	z += 1;
	i = 0;
	text_set($"menu_{z}_{i++}", "Back", "Voltar");
	text_set($"menu_{z}_{i++}", "Reset Keybinds", "Resetar Teclas");
	text_set($"menu_{z}_{i++}", "* Left", "* Esquerda");
	text_set($"menu_{z}_{i++}", "* Right", "* Direita");
	text_set($"menu_{z}_{i++}", "* Up", "* Cima");
	text_set($"menu_{z}_{i++}", "* Down", "* Baixo");
	text_set($"menu_{z}_{i++}", "* Select", "* Selecionar");
	text_set($"menu_{z}_{i++}", "* Select (ALT)", "* Selecionar (ALT)");
	text_set($"menu_{z}_{i++}", "* Cancel", "* Cancelar");
	text_set($"menu_{z}_{i++}", "* Cancel (ALT)", "* Cancelar (ALT)");
	text_set($"menu_{z}_{i++}", "* Run", "* Correr");
	text_set($"menu_{z}_{i++}", "* Run (ALT)", "* Correr (ALT)");
	text_set($"menu_{z}_{i++}", "* Inventory", "* Inventário");
	text_set($"menu_{z}_{i++}", "* Inventory (ALT)", "* Inventário (ALT)");
	text_set($"menu_{z}_{i++}", "* Pause", "* Pausar");
	text_set($"menu_{z}_{i++}", "* Fullscreen", "* Tela Cheia");
	z += 1;
	i = 0;
	text_set($"menu_{z}_title", "Enter Your Username", "Digite Seu Nome de Usuário");
	text_set($"menu_{z}_{i++}", "Back", "Voltar");
	text_set($"menu_{z}_{i++}", "Edit", "Editar");
	text_set($"menu_{z}_{i++}", "Done", "Pronto");
	z += 1;
	i = 0;
	text_set($"menu_{z}_{i++}", text_get("menu_key_2_2", "enUS"));
	text_set($"menu_{z}_{i++}", text_get("menu_key_2_2", "ptBR"));
	i = 0;
	text_set($"menu_namer_{i++}", "Uppercase", "Maiúsculo");
	text_set($"menu_namer_{i++}", "Backspace", "Backspace");
	text_set($"menu_namer_{i++}", "Confirm", "Confirmar");
	text_set($"menu_namer_f10", "TYPING MODE ENABLED\nPRESS [F10] TO QUIT", "MODO TECLADO ATIVADO\nAPERTE [F10] PARA SAIR");
	i = 0;
	text_set($"menu_name_{i}", "Dumpgame");
	text_set($"menu_namemsg_{i++}", "<3");
	text_set($"menu_name_{i}", "Fuckgame");
	text_set($"menu_namemsg_{i++}", "</3");
	text_set($"menu_name_{i}", "Carlinhos");
	text_set($"menu_namemsg_{i++}", "The true name.", "O nome verdadeiro.");
	text_set($"menu_name_{i}", "MEE6");
	text_set($"menu_namemsg_{i++}", "I suggest you choose\na different name.", "Eu sugiro que você escolha\num nome diferente.");
	text_set($"menu_name_{i}", "Armsguy");
	text_set($"menu_namemsg_{i++}", "I Know, Me Name Cool.\nBut Not For Ya.", "Eu Saber, Eu Nome Legau.\nMas Nn Pra Vc.");
	text_set($"menu_name_{i}", "Trashguy");
	text_set($"menu_namemsg_{i++}", "...okay, i guess...", "...ta, eu acho...");
	text_set($"menu_name_{i}", "Flitcher");
	text_set($"menu_namemsg_{i++}", "You make me sick.", "Você me dá nojo.");
	text_set($"menu_name_{i}", "Clock");
	text_set($"menu_namemsg_{i++}", "AND I THOUGHT YOU COULDN'T MAKE IT WORSE.", "E EU ACHEI QUE JÁ TAVA RUIM O SUFICIENTE.");
	text_set($"menu_name_{i}", "Brock");
	text_set($"menu_namemsg_{i++}", text_get($"menu_namemsg_{i-1}", "enUS"), text_get($"menu_namemsg_{i-1}", "ptBR"));
	text_set($"menu_name_{i}", "BrokenClock");
	text_set($"menu_namemsg_{i++}", text_get($"menu_namemsg_{i-1}", "enUS"), text_get($"menu_namemsg_{i-1}", "ptBR"));
	text_set($"menu_name_{i}", "BrokenCock");
	text_set($"menu_namemsg_{i++}", "... WHAT?!?", "... QUÊ?!?");
	text_set($"menu_name_{i}", "CrazyCat");
	text_set($"menu_namemsg_{i++}", ";)");
	text_set($"menu_name_{i}", "dsans");
	text_set($"menu_namemsg_{i++}", "Zero shits given.", "Tanto faz, honestamente.");
	text_set($"menu_name_{i}", "migel");
	text_set($"menu_namemsg_{i++}", "No Judgement");
	text_set($"menu_name_{i}", "migel8022");
	text_set($"menu_namemsg_{i++}", text_get($"menu_namemsg_{i-1}", "enUS"));
	text_set($"menu_name_{i}", "Frisk");
	text_set($"menu_namemsg_{i++}", "WARNING: This name will make the\ngame ridiculously easier.", "AVISO: Esse nome vai fazer o jogo\nridiculamente mais fácil."); // inspired by "UNDERTALE"
	text_set($"menu_hidehud", "hold [ALT] to hide menu", "segure [ALT] para esconder menu");
	i = 0;
	text_set($"unused_achievement_name_{i}", "MINI6");
	text_set($"unused_achievement_desc_{i++}", "Find the MEE6 toy that's hidden somewhere in the Corridors");
	text_set($"unused_achievement_name_{i}", "Unbelievable");
	text_set($"unused_achievement_desc_{i++}", "Draw a smiley face.");
	text_set($"unused_achievement_name_{i}", "Fashion Statement");
	text_set($"unused_achievement_desc_{i++}", "Get the armor that smells like strawberry");
	text_set($"unused_achievement_name_{i}");
	text_set($"unused_achievement_desc_{i++}", "Get a weapon by completing a monster's request");
	text_set($"unused_achievement_name_{i}", "Local Celebrity");
	text_set($"unused_achievement_desc_{i++}", "Spare every monster from the Corridors");
	text_set($"unused_achievement_name_{i}");
	text_set($"unused_achievement_desc_{i++}", "Kill Dummy and all monsters in the Corridors before fighting Broken Clock");
	text_set($"unused_achievement_name_{i}", "Out of Time"); // references "OUTATIME" from "Back to the Future" (1985)
	text_set($"unused_achievement_desc_{i++}", "Spare or kill Broken Clock");
	text_set($"unused_achievement_name_{i}", "Master of Puzzles"); // references "Master of Puppets" by "Metallica"
	text_set($"unused_achievement_desc_{i++}", "Complete reCAPTCHA's third stage in under 30 seconds");
	text_set($"unused_achievement_name_{i}");
	text_set($"unused_achievement_desc_{i++}", "Find and defeat the forgotten creature\nof this world");
	text_set($"unused_achievement_name_{i}");
	text_set($"unused_achievement_desc_{i++}", "Kill every monster from Caverns before reaching its exit");
	text_set($"unused_achievement_name_{i}", "Great Partner"); // references "Right. You are a great partner." from "UNDERTALE"
	text_set($"unused_achievement_desc_{i++}", "Erase a save file");
	text_set($"key_name_8", "Backspace");
	text_set($"key_name_9", "Tab");
	text_set($"key_name_13", "Enter");
	text_set($"key_name_16", "Shift");
	text_set($"key_name_17", "Ctrl");
	text_set($"key_name_18", "Alt");
	text_set($"key_name_27", "Esc");
	text_set($"key_name_32", "Space Bar", "Barra de Espaço");
	text_set($"key_name_37", "Left Arrow", "Seta para Esquerda");
	text_set($"key_name_39", "Right Arrow", "Seta para Direita");
	text_set($"key_name_38", "Up Arrow", "Seta para Cima");
	text_set($"key_name_40", "Down Arrow", "Seta para Baixo");
	text_set($"key_name_112", "F1");
	text_set($"key_name_113", "F2");
	text_set($"key_name_114", "F3");
	text_set($"key_name_115", "F4");
	text_set($"key_name_116", "F5");
	text_set($"key_name_117", "F6");
	text_set($"key_name_118", "F7");
	text_set($"key_name_119", "F8");
	text_set($"key_name_120", "F9");
	text_set($"key_name_121", "F10");
	text_set($"key_name_122", "F11");
	text_set($"key_name_123", "F12");
	text_set($"key_name_160", "Left Shift", "Shift Esquerdo");
	text_set($"key_name_161", "Right Shift", "Shift Direito");
	text_set($"key_name_162", "Left Ctrl", "Ctrl Esquerdo");
	text_set($"key_name_163", "Right Ctrl", "Ctrl Direito");
	text_set($"key_name_164", "Left Alt", "Alt Esquerdo");
	text_set($"key_name_165", "Right Alt", "Alt Direito");
	i = 0;
	text_set($"drp_state_menu_{i++}", "Title", "Título");
	text_set($"drp_state_menu_{i++}", text_get($"menu_{i}_title", "enUS"), text_get($"menu_{i}_title", "ptBR"));
	text_set($"drp_state_menu_{i++}", text_get("menu_0_1", "enUS"), text_get("menu_0_1", "ptBR"));
	text_set($"drp_state_menu_{i++}", text_get("menu_0_2", "enUS"), text_get("menu_0_2", "ptBR"));
	text_set($"drp_state_menu_{i++}", text_get($"menu_0_{2 + (1 * global.ACHIEVEMENT_ENABLED)}", "enUS"), text_get($"menu_0_{2 + (1 * global.ACHIEVEMENT_ENABLED)}", "ptBR"));
	text_set($"drp_state_menu_{i++}", text_get($"menu_{i}_1", "enUS"), text_get($"menu_{i}_1", "ptBR"));
	text_set($"drp_state_menu_{i++}", text_get($"menu_2_1", "enUS"), text_get($"menu_2_1", "ptBR"));
	text_set($"drp_state_menu_{i++}", text_get($"menu_7_title", "enUS"), text_get($"menu_7_title", "ptBR"));
	text_set($"drp_state_menu_{i++}", "Choose a Language", "Escolha um Idioma");
	text_set($"drp_state_battle_won_0", "YOU WON!", "VOCÊ GANHOU!");
	text_set($"drp_state_battle_won_1", "But nobody came.", "Mas ninguém veio.");
	text_set($"drp_state_battle_fleeing", "Fleeing...", "Fugindo...");
	text_set($"drp_faceInfo_0", "No File Selected", "Nenhum Arquivo Selecionado");
	text_set($"drp_faceInfo_1", "@{name} [LVL {lvl}]");
	// room_story (WORK IN PROGRESS, v0.6.0)
		// Creation (January 21, 2021) >> Transformation (June 10, 2021) >> Invasion (December 7, 2021) >> Carlinhos arrives (December 30, 2022 [12 months, 23 days and 6 hours after December 7, 2021])
	i = 0;
	text_set($"event_story_{i++}", "Long ago,^1 a group of&teenagers created a server on Discord."); // inspired by "Long ago, [...]" from "UNDERTALE"
	text_set($"event_story_{i++}", "Every month,^1 new members joined the server.");
	text_set($"event_story_{i++}", "Overnight,^1 they all&!disappeared without&!a trace."); // inspired by "One day, they all disappeared without a trace" from "UNDERTALE"
	text_set($"event_story_{i++}", "Two years later..."); // inspired by "Many years later" from "UNDERTALE"
	text_set($"unused_event_story_{i++}", "Every month,^1 the&!community grew as new&!members joined the server.\\");
	text_set($"unused_event_story_{i++}", "Long ago,^1 a group of&!high school students&!made a Discord server."); // inspired by "Long ago, [...]" from "UNDERTALE"
	/*
	text_set("intro_0", "Long ago,^1 three friends had met each other during class.^2");
	text_set("intro_1", "After some time,^1 they decided to create a server in Discord.^2");
	text_set("intro_2", "As the years went by,^1 new members had joined the server.^2");
	text_set("intro_3", "One day,^1 the owner was testing a new Discord feature.^2");
	text_set("intro_4", "But it went very,^1 very wrong.^2^2^2^1");
	text_set("intro_5", "Many years later^2.^2.^2.^2^2^1");
	text_set("intro_6", "FORTALEZA - \\11/14/2022");
	text_set("intro_7", "A brazilian boy was practing soccer in&a football pitch.");
	text_set("intro_8", "By mistake,^1 the ball fell inside a strange dumpster nearby.");
	text_set("intro_9", "When the boy was trying to get the ball,^1 he fell inside the dumpster.");
	text_set("intro_10", "The bottom of the dumpster opened,^1 revealing a giant portal.");
	text_set("intro_11", "The boy fell inside the portal and he was taken to another world.^2");
	*/
	/*
	msg[0] = "Long ago,^1 three friends&!met each other&!during class."; //"Long ago,^1 two races&!ruled over Earth:^1 &!HUMANS and MONSTERS."
	msg[1] = "After some time,^1 they&!decided to create a&!server in Discord.";
	msg[2] = "As months went by,^1 &!new members joined&!the server.";
	msg[3] = "One day,^1 the server's&!owner was conducting&!experiments in his room.";
	msg[4] = "But it went very,^1 &!very wrong.";
	msg[5] = "Many years later^2^3.^2^3.^2^3.";
	msg[6] = "    CEARÁ,^1 BRAZIL";
	msg[7] = "A brazilian boy was&!playing soccer alone&!in a football pitch.";
	msg[8] = "Suddenly,^1 a white flash&!of light came from a&!dumpster nearby.";
	msg[9] = "Curious, the boy approached the&!dumpster to search the&!origin of the light."
	msg[10] = "He was then gone as if&!nothing happened.";
	*/
	/*
	msg[0] = "Long ago,^1 a group of&!three friends created&!a server in Discord.^2^3";
	msg[1] = "As the months went by,^1 &!new members joined&!the server.^2^3";
	msg[2] = "One day,^1 the server's&!owner was conducting&!experiments in his room.^2^3";
	msg[3] = "But it all went very,^1 &!very wrong.^2^3";
	msg[4] = "Several years later^2^3.^2^3.^2^3.^2^1";
	msg[5] = "        BRAZIL&       2022^2^3";
	msg[6] = "A boy was playing soccer&!alone in a football&!pitch.";
	msg[7] = "Suddenly,^1 a white flash&!of light came from a&!dumpster nearby.";
	msg[8] = "The boy&!slowly approached the dumpster.";
	msg[9] = "He was then gone as if&!nothing had happened.";
	*/
	// room_battle
	text_set("battle_main_sparing_0_0", " is sparing you.", " está te poupando.");
	text_set("battle_main_sparing_0_1", " is tired of you.", " está de&saco cheio de você."); // "está de saco cheio de você" references a trash bag
	text_set("unused_battle_main_sparing_0_2", " is hypnotized.", " está hipnotizado.");
	text_set("battle_main_sparing_0_3", " has given up&on killing you.", " desistiu de matar você.");
	text_set("battle_main_sparing_0_4", " is staring&at the floor in silence.", " está encarando&o chão em silêncio.");
	text_set("battle_main_sparing_0_5", " is distracted.", " está distraído.");
	text_set("battle_main_sparing_1_0", " and ", " e ");
	text_set("battle_main_sparing_1_1", " are sparing you.", " estão te poupando.");
	text_set("battle_fight_0", "MISS", "ERRO");
	text_set("unused_battle_fight_1", "BLOCK", "BLOQUEIO");
	text_set("battle_act_0", "Check", "Checar");
	text_set("battle_mercy_0", "Spare", "Poupar");
	text_set("battle_mercy_1", "Flee", "Fugir");
	text_set("battle_won_0", "* (YOU WON!)^3 &* (You earned :Y", "* (VOCÊ GANHOU!)^3 &* (Você conseguiu :Y");
	text_set("battle_won_1", " EXP;D and :U$", " EXP;D e :UR$");
	text_set("battle_won_2", "^1 &* (Your :YLVL;D increased.)", "^1 &* (Seu :YLVL;D aumentou.)");
	i = 0;
	text_set($"battle_flee_{i++}", "* Waddle waddle."); // references "The Duck Song"
	text_set($"battle_flee_{i++}", "* I'll kill you.", "* Eu vou te matar."); // from "The Office"
	text_set($"battle_flee_{i++}", "* Happy go to hell.", "* Próspero vá para o inferno."); // from "House M.D."
	text_set($"battle_flee_{i++}", "* I have places to go.", "* Eu tenho lugares para ir."); // references "I have places to go" from "UNDERTALE"
	text_set($"battle_flee_{i++}", "* I hope you die in a fire.", "* Quero que você&   morra no fogo."); // references Living Tombstone's "Five Nights at Freddy's 3 Song"
	text_set($"battle_flee_{i++}", "* I'm too old for this shit.", "* Eu sou velho demais&   pra isso."); // references "Lethal Weapon"
	text_set($"battle_flee_{i++}", "* I'm not falling&   for that shit.", "* Fugindo..."); // "I'M NOT FALLING FOR THAT SHIT!" from "UNDERTALE" meme
	text_set($"battle_flee_{i++}", "* Screw you guys,&   I'm going home.", "* Vai se fuder, eu&   vou pra casa."); // references "South Park"
	text_set($"battle_flee_{i++}", "* I have to return&   some videotapes.", "* Eu preciso devolver&   umas fitas de vídeo."); // references "American Psycho"
	text_set($"battle_flee_{i++}", "* I'll follow you home&   and kill your dog."); // references "Postal 2"
	text_set($"battle_flee_{i++}", "* Maybe later.", "* Talvez depois.");
	text_set($"battle_flee_{i++}", "* Worst regards.", "* Com piores cumprimentos.");
	text_set($"battle_flee_{i++}", "* Good riddance.", "* Já fui tarde.");
	text_set($"battle_flee_{i++}", "* Hasta la vista.");
	text_set($"battle_flee_{i++}", "* Try again later.", "* Tente novamente mais tarde.");
	text_set($"battle_flee_{i++}", "* Not in the mood.", "* Não estou no clima.");
	text_set($"battle_flee_{i++}", "* Nice to meet you.", "* Prazer em conhecê-lo.");
	text_set($"battle_flee_{i++}", "* Zero shits given.", "* Cagando e andando.");
	text_set($"battle_flee_{i++}", "* Bother someone else.", "* Vai perturbar outra pessoa.");
	text_set($"battle_flee_{i++}", "* I'm busy, apparently.", "* Tô ocupado, pelo visto.");
	text_set($"battle_flee_{i++}", "* See you later, alligator.", "* Até, jacaré.");
	text_set($"battle_flee_{i++}", "* I'll send you a postcard.", "Te mando um cartão postal.");
	text_set($"battle_flee_{i++}", "* We should grab&   coffee sometime.", "* Vamo tomar um café&   algum dia desses.");
	text_set($"battle_flee_{i++}", "* Leave a message&   after the tone.", "* Deixe uma mensagem&   após o sinal.");
	text_set($"battle_flee_geno", "+S3* In my way.", "+S3* Em meu caminho."); // from "UNDERTALE"
	text_set("battle_nobody", "* (But nobody came.)", "* (Mas ninguém veio.)"); // from "UNDERTALE"
	i = 0;
	text_set($"unused_battle_nobody_{i++}", "* (I did them a favor.)");
	text_set($"unused_battle_nobody_{i++}", "* (There'll be more.)");
	text_set($"unused_battle_nobody_{i++}", "* (What's done is done.)");
	text_set($"unused_battle_nobody_{i++}", "* (They deserved it.)");
	text_set($"unused_battle_nobody_{i++}", "* (It's not my fault they're weak.)");
	text_set($"unused_battle_nobody_{i++}", "* (Look at yourself.)"); // from "UNDERTALE"
	text_set($"unused_battle_nobody_{i++}", "* (Look at what you've done.)"); // from "UNDERTALE"
	text_set($"unused_battle_nobody_{i++}", "* (Look at what you've become.)");
	text_set($"unused_battle_nobody_{i++}", "* (It's all your fault.)"); // from "UNDERTALE"
	text_set($"unused_battle_nobody_{i++}", "* (What made you wake up?)"); // from "UNDERTALE"
	text_set($"unused_battle_nobody_{i++}", "* (Somebody is dead because of you.)"); // from "UNDERTALE"
	text_set($"unused_battle_nobody_{i++}", "* (Kill or be killed.)"); // from "UNDERTALE"
	text_set($"unused_battle_nobody_{i++}", "* (Do you think even the worst person can change?)"); // from "UNDERTALE"
		// TESTGUY's battle
	text_set("battle_main_test", "* (Ugh...^1 That TESTGUY again?!)");
	i = 0;
	text_set($"battle_main_test_{i++}", "* (You feel TESTGUY crawling on your back.)"); // from "UNDERTALE"
	text_set($"battle_main_test_{i++}", "* (TESTGUY is just standing there...^1 menacingly.)"); // from "SpongeBob SquarePants"
	text_set($"battle_main_test_{i++}", "* (TESTGUY's grin is shining.)");
	text_set($"battle_main_test_{i++}", "* (TESTGUY is singing a beautiful song about slavery.)"); // I have NO IDEA of the meaning of this line I wrote in 2023 or whatever. What the fuck is this referencing.
	text_set($"battle_main_test_{i++}", "* (TESTGUY does something.)^4 &* (Something...^2 testable.)");
	text_set("battle_act_result_test_0_0", "* \"TESTGUY\" [:R0 ATK;D | :B0 DEF;D]^3 &* (Likes to be tested on.)^1 &* (Or not,^3 I don't really care.)");
	text_set("battle_act_result_test_1_0", "* Hello Mr. Jippity");
	text_set("battle_act_result_test_1_1", "GET OUT ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !");
	text_set("battle_act_result_test_1_2", "* Sorry...");
	text_set($"battle_bubble_test_0_0", "Hello there");
	i = 0;
	text_set($"battle_bubble_test_1_{i++}", "Is everything working properly?");
	text_set($"battle_bubble_test_1_{i++}", "... Yeah?^1 Wow.^1 Thanks");
	i = 0;
	text_set($"battle_bubble_test_2_{i++}", "You know what I love the most?");
	text_set($"battle_bubble_test_2_{i++}", "You.^1 &Humans.^1 &All of you.");
		// Dummy's battle
	z = 0;
	i = 0;
	text_set($"battle_main_dummy_{z}_{i++}", "* There you go!^1 &* Now we may begin&our lesson.", "* Agora sim!^1 &* Vamos dar início&à nossa aula.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Have you noticed the :Ufour buttons;D at the bottom of the menu?", "* Você percebeu os&:Uquatro botões;D na&base do menu?");
	text_set($"battle_main_dummy_{z}_{i++}", "* You can use them&to interact with&the enemies.", "* Você pode utilizá-los para interagir com os inimigos.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Try :RATTACKing;D the dummy through the leftmost button :U[FIGHT];D.", "* Tente :RATACAR;D o boneco através do botão mais&à esquerda :U[LUTAR];D.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Following your strike,^1 the opponent's turn&will initiate.", "* Em seguida,^1 a rodada do oponente irá se iniciar.");
	text_set($"battle_main_dummy_{z}_{i++}", "* You will be forced to,^3 once again,^1 helplessly dodge its attacks.", "* Você será forçado à,^3 mais uma vez,^3 correr&pela sua vida.");
	text_set($"battle_main_dummy_{z}_{i++}", "* (:@@MEE6;D wants you&to use \\:U[FIGHT];D.)", "* (:@@MEE6;D quer que&você use :U[LUTAR];D.)");
	z += 2;
	i = 0;
	text_set($"battle_main_dummy_{z}_{i++}", "* That was great!", "* Excelente!");
	text_set($"battle_main_dummy_{z}_{i++}", "* :RATTACKing;D your opponents to death is one route to win :Y[Battle Together];D...", "* :RATACAR;D seus oponentes até a morte é uma rota rumo a vitória..."); // references the Genocide route
	text_set($"battle_main_dummy_{z}_{i++}", "* ... though not&the only one.", "* ... embora não&seja a única.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Another method is through friendly conversation.", "* Outro método é através de conversas amigáveis."); // "[...] strike up a friendly conversation" from "UNDERTALE"
	text_set($"battle_main_dummy_{z}_{i++}", "* Within the :U[ACT];D button,^1 you can :Y[Check];D an enemy of your choice.", "* Dentro do botão :U[AGIR];D,^1 você pode :Y[Checar];D um inimigo de sua escolha.");
	text_set($"battle_main_dummy_{z}_{i++}", "* The :Y[Check];D option provides more details about the chosen enemy.", "* A opção :Y[Checar];D fornece mais informações sobre o inimigo escolhido.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Simply put,^1 it is easier for it to like you if you know what it likes.", "* Em resumo,^1 fazê-lo gostar de você é fácil ao saber do que ele \\gosta.");
	text_set($"battle_main_dummy_{z}_{i++}", "* (:@@MEE6;D wants you&to :Y[Check];D Dummy.)", "* (:@@MEE6;D quer que&você :Y[Cheque];D Dummy.)");
	z += 2;
	i = 0;
	text_set($"battle_main_dummy_{z}_{i++}", "* Thanks to :Y[Check];D,^1 you may know enough about Dummy to :U[ACT];D properly.\\", "* Graças à :Y[Checar];D,^1 você sabe o suficiente sobre Dummy para :U[AGIR];D.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Choose an option within :U[ACT];D that reflects Dummy's interests.", "* Escolha uma opção dentro de :U[AGIR];D que reflita os interesses da Dummy.");
	text_set($"battle_main_dummy_{z}_{i++}", "* (:@@MEE6;D wants you&to use :Y[?????];D.)", "* (:@@MEE6;D quer que&você use :Y[?????];D.)");
	z += 2;
	i = 0;
	text_set($"battle_main_dummy_{z}_{i++}", "* There you go!^1 &* The opponent's name&is now :Yyellow;D.", "* Voilà!^1 &* O nome do oponente&está agora :Yamarelo;D.");
	text_set($"battle_main_dummy_{z}_{i++}", "* This means you can :Y[Spare];D that enemy and&win :Y[Battle Together];D!\\", "* Isso significa que você pode :Y[Poupar];D Dummy e ganhar o jogo!");
	text_set($"battle_main_dummy_{z}_{i++}", "* Prior to that,^1 it is essential that I tell you about :U[ITEM];D.", "* Antes disso,^1 é essencial que eu lhe apresente um pouco sobre :U[ITEM];D.");
	text_set($"battle_main_dummy_{z}_{i++}", "* The :U[ITEM];D button permits\\&you to equip or consume items mid-game.", "* O botão :U[ITEM];D lhe permite equipar e utilizar seus itens.");
	text_set($"battle_main_dummy_{z}_{i++}", "* Due to your :YINVENTORY;D being empty,^1 the button is unavailable for use.", "* Dado que seu :YINVENTÁRIO;D está vazio,^1 o botão&está indisponível.");
	text_set($"battle_main_dummy_{z}_{i++}", "* I,^1 however,^1 can&concede you&an item.", "* Eu,^1 entretanto,^1 posso lhe conceder um item.");
	text_set($"battle_main_dummy_{z}_{i++}", "* (:@@MEE6;D picks up and&hands you a brick.)^3 &* (You got :YConcrete Brick;D.)", "* (:@@MEE6;D lhe entrega um tijolo.)^3\\ &* (Você conseguiu&:YTijolo de Concreto;D.)");
	text_set($"battle_main_dummy_{z}_{i++}", "* Proceed with&interacting with&the brick through :U[ITEM];D.\\", "* Prossiga interagindo&com o tijolo através&do botão :U[ITEM];D.");
	text_set($"battle_main_dummy_{z}_{i++}", "* (:@@MEE6;D wants you&to use :U[ITEM];D.)", "* (:@@MEE6;D quer que&você use :U[ITEM];D.)");
	z += 2;
	i = 0;
	text_set($"battle_main_dummy_{z}_{i++}", "* Splendid!^1 &* Our lesson&is complete.", "* Magnífico!^1 &* Nossa aula&está acabada."); // inspired by "Splendid! I am proud of you, little one." from "UNDERTALE"
	text_set($"battle_main_dummy_{z}_{i++}", "* Head to the rightmost button :U[MERCY];D and :Y[Spare];D Dummy.", "* Dirija-se ao botão mais à direita :U[POUPAR];D e :Y[Poupe];D Dummy.");
	text_set($"battle_main_dummy_{z}_{i++}", "* (:@@MEE6;D wants you&to :Y[Spare];D Dummy.)", "* (:@@MEE6;D quer que&você :Y[Poupe];D Dummy.)");
	text_set("battle_enemyname_dummy", "Dummy");
	text_set("battle_act_dummy_1", "Talk", "Falar");
	text_set("battle_act_dummy_2", "Scream", "Gritar");
	text_set("battle_act_result_dummy_0_0", "* \"Dummy\" [:R0 ATK;D | :B0 DEF;D]^3 &* (A training dummy made&to look like a cat.)", "* \"Dummy\" [:R0 ATK;D | :B0 DEF;D]^3 &* (Uma boneca de pano criada para ser parecida com um gato.)");
	text_set("battle_act_result_dummy_0_1", "* (Her body is made out of&cloth and artificial fur.)", "* (O corpo dela é feito de tecido e de pelo artificial.)");
	text_set("battle_act_result_dummy_0_2", "* (Even though she don't have much to say,^1 she's a great listener.)", "* (Mesmo que ela não tenha&muito a dizer,^1 ela é uma&ótima ouvinte.)");
	text_set("battle_act_result_dummy_1_0", "* (You try to talk with Dummy,^1 but you can't think of any&conversation topics...)", "* (Você tenta conversar com Dummy,^1 mas você não consegue pensar em um assunto...)"); // from "UNDERTALE"
	text_set("battle_act_result_dummy_1_1_0_0", "* (You have a passing conversation about&", "* (Você tem uma longa conversa&sobre ");
	text_set("battle_act_result_dummy_1_1_0_1_0", "cats", "gatos");
	text_set("battle_act_result_dummy_1_1_0_1_1", "dogs", "cachorros");
	text_set("battle_act_result_dummy_1_1_0_1_2", "birds", "pássaros");
	text_set("battle_act_result_dummy_1_1_0_1_3", "bees", "abelhas");
	text_set("battle_act_result_dummy_1_1_0_2", " with Dummy.)", " com Dummy.)");
	text_set("battle_act_result_dummy_1_1_1", "* (The blush on her face&seems to get redder...)^3 &* (Dummy's :YMERCY;D up :U100%;D!)", "* (O rosto dela parece&ficar mais rosa...)^3 &* (Sua :YPIEDADE;D subiu :U100%;D!)");
	text_set("battle_act_result_dummy_2_0", "* (You loudly scream&to Dummy's face.)", "* (Você grita na cara da Dummy.)");
	text_set("battle_act_result_dummy_2_1", "* (Tears flow down&out of her eyes.)", "* (Lágrimas escorrem&de seus olhos.)");
	i = 0;
	text_set($"battle_act_result_dummy_2_2_{i++}", "* That was the&wrong option.", "* Essa é a opção errada.");
	text_set($"battle_act_result_dummy_2_2_{i++}", "* You are an \"interesting\" individual.", "* Você é um indivíduo \"interessante\"."); // inspired by "You are an... 'interesting' child." from "UNDERTALE"
	text_set($"battle_act_result_dummy_2_2_{i++}", "* I knew your kind was&excessive,^1 but nothing near this.", "* Eu sabia que sua espécie era excessiva,^1 mas nunca imaginei isso.");
	text_set($"battle_act_result_dummy_2_2_{i++}", "* Out of curiosity,^1 were you ever dropped on your head as an infant?", "* Por curiosidade,^1 você foi jogado de cabeça no chão na infância?");
	text_set($"battle_act_result_dummy_2_2_{i++}", "* ...");
	i = 0;
	text_set($"battle_bubble_m6_dummy_0_{i++}", "When you were tortured by that terrible creature, ...", "Quando você foi torturado pela aquela criatura terrível, ..."); // inspired by "What a terrible creature, torturing such a poor, innocent youth" from "UNDERTALE"
	text_set($"battle_bubble_m6_dummy_0_{i++}", "... your only option was to dodge its attacks.", "Sua única opção era desviar de seus ataques.");
	text_set($"battle_bubble_m6_dummy_0_{i++}", "I will concede you the ;@@Member;D role,^1 which permits you to fight back.", "Vou concedê-lo o cargo ;@@Membro;D,^1 o qual o permite revidar o ataque.");
	text_set($"battle_bubble_m6_dummy_0_{i++}", "Hold on a moment.", "Aguarde um instante.");
		// Armsguy's battle
	text_set("battle_main_armsguy", "* (Armsguy jumps in your way!)", "* (Armsguy pula em seu caminho!)");
	text_set("battle_main_armsguy_geno", "* (I step into Armsguy's way.)", "* (Eu entro no&caminho do Armsguy.)");
	i = 0;
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy flexes his arms&too hard and pukes.)", "* (Armsguy flexiona seus braços com muita força e vomita.)");
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy drinks his own sweat and realizes it isn't sweat.)", "* (Armsguy bebe seu próprio suor e percebe que não é suor.)");
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy kisses his own arm and gets slime around his mouth.)", "* (Armsguy beija o próprio braço e fica com slime na boca.)");
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy finds a wet sock inside his mouth and&throws it away.)", "* (Armsguy encontra uma meia molhada dentro da boca e&joga-a para longe.)");
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy pulls rotten&meat out of his mouth&and eats it again.)", "* (Armsguy puxa uma carne&podre de dentro da boca&e come-a de novo.)");
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy is munching&on a dirty needle.)", "* (Armsguy está mastigando&uma seringa suja.)"); // inspired by "Armsguy munches on a dirty needle" by Mawri
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy is punching the air in an attempt to intimidate you.)", "* (Armsguy está dando socos no ar na tentativa de te assustar.)");
	text_set($"battle_main_armsguy_{i++}", "* (Armsguy is calling the other monsters in the room to watch him destroy you.)", "* (Armsguy está chamando os outros monstros no quarto&para vê-lo te destruir.)");
	text_set("battle_act_armsguy_1", "Take Slime", "Tirar Slime");
	text_set("battle_act_armsguy_2", "Fake Punch", "Soco Falso"); // "Fake Attack" from "UNDERTALE"
	i = 0;
	text_set($"battle_act_result_armsguy_0_{i++}", "* \"Armsguy\" :R[5 ATK ;D| :B4 DEF];D^3 &* (A slime with arms who came&to life inside a trash bag.)", "* \"Armsguy\" :R[5 ATQ ;D| :B4 DEF];D^3 &* (Um slime com braços que nasceu dentro de um saco de lixo.)");
	text_set($"battle_act_result_armsguy_0_{i++}", "* (He's obsessed with his own arms and can't accept being weaker than you.)", "* (Ele é obcecado pelos próprios braços e não aceita ser mais fraco que você.)");
	text_set($"battle_act_result_armsguy_0_{i++}", "* (He's also a masochist...?)", "* (Ele também é masoquista...?)");
	text_set($"unused_battle_act_result_armsguy_0_{i++}", "* (He likes bodybuilding,^3 strength,^3 arms and slime.)");
	text_set("battle_act_result_armsguy_1_0", "* (You try to take some slime from Armsguy's arms,^3 but he slaps your hand away...)", "* (Você tenta tirar o slime dos braços do Armsguy,^3 mas ele dá um tapa na sua mão...)");
	text_set("battle_act_result_armsguy_1_1", "* (Armsguy's :YMERCY;D down :R100%;D.)", "* (:YPIEDADE;D do Armsguy caiu :R100%;D.)");
	text_set("battle_act_result_armsguy_2_0", "* (You punch Armsguy's face pretending to use your&full strength...)", "* (Você bate no rosto do Armsguy fingindo que é com força...)");
	text_set("battle_act_result_armsguy_2_1", "* (Armsguy's :YMERCY;D up :U100%;D!)", "* (:YPIEDADE;D do Armsguy&subiu :U100%;D!)");
	text_set("battle_bubble_armsguy_0", "+F1Lemme Be Slimy.", "+F1Decha Eu Ser Slime.");
	text_set("battle_bubble_armsguy_1", "+F1Punch Me In Da Face!", "+F1Bater Eu Na Cara!");
	text_set("battle_bubble_armsguy_2", "+F1Use Ya Strength In Me!", "+F1Usar Vc Forca Em Eu!");
	text_set("battle_bubble_armsguy_3", "+F1Ya Never Be Strong Like Me.", "+F1Tu Nunca Ser Forte Tipo Eu.");
	text_set("battle_bubble_armsguy_4", "+F1Bro Ya Gotta Go To Da Gym.", "+F1Man Vc Tem Ir Pra Cademia.");
	text_set("battle_bubble_armsguy_5", "+F1... Wat?^1 &\"Leg Day\"?", "+F1... Q?^1 \"Dia De Perna\"?");
	text_set("battle_bubble_armsguy_6", "+F1Me Stronger Than Ya.", "+F1Eu Mas Forte Que Vc.");
	text_set("battle_bubble_armsguy_7", "+F1Want Break Ya Legs?", "+F1Querer Quebra Vc Perna?");
	text_set("battle_bubble_armsguy_8", "+F1Goo Job Bro.", "+F1Man Shou Da Bola.");
	text_set("battle_bubble_armsguy_9", "+F1Me Believe In Ya.", "+F1Eu Acredirtar Em Vc.");
	text_set("battle_bubble_armsguy_10", "+F1That How Ya Do It.", "+F1Assim Que Se Fas.");
	text_set("battle_bubble_armsguy_11", "+F1Make Like Tree And Go Outta Here.", "+F1Picar Mula E Mancar Fora Daqui."); // references "Back to the Future Part II"
	text_set("battle_bubble_armsguy_12", "+F1Hit Da Road,^1 Jackass.", "+F1Vasar Daqui,^1 Buro."); // "Hit Da Road, Jackass" references "Hit the Road Jack"
	text_set("battle_bubble_armsguy_13", "+F1I Kill Ya.", "+F1Eu Mato Vc.");
	text_set("battle_bubble_armsguy_clean_0", "+F1Back Off Dumbass!!!!", "+F1Sair Daqui Indiota!");
	text_set("battle_bubble_armsguy_clean_1", "+F1Take Ya Hands Off Me Arms!!!!", "+F1Tirar Mao Do Eu Brasso!!!!");
	text_set("battle_bubble_armsguy_clean_2", "+F1Don Touch Me Arms!!!!", "+F1Nn Pega Eu Brasso!!!!");
	text_set("battle_bubble_armsguy_punch_0", "+F1Ouch!!^1 Keep Going.", "+F1Ai!!^1 Nn Parar.");
	text_set("battle_bubble_armsguy_punch_1", "+F1Mweheheh!!^1 Me Like It!", "+F1Huehuehueh!!^1 Eu Gotar Iço!");
	text_set("battle_bubble_armsguy_punch_2", "+F1Congrats,^1 Me Luv It!", "+F1Parabems,^1 Eu Amar Iço!");
		// Trashguy's battle
	text_set("battle_main_trashguy", "* (Trashguy rolls into your way!)", "* (Trashguy cai em seu caminho!)");
	text_set("battle_main_trashguy_geno", "* (I step into Trashguy's way.)", "* (Eu entro no caminho do Trashguy.)");
	i = 0;
	text_set($"battle_main_trashguy_{i++}", "* (Trashguy seems to be&eating moldy bread.)", "* (Trashguy parece estar&comendo pão mofado.)");
	text_set($"battle_main_trashguy_{i++}", "* (Trashguy is cleaning themselves with dirty&toilet paper.)", "* (Trashguy está se limpando&com papel higiênico sujo.)");
	text_set($"battle_main_trashguy_{i++}", "* (Trashguy finds a plastic&bag with vomit inside and&drinks it.)", "* (Trashguy encontra um saco plástico com vômito dentro&e bebe tudo.)");
	text_set($"battle_main_trashguy_{i++}", "* (Trashguy takes a rotten egg and throws it at the nearest wall.)", "* (Trashguy pega um ovo podre e&o joga na parede mais próxima.)");
	text_set($"unused_battle_main_trashguy_{i++}", "* (Trashguy looks like it's&going to fall over.)", "* (Trashguy parece que vai cair.)"); // inspired by "Dummy looks like it's going to fall over" from "UNDERTALE"
	text_set("battle_act_trashguy_1", "Empty", "Esvaziar");
	text_set("battle_act_trashguy_2", "Kick", "Chutar");
	text_set("battle_act_result_trashguy_0_0", "* \"Trashguy\" :R[4 ATK ;D| :B7 DEF];D^3 &* (A mysterious creature who lives inside a trash can.)", "* \"Trashguy\" :R[4 ATQ ;D| :B7 DEF];D^3 &* (Uma criatura misteriosa que vive dentro de uma lixeira.)");
	text_set("battle_act_result_trashguy_0_1", "* (Strangely,^1 they really&hate the smell of garbage.)", "* (Estranhamente,^1 ele odeia profundamente o cheiro de lixo.)");
	text_set("battle_act_result_trashguy_1_0", "* (You reach into Trashguy's trash can and pull some&of the garbage out...)", "* (Você enfia a mão dentro da lata de lixo do Trashguy e&puxa lixo para fora...)");
	text_set("battle_act_result_trashguy_1_1", "* (Trashguy's :YMERCY;D up :U100%;D!)", "* (:YPIEDADE;D do Trashguy&subiu :U100%;D!)");
	text_set("battle_act_result_trashguy_2_0", "* (You kick Trashguy's trash can with your full strength...)", "* (Você chuta a lata de lixo&do Trashguy com toda a sua força restante...)");
	text_set("battle_act_result_trashguy_2_1", "* (Trashguy's :YMERCY;D up :U100%;D...?)", "* (:YPIEDADE;D do Trashguy&subiu :R100%;D...?)");
	i = 0;
	text_set($"battle_bubble_trashguy_{i++}", "+F1...i cant handle this smell...", "+F1...eu n aguento esse cheiro...");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...i just want all this trash to go away...", "+F1...eu so quero que todo esse lixo va embora...");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...this smell is terrible...", "+F1...esse cheiro e terrivel...");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...i think im gonna fall over...", "+F1...eu acho que eu vo cair...");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...why do they always put trash in here...?", "+F1...pq eles sempre jogam lixo aqui dentro...?");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...thanks...", "+F1...obg...");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...youre different...", "+F1...vc e diferente...");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...why do you like me...?", "+F1...pq vc gosta de mim...?");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...cant you just leave me alone...?", "+F1...tu n pode so me deixar sozinho...?");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...why are you like this...?", "+F1...pq voce e assim...?");
	text_set($"battle_bubble_trashguy_{i++}", "+F1...youre just like them...", "+F1...vc e igual a eles...");
	i = 0;
	text_set($"battle_bubble_trashguy_empty_{i++}", "+F1...this is so much better...", "+F1...isso e muito melhor...");
	text_set($"battle_bubble_trashguy_empty_{i++}", "+F1...you didnt have to...", "+F1...voce n precisava...");
	text_set($"battle_bubble_trashguy_empty_{i++}", "+F1...why are you being nice to me...?", "+F1...pq vc ta sendo legal comigo...?");
	i = 0;
	text_set($"battle_bubble_trashguy_kick_{i++}", "+F1...please,^1 stop...", "+F1...pfv,^1 para...");
	text_set($"battle_bubble_trashguy_kick_{i++}", "+F1...but why,^1 though...?", "+F1...mas pq...?"); // inspired by "Why, though?" from "Five Nights at Freddy's: Security Breach". I'm slightly embarrassed by this inspiration honestly
	text_set($"battle_bubble_trashguy_kick_{i++}", "+F1...what did i do to you...?", "+F1...oq eu te fiz...?");
		// Flitcher's battle
	text_set("battle_main_flitcher", "* (Flitcher suddenly&appears in your way!)", "* (Flitcher de repente&aparece em seu caminho!)");
	text_set("battle_main_flitcher_geno", "* (I step into Flitcher's way.)", "* (Eu entro no caminho do Flitcher.)");
	i = 0;
	text_set($"battle_main_flitcher_{i++}", "* (Flitcher stares blankly&to north and south.)", "* (Flitcher olha fixamente&para norte e sul.)");
	text_set($"battle_main_flitcher_{i++}", "* (Flitcher doesn't seem&to know why it's here.)", "* (Flitcher não parece saber&o porquê de estar aqui.)"); // from "UNDERTALE"
	text_set($"battle_main_flitcher_{i++}", "* (Flitcher is moving its&tongue back and forth.)", "* (Flitcher está movendo&sua língua para frente&e para trás.)");
	text_set($"battle_main_flitcher_{i++}", "* (Flitcher doesn't think,^3 therefore it isn't.)", "* (Flitcher não pensa,^3 \\&logo não é.)"); // references "I think, therefore I am"
	text_set($"battle_main_flitcher_{i++}", "* (Flitcher is daydreaming.)", "* (Flitcher está no&mundo da lua.)");
	text_set($"unused_battle_main_flitcher_{i++}", "* (Flitcher is just there.)");
	text_set("battle_act_flitcher_1", "Talk", "Falar");
	text_set("battle_act_flitcher_2", "Wave", "Acenar");
	text_set("battle_act_result_flitcher_0_0", "* \"Flitcher\" :R[3 ATK;D | :B6 DEF];D^3 &* (A reptile-like monster who's unaware of its own existence.)", "* \"Flitcher\" :R[3 ATQ;D | :B6 DEF];D^3 &* (Ele não tem consciência&sobre sua própria existência.)");
	text_set("battle_act_result_flitcher_0_1", "* (It avoids eye contact and any social interaction that involves talking.)", "* (Ele evita contato visual&e qualquer interação que&envolva falar.)");
	text_set("battle_act_result_flitcher_1_0", "* (You quietly say \"hi\"&to Flitcher...)", "* (Você fala \"oi\" em voz&baixa para Flitcher...)");
	text_set("battle_act_result_flitcher_1_1", "* (It seems scared.)^3 \\&* (Flitcher's :YMERCY;D down :R100%;D.)", "* (Ele parece estar com medo.)^3 \\&* (:YPIEDADE;D de Flitcher&caiu :R100%;D.)");
	text_set("battle_act_result_flitcher_2_0", "* (You gently wave your&hand to Flitcher...)", "* (Você gentilmente&acena para Flitcher...)");
	text_set("battle_act_result_flitcher_2_1", "* (It seems happy.)^3 \\&* (Flitcher's :YMERCY;D up :U100%;D!)", "* (Ele parece estar feliz.)^3 \\&* (:YPIEDADE;D de Flitcher&subiu :U100%;D!)");
		// Eyecrush's battle (Unused)
	text_set("unused_battle_main_eyecrush", "* (Eyecrush crawls into your way!)");
	text_set("unused_battle_main_eyecrush_geno", "* (I step into Eyecrush's way.)");
	text_set("unused_battle_main_eyecrush_0", "* (Eyecrush is looking at you.)");
	text_set("unused_battle_main_eyecrush_1", "* (Eyecrush is focused on your movements.)");
	text_set("unused_battle_main_eyecrush_2", "* (Eyecrush is happy he has more legs than you.)");
	text_set("unused_battle_main_eyecrush_3", "* (Eyecrush likes to drink eye drops for breakfast.)");
	text_set("unused_battle_main_eyecrush_4", "* (Eyecrush has set an unnoficial record for the longest time without blinking.)");
	text_set("unused_battle_act_eyecrush_1", "Hypnotize");
	text_set("unused_battle_act_eyecrush_2", "Dance");
	text_set("unused_battle_act_result_eyecrush_0_0", "* \"Eyecrush\" :R[6 ATK;D | :B0 DEF];D^3 &* (This monster is a big human eye with six red legs._");
	text_set("unused_battle_act_result_eyecrush_0_1", "* (Their inability to verbally communicate makes difficult&to know their interests.)");
	text_set("unused_battle_act_result_eyecrush_1_0", "* (You did something mysterious and hypnotized Eyecrush.)"); // "You did something mysterious" from "UNDERTALE"
	text_set("unused_battle_act_result_eyecrush_1_1", "* (This effect lasts for two turns.)");
	text_set("unused_battle_act_result_eyecrush_2_0", "* (You imitate the movements from a korean music video&you watched.)");
	text_set("unused_battle_act_result_eyecrush_2_1_0", "* (Eyecrush didn't understand what you did,^1 but liked it anyway.)"); // from "UNDERTALE"
	text_set("unused_battle_act_result_eyecrush_2_1_1", "* (Eyecrush couldn't understand what you did due to the hypnotization.)");
		// Broken Clock's battle
	text_set("battle_main_brock", "* (Broken Clock blocks your way{punctuation})", "* (Broken Clock bloqueia&o seu caminho{punctuation})");
	i = 0;
	text_set($"battle_main_brock_{i++}", "* (Broken Clock is flying&around the room.)", "* (Broken Clock está voando&ao redor do quarto.)"); // references "time flies" idiom
	text_set($"battle_main_brock_{i++}", "* (Broken Clock is bursting&with electricity.)", "* (Broken Clock está pulsando&de eletricidade estática.)");
	text_set($"battle_main_brock_{i++}", "* (Broken Clock is having&the time of his life.)", "* (Broken Clock está voando contra o tempo.)"); // "is having the time of his life" references Broken Clock; "voando contra o tempo" references Broken Clock
	text_set($"battle_main_brock_{i++}", "* (Broken Clock is breaking&laws of time and space.)", "* (Broken Clock está quebrando&leis do espaço e do tempo.)"); // inspired by "They say he shattered across time and space" from "UNDERTALE"
	text_set($"battle_main_brock_{i++}", "* (Broken Clock is the proof that time doesn't heal all wounds.)", "* (Broken Clock é a prova de&que o tempo não cura tudo.)"); // "time doesn't heal all wounds" idiom references Broken Clock
	text_set($"battle_main_brock_{i++}", "* (Broken Clock's movements&are making you dizzy.)", "* (Os movimentos do Broken Clock estão deixando você tonto.)");
	text_set($"battle_main_brock_{i++}", "* (Even Broken Clock is&right twice a day.)", "* (Até Broken Clock está&certo duas vezes ao dia.)"); // references "even a broken clock is right twice a day" idiom
	text_set($"battle_main_brock_{i++}", "* (:@@MEE6;D is insulting Broken Clock under his nonexistent breath.)", "* (:@@MEE6;D está insultando Broken&Clock e toda a sua família.)");
	text_set($"battle_main_brock_{i++}", "* (:@@MEE6;D throws leaves at&Broken Clock and misses&every one of them.)", "* (:@@MEE6;D pega folhas do chão&e joga-as em Broken Clock,^3 \\&errando todas.)");
	text_set($"battle_main_brock_{i++}", "* (You feel your hair being pulled by static eletricity.)", "* (Você sente seu cabelo voando com a eletricidade estática.)");
	text_set($"battle_main_brock_{i++}", "* (You feel the power of&1.21 gigawatts coursing&through your nervous system.)", "* (Você sente o poder de 1,21 gigawatts percorrendo o seu sistema nervoso.)"); // "1.21 gigawatts" references "Back to the Future" (1985)
	text_set($"battle_main_brock_{i++}", "* (Reading this doesn't seem&like the best use of time.)", "* (Ler isso não parece ser o melhor uso do seu tempo.)"); // from "UNDERTALE"
	text_set("battle_act_result_brock_0_0", "* \"Broken Clock\" :R[12 ATK;D | :B0 DEF];D^3 \\&* (A malfunctioning analog clock possessed by a ghost.)", "* \"Broken Clock\" :R[12 ATQ;D | :B0 DEF];D^3 \\&* (Um relógio analógico quebrado e possuído por um fantasma.)"); // "12" references a 12-hour clock
	text_set("battle_act_result_brock_0_1", "* (He has nothing to lose&besides his life.)", "* (Ele tem nada a perder&além da própria vida.)");
	text_set("battle_act_brock_1", "Negotiate", "Negociar");
	text_set("battle_act_result_brock_1_0_0", "* (You promise Broken Clock to spare him if he spares you...)", "* (Você promete a Broken Clock poupá-lo se ele poupar você...)");
	text_set("battle_act_result_brock_1_1_0", "* (He considers the possibility.)^3 \\&* (Broken Clock's :RATTACK;D down!)", "* (Ele considera a possibilidade.)^3 \\&* (:RATAQUE;D do Broken Clock caiu!)");
	text_set("battle_act_result_brock_1_0_1", "* (You propose handing over your weapon to Broken Clock...)", "* (Você propõe entregar sua&arma a Broken Clock...)");
	text_set("battle_act_result_brock_1_1_1", "* (He declines it,^3 but likes&that you tried anyway.)^3 &* (Broken Clock's :FSPEED;D down!)", "* (Ele recusa,^3 mas gosta que você tenha tentado mesmo assim.)^3 \\&* (:FVELOCIDADE;D do B. Clock caiu!)");
	text_set("battle_act_brock_2", "Insult", "Insultar"); // inspired by "Insult" and "Threat" from "UNDERTALE"
	i = 0;
	text_set($"battle_act_result_brock_2_{i++}", "* (You stare Broken Clock right in the eyes and shout...)", "* (Você encara Broken Clock&olho nos olho e grita...)"); 
	text_set($"battle_act_result_brock_2_{i}", "* (... \"You're {insult}\".)", "* (...\"Você é {insult}\".)");
	z = 0;
	text_set($"battle_act_result_brock_2_{i}_{z++}", "a stupid&doodoo butt", "um bundão bobão"); // from "UNDERTALE"
	text_set($"battle_act_result_brock_2_{i}_{z++}", "&the legendary&fartmaster", "o mestre peidorreiro supremo"); // from "UNDERTALE"
	text_set($"battle_act_result_brock_2_{i}_{z++}", "a filthy&single minder", ""); // from "UNDERTALE"
	text_set($"battle_act_result_brock_2_{i}_{z++}", "a goofy goober", "um amendobobo"); // references "Spongebob SquarePants Movie"
	text_set($"battle_act_result_brock_2_{i}_{z++}", "nothing&but a little chicken", ""); // from "Back to the Future Part II"
	text_set($"battle_act_result_brock_2_{i}_{z++}", "&a seedling&of Satan", "uma&semente do Diabo"); // from "South Park"
	text_set($"battle_act_result_brock_2_{i}_{z++}", "a teeny&tiny ding-a-ling", "um pintinho pequenininho");
	text_set($"unused_battle_act_result_brock_2_{i}_{z++}", "a dirty brother killer"); // from "UNDERTALE"
	text_set($"unused_battle_act_result_brock_2_{i}_{z++}", "a miserable creature"); // from "UNDERTALE"
	text_set($"unused_battle_act_result_brock_2_{i}_{z++}", "a fool of a took"); // from "Lord of the Rings"
	text_set($"unused_battle_act_result_brock_2_{i}_{z++}", "a worthless&cock nugget");
	i += 1;
	text_set($"battle_act_result_brock_2_{i}_0", "* (Broken Clock seems to be unsure on how to react...)", "* (Broken Clock não parece&saber como reagir...)");
	text_set($"battle_act_result_brock_2_{i}_1", "* (Broken Clock is very disappointed with your&swearing power...)", "* (Broken Clock está bem decepcionado com sua capacidade de xingamento...)");
	i += 1;
	text_set($"battle_act_result_brock_2_{i}_0", "* (Broken Clock's :FSPEED;D&down :U20%;D for two turns!)", "* (:FVELOCIDADE;D do Broken Clock caiu :U20%;D por duas rodadas!)");
	text_set($"battle_act_result_brock_2_{i}_1", "* (Broken Clock's :FSPEED;D&up :R20%;D for two turns.)", "* (:FVELOCIDADE;D do Broken Clock subiu :R20%;D por duas rodadas.)");
	text_set("battle_act_brock_3", "Convince", "Convencer"); // from "DELTARUNE"
	text_set("battle_act_result_brock_3_0", "* (What will you say?)", "* (O que você vai dizer?)");
	text_set("battle_act_result_brock_3_1_0_1", "I don't want\nto hurt you", "Eu não quero\nte machucar");
	text_set("battle_act_result_brock_3_1_0_2", "You're going\nto be okay", "Você vai\nficar bem");
	text_set("battle_act_result_brock_3_1_1_1", "I don't know\nwhere I am", "Eu não sei\nonde eu tô");
	text_set("battle_act_result_brock_3_1_1_2", "I just want\nto help you", "Eu só quero\nte ajudar");
	text_set("battle_act_result_brock_3_1_2_1", "I didn't do\nanything", "Eu não\nfiz nada");
	text_set("battle_act_result_brock_3_1_2_2", "I just want\nto go home", "Eu só quero\nir pra casa");
	text_set("battle_act_result_brock_3_1_3_1", "I didn't want\nto bother you", "Eu não queria\nte incomodar");
	text_set("battle_act_result_brock_3_1_3_2", "I know how you\nare feeling", "Eu sei o que\nvocê está\nsentindo");
	text_set("battle_act_result_brock_3_1_4_1", "I'm sorry", "Me desculpa");
	text_set("battle_act_result_brock_3_1_4_2", "You are\noverreacting", "Você tá\nexagerando")
	text_set("battle_act_result_brock_3_2_0", "* (Wrong choice...?)", "* (Escolha errada...?)"); // from "DELTARUNE"
	text_set("battle_act_result_brock_3_2_1_prefix", "* (Broken Clock seems to be willing to trust you...)^3 &", "* (Broken Clock parece&disposto a confiar em você...)^3 \\&");
	text_set("battle_act_result_brock_3_2_1", "* (Broken Clock's :YMERCY;D up :U20%;D!)", "* (:YPIEDADE;D do B. Clock subiu \\:U20%;D!)");
	text_set("battle_act_result_brock_convinced", "* (It doesn't matter anymore.)", "* (Não importa mais.)");
	z = 0;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU KNOW WHAT I HATE THE MOST?!?", "+F1+S2SABE O QUE EU&MAIS ODEIO?!?");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU.^1 HUMANS.^1 \\&ALL OF YOU!!!!", "+F1+S2VOCÊ.^1 HUMANOS.^1 TODOS VOCÊS!!!!");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2HUMANS ARE ALL&THE SAME.", "+F1+S2HUMANOS SÃO&TODOS IGUAIS.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2THEY DON'T CARE ABOUT ANYBODY&OR ANYTHING.", "+F1+S2ELES NÃO SE IMPORTAM COM&NADA OU NINGUÉM.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2ALL THEY WANT IS POWER,^1 MONEY,^1 FAME,^1 WOMEN,^2 ...^2 &+D0+F1Or whatever.", "+F1+S2ELES SÓ QUEREM PODER,^1 DINHEIRO,^1 FAMA,^1 MULHERES,^1 ...^2 +D0+F1Ou sei lá.");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2LET ME GIVE'YA AN EXAMPLE.", "+F1+S2DEIXA EU TE DAR UM EXEMPLO.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2TWO NEW MEMBERS CAME IN AND DESTROYED THE CORRIDORS.", "+F1+S2DOIS NOVOS MEMBROS VIERAM E DESTRUÍRAM OS CORREDORES.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2AND IF THAT&WASN'T ENOUGH,^1 &THEY BROKE ME.", "+F1+S2E SE ISSO NÃO FOSSE SUFICIENTE,^1 ELES ME QUEBRARAM.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2WITHOUT ANY REGRET!!!!", "+F1+S2COM NEM&UM PINGO DE ARREPENDIMENTO!!!!");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2THEN,^3 THE ADMINS ABANDONED THIS PLACE.", "+F1+S2AÍ,^3 OS ADMINS ABANDONARAM&ESSE LUGAR.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2THE CORRIDORS WERE DESTROYED AND ALMOST USELESS.", "+F1+S2OS CORREDORES ESTAVAM DESTRUÍDOS E QUASE INÚTEIS.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2ALL THOSE NEW MEMBERS DID WAS&DESTROY PART OF&OUR WORLD!!!!", "+F1+S2TUDO QUE OS NOVOS MEMBROS FIZERAM FOI DESTRUIR ESSE MUNDO!!!!");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2DO YOU UNDERSTAND WHAT I'M TRY'NA TO SAY?!?", "+F1+S2ENTENDE O QUE EU TÔ TENTANDO TE DIZER?!?");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2HUMANS WILL DO THE WORST THINGS IF THEY FEEL ENTITLED ENOUGH.", "+F1+S2HUMANOS FAZEM AS PIORES COISAS SE ELES SE ACHAREM IMPORTANTES.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2BESIDES,^3 THOSE NEW MEMBERS HAD ABSOLUTELY NO REASON WHATSOEVER.", "+F1+S2AINDA POR CIMA,^3 AQUELES NOVOS MEMBROS NÃO TINHAM NENHUM MOTIVO.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2THEY DID ALL THAT JUST FOR FUN!!!!", "+F1+S2ELES FIZERAM TUDO AQUILO SÓ POR DIVERSÃO!!!!");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU'RE A&NEW MEMBER,^3 &JUST LIKE'EM.", "+F1+S2E VOCÊ É UM NOVO MEMBRO,^3 QUE NEM ELES.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2HOW WOULD I KNOW IF YOU DIDN'T C'MERE TO&KILL ME?!?", "+F1+S2COMO EU VOU SABER SE VOCÊ NÃO VEIO AQUI PRA ME MATAR?!?");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2TO BE HONEST,^1 I DON'T WANNA&KILL'YA.", "+F1+S2NA REAL,^1 EU NÃO QUERO TE MATAR.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2BUT I ALSO DON'T WANT'YA TO TAKE AN INNOCENT LIFE.", "+F1+S2MAS EU TAMBÉM NÃO QUERO QUE VOCÊ MATANDO GENTE INOCENTE.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2WHETHER IT'S MINE OR ANY OTHER MONSTER'S.", "+F1+S2NÃO IMPORTA SE SOU EU OU SE É QUALQUER OUTRO MONSTRO.");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2ALL I'M DOING&IS STOPPIN' A DISASTER BEFORE&IT EVEN HAPPENS.", "+F1+S2TUDO QUE EU TÔ FAZENDO É PARANDO UM DISASTRE ANTES QUE ACONTEÇA.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2I'M STOPPIN' MYSELF FROM REGRETTIN' EVER TRUSTIN'YA.", "+F1+S2EU TÔ ME PARANDO DE SE ARREPENDER DE TER CONFIADO&EM VOCÊ.");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2IT'S NOT MY FAULT IF YOU'RE NOT CONVINCIN'&ENOUGH.", "+F1+S2NÃO É MINHA CULPA SE VOCÊ NÃO É CONVINCENTE O SUFICIENTE."); // hints convincing Broken Clock to win the battle
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2YOU'RE NOT A BOOK.^1 I CAN'T EXACTLY \"READ\" YOU.", "+F1+S2VOCÊ NÃO É UM LIVRO.^1 EU NÃO CONSIGO \"LER\"	VOCÊ.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2I HAVE NO OPTION BUT TO JUDGE'YA&BY YOUR COVER.", "+F1+S2MINHA ÚNICA OPÇÃO É JULGAR VOCÊ PELA TUA CAPA.");
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2NOTHING IS GONNA CHANGE IF'YA DO NOTHING!!!!", "+F1+S2NADA VAI MUDAR SE VOCÊ FIZER NADA!!!!"); // hints convincing Broken Clock to win the battle
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2I HAVE ALL THE&TIME IN THE WORLD,^3 Y'KNOW.", "+F1+S2EU TENHO TODO O TEMPO DO MUNDO,^3 SABE.");
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2I CAN STAND HERE AND FIGHT'YA UNTIL THE END OF TIME.", "+F1+S2EU POSSO FICAR AQUI E BATALHAR COM VOCÊ PRA SEMPRE."); // inspired by "even if it means we have to stand here until the end of time" from "UNDERTALE"
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S2YOUR LIFE IS&IN YOUR OWN&HANDS NOW.", "+F1+S2TUA VIDA TÁ NAS TUAS PRÓPRIAS MÃOS AGORA."); // references the hands of an analog clock
	z += 1;
	i = 0;
	text_set($"battle_bubble_brock_{z}_{i++}", "+F1+S4...");
	i = 0;
	text_set($"battle_bubble_brock_fight_{i++}", "+F1+S2WHAT?!^1 DID'YA REALLY TRY TO&HURT ME?!?", "+F1+S2QUÊ?!?!^1 \\&TU REAL TENTOU BATER EM MIM?!?");
	text_set($"battle_bubble_brock_fight_{i++}", "+F1+S2ARE YOU BLIND?!?!^1 ;RYOU CAN'T HIT ME WHILE IM FLYING;D!!!", "+F1+S2TU É CEGO?!?!^1 \\&;RTU NÃO VAI ME ACERTAR ENQUANTO EU TIVER VOANDO;D!!!");
	text_set($"battle_bubble_brock_fight_{i++}", "+F1+S2NOT WITH THAT&USELESS THING&YOU HAVE.", "+F1+S2NÃO COM ESSA COISA INÚTIL QUE TU TEM.");
	i = 0;
	text_set($"battle_bubble_brock_convince_0_1_{i++}", "+F1+S2YOU DON'T WANNA HURT ME?!?", "+F1+S2TU NÃO QUER ME MACHUCAR?!?");
	text_set($"battle_bubble_brock_convince_0_1_{i++}", "+F1+S2IF THAT'S TRUE,^3 &WHY DO YOU HAVE A WEAPON WITH YOU?!?", "+F1+S2SE ISSO É VERDADE,^3 PORQUE TU TÁ COM UMA ARMA?!?");
	text_set($"battle_bubble_brock_convince_0_1_{i++}", "+F1+S2IS IT...^2^1 &+D0+F1Is it just for SELF-DEFENSE...?", "+F1+S2ELA É...^2^1 \\&+D0+F1Ela é só&pra tu SE&DEFENDER...?");
	i = 0;
	text_set($"battle_bubble_brock_convince_0_2_{i++}", "+F1+S2I'M GONNA BE&OKAY?!^1 REALLY?!?^1 &HOW D'YA KNOW?!?\\", "+F1+S2EU VÔ FICAR BEM?!^1 SÉRIO?!?^1 COMO TU SABE?!?");
	text_set($"battle_bubble_brock_convince_0_2_{i++}", "+F1+S2BECAUSE RIGHT NOW I'M FAR FROM BEING SLIGHTLY \"OKAY\".", "+F1+S2PORQUE AGORA EU&TÔ LONGE DE ESTAR MINIMAMENTE \"BEM\".");
	i = 0;
	text_set($"battle_bubble_brock_convince_1_1_{i++}", "+F1+S2HOW DON'T YOU KNOW&WHERE YOU ARE?!?", "+F1+S2COMO TU NÃO SABE ONDE TU TÁ?!?");
	text_set($"battle_bubble_brock_convince_1_1_{i++}", "+F1+S2YOU WEREN'T INVITED BY ANYONE?!?", "+F1+S2TU NÃO FOI CONVIDADO POR NINGUÉM?!?");
	text_set($"battle_bubble_brock_convince_1_1_{i++}", "+F1+S2I...^2^1 +D0+F1I didn't&know THAT...", "+F1+S2EU...^2^1 \\&+D0+F1Eu não sabia DISSO..."); // slightly inspired by "You're gonna have to try a little harder than THAT" from "UNDERTALE"
	i = 0;
	text_set($"battle_bubble_brock_convince_1_2_{i++}", "+F1+S2AND HOW WOULD'YA HELP ME,^1 EXACTLY?!?\\", "+F1+S2COMO TU IRIA ME AJUDAR,^1 EXATAMENTE?!?");
	text_set($"battle_bubble_brock_convince_1_2_{i++}", "+F1+S2YOU'RE A CHILD,^1 FOR FUCK'S SAKE.", "+F1+S2TU É UMA CRIANÇA,^1 PELO AMOR DE DEUS.");
	text_set($"battle_bubble_brock_convince_1_2_{i++}", "+F1+S2I REALLY DOUBT THAT YOU CAN&FIX ME.", "+F1+S2EU DUVIDO QUE TU CONSIGA ME AJUDAR.");
	i = 0;
	text_set($"battle_bubble_brock_convince_2_1_{i++}", "+F1+S2OH,^1 BUT YOU WILL.^1 &IT'S JUST&A MATTER&OF TIME.", "+F1+S2AH,^1 MAS TU VAI.^1 \\&É SÓ UMA QUESTÃO DE TEMPO."); // references "be [only/just] a matter of time" idiom
	i = 0;
	text_set($"battle_bubble_brock_convince_2_2_{i++}", "+F1+S2YOU...^2 &+D0+F1You just wanna&go HOME...?", "+F1+S2TU...^2 +D0+F1Tu só quer ir pra casa...?");
	text_set($"battle_bubble_brock_convince_2_2_{i++}", "+F1Well,^2 THEN...", "+F1Bom,^2 ENTÃO...");
	i = 0;
	text_set($"battle_bubble_brock_convince_3_1_{i++}", "+F1B-but you DIDN'T,^1 you didn't BOTHER me at ALL...", "+F1M-mas tu NÃO me incomodou,^1 nem&um POUCO...");
	text_set($"battle_bubble_brock_convince_3_1_{i++}", "+F1It's just...", "+F1É só que...");
	i = 0;
	text_set($"battle_bubble_brock_convince_3_2_{i++}", "+F1+S2TELL ME,^1 HOW COULD'YA POSSIBLY KNOW HOW I'M FEELING?!?", "+F1+S2ME DIGA,^1 COMO CARALHOS TU SABE O QUE EU TÔ SENTINDO?!?");
	text_set($"battle_bubble_brock_convince_3_2_{i++}", "+F1+S2IF THAT WERE TRUE,^1 YOU WOULD'VE LET ME KILL'YA ALREADY!!!!", "+F1+S2SE ISSO FOSSE VERDADE,^1 TU JÁ TERIA ME DEIXADO TE MATAR!!!!");
	i = 0;
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1D-did'ya...", "+F1Tu...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1Did'ya say&you're SORRY...?", "+F1Tu pediu DESCULPAS...?");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1But,^2 WHY?!?^1 You...", "+F1Mas,^2 PORQUE?!?^1 Tu...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1You haven't done ANYTHING to me.", "+F1Tu nem fez&NADA comigo.");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1You're NOT the one who broke me.", "+F1Tu NÃO é o que&me quebrou.");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1You're just a KID.\\", "+F1Tu é só uma CRIANÇA.");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1I'M the one that's HURTING you.", "+F1EU sou que tá&te MACHUCANDO.");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1I'M the one that's TRY'na KILL you.\\", "+F1EU sou que tá tentando te MATAR.");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1I-I'M the one that's...", "+F1E-EU sou&o que tá...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4T-that's,^2 uh...", "+F1+S4Que tá,^2 é...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4That's...", "+F1+S4Que tá...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4I'm the,^2 uh...", "+F1+S4Eu sou o que,^2 é...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4I'm...", "+F1+S4Eu...");
	text_set($"battle_bubble_brock_convince_4_1_{i++}", "+F1+S4...");
	i = 0;
	text_set($"battle_bubble_brock_convince_4_2_{i++}", "+F1+S2OVERREACTING?!?^1 &I'M OVERREACTING?!?\\", "+F1+S2EXAGERANDO?!?^1 EU TÔ EXAGERANDO?!?");
	text_set($"battle_bubble_brock_convince_4_2_{i++}", "+F1+S2OH,^1 GO FUCK YOURSELF.", "+F1+S2AH,^1 VAI SE FUDER.");
	i = 0;
	text_set($"battle_bubble_brock_insult_0_{i++}", "+F1+S2... SERIOUSLY?!", "+F1+S2... SÉRIO ISSO?!");
	text_set($"battle_bubble_brock_insult_0_{i++}", "+F1+S2YOU'RE AT THE PEAK OF YOUR IMMATURITY AND THAT'S WHAT'YA SAY?!?", "+F1+S2TU TÁ NO ALTO DA TUA IMATURIDADE&E ISSO É O QUE&TU DIZ?!?");
	text_set($"battle_bubble_brock_insult_0_{i++}", "+F1...^2 Way to go,^1 &I GUESS...?", "+F1...^2 Que bom,^1 \\&eu ACHO...?");
	i = 0;
	text_set($"battle_bubble_brock_insult_1_{i++}", "+F1... Bwahahah!^1 &What does THAT&even MEAN?!", "+F1...Bwahahah!^1 \\&E o quê que ISSO significa?!");
	text_set($"battle_bubble_brock_insult_1_{i++}", "+F1Are'ya just saying RANDOM things to make me LAUGH?!", "+F1Tu tá dizendo coisas ALEATÓRIAS só pra me fazer RIR?!");
	i = 0;
	text_set($"battle_bubble_brock_insult_2_{i++}", "+F1... No,^3 seriously,^1 WHAT does&THAT mean?!", "+F1... Não,^3 sério,^1 \\&o que ISSO significa?!");
	text_set($"battle_bubble_brock_insult_2_{i++}", "+F1Are'ya saying that I'm SINGLE because I'm FILTHY?!");
	i = 0;
	text_set($"battle_bubble_brock_insult_3_{i++}", "+F1... Oh,^1 PLEASE.^1 You're not&even TRYING.", "+F1... Ah,^1 pelo AMOR de DEUS.^1 Tu nem&tá TENTANDO.");
	i = 0;
	text_set($"battle_bubble_brock_insult_4_{i++}", "+F1... Okay,^1 OKAY.^1 You're getting&the HANG of IT!!!^1 FINALLY!!!!", "+F1... Tá,^1 okay.^1 \\&Tu tá \\MELHORANDO!!!^1 FINALMENTE!!!!");
	text_set($"battle_bubble_brock_insult_4_{i++}", "+F1You'll be yelling SWEAR WORDS in&NO TIME!!!", "+F1Daqui a POUCO tu vai tá SÓ gritando PALAVRÃO!!!");
	i = 0;
	text_set($"battle_bubble_brock_insult_5_{i++}", "+F1... Wow.^2 That's a powerful one.", "+F1... Nossa.^2 \\&Que poético.");
	text_set($"battle_bubble_brock_insult_5_{i++}", "+F1I'm speechless,^1 honestly.", "+F1Eu tô impressionado,^1 \\&de verdade.");
	text_set($"battle_bubble_brock_insult_5_{i++}", "+F1That was beautiful.", "+F1Isso foi lindo.");
	i = 0;
	text_set($"battle_bubble_brock_insult_6_{i++}", "+F1+S2... OH,^1 FOR&FUCK'S SAKE.^3 &YOU WERE DOING&SO WELL!!!!", "+F1+S2... AH,^1 PUTA QUE PARIU.^3 TU TAVA INDO TÃO BEM!!!!");
	text_set($"battle_bubble_brock_insult_6_{i++}", "+F1+S2HOW COULD'YA POSSIBLY GO FROM SATAN TO FUCKING DING-A-LING??!?!?", "+F1+S2COMO CARALHOS TU CONSEGUIU IR DO DIABO PRA PINTINHO PEQUENINHO??!?!?");
		// Armsguy, Trashguy, Flitcher & Eyecrush's battles
	text_set("battle_main_armsguy_armsguy", "* (Armsguys jump in your way!)", "* (Armsguys pulam&em seu caminho!)");
	text_set("battle_main_armsguy_armsguy_geno", "* (I step into Armsguys' way.)", "* (Eu entro no&caminho dos Armsguys.)");
	text_set("battle_main_trashguy_armsguy", "* (Trashguy rolls into your way!)^3 \\&* (Armsguy gets jealous and&jumps in to save the day!)", "* (Trashguy cai em seu caminho!)^3 \\&* (Armsguy fica com inveja e aparece para salvar o dia!)");
	text_set("battle_main_trashguy_armsguy_geno", "* (I step into Trashguy's way.)^3 \\&* (Armsguy jumps in&to protect them.)", "* (Eu entro no&caminho do Trashguy.^3 Armsguy aparece para protegê-lo.)");
	text_set("battle_main_armsguy_flitcher", "* (Armsguy jumps in your way!)^3 &* (Flitcher is here,^3 somehow.)\\", "* (Armsguy pula em seu caminho!)^3 \\&* (Flitcher também está&aqui,^3 por algum motivo.)");
	text_set("battle_main_armsguy_flitcher_geno", "* (I step into Armsguy's way.)^3 &* (Flitcher was caught&in the crossfire.)", "* (Eu entro no&caminho do Armsguy.^3 Flitcher é pegue no fogo cruzado.)");
	text_set("unused_battle_main_eyecrush_armsguy", "* (Eyecrush crawls into your way!)^3 &* (Armsguy jumps in to help them!)");
	text_set("unused_battle_main_eyecrush_flitcher", "* (Eyecrush crawls into your way!)^3 &* (Also,^3 one big eye isn't enough.)");
	text_set("battle_main_armsguy_trashguy_flitcher", "* (The whole gang shows up!)", "* (A turma inteira aparece!)");
	text_set("battle_main_armsguy_trashguy_flitcher_geno", "* (I step into their way.)", "* (Eu entro no caminho deles.)");
		// Rhonhey's semi-battle
	i = 0;
	text_set($"battle_bubble_m6_rhonhey_0_{i++}", "Hey!^3 Hey!!^3 You!^1 You over there!!", "Ei!^3 Ei!!^3 \\&Você!^1 Você aí!!");
	text_set($"battle_bubble_m6_rhonhey_0_{i++}", "Stop!^1 Freeze!!^1 Cease and desist!!", "Parado!^1 \\&Mãos na cabeça!!^1 \\&Cesse e desista!!");
	i = 0;
	text_set($"battle_bubble_m6_rhonhey_1_{i++}", "Leave the&baby alone,^3 &you foul beast!", "Deixe o bebê em paz,^3 sua besta medonha!");
	text_set($"battle_bubble_m6_rhonhey_1_{i++}", "You do not&belong here!^1 &Your presence&is unwanted!", "Você não pertence aqui!^1 Sua presença é indesejada!");
	text_set($"battle_bubble_m6_rhonhey_1_{i++}", "Leave!", "Saia!");
	i = 0;
	text_set($"battle_bubble_m6_rhonhey_2_{i++}", "Leave!!!!", "Saia!!!!");
		// Rhonhey's battle
	text_set("battle_main_rhonhey", "* (Rhonhey is ready to eat you alive.)");
	text_set("battle_main_rhonhey_0", "* (Rhonhey is drooling.)");
	text_set("battle_main_rhonhey_1", "* (Rhonhey is getting closer.)");
	text_set("battle_main_rhonhey_2", "* (Rhonhey's cousin lives in a popular plumbing game about turtles.)"); // references Pokey from "Super Mario Bros."
	text_set("battle_main_rhonhey_3", "* (Rhonhey accidentally crushes an insect with his body.)");
	text_set("battle_main_rhonhey_4", "* (You feel the worst smell imaginable coming from Rhonhey's mouth.)");
	text_set("battle_act_rhonhey_1", "Punch");
	text_set("battle_act_rhonhey_2", "Threat"); // from "UNDERTALE"
	text_set("battle_act_rhonhey_3", "Terrorize");  // from "UNDERTALE"
	text_set("battle_act_result_rhonhey_0", "* \"Rhonhey\" :R[?? ATK;D | :B?? DEF];D^3 &* [No data available.]"); // "No data available" from "UNDERTALE"
	text_set("battle_act_result_rhonhey_1_0", "* (You punch Rhonhey in the face with all the strength you have...)");
	text_set("battle_act_result_rhonhey_1_1_0", "* (Rhonhey is getting uncomfortable around you.)");
	text_set("battle_act_result_rhonhey_1_1_1", "* (You've made Rhonhey uncomfortable.)");
	text_set("battle_act_result_rhonhey_1_1_2", "* (But punching Rhonhey won't make him any more uncomfortable.)");
	text_set("battle_act_result_rhonhey_2_0", "* (You tell Rhonhey that you're going to rip one of his eyeballs out.)");
	text_set("battle_act_result_rhonhey_2_1", "* (Rhonhey didn't understand&what you said.)^1 &* (Nothing happened.)"); // from "UNDERTALE"
	text_set("battle_act_result_rhonhey_3_0", "* (You scream at the top of your lungs while throwing rocks at Rhonhey...)");
	text_set("battle_act_result_rhonhey_3_1_0", "* (Rhonhey is getting miserable around you.)");
	text_set("battle_act_result_rhonhey_3_1_1", "* (You've made Rhonhey miserable.)");
	text_set("battle_act_result_rhonhey_3_2_2", "* (But terrorizing Rhonhey won't make him any more miserable.)");
		// MEE6's genocide-only semi-battle (WORK IN PROGRESS, v0.6.0)
	z = 0;
	i = 0;
	text_set($"battle_bubble_mee6_{z}_{i++}", "Stop with this already!^1 \\&This isn't funny!"); // inspired by "This isn't funny! You've got a SICK sense of humor!" from "UNDERTALE"
	text_set($"battle_bubble_mee6_{z}_{i++}", "What a sick joke!"); // inspired by "What a sick joke" from "Better Call Saul"
	z += 1;
	i = 0;
	text_set($"battle_bubble_mee6_{z}_{i++}", "What makes you think this is funny?!");
	text_set($"battle_bubble_mee6_{z}_{i++}", "This little \"parade\" of yours is only extremely disrespectful!");
	text_set($"battle_bubble_mee6_{z}_{i++}", "You have a sick sense of humor!"); // inspired by "This isn't funny! You've got a SICK sense of humor!" from "UNDERTALE"
	z += 1;
	i = 0;
	text_set($"battle_bubble_mee6_{z}_{i++}", "Think rationally!^1 \\&I have done nothing but guide and assist you!");
	text_set($"battle_bubble_mee6_{z}_{i++}", "Does a white lie really outweigh that?!");
	z += 1;
	i = 0;
	text_set($"battle_bubble_mee6_{z}_{i++}", "Drop the act,^1 ;@@[name];D!^1 You do not want to :RATTACK;D me.");
	text_set($"battle_bubble_mee6_{z}_{i++}", "If you did,^1 you would have done it already.");
	z += 1;
	i = 0;
	text_set($"battle_bubble_mee6_{z}_{i++}", ":Y[Spare];D me!^1 \\&You know that is the right thing to do.");
	z += 1;
	i = 0;
	text_set($"battle_bubble_mee6_{z}_{i++}", ":Y[Spare];D me.");
		// TROLLFACE's battle (WORK IN PROGRESS, v0.6.0)
	text_set("battle_main_troll", "* (TROLLFACE stands in the way.)");
	i = 0;
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE is laughing&at his own jokes.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE is laughing uncomfortably loud.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE is blatantly&staring at your hips.)"); // inspired by "Quit staring at my hips" from "EarthBound (MOTHER 2)"
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE is sharing overly intimate secrets.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE is whispering inappropriate compliments.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE is chanting&words in an language&you don't recognize.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE sneezes and&doesn't cover his nose.)"); // inspired by "Jerry sneezes without covering its nose" from "UNDERTALE
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE spits in his&hands and fixes his hair.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE suddenly proposes going somewhere more private.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE does something explicit and acts like&nothing happened.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE exhales deeply.)^3 &* (The smell of sour&milk fills the air.)") // inspired by "The smell of [...] fills the air" from "UNDERTALE"
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE starts gently&playing with your hair.)^3 &* (You slap his hand away.)"); // references Armsguy's "Take Slime"
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE's behavior fills&you with hate and despair.)") // references "[...] fills you with determination" from "UNDERTALE"
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE's behavior makes&you question your own moral principles.)");
	text_set($"battle_main_troll_{i++}", "* (TROLLFACE's behavior makes&you consider legalizing the&death penalty.)");
	text_set($"battle_main_troll_{i++}", "* (You feel a shiver run&down your spine.)");
	text_set($"battle_main_troll_{i++}", "* (You feel TROLLFACE's sins crawling on your back.)"); // references "You felt your sins crawling on your back" from "UNDERTALE"
	text_set($"battle_main_troll_{i++}", "* (You feel hands wrap around your waist from behind.)^3 &* (But no one was there.)");
	text_set("battle_act_result_troll_0_0", "* \"TROLLFACE\" :R[?? ATK;D | :B?? DEF];D^3 &* [...]");
	text_set($"battle_bubble_troll_0_0", "+S5LAUGH OUT LOUD AND DIE INSIDE");
		// Toilet's battle (Unused)
	text_set("battle_main_toilet", "* (A toilet stands in the way.)");
	text_set("battle_main_toilet_0", "* (The toilet glares at you.)");
	i = 0;
	text_set($"battle_act_result_toilet_0_{i++}", "* \"Toilet\" :R[?? ATK;D | :B?? DEF];D^3 &* (A giant toilet.)");
	text_set($"battle_act_result_toilet_0_{i++}", "* (A disgusting smell is coming from inside.)");
	text_set($"battle_act_result_toilet_0_{i++}", "* (The toilet is too big for you to see what is causing the smell.)");
	i = 0;
	text_set($"battle_act_result_toilet_1_{i++}", "* (You flushed the toilet.)^1 &* (Suddenly,^1 the smell stops.)");
	text_set($"battle_act_result_toilet_1_{i++}", "* (Then,^1 you understand.)");
	text_set($"battle_act_result_toilet_1_{i++}", "* (The toilet^4 is finally^4 free.)");
	text_set($"battle_act_result_toilet_1_{i++}", "* (It smiles and thanks you.)");
	text_set($"battle_act_result_toilet_1_{i++}", "* (You feel like a weight has been lifted from your shoulders...)");
	// room_over
	text_set("over_0", "Try Again", "Continuar");
	text_set("over_1", "Give Up", "Desistir");
	text_set("over_skip", "press [{key0}] or [{key1}] to skip", "aperte [{key0}] ou [{key1}] para pular");
	// room_corridors_1
	text_set("world_corridors", "Corridors", "Corredores");
	text_set("world_cave", "Caverns", "Cavernas");
	text_set("chapter_main", "Chapter", "Capítulo");
	i = 0;
	text_set($"chapter_number_{i}", "I"); // Corridors
	text_set($"chapter_name_{i++}", text_get("room_corridors_1", "enUS"), text_get("room_corridors_1", "ptBR"));
	text_set($"chapter_number_{i}", "II"); // Caverns
	text_set($"chapter_name_{i++}", text_get("room_cave_1", "enUS"), text_get("room_cave_1", "ptBR"));
	text_set($"unused_chapter_number_{i}", "III"); // Central City
	text_set($"unused_chapter_name_{i++}", "Civilized Chaos", "Caos Civilizado");
	text_set($"unused_chapter_number_{i}", "IV"); // Scrapyard
	text_set($"unused_chapter_name_{i++}", "");
	text_set($"unused_chapter_number_{i}", "V"); // Admin Realm
	text_set($"unused_chapter_name_{i++}", "");
	text_set("charamenu_main_info_lvl", "LVL  ");
	text_set("charamenu_main_info_hp", "HP   ");
	text_set("charamenu_main_info_money", "$    ", "R$   ");
	i = 0;
	text_set($"charamenu_main_{i++}", "Item");
	text_set($"charamenu_main_{i++}", "Stat");
	text_set($"charamenu_main_{i++}", "Cell");
	text_set("charamenu_item_title_0", "YOUR ITEMS", "SEUS ITENS");
	text_set("charamenu_item_title_1", "YOUR STATS", "SEUS DADOS");
	text_set("charamenu_item_title_2", "CELLPHONE", "CELULAR");
	text_set("charamenu_item_other_0", "Use", "Usar");
	text_set("charamenu_item_other_1", "Info");
	text_set("charamenu_item_other_2", "Drop", "Largar");
	text_set("charamenu_stat_def", "DEF  ");
	text_set("charamenu_stat_exp", "EXP  ");
	text_set("charamenu_stat_atk", "ATK  ", "ATQ  ");
	text_set("charamenu_stat_spares", "SPARES  ", "POUPAR  ");
	text_set("charamenu_stat_heals", "HEALS   ", "CURAS   ");
	text_set("charamenu_stat_kills", "KILLS   ", "MATAR   ");
	text_set("charamenu_stat_deaths", "DEATHS  ", "MORTES  ");
	text_set("charamenu_stat_armor", "ARMOR", "ARMADURA");
	text_set("charamenu_stat_weapon", "WEAPON", "ARMA");
	i = 0;
	text_set($"item_use_{i++}", "* (You used", "* (Você usou");
	text_set($"item_use_{i++}", "* (You restored", "* (Você recuperou");
	text_set($"item_use_{i++}", "* (Your :OHP;D was maxed out.)", "* (Seu :OHP;D foi maximizado.)");
	text_set("item_equip", "* (You equipped", "* (Você equipou");
	i = 0;
	text_set($"item_drop_{i++}", "was dumped.)", "foi jogado no lixo.)"); // references Dumpgame itself
	text_set($"item_drop_{i++}", "was kicked.)", "foi expulso.)"); // references kicking members from a Discord server
	text_set($"item_drop_{i++}", "was banned.)", "foi banido.)"); // references banning members from a Discord server
	text_set($"item_drop_{i++}", "was blocked.)", "foi bloqueado.)"); // references blocking users on Discord
	text_set($"item_drop_{i++}", "was ignored.)", "foi ignorado.)"); // references ignoring users on Discord
	text_set("item_pickup", "* (You got", "* (Você conseguiu");
	text_set("item_cantpickup", "* (Your :YINVENTORY;D is full...)", "* (Seu :YINVENTÁRIO;D está cheio...)");
	text_set("item_name_stick", "Broomstick",	"Cabo de Vassoura");
	text_set("item_name_stick_small", "", "CaboVasora");
	text_set("item_name_stick_serious", "Broom", "Vassoura");
	text_set("item_info_stick_0", "* \"Broomstick\" :R[+\\0 ATK];D^3 &* (Feels like it's&about to break.)", "* \"Cabo de Vassoura\" :R[+\\0 ATQ];D ^3 &* (Parece estar prestes&a quebrar.)");
	text_set("item_name_bandage", "Bandage", "Curativo");
	text_set("item_name_bandage_small", "");
	text_set("item_name_bandage_serious", "");
	text_set("item_info_bandage_0", "* \"Bandage\" :B[+\\0 DEF];D^3 &* (There's a drawing of&a blonde woman on it.)", "* \"Curativo\" :B[+\\0 DEF];D^3 &* (Tem um desenho de uma&mulher loira nele.)"); // "drawing of a blonde woman" references "Barbie"
	text_set("charapause_title", "GAME PAUSED", "JOGO PAUSADO");
	text_set("charapause_0", "Resume", "Continuar");
	text_set("charapause_1", "Main Menu", "Menu Principal");
	text_set("charapause_2", "Quit Game", "Sair do Jogo");
	text_set("charapause_warning_title", "Are you sure?\nUnsaved progress\nwill be ERASED.", "Você tem certeza?\nProgresso não salvo\nserá APAGADO."); // inspired by "ERASE" and "DO NOT" from "UNDERTALE"
	text_set("charapause_warning_0", "No", "Não");
	text_set("charapause_warning_1", "Yes", "Sim");
	text_set("room_lamp_0","* (It's a lamp.)^1 \\&* (An exotic blue fire is lighting up the room...)", "* (É uma lâmpada.)^1 \\&* (Uma luz azul exótica está iluminando o quarto...)");
	text_set("room_lamp_0_geno","* (It's a lamp.)", "* (É uma lâmpada.)");
	text_set("room_brokenlamp", "* (This lamp appears to have been forcefully thrown&against the floor...)", "* (Essa lâmpada parece ter sido arremessada contra o chão...)");
	text_set("room_brokenlamp_geno", "* (It's a broken lamp.)", "* (É uma lâmpada quebrada.)");
	// room_corridors_1_5
	text_set("room_rockpile_0_0", "* (It's a pile of rocks.)", "* (É uma pilha de rochas.)");
	text_set("room_rockpile_1_0", "* (Oh,^3 my God!^1 It can't be!)^2 &* (It's a pile of rocks.)", "* (Ai,^3 meu Deus!^1 Não pode ser!)^2 \\&* (É uma pilha de rochas.)");
	i = 0;
	text_set($"event_rhonhey_battle_0_{i++}", "* My apologies for not interrupting earlier.", "* Peço perdão por não interropê-lo mais cedo.");
	text_set($"event_rhonhey_battle_0_{i++}", "* I was not expecting&a :Onew member;D to&join the server!", "* Eu não previa que um :Onovo membro;D se juntaria ao servidor!");
	text_set($"event_rhonhey_battle_0_{i++}", "* Hmmm...^1 \\&* I assume you did not receive an invite...?", "* Hmmm...^1 \\&* Eu suponho que você não recebeu um convite...?");
	text_set($"event_rhonhey_battle_0_{i++}", "* You must be so lost&and confused.^1 Come with me to the next room!", "* Você deve estar confuso e perdido.^1 Siga-me para o próximo quarto!"); // inspired by "You must be so lost and confused" from "UNDERTALE"
	text_set($"event_rhonhey_battle_0_{i++}", "* All of your questions will be answered.", "* Todos os seus questionamentos&serão respondidos."); // inspired by "Bear with me, Marty, all your questions will be answered" from "Back to the Future" (1985)
	// room_corridors_2
	z = 0;
	i = 0;
	text_set($"event_m6_meet_{z}_{i++}", "* Hey there,^3 :@@[name];D!");
	text_set($"event_m6_meet_{z}_{i++}", "* Welcome to the :E+F0trashiest+D0;D :@Discord server;D you have ever seen...");
	text_set($"event_m6_meet_{z}_{i++}", "* ");
	z += 1;
	i = 0;
	text_set($"event_m6_meet_{z}_{i++}", "* My name is :@@MEE6;D.^1 &* I am a robot designed&to guide and assist you!"); // inspired by "Howdy! I'm FLOWEY. FLOWEY the FLOWER!" from "UNDERTALE"
	text_set($"event_m6_meet_{z}_{i++}", "* My mission is to prepare you to explore the server by yourself."); // inspired by "Please remain here. It's dangerous to explore by yourself." from "UNDERTALE" (which is probably inspired by "It's dangerous to go alone! Take this." from "Legend of Zelda")
	text_set($"event_m6_meet_{z}_{i++}", "* For that,^1 we must analyze the anatomy behind this world.");
	text_set($"event_m6_meet_{z}_{i++}", "* :UDumpster Friends;D can be divided into three primary regions\\:");
	text_set($"event_m6_meet_{z}_{i++}", "* The :GCorridors;D,^1 where&:Onew members;D appear and verify their identity...");
	text_set($"event_m6_meet_{z}_{i++}", "* The :CCentral City;D,^1 a friendly neighborhood for all members alike..."); // "friendly heighborhood" inspired by "Spider-Man: Brand New Day"
	text_set($"event_m6_meet_{z}_{i++}", "* And the :YAdmin Realm;D,^1 restricted to those&who manage the server.");
	text_set($"event_m6_meet_{z}_{i++}", "* If you wish to return to your world,^1 we must reach :YAdmin Realm;D.");
	text_set($"event_m6_meet_{z}_{i++}", "* There,^3 we will find the only known exit in :UDumpster Friends;D.");
	text_set($"unused_event_m6_meet_{z}_{i++}", "* My mission is to help you not need my help.");
	text_set($"unused_event_m6_meet_{z}_{i++}", "* My mission is to fulfill your requests and help you accomplish your goals.");
	text_set($"unused_event_m6_meet_{z}_{i++}", "* My mission is to make Dumpster Friends feel a little less intimidating to you.");
	i = 0;
	text_set($"event_m6_meet_teachInfo_{i++}", "Corridors", "Corredores");
	text_set($"event_m6_meet_teachInfo_{i++}", "Central\nCity", "Cidade\nCentral");
	text_set($"event_m6_meet_teachInfo_{i++}", "Admin\nRealm", "Reino\nAdmin");
	z += 1;
	i = 0;
	text_set($"event_m6_meet_{z}_{i++}", "* It has been precisely&12 months,^1 23 days,^3 &and 6 hours, ..."); // I was born on December (12th month) 23rd, at 6 a.m.
	text_set($"event_m6_meet_{z}_{i++}", "* ... since the :YAdmins;D publicly declared the :GCorridors;D as abandoned.");
	text_set($"event_m6_meet_{z}_{i++}", "* Puzzles I am unable to solve prevent me from exiting the :GCorridors;D."); // Puzzles I cannot solve have blocked me from exiting the :GCorridors;D
	text_set($"event_m6_meet_{z}_{i++}", "* You,^1 however,^1 may be able to solve them!");
	text_set($"event_m6_meet_{z}_{i++}", "* If I am not mistaken,^1 we could easily reach :CCentral City;D!");
	text_set($"event_m6_meet_{z}_{i++}", "* My knowledge and your strength together will ease our journey.");
	text_set($"unused_event_m6_meet_{z}_{i++}", "* Hey.^1 Look.^1 My system does not understand sarcasm,^1 all right?");
	z += 1;
	i = 0;
	text_set($"event_m6_meet_{z}_{i++}", "* Let us initiate&our adventure!");
	text_set($"event_m6_meet_{z}_{i++}", "* (:@@MEE6;D joined your&:VACTIVITY PARTY;D...)");
	i = 0;
	text_set($"unused_event_theguys_meet_0_{i++}", "* Incoming !!!!!"); // from "Meet the Spy" (2009) by Valve
	text_set($"unused_event_theguys_meet_0_{i++}", "* Wrap It Up,^1 Shakespear!");
	i = 0;
	text_set($"unused_event_theguys_meet_1_{i++}", "* Stop Right There,^1 CowBoy!!!!");
	text_set($"unused_event_theguys_meet_1_{i++}", "* Or Is It CowGirl??^1 &* I Can Really Tell!");
	text_set($"unused_event_theguys_meet_1_{i++}", "* whatever.^1 &* \"cowyou\".^1 &* it doesnt matter.");
	text_set($"unused_event_theguys_meet_1_{i++}", "* Ya Must Be A New Member!");
	text_set($"unused_event_theguys_meet_1_{i++}", "* Well.^1 &* Lucky Ya,^1 We Here!");
	text_set($"unused_event_theguys_meet_1_{i++}", "* Because If It Werent For We...");
	text_set($"unused_event_theguys_meet_1_{i++}", "+S1* Dat Blue Head Pain In Da Ass Would Talk For Days!!!!");
	text_set($"unused_event_theguys_meet_1_{i++}", "+S3* you should thank us for kicking that guys face.");
	text_set($"unused_event_theguys_meet_1_{i++}", "* Hold Ya Horses!!!^1 &* We Forgo To Introduce We!");
	text_set($"unused_event_theguys_meet_1_{i++}", "* I Am...^2 Da Guy.^1 &* Da Real Guy."); // "I'm the guy. The real guy." from "Spy Kids 3-D: Game Over"
	text_set($"unused_event_theguys_meet_1_{i++}", "* and im the&other guy.");
	text_set($"unused_event_theguys_meet_1_{i++}", "* Together,^1 We Are...");
	i = 0;
	text_set($"unused_event_theguys_meet_2_{i++}", "* ... Da Guys!!!!");
	text_set($"unused_event_theguys_meet_2_{i++}", "* Dat Right,^1 &Fancy Pants!^1 &* Da Guys!");
	text_set($"unused_event_theguys_meet_2_{i++}", "* And Ya Made A Very Bad Mistake!");
	text_set($"unused_event_theguys_meet_2_{i++}", "* a mistake not even&death can undo.");
	text_set($"unused_event_theguys_meet_2_{i++}", "* You Invade We Territory!");
	text_set($"unused_event_theguys_meet_2_{i++}", "* our private,^1 &private space.");
	text_set($"unused_event_theguys_meet_2_{i++}", "* So,^1 In Conclusion ...");
	text_set($"unused_event_theguys_meet_2_{i++}", "* We are going to kill you.");
	text_set("room_m6_banner_0", "* (It's an old banner.)", "* (É um cartaz antigo.)");
	text_set("room_m6_banner_1", "* (The banner depicts :@@MEE6;D advertising a product&that you don't know.)", "* (O cartaz mostra :@@MEE6;D anunciando um produto&que você não conhece.)");
	text_set("room_m6_poster_0", "* (It's a poster.)^1 \\&* (It says something about :@@MEE6;D remembering your birthday.)", "* (É um pôster.)^3 \\&* (O pôster diz que :@@MEE6;D pode lembrar do seu aniversário.)");
	text_set("room_m6_poster_1", "* (There's also a drawing of&him wearing a birthday hat.)", "* (Tem um desenho dele com&um chapéu de aniversário.)");
	text_set("room_m6_papers_0", "* (It's a pair of&stapled papers.)", "* (É um par de papéis grampeados.)");
	text_set("room_m6_papers_1", "* (It's a license agreement&for :@@MEE6;D's services.)", "* (É um contrato de licença&para os serviços do :@@MEE6;D.)");
	text_set("room_m6_papers_2", "* (You decide not to read.)", "* (Você decide não lê-lo.)");
	text_set("room_m6_brokenwall_0", "* (There's an ant-sized toy&of :@@MEE6;D inside the crack&of this wall...)", "* (Tem um brinquedo minúsculo&do :@@MEE6;D dentro da rachadura desta parede...)"); // from "UNDERTALE"; references a bug where a tiny MEE6 appeared next to the actual MEE6
	text_set("room_m6_brokenwall_1", "* (Strangely,^1 the toy depicts :@@MEE6;D as a tall robot.)", "* (Estranhamente,^1 o&brinquedo retrata&:@@MEE6;D como um robô alto.)"); // references MEE6's old design
	// room_corridors_2
	i = 0;
	text_set($"room_stairssign_{i++}", "* \"Hey!\"^3 \\&* \"Thanks for choosing&Dumpster Friends!\"", "* \"Opa!\"^3 \\&* \"Valeu por escolher&o Dumpster Friends!\"");
	text_set($"room_stairssign_{i++}", "* \"Pretty soon you'll be&at the city,^3 don't worry.\"^1 \\&* \"This shouldn't take long.\"", "* \"Logo logo tu vai tá na cidade,^3 fica tranquilo.\"^1 \\&* \"Isso não é pra demorar.\"");
	text_set($"room_stairssign_{i++}", "* \"Signed,^1 your local&Dumpster Friend\"", "* \"Assinado,^1 seu&amigão do Dumpster\"");
	text_set($"unused_room_stairssign_{i++}", "* \"It's kind of a legal thing,^3 you know?\""); // from "Five Nights at Freddy's"
	text_set("room_rulesbook_0", "* (It's a book titled&\"Server Rules\".)", "* (É um livro chamado&\"Regras do Servidor\".)");
	text_set("room_rulesbook_1", "* (Some pages have been&ripped out and others&are full of drawings.)", "* (Algumas páginas foram arrancadas e outras estão cheias de desenhos.)");
	text_set("room_rulesbook_2", "* (There's a pen attached to&the pillar with a chain.)", "* (Tem uma caneta presa ao&pilar por uma corrente.)");
	text_set("room_rulesbook_3.0", "* (Draw a smiley face?)", "* (Desenhar uma carinha feliz?)");
	text_set("room_rulesbook_3.1_0", "* (Draw a ", "* (Desenhar uma ");
	text_set("room_rulesbook_3.1_1", "nd smiley face?)", "° carinha?)");
	text_set("room_rulesbook_3.1_2", "rd smiley face?)", text_get("room_rulesbook_3.1_1", "ptBR"));
	text_set("room_rulesbook_3.1_3", "th smiley face?)", text_get("room_rulesbook_3.1_1", "ptBR"));
	text_set("room_rulesbook_3_1", "Yes", "Sim");
	text_set("room_rulesbook_3_2", "No", "Não");
	text_set("room_rulesbook_4.0", "* (You drew a smiley face.)", "* (Você desenhou uma&carinha feliz.)");
	text_set("room_rulesbook_4.1", "* (You drew another&smiley face.)", "* (Você desenhou outra&carinha feliz.)");
	i = 0;
	text_set($"room_rulesbook_5-{i++}", "* (You feel like you've lived your whole life just for&this moment...)", "* (Você sente que viveu&sua vida toda apenas&para esse momento...)");
	text_set($"room_rulesbook_5-{i++}", "* (You feel like you've fulfilled your life purpose...)", "* (Você sente que cumpriu o propósito da sua vida...)");
	text_set($"room_rulesbook_5-{i++}", "* (You feel like the world has become a better place...)", "* (Você sente que o mundo se tornou um lugar melhor...)");
	text_set($"room_rulesbook_5-{i++}", "* (You feel the smiley faces looking right back at you.)", "* (Você sente as carinhas felizes encarando-o de volta.)");
	text_set($"room_rulesbook_5-{i++}", "* (You have become the&fastest drawer in the world.)", "* (Você se tornou o desenhista mais rápido do mundo.)"); // inspired by https://www.youtube.com/watch?v=IqzMUn90tMg
	text_set($"room_rulesbook_5-{i++}", "* (You show no signs&of stopping.)", "* (Você não dá sinais&de que vai parar.)");
	text_set($"room_rulesbook_5-{i++}", "* (:@@MEE6;D is visibly confused&by your persistence.)", "* (:@@MEE6;D está visivelmente confuso pela sua persistência.)");
	text_set($"room_rulesbook_5-{i++}", "* (:@@MEE6;D is wondering if he should intervene or not.)", "* (:@@MEE6;D está se perguntando se deveria intervir ou não.)");
	text_set($"room_rulesbook_5-{i++}", "* (:@@MEE6;D would intervene if he wasn't scared of you drawing on his face too.)", "* (:@@MEE6;D iria intervir se não estivesse com medo de você desenhar no rosto dele.)");
	text_set($"room_rulesbook_5-{i++}", "* (:@@MEE6;D has begun to question his own life choices.)", "* (:@@MEE6;D está questionando&suas escolhas de vida.)");
	text_set($"room_rulesbook_5-{i++}", "* (:@@MEE6;D has grown tired of&you and put himself in&Sleep mode.)", "* (:@@MEE6;D se cansou de você e se colocou no Modo de Suspensão.)");
	text_set($"room_rulesbook_5-{i++}", "* (You have successfully given yourself a headache.)", "* (Você conseguiu a proeza de&se dar uma dor de cabeça.)");
	text_set($"room_rulesbook_5-{i++}", "* (It's a migraine,^3 actually.)", "* (É uma enxaqueca,^3 na verdade.)");
	text_set($"room_rulesbook_5-{i++}", "* (It might be a tumor.)", "* (Talvez seja um tumor.)"); // references "Kindergarten Cop" (https://www.youtube.com/watch?v=t_FRWUPcR7Y&t=38s)
	text_set($"room_rulesbook_5-{i++}", "* (Not only your head hurts,^3 &but you can't feel your&hand anymore.)", "* (Não só a sua cabeça dói,^3 \\&mas você não consegue&mais sentir sua mão.)");
	text_set($"room_rulesbook_5-{i++}", "* (It's getting progressively harder to draw as your hand loses blood flow.)", "* (Está cada vez mais difícil de desenhar à medida que a sua mão perde a circulação.)");
	text_set($"room_rulesbook_5-{i++}", "* (\"What am I doing?\",^3 you ask yourself.^1 You couldn't think of an answer.)", "* (\"O que eu tô fazendo?\",^3 você se pergunta.^1 Você não consegue pensar numa resposta.)");
	text_set($"room_rulesbook_5-{i++}", "* (\"Why am I doing this?\",^3 you ask yourself.^1 You'd rather&not know the answer.)", "* (\"Por que eu tô fazendo \\isso?\",^3 você se pergunta.^1 Você prefere não saber a resposta.)");
	text_set($"room_rulesbook_5-{i++}", "* (\"When will I stop?\",^3 you ask yourself.^1 You wish you knew the answer.)", "* (\"Quando eu vou parar?\",^3 você se pergunta.^1 Você gostaria de saber a resposta.)");
	text_set($"room_rulesbook_5-{i++}", "* (Is it because you're bored?)^1 \\&* (Is it because you're crazy?)", "* (É porque você&está entediado?)^1 \\&* (É porque você é doido?)");
	text_set($"room_rulesbook_5-{i++}", "* (Is it because it's funny?)^1 \\&* (Is it because you're torturing yourself?)", "* (É porque é engraçado?)^1 \\&* (É porque você está&se torturando?)");
	text_set($"room_rulesbook_5-{i++}", "* (Or is it because you want to see far dialogue goes...?)", "* (Ou é porque você quer ver o quão longe o diálogo vai...?)");
	text_set($"room_rulesbook_5-{i++}", "* (It's not worth it,^1 you know.)^1 \\&* (No one will be impressed.)^1 \\&* (Nothing will come from this.)", "* (Não vale a pena,^1 sabe.)^1 \\&* (Nada vai vir disso.)");
	text_set($"room_rulesbook_5-{i++}", "* (No one will congratulate&you or be proud of you.)^1 \\&* (No one will care.)", "* (Ninguém vai parabenizá-lo&ou ficar orgulhoso de você.)^1 \\&* (Ninguém vai se importar.)");
	text_set($"room_rulesbook_5-{i++}", "* (Of all things you could do,^3 why would you pick this?)", "* (De todas as coisas que você podia estar fazendo,^1 por que escolher isso?)");
	text_set($"room_rulesbook_5-{i++}", "* (Don't you realize that you're wasting your own time?)", "* (Você não percebe que isso&é uma perda de tempo?)");
	text_set($"room_rulesbook_5-{i++}", "* (Don't you realize that you like to waste your own time?)", "* (Você não percebe que você gosta de perder tempo?)");
	text_set($"room_rulesbook_5-{i++}", "* (Don't you realize this was made for those who like to waste their own time?)", "* (Você não percebe que isso foi feito para aqueles que gostam de perder tempo?)");
	text_set($"room_rulesbook_5-{i++}", "* (Don't you have anything better to do?)", "* (Você não tem nada&melhor para fazer?)"); // "Don't you have anything better to do?" from "UNDERTALE"
	text_set($"room_rulesbook_6", "* (You try to draw another smiley face,^1 but the pen&ran out of ink...)", "* (Você tenta desenhar outra carinha feliz,^1 mas a caneta está sem tinta...)");
	text_set("room_deadlamp", "* (The flame inside this lamp seems to have gone out...)", "* (O fogo dentro desta lâmpada parece ter se apagado...)");
	text_set("room_deadlamp_geno", text_get("room_lamp_0_geno", "enUS"), text_get("room_lamp_0_geno", "ptBR"));
	// room_corridors_3_5
	i = 0;
	text_set($"event_dummy_battle_0_{i++}", "* An essential component of :UDumpster Friends;D' culture is :VACTIVITIES;D.", "* Um componente essencial da cultura do :UDumpster Friends;D é :VATIVIDADES;D.");
	text_set($"event_dummy_battle_0_{i++}", "* An :VACTIVITY;D is a multiplayer game and social experience.", "* Uma :VATIVIDADE;D é um jogo multijogador e uma experiência social."); // "Activities are multiplayer games and social experiences [...]" from "Discord Developer Platform"
	text_set($"event_dummy_battle_0_{i++}", "* The most relevant :VACTIVITY;D today is :Y[Battle Together];D.", "* A :VATIVIDADE;D mais relevante hoje é&:Y[Battle Together];D.");
	text_set($"event_dummy_battle_0_{i++}", "* It is crucial that you understand how this :VACTIVITY;D works.", "* É crucial que você entenda como essa :VATIVIDADE;D funciona.");
	text_set($"event_dummy_battle_0_{i++}", "* You see,^1 in this world,^1 spontaneous generation is real,^1 unfortunately.", "* Veja bem,^1 neste mundo,^1 geração espontânea é real,^1 infelizmente.");
	text_set($"event_dummy_battle_0_{i++}", "* Aggressive beasts commonly arise from non-living matter.", "* Monstros agressivos comumente surgem de matéria inorgânica.");
	text_set($"event_dummy_battle_0_{i++}", "* These creatures are wired to submit others to that :VACTIVITY;D.", "* Essas criaturas têm a função de submeter outros a essa :VATIVIDADE;D.");
	text_set($"event_dummy_battle_0_{i++}", "* Therefore,^1 you must be prepared for this kind of situation.", "* Portanto,^1 é preciso que você esteja preparado para essa situação."); // inspired by "You will need to be prepared for this situation" from "UNDERTALE"
	text_set($"event_dummy_battle_0_{i++}", "* Approach the training dummy and subject it&to :Y[Battle Together];D.", "* Aproxime-se do boneco de treinamento e submeta-o à :Y[Battle Together];D.");
	i = 0;
	text_set($"event_dummy_battle_1_{i++}", "* Excellent work,^3 &:Onew member;D!", "* Excelente trabalho,^3 \\&:Onovo membro;D!");
	text_set($"event_dummy_battle_1_{i++}", "* It was almost as if you had already played it&somewhere else...!", "* Foi quase como se você já havia jogado esse jogo antes...!"); // references "UNDERTALE"
	text_set($"event_dummy_battle_1_{i++}", "* Regardless,^1 you are ready to defend yourself in case of danger.", "* Seja como for,^1 você está pronto para se defender.");
	text_set($"event_dummy_battle_1_{i++}", "* We may now proceed&with our adventure!", "* Nós podemos agora prosseguir com&nossa aventura!"); // inspired by "Let us move to the next room" from "UNDERTALE"
	i = 0;
	text_set($"event_dummy_battle_2_{i++}", "* You may have taken my \"fight back\" statement too literally.", "* Quando eu disse \"revidar o ataque\",^1 não quis dizer matá-lo,^1 sabe?");
	text_set($"event_dummy_battle_2_{i++}", "* Nonetheless,^3 you have won :Y[Battle Together];D.^1 \\&* That is what matters.", "* De qualquer forma,^3 \\&você ganhou o jogo.^1 \\&* Isso é o que importa.");
	text_set($"event_dummy_battle_2_{i++}", "* Let us proceed with&our adventure!", "* Vamos prosseguir com nossa aventura!");
	i = 0;
	text_set($"event_dummy_battle_3_{i++}", "* You were not supposed&to :Y[Spare];D it yet.", "* Não era seu dever :Y[Poupar];D o boneco naquele momento.");
	text_set($"event_dummy_battle_3_{i++}", "* Must I remind you to use :U[ITEM];D when necessary?", "* Será necessário lembrar você de utilizar :U[ITEM];D quando necessário?");
	i = 0;
	text_set($"npc_dummy_{i++}", "* (It's a training dummy.)", "* (É uma boneca de treinamento.)");
	text_set($"npc_dummy_{i}", "* (Battle the dummy?)", "* (Batalhar a boneca?)");
	text_set($"npc_dummy_{i}_1", "Yes", "Sim");
	text_set($"npc_dummy_{i}_2", "No", "No");
	text_set("item_name_brick", "Concrete Brick", "Tijolo de Concreto");
	text_set("item_name_brick_small", "ConcBrick", "TijoConcre");
	text_set("item_name_brick_serious", "");
	text_set("item_info_brick_0", "* \"Concrete Brick\" :O[+\\0 HP];D^3 \\&* (It's literally just a brick.)", "* \"Tijolo de Concreto\" :O[+0 HP];D^3 \\&* (É literalmente apenas um tijolo.)");
	i = 0;
	text_set($"item_use_brick_{i}_0", "* (You shoved :YConcrete Brick;D in&your mouth and swallowed&it whole...)", "* (Você enfiou :YTijolo de Concreto;D dentro da sua boca&e o engoliu por inteiro...)");
	text_set($"item_use_brick_{i}_1", "* (You forcefully threw :YConcrete Brick;D against the floor.)", "* (Você jogou :YTijolo de Concreto;D contra o chão com muita \\força.)");
	i += 1;
	text_set($"item_use_brick_{i}_0", "* (Nothing happened.)", "* (Nada aconteceu.)");
	text_set($"item_use_brick_{i}_1", "*^4 ?");
	// room_corridors_4
	i = 0;
	text_set($"savepoint_0_{i++}", "* (Seeing dust build up&on the stairs and flowers&grow in the grass...)", "* (Vendo poeira se acumular nos degraus da escada e flores crescerem na grama...)");
	text_set($"savepoint_0_{i++}", "* (You realize that none&of this makes any sense.)", "* (Você percebe que nada disso faz o menor sentido.)");
	text_set($"savepoint_0_{i++}", "* (And that you should've&stayed at home,^1 too...)", "* (E que você deveria ter ficado em casa,^1 também...)");
	text_set($"unused_savepoint_0_{i++}", "* (You feel like this is&just the beginning to something big.)");
	text_set("savepoint_all_0", "* (Your :OHP;D has been&fully restored.)", "* (Seu :OHP;D foi maximizado.)");
	text_set("savepoint_all_1", "");
	text_set("savepoint_all_1_1", "Save", "Salvar");
	text_set("savepoint_all_1_2", "Back", "Voltar");
	text_set("savepoint_all_2", "File saved.", "SAVE salvo.");
	z = 0;
	i = 0;
	text_set($"npc_armsguy1_{z}_{i++}", "* Yo :@@[name];D.^3 \\&* Ya A New Member?", "* Fala :@@[name];D.^3 \\&* Vc Novo Menbro?");
	text_set($"npc_armsguy1_{z}_{i++}", "* Dat Cool.^1 \\&* Me An Armsguy.^1 \\&* Call Me Armsguy.", "* Iço Da Ora.^1 \\&* Eu Um Armsguy.^1 \\&* Eu Nome Armsguy.");
	text_set($"npc_armsguy1_{z}_{i++}", "* Why Me Not Fight Ya?^1 &* Eazy,^1 No Why.", "* Pq Eu Nn Lutar Vc?^1 \\&* Facio,^1 Nn Motivo.");
	text_set($"npc_armsguy1_{z}_{i++}", "* Ya A Kid Bro.^1 &* Ya Weak.^1 &* Me Stronger Than Ya.", "* Vc Criansa Man.^1 \\&* Vc Fraco.^1 \\&* Eu Mas Forte Q Vc.");
	text_set($"npc_armsguy1_{z}_{i++}", "* But If Ya Kill,^1 Me Run!", "* Mas Se Vc Matar,^1 Eu Corer!");
	z += 1;
	i = 0;
	text_set($"npc_armsguy1_{z}_{i++}", "* Lemme Tell Ya Sumthin Bro.", "* Deicha Eu Dizer Vc Augo Man."); // inspired by "Let me tell you something, man" from "The Walking Dead"
	text_set($"npc_armsguy1_{z}_{i++}", "* Be Cool With Monsters.^1 \\&* They Hurt Ya Because&They Scared Bro!", "* Ser Legau Co Montros.^1 \\&* Eles Atacam Tu Pq&Eles Tão Medo Man!");
	text_set($"npc_armsguy1_{z}_{i++}", "* If Ya Don Hurt&Em,^1 Ya Cool.", "* Se Tu Nn Bater Eles,^1 Tu Legau.");
	// room_corridors_5
	text_set("event_m6_captcha1_0_0", "* This is the door that has trapped me here for all of this time.", "* Este é o portão que me impede de alcançar a saída dos :GCorredores;D.");
	text_set("event_m6_captcha1_0_1", "* I have never been told the reason behind the puzzles' complexity.", "* Nunca entendi a complexidade dos quebra-cabeças.");
	text_set("event_m6_captcha1_0_2", "* Regardless,^1 I believe you should read the&sign near the door.", "* Seja como for,^1 acredito que você deve ler a placa próxima ao portão.");
	text_set("event_m6_captcha1_0_3", "* It may help you find the answer to the puzzles!", "* É possivel que ela o ajude a encontrar a solução deles!");
	text_set("room_captcha_mainsign_1_0", "* \"reCAPTCHA\\:  Stage 1/3\"", "* \"reCAPTCHA\\:  Fase 1/3\"");
	text_set("room_captcha_mainsign_1_1", "* \"Before accessing the server,^1 you need to complete a quick verification check.\"", "* \"Antes de acessar o servidor,^1 você precisa concluir uma verificação de segurança.\"");
	text_set("room_captcha_mainsign_1_2", "* \"This helps prevent automated systems from accessing&the platform.\"", "* \"Isso ajuda a evitar que sistemas automatizados&acessem a plataforma.\"");
	text_set("room_captcha_mainsign_1_3", "* \"Please solve two simple puzzles to confirm you&are a human.\"", "* \"Por favor,^1 resolva dois quebra-cabeças simples para confirmar que você é humano.\"");
	i = 0;
	text_set($"event_m6_captcha1_1_{i++}", "* You have solved&the puzzles?!", "* Você conseguiu resolver os quebra-cabeças?!");
	text_set($"event_m6_captcha1_1_{i++}", "* I knew you could do it!^3 &* Thank you,^1 :Onew member;D!", "* Eu estava certo!^3 \\&* Muitíssimo obrigado,^1 \\&:Onovo membro;D!");
	text_set($"event_m6_captcha1_1_{i++}", "* Unfortunately,^1 there will be more puzzles&for you to solve.", "* Infelizmente,^1 haverão outros quebra-cabeças para você resolver.");
	text_set($"event_m6_captcha1_1_{i++}", "* Nonetheless,^1 let&us carry on with&our journey!", "* De qualquer forma,^1 \\&nós prosseguimos&com nossa jornada!");
	// room_corridors_5_A, room_corridors_5_B
	text_set("room_captcha_guidesign_1_0", "* \"Step on the buttons to&enter what is shown above.\"", "* \"Pise nos botões para&escrever o que está&sendo mostrado acima.\"");
	text_set("room_captcha_guidesign_1_1", "* \"Restart the puzzle by stepping on the 'X' button.\"", "* \"Reinicie o quebra-cabeça pisando no botão de 'X'.\"");
	i = 0;
	text_set($"room_captcha1_{i++}", "MOTORBIKE", "MICROFONE");
	text_set($"room_captcha1_{i++}", "CELLPHONE", "TABULEIRO");
	text_set($"room_captcha1_{i++}", "LIGHTBULB", "GELADEIRA");
	text_set($"room_captcha1_{i++}", "CLASSROOM", "BICICLETA");
	text_set($"unused_room_captcha1_{i++}", "JELLYFISH", "ÁGUA-VIVA");
	text_set($"unused_room_captcha1_{i++}", "CLOWNFISH");
	// room_corridors_6
	text_set("room_candysign_0", "* \"Thank you for completing stage one of reCAPTCHA's verification.\"", "* \"Obrigado por concluir a primeira fase da verificação de segurança do reCAPTCHA.\"");
	text_set("room_candybowl_0_0_0", "* (It's a candy bowl.)", "* (É uma tijela de doces.)");
	text_set("room_candybowl_0_0_1", "^3 &* (There ", "^3  &* (Tem ");
	text_set("room_candybowl_0_0_2", "is ", "");
	text_set("room_candybowl_0_0_3", "are ", "");
	text_set("room_candybowl_0_0_4", " candy in it.)", " doce nela.)");
	text_set("room_candybowl_0_0_5", " candies in it.)", " doces nela.)");
	text_set("room_candybowl_0_1", "* (Take a candy?)", "* (Pegar um doce?)");
	text_set("room_candybowl_0_1_1", "Yes", "Sim");
	text_set("room_candybowl_0_1_2", "No", "Não");
	text_set("room_candybowl_0_2", "* (You took a candy.)^3 \\&* (You got :YCheap Candy;D.)", "* (Você pegou um doce.)^3 \\&* (Você conseguiu :YDoce Barato;D.)");
	text_set("room_candybowl_0_3_0", "* (Press :Y[", "* (Aperte :Y[");
	text_set("room_candybowl_0_3_1", " or ", " ou ");
	text_set("room_candybowl_0_3_2", "];D to&open your :YINVENTORY;D.)", "];D para&abrir seu :YINVENTÁRIO;D.)");
	text_set("room_candybowl_1_0", "* (It's an empty bowl.)", "* (É uma tijela vazia.)");
	text_set("room_candybowl_1_1", "* (The bowl was full of candy before you took all of it.)", "* (A tijela estava cheia de doces antes de você pegá-los.)");
	text_set("room_candybowl_1_2", "* (By the way,^3 you can take the bowl and use it as :BARMOR;D.)", "* (Aliás,^3 tu pode pegar a tijela e usá-la como :BARMADURA;D.)");
	text_set("room_candybowl_1_3", "* (Take the bowl?)", "* (Pegar a tijela?)");
	text_set("room_candybowl_1_3_1", "Yes", "Sim");
	text_set("room_candybowl_1_3_2", "No", "Não");
	text_set("room_candybowl_1_4", "* (You took the bowl.)^3 \\&* (You got :YCandy Bowl;D.)", "* (Você pegou a tijela.)^3 \\&* (Você conseguiu&:YTijela de Doces;D.)");
	text_set("room_candybowl_2_0", "* (It's a small pillar.)", "* (É um pilar pequeno.)");
	text_set("room_candybowl_2_1", "* (The pillar had a candy bowl on it before you took both the candies and the bowl.)", "* (Tinha uma tijela de doces em cima do pilar antes de você pegar os doces e a tijela.)");
	text_set("room_candybowl_2_2", "* (By the way,^3 you can take the pillar and use it as...^2 Wait.)^1 \\&* (No,^1 that's wrong.)", "* (Aliás,^3 tu pode pegar o pilar e usá-lo como...^2 Espera.)^1 \\&* (Não,^1 isso tá errado.)");
	text_set("room_candybowl_2_3", "* (You can't take the pillar.)^1 \\&* (Sorry!)", "* (Você não pode pegar o pilar.)^1 \\&* (Desculpa!)");
	text_set("item_name_candy",				"Cheap Candy",	"Doce Barato");
	text_set("item_name_candy_small",		"CheapCandy",	"DoceBarato");
	text_set("item_name_candy_serious",		"Candy",		"Doce");
	text_set("item_info_candy_0", "* \"Cheap Candy\" :O[+\\7 HP];D^3 &* (:U1/7;D chance to restore additional :OHP;D when eaten.)", "* \"Doce Barato\" :O[+\\7 HP];D^3 &* (:U1/7;D de chance de recuperar&:OHP;D extra ao ser usado.)"); // "+7 HP" and "1/7 chance" references the Brazilian candy "7-Belo"
	text_set("item_name_bowl",				"Candy Bowl",	"Tigela de Doces");
	text_set("item_name_bowl_small",		"",				"TijelaDoce");
	text_set("item_name_bowl_serious",		"Bowl",			"Tijela");
	text_set("item_info_bowl_0", "* \"Candy Bowl\" :B[+\\3 DEF];D^3 &* (:U1/7;D chance to fully block damage when hurt.)", "* \"Tigela de Doces\" :B[+\\3 DEF];D^3 &* (:U1/7;D de chance de bloquear dano por completo.)");// "1/7 chance" references the Brazilian candy "7-Belo"
	// room_corridors_7
	text_set("room_relaxsign_0", "* \"Hey!\"^3 \\&* \"Getting tired with all&the walking and reading?\"", "* \"Opa!\"^33 &* \"Tá exausto de tanto&precisar ler e andar?\"");
	text_set("room_relaxsign_1", "* \"Why not take a break?\"^3 \\&* \"Make yourself comfortable!\"", "* \"Por que não dar uma pausa?\"^3 \\&* \"Fique à vontade,^1 \\&de boa na lagoa!\"");
	text_set("room_relaxsign_2", "* \"Signed,^1 your local&Dumpster Friend\"", "* \"Assinado,^1 seu&amigão do Dumpster\"");
	text_set("room_bench_geno_0", "* (It's a bench.)", "* (É um banco.)");
	text_set("room_benchCardboard_0", "* (It's a conveniently-shaped&cardboard cutout.)", "* (É um recorte de papelão&de formato conveniente.)"); // inspired by "quick, behind that conveniently-shaped lamp" from "UNDERTALE"
	text_set("room_benchlamp_0", "* (Even a broken lamp needs&to take a break sometime...)", "* (Até uma lâmpada quebrada tem que dar um tempo às vezes...)");
	text_set("room_benchlamp_0_geno", "* (It's a broken lamp.)", "* (É uma lâmpada quebrada.)");
	text_set("npc_trashguy_0", "* (It's a normal trash can.)", "* (É uma lata de lixo normal.)");
	text_set("npc_trashguy_1", "* (Actually,^3 it's a gruesome hungry creature pretending&to be a normal trash can...)", "* (Na verdade,^3 é uma faminta besta feroz fingindo ser&uma lata de lixo normal...)");
	text_set("npc_trashguy_2", "* (Life really takes some&wild turns sometimes...!)", "* (A vida realmente é&inesperada às vezes...!)");
	// room_corridors_8
	i = 0;
	text_set($"savepoint_1_{i++}", "* (Seeing scientifically impossible trees flood the :GCorridors;D with dead leaves...)", "* (Vendo árvores cientificamente impossíveis inundar os :GCorredores;D com folhas...)");
	text_set($"savepoint_1_{i++}", "* (You wonder if this is all just one giant fever dream.)", "* (Você se pergunta se isso tudo é apenas um longo pesadelo.)"); // "one giant fever dream" references "DELTARUNE" 
	text_set("room_rat_geno", "* (It's a rat hole.)", "* (É um buraco de rato.)");
	text_set("npc_armsguy_lost_0_0_0", "* Yo Bro,^3 :@@{name};D.^3 \\&* Ya A New Member Right?", "* Fala Man,^3 :@@{name};D.^3 \\&* Vc Novo Menbro Ne?");
	text_set("npc_armsguy_lost_0_0_1", "* Me Buddy Is Dumbass!^1 \\&* He Stuck In Capcha 2.^3 &* He Need Help.", "* Eu Amigo E Buro!^1 \\&* Ele Prezo No Capcha 2.");
	text_set("npc_armsguy_lost_0_0_2", "* Me Give Ya Gift.^3 &* Very Goo Gift.", "* Eu Dar Augo Vc.^3 \\&* Augo Muto Legau.");
	text_set("npc_armsguy_lost_0_0_3", "* (Do you want to help Armsguy?)", "* (Você quer ajudar Armsguy?)");
	text_set("npc_armsguy_lost_0_0_3_1", "Sure", "Claro");
	text_set("npc_armsguy_lost_0_0_3_2", "No", "Não");
	text_set("npc_armsguy_lost_0_1_0", "* Cool.^1 Me Wait Here.", "* Legau.^1 Eu Esperar Aqui.");
	text_set("npc_armsguy_lost_0_2_0", "* Eh,^3 Didn Even Need Anyway.", "* Eh,^3 Nn Presizar Mesmo.");
	text_set("npc_armsguy_lost_1_0_0", "* Ya Know Were It Is Bro Right?", "* Vc Saber Onde Ta Ne?");
	text_set("npc_armsguy_lost_1_0_1", "* It Right Up There.^3 &* After Pillar.", "* Ta La Encima.^3 &* Depoiz Pilar.");
	text_set("npc_armsguy_lost_1_1_0", "* Goo Job Bro.", "* Shou Da Bola Man.");
	text_set("npc_armsguy_lost_1_1_1", "* Me Said,^3 Me Give Ya Gift.", "* Eu Disser,^3 Eu Dar Vc Augo.");
	text_set("npc_armsguy_lost_1_1_1__", "* Ya Helped Me Dumbass Buddy.^3 &* Me Give Ya Gift.", "* Vc Ajudar Eu Amigo Buro.^3 \\&* Eu Dar Augo Vc.");
	text_set("npc_armsguy_lost_1_1_2", "* Me Don Know Wat Is,^1 But&Me Found It Around Here.^3 &* Very Weid Thing.", "* Eu Nn Saber Oq E,^1 Mas&Eu Encotrar Aqui.");
	text_set("npc_armsguy_lost_1_1_3_0", "* Here.^1 \\&* All Ya.", "* Aq.^1 \\&* Todo Vc.");
	text_set("npc_armsguy_lost_1_1_4_0", "* (You got :YEnchanted Trident;D.)", "* (Você conseguiu&:YTridente Encantado;D.)");
	text_set("npc_armsguy_lost_1_1_3_1", "* ... Ya Have No Space?", "* Vc Nn Ter Espaco?");
	text_set("npc_armsguy_lost_1_1_4_1", "* Dump Sumthin And Me Give Ya Gift.", "* Tirar Augo E Eu Dar Vc Augo.");
	text_set("npc_armsguy_lost_1_2_0", "* Wat?^3 Didn Like It?^2 \\&* Deal With It", "* Q?^3 Nn Gostar?^2 \\&* Se Virar");
	text_set("npc_trashguy_lost2", "* ...thanks...", "* ...obg...");
	text_set("item_name_trident",			"Enchanted Trident",	"Tridente Encantado");
	text_set("item_name_trident_small",		"EncTrident",			"TrideEncan");
	text_set("item_name_trident_serious",	"Trident",				"Tridente");
	text_set("item_info_trident_0", "* \"Enchanted Trident\" :R[+\\3 ATK];D^3 \\&* (Summons a lightning when :RATTACKing;D at the center mark.)", "* \"Tridente Encantado\" :R[+\\3 ATQ];D^3 \\&* (Invoca um raio ao :RATACAR;D&na linha de centro.)"); // references Minecraft's "Trident" item with "Channeling" enchantment
	// room_corridors_9
	/*sketch*/text_set("event_m6_captcha2_0", "* Here comes more extremely difficult puzzles for you.", "* Aproximam-se mais quebra-cabeças impossíveis.");
	/*sketch*/text_set("event_m6_captcha2_1", "* The quicker we go,^3 &the earlier we exit&the :GCorridors;D.", "* Se prosseguirmos com rapidez,^1 em breve&saímos dos :GCorredores;D.");
	text_set("room_captcha_mainsign_2_0", "* \"reCAPTCHA\\:  Stage 2/3\"", "* \"reCAPTCHA\\:  Fase 2/3\"");
	text_set("room_captcha_mainsign_2_1", "* \"Please solve three puzzles&to confirm you are a human.\"", "* \"Por favor resolva os três quebra-cabeças para confirmar que você é humano.\"");
	text_set("room_captcha_guidesign_2_0", "* \"Push the box to the 'X'&on the white path.\"", "* \"Empurre a caixa para o&'X' no caminho branco.\"");
	text_set("npc_trashguy_lost1_0", "* ...you solved the puzzle...?", "* ...vc resolveu o puzzle...?");
	text_set("npc_trashguy_lost1_1", "* ...now i can go back&and meet my friend...", "* ...agr eu posso&ir pro meu amg...");
	text_set("npc_trashguy_lost1_2", "* ...thank you...", "* ...obg...");
	text_set("event_m6_postcaptcha2_0", "* How are you able to solve them so easily?!", "* Como você é capaz de resolvê-los com tanta facilidade?!");
	text_set("event_m6_postcaptcha2_1", "* Regardless,^1 let us proceed with our adventure!", "* Seja como for,^1 nós prosseguimos com&nossa aventura!");
	// room_corridors_10
	text_set("room_chocosign", "* \"          for completing&           f reCAPTCHA's&           n.\"", "* \"          or concluir a&           se da verificação&           a do reCAPTCHA.\"");
	text_set("room_chocosign_geno", "* (The left half of this&sign is missing.)", "* (A metade esquerda desta&placa está faltando.)");
	text_set("room_chocobowl_0", "* (It's a very damaged&chocolate bowl.)", "* (É uma tijela de chocolate muito quebrada.)");
	text_set("room_chocobowl_1", "* (There's only one chocolate left,^1 lying on the floor...)", "* (Tem apenas um chocolate restante,^1 deitado no chão...)");
	text_set("room_chocobowl_2", "* (Take the chocolate?)", "* (Pegar o chocolate?)");
	text_set("room_chocobowl_2_1", "Yes", "Sim");
	text_set("room_chocobowl_2_2", "No", "Não");
	text_set("room_chocobowl_3", "* (You took the chocolate.)^3 \\&* (You got :YChocolate Bar;D.)", "* (Você pegou o chocolate.)^3 \\&* (Você conseguiu&:YBarra de Chocolate;D.)");
	text_set("room_chocobowl_4", "* (You already have a&bowl on your head.)", "* (Você já tem uma tijela em cima da cabeça.)");
	text_set("item_name_choco",				"Chocolate Bar",	"Barra de Chocolate");
	text_set("item_name_choco_small",		"ChocolaBar",		"BarraChoco");
	text_set("item_name_choco_serious",		"Chocolate");
	text_set("item_info_choco_0", "* \"Chocolate Bar\" :O[+\\14 HP];D^3 \\&* (Doubles :RATTACK;D for two&turns when eaten in battle.)", "* \"Barra de Chocolate\" :O[+\\14 HP];D^3 \\&* (Dobra :RATAQUE;D por duas rodadas ao ser usado em batalha.)"); // "Doubles ATTACK", "for two turns" and "+14 HP" (which is the double of Cheap Candy's "+7 HP") are inspired by "Nestlé Classic Duo" (double chocolate bar); "Doubles ATTACK" inspired by "No chocolate" (genocide-only dialog) from "UNDERTALE"
	text_set("unused_item_info_choco_0", "* \"Chocolate Bar\" :O[+\\14 HP];D^3 \\&* (Very sticky,^3 but lactose-free.)", "* \"Barra de Chocolate\" :O[+\\14 HP];D^3 \\&* (Preguento,^3 mas zero lactose.)");
	text_set($"item_use_choco", "* (:RATTACK;D doubled for two turns!)", "* (:RATQ;D dobrado por dois turnos!)");
	// room_corridors_11
	text_set("room_preclocksign_0", "* \"Hey!\"^1 \\&* \"Don't worry,^3 you're almost there.^3 Just a few rooms away!\"", "* \"Opa!\"^1 \\&* \"Fica tranquilo,^3 tu tá quase lá.^3 Falta só alguns quartos!\"");
	text_set("room_preclocksign_1", "* \"Why not speed up a&bit and finish early?\"^1 \\&* \"Think of it like this\\:\\\"", "* \"Porque não agilizar pra terminar mais cedo?\"^1 \\&* \"Pensa assim\\:\\\"");
	text_set("room_preclocksign_2", "* \"Brick by brick,^3 you make a bridge.^1 In the blink of an eye,^3 you'll save time!\"", "* \"Tijolo por tijolo,^3 tu monta uma ponte.^1 Se tu for rápido,^3 tu economiza tempo!\"");
	text_set("room_preclocksign_3", "* \"Does that make sense?\"^1 \\&* \"Don't mind answering,^3 &I'm just a sign.\"", "* \"Isso faz sentido?\"^1 \\&* \"Não precisa responder,^1 \\&eu sou só uma placa.\""); // inspired by "does that make sense?" from "UNDERTALE"
	text_set("room_preclocksign_4", "* \"Signed,^1 your local&Dumpster Friend\"", "* \"Assinado,^1 seu&amigão do Dumpster\"");
	i = 0;
	/*sketch*/text_set($"savepoint_2_{i++}", "* (hello)");
	i = 0;
	text_set($"unused_genodialog_0_{i++}", "* (You feel the power in your hands...)");
	text_set($"unused_genodialog_0_{i++}", "* (... and the strength crossing through your veins.)");
	text_set($"unused_genodialog_0_{i++}", "* (Your desire to [...])");
	text_set($"unused_genodialog_0_{i++}", "* (But nobody came.)");
	text_set("unused_genofeeling", ";R* (Something tells you that you shouldn't continue yet.)");
	i = 0;
	text_set($"event_brock_battle_0_{i++}", "+F0+S1* DID'YA REALLY THINK&I WOULDN'T SEE'YA?!?", "+F0+S1* TU REAL ACHOU QUE&EU NÃO IA TE VER?!?");
	text_set($"event_brock_battle_0_{i++}", "+F0+S1* EVEN AFTER EVERYTH()", "+F0+S1* MESMO DEPOIS DE TUD()");
	text_set($"event_brock_battle_0_{i++}", "* You are breaking the server's rules,^3 wild clock creature!", "* Você está infringindo regras do servidor,^3 relógio malévolo!"); // MEE6 attempts to interrupt Broken Clock the same way he successfully interrupted Rhonhey 
	text_set($"event_brock_battle_0_{i++}", "* You do not have permission to trap us he()", "* Você não tem permissão para nos prender aqu()");
	var i = 0;
	text_set($"event_brock_battle_1_{i++}", "+F0+S1* SHUT UP!!!!!!!!!!", "+F0+S1* CALA A BOCAAAAAAAAAA!!!!!!!!!!");
	i = 0;
	text_set($"event_brock_battle_2_{i++}", "+F0* So...^2 Where WERE we.^1 \\&* ... HMM,^3 RIGHT!!", "+F0* Calma.^2 Do quê que&eu tava falando.^1 \\&* ... AAH,^3 SIM!!"); // inspired by "... NOW, WHERE WERE WE? OH YES." and "HMM? So you're ASKIN' me to move over?" from "UNDERTALE"
	text_set($"event_brock_battle_2_{i++}", "+F0+S1* :@@[name];D!!!!!!^1 \\&* DID'YA REALLY THINK I'D JUST LET'YA IGNORE MY EXISTENCE?!?", "+F0+S1* :@@[name];D!!!!!!^1 \\&* TU REAL ACHOU QUE EU IA DEIXAR TU IGNORAR MINHA EXISTÊNCIA?!?");
	text_set($"event_brock_battle_2_{i++}", "+F0+S1* ABSOLUTELY NO WAY,^1 BUDDY.^3 \\&* NOT AFTER EVERYTHING&YOU HUMANS DID TO ME.", "+F0+S1* NEM A PAU,^1 AMIGÃO.^3 \\&* NÃO DEPOIS DE TUDO QUE VOCÊS HUMANOS FIZERAM COMIGO.");
	text_set($"event_brock_battle_2_{i++}", "+F0+S1* I'VE BEEN COUNTING DOWN&THE SECONDS UNTIL THIS DAY,^1 RIGHT HERE,^3 FOR MONTHS!!!!!!", "+F0+S1* EU TAVA CONTANDO OS SEGUNDOS ATÉ ESSE DIA,^1 BEM AQUI,^3 POR MESES!!!!!!");
	text_set($"event_brock_battle_2_{i++}", "+F0+S1* YOU WOULDN'T WANNA RUIN THIS MOMENT FOR ME,^3 WOULD'YA?!?", "+F0+S1* TU NÃO QUER ARRUINAR ESSE MOMENTO PRA MIM,^3 NÉ?!?");
	text_set($"event_brock_battle_2_{i++}", "+F0+S1* TIME TO DIE,^3 LITTLE BUDDY...!", "+F0+S1* HORA DE MORRER,^3 AMIGUINHO...!"); // "TIME TO DIE" inspired by "Time to die" from "Blade Runner"
	i = 0;
	text_set($"event_brock_battle_3_{i++}", "+F0* You...^2 You SPARED me...?", "+F0* Tu...^2 Tu me POUPOU...?");
	text_set($"event_brock_battle_3_{i++}", "+F0* Even after EVERYTHING&I've done to HURT'ya?!?", "+F0* Mesmo depois de TUDO que&eu fiz pra te MACHUCAR?!?"); // inspired by "After everything I have done to hurt you..." from "UNDERTALE"
	text_set($"event_brock_battle_3_{i++}", "+F0* :@@[name];D...^2 \\&* You shouldn't say&sorry,^1 Y'KNOW...", "+F0* :@@[name];D...^2 \\&* Tu não precisa pedir desculpas,^1 SABE...");
	text_set($"event_brock_battle_3_{i++}", "+F0* You REALLY shouldn't.^3^3 \\&* You haven't done&ANYTHING wrong.", "+F0* Tu REALMENTE não precisa.^3^3 \\&* Tu não fez NADA de errado.");
	text_set($"event_brock_battle_3_{i++}", "+F0* But I have,^1 and&I understand if&you hate me.", "+F0* Mas eu fiz,^1 e eu entendo&se tu me odiar."); // inspired by "I understand if you hate me" from "UNDERTALE"
	text_set($"event_brock_battle_3_{i++}", "+F0* There's NO excuse&for how I treat'ya.", "+F0* Não tem NENHUMA justificativa pra como eu te tratei."); // inspired by "There's no excuse for what I've done" from "UNDERTALE"
	text_set($"event_brock_battle_3_{i++}", "+F0* The LEAST I can do&is TRY to make it&up to you.", "+F0* O MÍNIMO que eu posso fazer&é TENTAR te ajudar."); // inspired by "The least I can do is return them" from "UNDERTALE"
	text_set($"event_brock_battle_3_{i++}", "+F0* You wanna LEAVE&the server,^1 RIGHT?^1 \\&* You could use some help.", "+F0* Tu quer SAIR do server,^1 NÉ?^1 \\&* Tu vai precisar&de uma mãozinha.");
	text_set($"event_brock_battle_3_{i++}", "+F0* Take this.^1 &* It's PROBABLY better&than what'ya have there.", "+F0* Pega isso.^1 \\&* PROVAVELMENTE é melhor&do que tu tem aí.");
	text_set($"event_brock_battle_3_{i}_1", "* (You got :YTemporary Pacemaker;D.)", "* (Você conseguiu&:YMarcapasso Temporário;D.)");
	text_set($"event_brock_battle_3_{i}_0", "+F0* I'll,^1 UH...^2 Leave it in&the brick pile,^1 M'KAY...?", "+F0* Eu vou,^1 É...^2 Deixar lá na pilha de tijolo,^1 TÁ...?"); // inspired by "HMM? So you're ASKIN' me to move over?" from "UNDERTALE"
	text_set($"event_brock_battle_3_{++i}", "+F0* WELL,^2 I've wasted&enough of your time.", "+F0* BOM,^2 eu já peguei muito&do seu tempo."); // "I've wasted enough of your time" references Broken Clock
	text_set($"event_brock_battle_3_{++i}", "+F0* Watch'ya back,^1 &little buddy...^1 \\&* ... Sorry for,^1 Y'KNOW...", "+F0* Se cuida,^1 amiguinho...^1 \\&* ... Desculpa por,^1 SABE..."); // "Watch'ya back" references a watch, a wristwatch, Broken Clock
	i = 0;
	text_set($"event_brock_battle_4_{i++}_0", "* In my opinion,^3 your decision to spare that thing was a mistake.", "* Em minha opinião,^3 sua decisão em poupá-lo foi um lapso de julgamento.");
	text_set($"event_brock_battle_4_{i++}_0", "* What if it changes its mind and returns to murder us both?", "* E se ele mudar de opinião e retornar&para nos matar?");
	text_set($"event_brock_battle_4_{i}_0", "          ");
	text_set($"event_brock_battle_4_{i}_0_1", "Not going\nto happen", "Não vai\nacontecer");
	text_set($"event_brock_battle_4_{i}_0_2", "Sorry", "Desculpinha");
	text_set($"event_brock_battle_4_{++i}_0", "* ...");
	i = 0;
	text_set($"event_brock_battle_4_{i++}_1", "* I confess I am quite surprised by your fantastic performance!", "* Confesso que estou impressionado com seu fantástico desempenho!");
	text_set($"event_brock_battle_4_{i++}_1", "* Again,^1 thanks to you,^1 &we slowly approach the exit of :GCorridors;D.", "* Novamente,^1 graças a você,^1 nos aproximamos&à saida dos :GCorredores;D.");
	text_set($"event_brock_battle_4_{i++}_1_geno", "* ...^2 What did you say?^1 &* I was not skeptical&of your abilities.", "* ...^2 O que você disse?^1 \\&* Eu não estava cético&de suas abilidades.");
	text_set($"event_brock_battle_4_{i++}_1_geno", "* You are the one who interpreted it incorrectly.", "* É você quem&me interpretou incorretamente.");
	text_set("item_name_pace",			"Temporary Pacemaker",	"Marcapasso Temporário"); // "Temporary" references Broken Clock, but also explains why the player can equip the item without surgery; "Pacemaker" references both Broken Clock and the player's SOUL
	text_set("item_name_pace_small",	"TempoPacer",			"MarcaTempo");
	text_set("item_name_pace_serious",	"Pacemaker",			"Marcapasso");
	text_set("item_info_pace_0", "* \"Temporary Pacemaker\" :B[+\\6 DEF];D^3 \\&* (Increases the duration of :PINVINCIBILITY FRAMES;D by :U50%;D.)", "* \"Marcapasso Temporário\" :B[6 \\DEF];D^3 \\&* (Prolonga a duração dos :PFRAMES DE INVENCIBILIDADE;D em :U50%;D.)");
	i = 0;
	text_set($"room_trollwall_{i++}", "* (A thick,^3 oily substance is leaking from between the bricks of this wall...)", "* (Uma grossa,^3 oleosa substância está vazando dos espaços entre os tijolos desta parede...)"); // references TROLLFACE's oil attack
	text_set($"room_trollwall_{i++}", "* (It seems irrelevant for now.)", "* (Isso parece&irrelevante&no momento.)");
	// room_corridors_11_trollStairs (WORK IN PROGRESS, v0.6.0)
	z = 0;
	i = 0;
	text_set($"event_trollStairs_{z}_{i++}", "* We do not belong here.^1 \\&* This place is dangerous.");
	text_set($"event_trollStairs_{z}_{i++}", "* We must exit the :GCorridors;D,^3 not go&down rabbit holes.");
	text_set($"event_trollStairs_{z}_{i++}", "* It would be a crime&to not turn around."); // inspired by "turn around, kid. it'd be a crime." from "Stronger Than You (Sans Parody)"
	z += 1;
	i = 0;
	text_set($"event_trollStairs_{z}_{i++}", "* ");
	z += 1;
	i = 0;
	text_set($"event_trollStairs_{z}_{i++}", "* ... I refuse to feed your insanity,^3 :@@{name};D...!");
	text_set($"event_trollStairs_{z}_{i++}", "* ... You are&entirely on&your own...!");
	// room_corridors_11_troll (WORK IN PROGRESS, v0.6.0)
	text_set($"room_trollCell_0_0", "* (It's a prison cell.)^3 \\&* (It doesn't seem to&have anyone inside.)");
	text_set($"room_trollCell_1_0", "* (It's another prison cell.)^3 \\&* (It seems to be empty.)");
	text_set($"room_trollCell_2_0", "* (It's one more prison cell.)^1 \\&* (It seems to be empt()");
	z = 0;
	i = 0;
		// Like Aaron Undertale? "Come on in, the water's fine ;)" "Nice, my kind of humor ;)" "You'll change your mind ;)" "Just the two of us, huh? ;)"
		// "It's hot in here. Don't you want to take off your clothes?"; "Be a good boy and [...]"; "Do it for daddy"; "Come closer, I don't bite. Unless you want me to"
	text_set($"event_troll_{z}_{i++}", "+S6+I1* Hey,^3 hey...^1 \\&* Relax,^1 little boy...^1 \\&* Relax...");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* I'm not going to&hurt you,^1 silly...^2 \\&* Oh,^1 no,^2 I would never do that!");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* No,^1 no...^2 \\&* You're way too&cute for that... ;\\)");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* You know I'd do anything&for you,^1 right,^1 sweetie?");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* So...^2 \\&* That means you can&do something for me.");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* Something very,^2 \\&very important.");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* Something only you&can do for me.^1 \\&* You,^1 only you.");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* But you can't tell&anyone about this!");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* This needs to be our&\"little secret\"!");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* Can you be a good boy and pull that lever for me,^1 sweetheart?");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* You don't want to leave Daddy trapped here,^2 do you...?^2 \\&* Ha,^1 ha...");
	text_set($"event_troll_{z}_{i++}", "+S6+I1* Come on,^1 pull the lever.^2 \\&* You owe me.");
	z += 1;
	i = 0;
	text_set($"unused_event_troll_{z}_{i++}", "+I1* HEY,^3 CUPCAKE^1 \\&* SEE THAT LEVER&OVER THERE?");
	text_set($"unused_event_troll_{z}_{i++}", "+I1* PULL IT FOR ME^1 \\&* PULL IT FOR ME SO&I CAN MAKE YOU HAPPY");
	z += 1;
	i = 0;
	text_set($"event_troll_{z}_{i++}", "+I1* Is this a joke?^1 \\&* Are you trolling me?^2 \\&* PULL THE DAMN LEVER"); // inspired by "Is this a joke? Are you braindead? RUN. INTO. THE. BULLETS!!!" from "UNDERTALE"
	z += 1;
	i = 0;
	text_set($"event_troll_{z}_{i++}", "+S6+I1* Ah...^1 Ha,^1 ha...^2 \\&* You did good,^1 sweetie,^1 \\&you did very good...");
	z += 1;
	i = 0;
	text_set($"event_troll_{z}_{i++}", "+S6+I1* YOU'VE^4 BEEN^4 TROLLED");
	// room_corridors_13
	z = 0;
	i = 0;
	text_set($"npc_armsguy_postbrock_{z}_{i++}", "* Ya Da New Member Da&Guys Talk About.", "* Vc Novo Menbro Q Eles Falaro.");
	text_set($"npc_armsguy_postbrock_{z}_{i++}", "* Me Watch Ya&Fight Brock.^3 &* Very Epic!", "* Eu Asitir Vc Luta Brock.^3 \\&* Bem Epico!");
	text_set($"npc_armsguy_postbrock_{z}_{i++}", "* Me Laugh When Brock&Scare Meeseeks.^1 &* Total Clanker.", "* Eu Rir Cuando Brock&Asusta Meeseeks.^1 \\&* Lata Veia Bura.");
	z += 1;
	i = 0;
	text_set($"npc_armsguy_postbrock_{z}_{i++}", "* Brock Is Very Chill.^3 \\&* He A Cool Guy!", "* Brock E Bem Dboa.^3 \\&* Ele Cara Legau!");
	text_set($"npc_armsguy_postbrock_{z}_{i++}", "* He Got Angry After Da Raid,^1 But He Not Always Angry.", "* Ele Ficar Iritado&Depoiz Da Invazao,^1 \\&Mas Ele Nn Sempre Iritado.");
	text_set($"npc_armsguy_postbrock_{z}_{i++}", "* Why He Angry At Ya?", "* Pq Ele Iritado Co Vc?");
	i = 0;
	text_set($"savepoint_3_{i++}", "* (Seeing mythical creatures like muscular slimes and flying clocks...)", "* (Vendo criaturas míticas&como slimes musculosos&e relógios voadores...)");
	text_set($"savepoint_3_{i++}", "* (You tell yourself that&it must all just be&a bad dream.)", "* (Você diz a si mesmo&que isso tudo é&apenas um pesadelo.)"); // inspired by "It must have all just been a bad dream" from "EarthBound (MOTHER 2)"
	i = 0;
	text_set($"npc_flitcher_postbrock_{i++}", "* (Flitcher is staring into&the abyss,^1 thinking...)^1 &* (That is,^3 if it thinks.)", "* (Flitcher está encarando&o abismo,^1 pensando...) ^1 \\&* (Isto é,^3 se ele pensa.)");
	text_set($"npc_flitcher_postbrock_{i++}", "* (Perhaps Flitcher is waiting for an answer...)", "* (Talvez Flitcher esteja esperando por uma resposta...)");
	text_set($"npc_flitcher_postbrock_{i++}", "* (Or,^1 perhaps,^1 Flitcher has been carrying the weight&of knowing the answer...)", "* (Ou,^1 talvez,^1 Flitcher tem carregado o peso de saber&a resposta...)");
	text_set($"npc_flitcher_postbrock_{i++}", "* (...)^4 \\&* (It doesn't matter.)", "* (...)^4 \\&* (Não importa.)"); // inspired by "Tra la la. What's my name? ... It doesn't really matter." from "UNDERTALE"
	text_set($"npc_flitcher_postbrock_{i++}_geno", "* (It's a Flitcher.)", "* (É um Flitcher.)");
	// room_corridors_14
	i = 0;
	text_set($"event_m6_captcha3_{i++}", "* Here we are{punctuation}^1 \\&* The last stage of nearly unsolvable puzzles{punctuation}");
	text_set($"event_m6_captcha3_{i++}", "* Based on other members' experiences,^1 you may&not succeed at first.");
	text_set($"event_m6_captcha3_{i}", "* I suggest you read the introductory sign.");
	text_set($"event_m6_captcha3_{i}_geno", "* I suggest you&read the,^1 uh...");
	text_set($"event_m6_captcha3_{++i}_geno", "* ...^2 Why are you&looking at me&like that?");
	text_set("room_captcha_mainsign_3_0", "* \"reCAPTCHA\\:  Stage 3/3\"");
	text_set("room_captcha_mainsign_3_1", "* \"Please solve three puzzles&to confirm you are a human.\"");
	text_set("room_captcha_mainsign_3_2", "* \"You have :Rone minute;D&to solve the puzzles.\"");
	text_set("room_captcha_mainsign_3_3", "* \"Pull both levers next&to the door to begin.\"");
	text_set("room_captcha_guidesign_3_3_0", "* \"Activate all plates.\"&* \"Stepping on a plate activates nearby plates.\"");
	text_set("room_captcha_guidesign_3_3_1", "* \"Restart the puzzle by stepping on the 'X' button.\"");
	i = 0;
	text_set($"event_m6_postcaptcha3_{i}_0", "* Frankly,^1 :Onew member;D,^1 \\&you surpassed my expectations{punctuation}"); // inspired by "Frankly, my dear, I don't give a damn" from "Gone with the Wind"
	text_set($"event_m6_postcaptcha3_{i}_1", "* As I had foreseen,^1 you were unable to succeed at first.");
	text_set($"event_m6_postcaptcha3_{++i}", "* Regardless,^1 we overcame our primary obstacle\\: ^1 impossible quizzes."); // inspired by "The Impossible Quiz"
	text_set($"event_m6_postcaptcha3_{++i}", "* All there is left to do is walk towards the&exit of :GCorridors;D{punctuation}");
	text_set("room_captcha_endsign_3_0", "* \"Thank you for completing stage three of reCAPTCHA's verification.\"");
	text_set("room_captcha_endsign_3_1", "* \"You are now free to&access the server.\"");
	i = 0;
	text_set($"captcha3_buttonsWord_{i++}", "MISUNDERSTANDING");
	text_set($"captcha3_buttonsWord_{i++}", "INCOMPREHENSIBLE");
	text_set($"captcha3_buttonsWord_{i++}", "RESPONSIBILITIES");
	// room_corridors_17
	i = 0;
	text_set($"savepoint_4_{i++}", "* (Seeing monsters you've met peacefully living their day-to-day lives...)");
	text_set($"savepoint_4_{i++}", "* (You realize this might not be a dream after all.)");
	text_set($"unused_savepoint_4_{i++}", "* (You realize this world might not be as weird as you originally thought.)");
	z = 0;
	i = 0;
	text_set($"npc_armsguy_exit_{z}_{i++}", "* Ya Da New Member?^1 &* Bro Dat Cool.^3 &* Ya Da First Since Da Raid!");
	text_set($"npc_armsguy_exit_{z}_{i++}", "* Sucks You Be Leavin.^1 &* Da Exit Right Up There.");
	text_set($"npc_armsguy_exit_{z}_{i++}", "* How Ya Go Through Corridor??^3 &* Ya Fly??");
	z += 1;
	i = 0;
	text_set($"npc_armsguy_exit_{z}_{i++}", "* Meeseeks Not Say Of Da Raid??");
	text_set($"npc_armsguy_exit_{z}_{i++}", "* Bro Da Raid Was Nuts!^3 &* Da Corridor There&Broken Totally.");
	text_set($"npc_armsguy_exit_{z}_{i++}", "* Da Humans Kill Me Grandma!^1 &* But Me Cool Now."); // inspired by "Singing killed my grandma" from "Trolls"
	text_set("npc_trashguy_exit_fishing_0_0", "* ...hi...");
	text_set("npc_trashguy_exit_fishing_0_1", "* ...what...?^1 &* ...im not fishing...");
	text_set("npc_trashguy_exit_fishing_0_2", "* ...i was throwing trash down there but i threw something important on accident...");
	text_set("npc_trashguy_exit_fishing_0_3", "* ...now im trying to take it back with a fishing rod...");
	text_set("npc_trashguy_exit_fishing_0_4", "* ...its not working...");
	text_set("npc_trashguy_exit_fishing_1_0", "* ...i think ill&just give up...");
	text_set("npc_armsguy_exit_fishing_0_0", "* Wat Up.^1 &* Me Just Waitin This Smartass Here Get Thing Back.");
	text_set("npc_armsguy_exit_fishing_0_1", "* Big Waste Of Time!^3 &* How Dat Fall There Anyway!?");
	text_set("npc_armsguy_exit_fishing_0_2", "* ...i already told you&i dont know...");
	text_set("npc_armsguy_exit_fishing_1_0", "* This Intolerable!"); // inspired by "This is intolerable" from "Indiana Jones and the Last Crusade"
	text_set("npc_armsguy_exit_lifting_0_0", "* Me Don Talk Now.^3 &* I Gyming.");
	text_set("npc_armsguy_exit_lifting_1_0", "* Me Say Me Don Talk&Now Dumbass!!!");
	text_set("npc_armsguy_exit_lifting_2_0", "* Go Away Bro!!!!!!");
	text_set("npc_armsguy_exit_lifting_3_0", "* I Kill Ya!!!!!!!!!!!!");
	text_set("npc_armsguy_exit_lifting_4_0", "* Ahhhhhh!!!!!!!!!!!!!!!!!!");
	text_set("npc_flitcher_exit_0_0", "* (You wave to Flitcher.)^3 &* (It waves back at you.)");
	text_set("npc_flitcher_exit_0_1", "* (How did it wave back if it doesn't even have hands?)");
	text_set("npc_flitcher_exit_0_2", "* (This is one of the weirdest mysteries of All Time.)");
	text_set("npc_flitcher_exit_1_0", "+S3* Kill^2 me,^4 please...!");
	text_set("unused_npc_flitcher_exit_1_0", "* I^4 am^4 deeply disgusted^4 by^4 &your existence.^4 &* Do^4 me a^4 favor^4^4 and^4^4^4^4 die.");
	text_set("npc_flitcher_exit_geno_0", "* (It's a Flitcher.)");
	text_set("room_corridors_17_egg.0", "* (It's an egg.)");
	text_set("room_corridors_17_egg.1", "* (It's unclear why there's&an egg beside the tree.)"); // from "DELTARUNE"
	text_set("item_name_brick2",			"Metal Brick",	"Tijolo de Metal");
	text_set("item_name_brick2_small",		"MetalBrick",	"TijoMetal");
	text_set("item_name_brick2_serious",	"");
	i = 0;
	text_set($"item_info_brick2_{i++}", "* \"Metal Brick\"^3 \\&* (It's a very unusual brick...)"); // inspired by "It's a very unusual knife" from "12 Angry Men" (1957)
	text_set($"item_info_brick2_{i++}", "* (It seems irrelevant for now.)");
	// room_corridors_18
	text_set("room_corridors_18_sign.0", "* \"New member,^1 you are at&the Corridors' edge.\"");
	/*sketch*/text_set("room_corridors_18_sign.1", "* \"Soon you'll be at the&Central City,^1 the home&of members like you.\"");
	text_set("room_corridors_18_sign.2", "* \"But,^1 before that,^1 there's one&last thing you have to do.\"");
	text_set("room_corridors_18_sign.3", "* \"Face your last challenge before leaving this place.\"");
	text_set("room_corridors_18_sign.4", "* \"Prove yourself worthy&by walking through this unnecessarily long corridor.\"");
	text_set("room_corridors_18_sign.5", "* \"Jokes aside,^1 we're sorry.\"^1 &* \"Someone's REALLY bad&at urban planning.\"");
	text_set("room_corridors_18_sign.6", "* \"Signed,^1 your local&Dumpster Friend\"");
	text_set("event_gabee_chase.0.0", "* This is it.");
	text_set("event_gabee_chase.0.1", "* The exit is at the end of this corridor.");
	text_set("event_gabee_chase.0.2", "* Before we continue,^1 I have a question for you.");
	text_set("event_gabee_chase.0.3", "* You do remember how :Y[Battle Together];D&works,^2 correct?");
	text_set("event_gabee_chase.0.4", "* ...");
	text_set("event_gabee_chase.0.5", "* ...^3 No!^1 Nothing!^2 &* I was curious,^1 &that is all.");
	text_set("event_gabee_chase.0.6_geno", "* ...^2 Excuse me?^1 &* I have no reason&to lie to you.");
	text_set("event_gabee_chase.0.7_geno", "* Would you mind treating me with more respect?");
	text_set("event_gabee_chase.1.0", "* I confess.");
	text_set("event_gabee_chase.1.1", "* I lied.");
	text_set("event_gabee_chase.1.2", "* There is a reason I questioned your memory.");
	text_set("event_gabee_chase.1.3", "* You see,^1 I may have not been as hone()");
	i = 0;
	text_set($"unused_event_gabee_chase.3.{i++}", "* (You hear a distant voice.)"); // inspired by "You hear a distant voice" from "UNDERTALE"
	text_set($"unused_event_gabee_chase.3.{i++}", "* ele ta ali^1 &* ta vendo?");
	text_set($"unused_event_gabee_chase.3.{i++}", "* tu acha q ele morreu?");
	text_set($"unused_event_gabee_chase.3.{i++}", "* ...");
	// room_cave_1
	text_set($"room_leafbed_0", "* (Dead leaves.)^3 &* (They must have&broken your fall.)"); // inspired by "Golden flowers. They must have broken your fall." from "UNDERTALE"
	// room_cave_2
	i = 0;
	text_set($"cellphone_developer_{i++}", "* (Ring,^1 ring...)");
	text_set($"cellphone_developer_{i++}", "* (It's a voice you have&never heard before.)"); // inspired by "It's a voice you have never heard before" from "UNDERTALE"
	text_set($"cellphone_developer_{i++}", "* Hey.");
	text_set($"cellphone_developer_{i++}", "* It must be obvious by now&that I like UNDERTALE.");
	text_set($"cellphone_developer_{i++}", "* But it's more than&that,^1 really.^1 &* Way more than that.");
	text_set($"cellphone_developer_{i++}", "* I might've never gotten better at drawing without UNDERTALE.");
	text_set($"cellphone_developer_{i++}", "* I probably would've never gotten into programming without UNDERTALE.");
	text_set($"cellphone_developer_{i++}", "* I definitely would've never even thought of making music without UNDERTALE.");
	text_set($"cellphone_developer_{i++}", "* Basically,^1 I'd have a completely different life and personality without UNDERTALE.");
	text_set($"cellphone_developer_{i++}", "* It's weird,^1 isn't it?");
	text_set($"cellphone_developer_{i++}", "* Knowing someone you've never met,^1 and most certainly never will,^1 has changed you forever.");
	text_set($"cellphone_developer_{i++}", "* In a good way,^3 of course!");
	text_set($"cellphone_developer_{i++}", "* ...");
	text_set($"cellphone_developer_{i++}", "* I just wanted to say...");
	text_set($"cellphone_developer_{i++}", "* You made a snowman&really happy...!"); // from "UNDERTALE"
	text_set($"cellphone_developer_{i++}", "* (Click...)");
	// room_cave_3
	text_set("room_cave_3_npc_armsguy.0.0", "* Ahh!^3 Ya Here Too!");
	text_set("room_cave_3_npc_armsguy.0.1", "* Look Like Me Not Da&Only Dat Try Jump!^3 &* Mweheheh!!");
	text_set("room_cave_3_npc_armsguy.1.0", "* If Me Was Lil Closer To Hole,^1 Me Jump To Other Side.");
	text_set("room_cave_3_npc_armsguy.1.1", "* But Ya??^3 &* Ya A Human Yes?^1 &* Ya Very Weak!");
	text_set("room_cave_3_npc_armsguy.1.2", "* Ya Dumbass Too??");
	text_set("room_cave_3_npc_armsguy.1.2.1", "Yeah");
	text_set("room_cave_3_npc_armsguy.1.2.2", "Not really");
	text_set("room_cave_3_npc_armsguy.1.3.1", "* ...^4^2 &* ...^4^2 &* ... OK");
	text_set("room_cave_3_npc_armsguy.1.3.2", "* Mweheheheh!!^1 Dat Funny!^1 &* Ya Dumbass Yes,^3 Dumbass.^1 &* Go Dumbass Away.");
	i = 0;
	text_set($"room_cave_3_border.{i++}", "* (An electrical border&is blocking the path.)");
	text_set($"room_cave_3_border.{i++}", "* (You feel like this is the end to some sort of \"demo\"...)");
	text_set($"room_cave_3_border.{i++}", "* (... and that a \"full game\" has been canceled,^3 too...?)");
	text_set($"room_cave_3_border.{i++}", "* (Such strange feelings...)^1 &* (What could they mean...?)");
	text_set($"room_cave_3_border.{i++}", "* (Suddenly,^3 your mouth starts moving by itself as if it&was trying to speak.)");
	text_set($"room_cave_3_border.{i++}", "* (Could it be an attempt&at communication from a supernatural entity...?)");
	text_set($"room_cave_3_border.{i++}", "* (You muttered...^2 &\"Thanks for playing\".)");
	// room_cave_X
	text_set("unused_genodialog_1_0", "* (Just as before,^1 the sound of emptiness arrives yet again.)");
	text_set("unused_genodialog_1_1", "* (Your strength and patience )");
	text_set("unused_genodialog_1_1", "* (However,^1 your urge is far to being fulfilled.)");
	text_set("unused_genodialog_1_1", "* (But nobody came.)");
}