
function TEXTDATA_PT_OLD()
{
	global.textdata_pt = ds_map_create();
	// ds_map_add(global.textdata_pt, "", "");
	
	// start
	ds_map_add(global.textdata_pt, "start",	"Carregando...");
	
	// menu
	ds_map_add(global.textdata_pt, "menu_title_0",	"Jogar");
	ds_map_add(global.textdata_pt, "menu_title_1",	"Opções");
	ds_map_add(global.textdata_pt, "menu_title_2",	"Conquistas");
	ds_map_add(global.textdata_pt, "menu_title_3",	"Créditos");
	ds_map_add(global.textdata_pt, "menu_title_4",	"Sair");
	
	ds_map_add(global.textdata_pt, "menu_play_title", "Escreva o nome da\ncriança caída");
	ds_map_add(global.textdata_pt, "menu_play_0", "Voltar");
	ds_map_add(global.textdata_pt, "menu_play_1", "Editar");
	ds_map_add(global.textdata_pt, "menu_play_2", "Pronto");
	ds_map_add(global.textdata_pt, "menu_namer_0", "Capslock");
	ds_map_add(global.textdata_pt, "menu_namer_1", "Deletar");
	ds_map_add(global.textdata_pt, "menu_namer_2", "Pronto");
	
	ds_map_add(global.textdata_pt, "menu_settings_0", "Voltar");
	ds_map_add(global.textdata_pt, "menu_settings_1", "Controles");
	ds_map_add(global.textdata_pt, "menu_settings_2", "Idioma");
	ds_map_add(global.textdata_pt, "menu_settings_3", "Tela Cheia");
	ds_map_add(global.textdata_pt, "menu_settings_4", "Efeitos Visuais");
	ds_map_add(global.textdata_pt, "menu_settings_5", "Volume Geral");
	ds_map_add(global.textdata_pt, "menu_settings_6", "Volume Da Música");
	ds_map_add(global.textdata_pt, "menu_settings_7", "Volume Dos Sons");
	ds_map_add(global.textdata_pt, "menu_settings_8", "Auto-Run");
	ds_map_add(global.textdata_pt, "menu_settings_9", "Mostrar FPS");
	ds_map_add(global.textdata_pt, "menu_settings_10", "Mostrar Cronômetro");
	ds_map_add(global.textdata_pt, "menu_settings_11", "Esconder Notificações");
	ds_map_add(global.textdata_pt, "menu_settings_12", "Ativar Discord RPC");
	ds_map_add(global.textdata_pt, "menu_settings_13", "Sangue e Gore");
	ds_map_add(global.textdata_pt, "menu_settings_key_0", "Não");
	ds_map_add(global.textdata_pt, "menu_settings_key_1", "Sim");
	ds_map_add(global.textdata_pt, "menu_settings_key_pt", "Português");
	
	ds_map_add(global.textdata_pt, "menu_achievements_0", "Voltar");
	/*
	for (var i = 0; i < array_length(global.achievement); i++)
	{
		if (global.achievement_name[i] != 0)
			ds_map_add(global.textdata_pt, "menu_achievements_" + string(i + 1), global.achievement_name[i]);
	}
	*/

	ds_map_add(global.textdata_pt, "menu_credits_0", "Voltar");
	ds_map_add(global.textdata_pt, "menu_credits_info_0", "dsans - Programação, Arte, História,\n        Personagens, Tradução,\n        Mapa, Página Itch.io\n\nmigel - Músicas, Efeitos Sonoros,\n        Design do Broken Clock,\n        Site Oficial");
	ds_map_add(global.textdata_pt, "menu_credits_info_1", "Maari - Designs do Armsguy e Trashguy\nComunista - Ajuda no design do MEE6\nsam06tanb - Ajuda no site oficial\nfer10tanb - Ajuda na música");
	ds_map_add(global.textdata_pt, "menu_credits_info_2", "UNDERTALE e DELTARUNE por Toby Fox\n\nUNDERTALE Bits And Pieces por Team BnP\n\nBot do Discord MEE6 por Anis Belkacem");

	ds_map_add(global.textdata_pt, "menu_continue_0", "Voltar");
	ds_map_add(global.textdata_pt, "menu_continue_1", "Continuar");
	ds_map_add(global.textdata_pt, "menu_continue_2", "Resetar")

	ds_map_add(global.textdata_pt, "menu_controls_0", "Voltar");
	ds_map_add(global.textdata_pt, "menu_controls_1", "Resetar Teclas");
	ds_map_add(global.textdata_pt, "menu_controls_2", "*  Mover Esquerda");
	ds_map_add(global.textdata_pt, "menu_controls_3", "*  Mover Direita");
	ds_map_add(global.textdata_pt, "menu_controls_4", "*  Mover Cima");
	ds_map_add(global.textdata_pt, "menu_controls_5", "*  Mover Baixo");
	ds_map_add(global.textdata_pt, "menu_controls_6", "*  Selecionar");
	ds_map_add(global.textdata_pt, "menu_controls_7", "*  Selecionar  (ALT)");
	ds_map_add(global.textdata_pt, "menu_controls_8", "*  Desselecionar");
	ds_map_add(global.textdata_pt, "menu_controls_9", "*  Desselecionar  (ALT)");
	ds_map_add(global.textdata_pt, "menu_controls_10", "*  Correr");
	ds_map_add(global.textdata_pt, "menu_controls_11", "*  Correr  (ALT)");
	ds_map_add(global.textdata_pt, "menu_controls_12", "*  Menu do Jogo");
	ds_map_add(global.textdata_pt, "menu_controls_13", "*  Menu do Jogo  (ALT)");
	ds_map_add(global.textdata_pt, "menu_controls_14", "*  Pausar Jogo");
	ds_map_add(global.textdata_pt, "menu_controls_15", "*  Tela Cheia");
	
	// intro
	/*
	ds_map_add(global.textdata_pt, "intro_0", "Long ago,^1 three friends had met each other during class.^2");
	ds_map_add(global.textdata_pt, "intro_1", "After some time,^1 they decided to create a server in Discord.^2");
	ds_map_add(global.textdata_pt, "intro_2", "As the years went by,^1 new members had joined the server.^2");
	ds_map_add(global.textdata_pt, "intro_3", "One day,^1 the owner was testing a new Discord feature.^2");
	ds_map_add(global.textdata_pt, "intro_4", "But it went very,^1 very wrong.^2^2^2^1");
	ds_map_add(global.textdata_pt, "intro_5", "Many years later^2.^2.^2.^2^2^1");
	ds_map_add(global.textdata_pt, "intro_6", "FORTALEZA - \\11/14/2022");
	ds_map_add(global.textdata_pt, "intro_7", "A brazilian boy was practing soccer in&a football pitch.");
	
	ds_map_add(global.textdata_pt, "intro_8", "By mistake,^1 the ball fell inside a strange dumpster nearby.");
	ds_map_add(global.textdata_pt, "intro_9", "When the boy was trying to get the ball,^1 he fell inside the dumpster.");
	ds_map_add(global.textdata_pt, "intro_10", "The bottom of the dumpster opened,^1 revealing a giant portal.");
	ds_map_add(global.textdata_pt, "intro_11", "The boy fell inside the portal and he was taken to another world.^2");
	*/
	
	// game over
	ds_map_add(global.textdata_pt, "gameover_0", "CONTINUAR");
	ds_map_add(global.textdata_pt, "gameover_1", "DESISTIR");
	
	// worlds
	ds_map_add(global.textdata_pt, "world_name_corridors",	"Corredores");
	ds_map_add(global.textdata_pt, "world_name_caverns",	"Cavernas");
	
	// rooms
	ds_map_add(global.textdata_pt, "room_corridors_1",		"O Quarto dos Novos Membros");
	ds_map_add(global.textdata_pt, "room_corridors_1_5",	"Primeiro Corredor");
	ds_map_add(global.textdata_pt, "room_corridors_2",		"Quarto do MEE6");
	ds_map_add(global.textdata_pt, "room_corridors_3",		"Entrada");
	ds_map_add(global.textdata_pt, "room_corridors_3_5",	"Treinamento do Boneco");
	ds_map_add(global.textdata_pt, "room_corridors_4",		"Caminho na Grama");
	ds_map_add(global.textdata_pt, "room_corridors_5",		"CAPTCHA (Estágio 1)");
	ds_map_add(global.textdata_pt, "room_corridors_5_A",	"CAPTCHA (Estágio 1 - Quebra-cabeça 1)");
	ds_map_add(global.textdata_pt, "room_corridors_5_B",	"CAPTCHA (Estágio 1 - Quebra-cabeça 2)");
	ds_map_add(global.textdata_pt, "room_corridors_6",		"Recompensa do CAPTCHA (Estágio 1)");
	ds_map_add(global.textdata_pt, "room_corridors_7",		"Corredor Relaxante");
	ds_map_add(global.textdata_pt, "room_corridors_8",		"Toca do Rato");
	ds_map_add(global.textdata_pt, "room_corridors_9",		"CAPTCHA (Estágio 2)");
	ds_map_add(global.textdata_pt, "room_corridors_10",		"Recompensa do CATPCHA (Estágio 2)");
	ds_map_add(global.textdata_pt, "room_corridors_11",		"Caminho Relaxante");
	ds_map_add(global.textdata_pt, "unused_room_corridors_12",		"O Relógio");
	ds_map_add(global.textdata_pt, "unused_room_corridors_13",		"Caminho das Pedras");
	ds_map_add(global.textdata_pt, "room_corridors_14",		"CAPTCHA (Último Estágio)");
	ds_map_add(global.textdata_pt, "unused_room_corridors_15",		"Recompensa do CAPTCHA (Último Estágio)");
	ds_map_add(global.textdata_pt, "unused_room_corridors_16",		"Ponto de Controle");
	ds_map_add(global.textdata_pt, "unused_room_corridors_16_A",	"Entrada das Cavernas");
	ds_map_add(global.textdata_pt, "unused_room_corridors_16_B",	"Entrada do Metrô nos Corredores");
	ds_map_add(global.textdata_pt, "room_corridors_17",		"Último Caminho");
	ds_map_add(global.textdata_pt, "room_corridors_18",		"Corredor Final");
	ds_map_add(global.textdata_pt, "room_caverns_1",		"No Fundo do Poço");
	ds_map_add(global.textdata_pt, "room_caverns_2",		"Eu Espero Que Você Goste do Escuro Porque Isso É Apenas o Começo");
	ds_map_add(global.textdata_pt, "room_caverns_3",		"Pilares Altos");
	
	ds_map_add(global.textdata_pt, "unused_room_corridors_4_5",	"Regras");
	ds_map_add(global.textdata_pt, "room_corridors_1_doors","Elevador Estranho");
	ds_map_add(global.textdata_pt, "unused_room_happybirthday",	"Feliz Aniversário");
	
	// items
	ds_map_add(global.textdata_pt, "item_name_none",		"(Vazio)");
	
	ds_map_add(global.textdata_pt, "item_name_broomstick",	"Cabo de Vassoura");
	ds_map_add(global.textdata_pt, "item_name_bandage",		"Curativo");
	ds_map_add(global.textdata_pt, "item_name_candy",		"Doce Barato");
	ds_map_add(global.textdata_pt, "item_name_bowl",		"Pote de Doce");
	ds_map_add(global.textdata_pt, "item_name_choco",		"Barra de Chocolate");
	ds_map_add(global.textdata_pt, "item_name_kunai",		"Kunai");
	ds_map_add(global.textdata_pt, "item_name_helmet",		"Capacete Quebrado");
	
	ds_map_add(global.textdata_pt, "item_name_broomstick_small",	"CaboVasora");
	ds_map_add(global.textdata_pt, "item_name_bandage_small",		"");
	ds_map_add(global.textdata_pt, "item_name_7belo_small",			"Doce Brto");
	ds_map_add(global.textdata_pt, "item_name_bowl_small",			"Pote Doce");
	ds_map_add(global.textdata_pt, "item_name_baton_small",			"Brr Choco");
	ds_map_add(global.textdata_pt, "item_name_kunai_small",			"");
	ds_map_add(global.textdata_pt, "item_name_helmet_small",		"Cpcte Qbrdo");
	
	ds_map_add(global.textdata_pt, "item_name_broomstick_serious",	"Cabo");
	ds_map_add(global.textdata_pt, "item_name_bandage_serious",		"");
	ds_map_add(global.textdata_pt, "item_name_7belo_serious",		"Doce");
	ds_map_add(global.textdata_pt, "item_name_bowl_serious",		"Pote");
	ds_map_add(global.textdata_pt, "item_name_baton_serious",		"Chocolate");
	ds_map_add(global.textdata_pt, "item_name_kunai_serious",		"Faca");
	ds_map_add(global.textdata_pt, "item_name_helmet_serious",		"Capacete");
	
	ds_map_add(global.textdata_pt, "item_desc_broomstick",	"* Cabo de Vassoura - [0 ATK]^1&* Parece que vai quebrar a qualquer momento.");
	ds_map_add(global.textdata_pt, "item_desc_bandage",		"* Curativo - [0 DEF]^1&* Você usou ele durante muito tempo.");
	ds_map_add(global.textdata_pt, "item_desc_7belo",		"* Doce 7-Belo - [CURA 7 HP]^1&* Tem gosto de morango.");
	ds_map_add(global.textdata_pt, "item_desc_bowl",		"* Pote de Doce - [3 DEF]^1&* Tem cheiro de morango estragado.");
	ds_map_add(global.textdata_pt, "item_desc_baton",		"* Baton Garoto - [CURA 12 HP]^1&* É um chocolate em formato cilíndrico.");
	ds_map_add(global.textdata_pt, "item_desc_kunai",		"* Kunai - [3 ATK]^1&* Tem uma mancha de sangue em sua área cortante.");
	ds_map_add(global.textdata_pt, "item_desc_helmet",		"* Capacete Quebrado - [7 DEF]^1&* ");
	
	ds_map_add(global.textdata_pt, "item_equip", "* (Você equipou ");
	
	ds_map_add(global.textdata_pt, "item_use_0", "* (Você usou o ");
	ds_map_add(global.textdata_pt, "item_use_1", "&* (Você recuperou ");
	ds_map_add(global.textdata_pt, "item_use_2", "&* (Seu HP foi maximizado.)");
	
	ds_map_add(global.textdata_pt, "item_drop_0.0", "* (");
	ds_map_add(global.textdata_pt, "item_drop_0.1", " foi jogado fora.)");
	
	ds_map_add(global.textdata_pt, "item_pickup", "* (Você pegou ");
	ds_map_add(global.textdata_pt, "item_cantpickup", "* (Seu inventário está cheio.)");
	
	// chara menu
	ds_map_add(global.textdata_pt, "charamenu_main_info_3", "R$");
	
	ds_map_add(global.textdata_pt, "charamenu_item_title_0", "INVENTÁRIO");
	ds_map_add(global.textdata_pt, "charamenu_item_title_1", "SEUS STATUS");
	ds_map_add(global.textdata_pt, "charamenu_item_title_2", "CELULAR");
	ds_map_add(global.textdata_pt, "charamenu_item_other_0", "USAR");
	ds_map_add(global.textdata_pt, "charamenu_item_other_1", "INFO");
	ds_map_add(global.textdata_pt, "charamenu_item_other_2", "DROP");
	
	ds_map_add(global.textdata_pt, "charamenu_stat_spares", "POUPAR");
	ds_map_add(global.textdata_pt, "charamenu_stat_kills", "MORTOS");
	ds_map_add(global.textdata_pt, "charamenu_stat_heals", "CURAS ");
	ds_map_add(global.textdata_pt, "charamenu_stat_deaths", "MORTES");
	ds_map_add(global.textdata_pt, "charamenu_stat_weapon", "ARMA    ");
	ds_map_add(global.textdata_pt, "charamenu_stat_armor", "ARMADURA");
	
	// chara pause
	ds_map_add(global.textdata_pt, "charapause_title", "JOGO PAUSADO");
	ds_map_add(global.textdata_pt, "charapause_0", "Continuar");
	ds_map_add(global.textdata_pt, "charapause_1", "Menu  Principal");
	ds_map_add(global.textdata_pt, "charapause_2", "Fechar  Jogo");
	
	ds_map_add(global.textdata_pt, "charapause_warning_title_0", "Você tem certeza? Você vai\nperder tudo não salvo.");
	ds_map_add(global.textdata_pt, "charapause_warning_title_1", "Você tem certeza? Você\nvai perder tudo.");
	ds_map_add(global.textdata_pt, "charapause_warning_0", "Não");
	ds_map_add(global.textdata_pt, "charapause_warning_1", "Sim");
	
	// battle main
	ds_map_add(global.textdata_pt, "battle_main_sparing_0", " está te poupando.");
	ds_map_add(global.textdata_pt, "battle_main_sparing_1_0", " e ");
	ds_map_add(global.textdata_pt, "battle_main_sparing_1_1", " estão te poupando.");
	
	ds_map_add(global.textdata_pt, "battle_fight_0", "ERROU");
	ds_map_add(global.textdata_pt, "battle_fight_1", "BLOQUEIO");
	
	ds_map_add(global.textdata_pt, "battle_act_0", "Checar");
		
	ds_map_add(global.textdata_pt, "battle_mercy_0", "* Poupar");
	ds_map_add(global.textdata_pt, "battle_mercy_1", "* Fugir");
	
	ds_map_add(global.textdata_pt, "battle_won_0", "* (VOCÊ GANHOU!)^1&* (Você conseguiu :Y");
	ds_map_add(global.textdata_pt, "battle_won_1", " EXP;D e :YR$");
	ds_map_add(global.textdata_pt, "battle_won_2", "^1&* (Seu :YLVL;D aumentou.)");
	
	ds_map_add(global.textdata_pt, "battle_flee_0", "* Eu tenho coisa melhor pra fazer.");
	ds_map_add(global.textdata_pt, "battle_flee_1", "* Te vejo amanhã.");
	ds_map_add(global.textdata_pt, "battle_flee_2", "* Foi bom te conhecer.");
	ds_map_add(global.textdata_pt, "battle_flee_3", "* Xispa bicho chato.");
	ds_map_add(global.textdata_pt, "battle_flee_4", "* Casca fora.");
	
	ds_map_add(global.textdata_pt, "battle_nobody", "* Mas ninguém veio.");
	
	// achievements descriptions
	ds_map_add(global.textdata_pt, "achievement_desc_m6toy",		"Encontre o boneco escondido do MEE6");
	ds_map_add(global.textdata_pt, "achievement_desc_sbhelmet",		"Consiga a armadura que cheira a morango");
	ds_map_add(global.textdata_pt, "achievement_desc_corsparedall", "Poupe todos os inimigos dos Corredores");
	ds_map_add(global.textdata_pt, "achievement_desc_brockwin",		"Derrote Broken Clock");
	ds_map_add(global.textdata_pt, "achievement_desc_restart",		"Resete seu arquivo salvo pela primeira vez");
	
	// save
	ds_map_add(global.textdata_pt, "savepoint_0", "* [Esse sistema de save é temporário.]");
	ds_map_add(global.textdata_pt, "savepoint_1", "* [Quando você fechar o jogo,^1 você vai perder seu progresso.]");
	ds_map_add(global.textdata_pt, "savepoint_2", "* [Você não vai perder progresso ao retornar para o Menu.]");
	ds_map_add(global.textdata_pt, "savepoint_3", "* (Seu HP foi restaurado.)");
	ds_map_add(global.textdata_pt, "savepoint_4", "");
	ds_map_add(global.textdata_pt, "savepoint_4_1", "Salvar");
	ds_map_add(global.textdata_pt, "savepoint_4_2", "Voltar");
	ds_map_add(global.textdata_pt, "savepoint_5", "Arquivo salvo.");
	
	// border
	ds_map_add(global.textdata_pt, "border_0", "* (Essa borda elétrica te dá o sentimento que a PRE-DEMO acabou.)");
	//ds_map_add(global.textdata_pt, "border_0", "* (Tem uma borda elétrica que impede você de continuar.)");
	
	// genofeeling
	ds_map_add(global.textdata_pt, "genofeeling", ";R* (Algo te diz que você não deveria continuar ainda.)");
	
	// genodialog
	ds_map_add(global.textdata_pt, "genodialog_0_1_unused", "* (Você consegue sentir o poder nas suas mãos...)");
	ds_map_add(global.textdata_pt, "genodialog_0_2_unused", "* (A força atravessando as suas veias...)");
	ds_map_add(global.textdata_pt, "genodialog_0_3_unused", "* (O seu desejo de acabar as vidas dos outros é tão profunda...)");
	ds_map_add(global.textdata_pt, "genodialog_0_4_unused", "* (Mas ninguém veio.)");
	
	// room_corridors_1
	ds_map_add(global.textdata_pt, "room_lamp","* (É uma lâmpada.)");
	ds_map_add(global.textdata_pt, "room_pillar","* (É um pilar.)");
	ds_map_add(global.textdata_pt, "room_brokenlamp", "* (Esta lâmpada foi fortemente jogada contra o chão.)");
	
	// obj_event_m6_start
	ds_map_add(global.textdata_pt, "event_m6_start_0_0", "* Você é um novo membro?");
	ds_map_add(global.textdata_pt, "event_m6_start_0_1", "* Você não faz parte deles,^1 faz?");
	ds_map_add(global.textdata_pt, "event_m6_start_0_2", "* ...^2 Tá certo.");
	
	ds_map_add(global.textdata_pt, "event_m6_start_1_0", "* Olá,^1 novo membro.^1&* Bem-vindo ao mundo&de ;UDumpster Friends;D!");
	ds_map_add(global.textdata_pt, "event_m6_start_1_1", "* Meu nome é :6MEE6;D.^1&* Eu sou um :6ROBÔ;D feito para te ajudar.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_2", "* ... e você provavelmente não deveria estar aqui.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_3", "* Nós estamos nos&:RCORREDORES;D,^1 um lugar abandonado.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_4", "* Mesmo que tenha uma saída,^1 é perigoso para chegar lá.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_5", "* Além disso,^1 os :RCORREDORES;D são cheios de quebra-cabeças.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_6", "* Esses quebra-cabeças são o que estão me deixando preso aqui.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_7", "* Quando eu digo que você não deveria estar aqui,^1 é por causa disso.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_8", "* Eu não vou te parar de sair,^1 mas você tem que saber o perigo.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_9", "* Bom,^1 eu te desejo boa sorte em sua aventura.");
	ds_map_add(global.textdata_pt, "event_m6_start_1_10", "* Até mais,^1 novo membro.");
	
	ds_map_add(global.textdata_pt, "event_m6_start_2_0", "* ... Espera.");
	
	ds_map_add(global.textdata_pt, "event_m6_start_3_0", "* Eu tenho uma ideia.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_1", "* Se nós fôssemos juntos,^1 nós poderíamos sair&dos :RCORREDORES;D.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_2", "* Meu conhecimento e o seu poder poderia facilitar nossa aventura.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_3", "* A saída leva para a cidade deste mundo,^1 um lugar seguro e populoso.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_4", "* Então eu te pergunto,^1 novo membro.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_5", "* Eu posso por favor seguir você em sua aventura?");
	ds_map_add(global.textdata_pt, "event_m6_start_3_6", "* Você é a minha única chance de sair deste lugar.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_7", "* (Deixar MEE6 ir com você?)");
	ds_map_add(global.textdata_pt, "event_m6_start_3_7_1", "Sim");
	ds_map_add(global.textdata_pt, "event_m6_start_3_7_2", "Não");
	ds_map_add(global.textdata_pt, "event_m6_start_3_8_1", "* Bom,^1 muito obrigado,^1 novo membro.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_9_1", "* Estou agradecido que você aceitou a minha proposta.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_8_2", "* Ei.^1 Olha.^1 Meu sistema não entende sarcasmo,^1&tá certo?");
	ds_map_add(global.textdata_pt, "event_m6_start_3_9_2", "* Mas estou agradecido que você aceitou meu pedido.");
	ds_map_add(global.textdata_pt, "event_m6_start_3_10", "* Eu vou fazer tudo em meu alcance para te ajudar.");
	
	ds_map_add(global.textdata_pt, "event_m6_start_4_0", "* Agora,^1 vamos lá,^1 temos uma aventura para viver!");
	
	// room_corridors_2
	ds_map_add(global.textdata_pt, "room_m6_banner_0", "* (É um banner velho.)");
	ds_map_add(global.textdata_pt, "room_m6_banner_1", "* (O banner está anúnciando um produto e informando seu uso.)");
	ds_map_add(global.textdata_pt, "room_m6_banner_2", "* (Está dizendo que MEE6 estaria vendendo esse produto&por você.)");
		
	ds_map_add(global.textdata_pt, "room_m6_poster_0", "* (É um poster.)");
	ds_map_add(global.textdata_pt, "room_m6_poster_1", "* (Ele diz alguma coisa sobre&o MEE6 lembrar do seu aniversário.)");
	ds_map_add(global.textdata_pt, "room_m6_poster_2", "* (Também tem um desenho dele vestindo um chapéu de aniversário.)");
		
	ds_map_add(global.textdata_pt, "room_m6_table_0", "* (Está trancado.)");
	ds_map_add(global.textdata_pt, "room_m6_table_1", "* (Você quer ir por baixo?)");
	ds_map_add(global.textdata_pt, "room_m6_table_2", "* (Não,^1 você não quer.)");

	ds_map_add(global.textdata_pt, "room_m6_papers_0", "* (É um par de papéis grampeados.)");
	ds_map_add(global.textdata_pt, "room_m6_papers_1", "* (Tem um termos de licença neles.)");
	ds_map_add(global.textdata_pt, "room_m6_papers_2", "* (Você decide não ler.)");
	
	// room_corridors_3
	ds_map_add(global.textdata_pt, "room_m6_brokenwall_0", "* (Tem um boneco do MEE6 com o tamanho de uma formiga dentro do buraco dessa parede.)");
	ds_map_add(global.textdata_pt, "room_m6_brokenwall_1", "* (Estranhamente,^1 o boneco retrata o MEE6 como um&robô alto.)");
	
	ds_map_add(global.textdata_pt, "room_deadlamp", "* (A luz desta lâmpada parece estar desativada.)");
	
	// obj_event_m6_predummy	
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_0", "* Como eu disse antes,^1&os :RCORREDORES;D são muito perigosos.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_1", "* Isso é porque este lugar é cheio de monstros e criaturas.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_2", "* Normalmente eles não seriam perigosos para você.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_3", "* Entretanto,^1 esses monstros conseguem iniciar :YBATALHAS;D.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_4", "* Uma :YBATALHA;D é um desafio entre dois ou mais usuários.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_5", "* O objetivo de cada jogador é :Rmatar;D ou&:Ypoupar;D o oponente.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_6", "* Se você entrar em uma&:YBATALHA;D e o inimigo quiser te matar, ...");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_7", "* ... você talvez não sobreviva se você não souber como vencer.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_0_8", "* É importante que você saiba como esse desafio funciona.");
	
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_0", "* Este boneco de pano é usado para&treinar :YBATALHAS;D.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_1", "* Você gostaria de entrar em uma batalha com o boneco?");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_2", "* Eu iria te guiar durante todo o desafio.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_3", "* (Batalhar com o boneco?)");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_3_1", "Sim");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_3_2", "Não");
	
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_1_4", "* Ótimo!");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_1_5", "* Chegue perto do boneco e interaja com ele para iniciar a :YBATALHA;D.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_1_6_0", "* (Aperte :Y[");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_1_6_1", " ou ");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_1_6_2", "];D para interagir com objetos próximos.)");
	
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_2_4", "* ... T-Tá certo.");
	ds_map_add(global.textdata_pt, "event_m6_predummy_1_2_5", "* Vamos para aquela porta.");
	
	// room_corridors_3_5
	ds_map_add(global.textdata_pt, "npc_dummy_0", "* (Tem um boneco de pano aqui.)");
	ds_map_add(global.textdata_pt, "npc_dummy_1", "* (Batalhar com o boneco?)");
	ds_map_add(global.textdata_pt, "npc_dummy_1_1", "Sim");
	ds_map_add(global.textdata_pt, "npc_dummy_1_2", "Não");
	ds_map_add(global.textdata_pt, "npc_dummy_2", "* (Está estranhamente quieto.)");
	
	// obj_event_m6_postdummy
	ds_map_add(global.textdata_pt, "event_m6_postdummy_0", "* Você é muito bom nisso.");
	ds_map_add(global.textdata_pt, "event_m6_postdummy_1", "* É quase como se você já tivesse visto isso em algum outro lugar...!");
	ds_map_add(global.textdata_pt, "event_m6_postdummy_2", "* De qualquer maneira,^1 vamos para aquela porta.");
	
	// obj_event_m6_dummydoor
	ds_map_add(global.textdata_pt, "event_m6_dummydoor_0", "* A partir de agora,^1 nós vamos encontrar monstros.");
	ds_map_add(global.textdata_pt, "event_m6_dummydoor_1_1", "* Eu espero que você entendeu como :YBATALHAS;D funcionam.");
	ds_map_add(global.textdata_pt, "event_m6_dummydoor_1_2", "* Eu espero que você saiba como :YBATALHAS;D funcionam.");
	ds_map_add(global.textdata_pt, "event_m6_dummydoor_2", "* Bom,^1 vamos apenas continuar.");
	
	// room_corridors_4	
	ds_map_add(global.textdata_pt, "npc_armsguy_0_0", "* Você É Um Novo Membro?");
	ds_map_add(global.textdata_pt, "npc_armsguy_0_1", "* Perfeito.^1 &* Eu Sou Armsguy,^1 Um Monstro.");
	ds_map_add(global.textdata_pt, "npc_armsguy_0_2", "* ... Porque Eu Sou O Único Armsguy Que Não Te Ataca?");
	ds_map_add(global.textdata_pt, "npc_armsguy_0_3", "* Não Tem Muito Motivo.^1&* Você É Uma Criança.^1 &* Como Você Seria Perigoso?");
	ds_map_add(global.textdata_pt, "npc_armsguy_0_4", "* A Não Ser Que Você Mate Um Monstro.^1&* Aí Eu Vou Correr.");
	ds_map_add(global.textdata_pt, "npc_armsguy_1_0", "* Tenta Virar Amigo Dos Outros Monstros.");
	ds_map_add(global.textdata_pt, "npc_armsguy_1_1", "* Eles Só Estão Te Atacando Porque Eles Estão Com Medo.");
	ds_map_add(global.textdata_pt, "npc_armsguy_1_2", "* Se Você Mostrar Que Você Não Vai Machucar Eles,^1 Tu Tá De Boa.");
	
	// unused_room_corridors_4_5
	ds_map_add(global.textdata_pt, "room_rulesbook_0", "* (É um livro antigo.)");
	ds_map_add(global.textdata_pt, "room_rulesbook_1", "* (O título do livro é \"Regras\".)");
	ds_map_add(global.textdata_pt, "room_rulesbook_2", "* (Algumas páginas estão arrancadas e outras cheias de desenhos.)");
	ds_map_add(global.textdata_pt, "room_rulesbook_3", "* (Alguém desenhou a mesma carinha feliz umas cem vezes.)");
	
	// obj_event_m6_precaptcha1
	ds_map_add(global.textdata_pt, "event_m6_precaptcha1_0", "* Essa é umas das portas que me fez ficar aqui por todo este tempo.");
	ds_map_add(global.textdata_pt, "event_m6_precaptcha1_1", "* Queria saber porque os quebra-cabeças são tão difíceis.");
	ds_map_add(global.textdata_pt, "event_m6_precaptcha1_2", "* De qualquer maneira,^1 eu acho que você deveria ler aquela placa.");
	ds_map_add(global.textdata_pt, "event_m6_precaptcha1_3", "* Ela pode te ajudar a entender como abrir a porta!");
	
	// room_corridors_5
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_1_0", "* \"[CAPTCHA - ESTÁGIO 1]\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_1_1", "* \"Para você entrar no servidor,^1 é necessário checar se você não é um robô.\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_1_2", "* \"Você pode confirmar que não é um robô ao completar dois quebra-cabeças.\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_1_3", "* \"Um na esquerda e outro na direita.\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_1_4", "* \"Quando os dois quebra-cabeças estiverem completos,^1 a porta vai abrir.\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_1_5", "* \"Boa sorte!\"");
	
	// room_corridors_5_A, room_corridors_5_B
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_1_0", "* \"[CAPTCHA - INSTRUÇÕES]\"");	
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_1_1", "* \"O seu objetivo é escrever o que está na imagem.\"");
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_1_2", "* \"Você precisa usar todos os botões para escrever.\"");
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_1_3", "* \"Você consegue apertar os botões ao pisar em cima deles.\"");
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_1_4", "* \"Aperte o botão com um 'X' para resetar o quebra-cabeça.\"");
	
	ds_map_add(global.textdata_pt, "room_captcha1_0", "MICROFONE");
	ds_map_add(global.textdata_pt, "room_captcha1_1", "TABULEIRO");
	ds_map_add(global.textdata_pt, "room_captcha1_2", "GELADEIRA");
	ds_map_add(global.textdata_pt, "room_captcha1_3", "BICICLETA");

	// obj_event_m6_postcaptcha1
	ds_map_add(global.textdata_pt, "event_m6_postcaptcha1_0", "* Você abriu a porta?!");
	ds_map_add(global.textdata_pt, "event_m6_postcaptcha1_1", "* Eu sabia que você podia fazer isso.");
	ds_map_add(global.textdata_pt, "event_m6_postcaptcha1_2", "* Obrigado,^1 humano.");
	ds_map_add(global.textdata_pt, "event_m6_postcaptcha1_3", "* Bom,^1 vamos continuar,^1 não temos tempo a perder!");
		
	// room_corridors_6
	ds_map_add(global.textdata_pt, "room_candybowl_0_0_0", "* (É um pote de doce.)");
	ds_map_add(global.textdata_pt, "room_candybowl_0_0_1", "^1&* (");
	ds_map_add(global.textdata_pt, "room_candybowl_0_0_2", "Tem ");
	ds_map_add(global.textdata_pt, "room_candybowl_0_0_3", "Têm ");
	ds_map_add(global.textdata_pt, "room_candybowl_0_0_4", " doce dentro do pote.)");
	ds_map_add(global.textdata_pt, "room_candybowl_0_0_5", " doces dentro do pote.)");
	ds_map_add(global.textdata_pt, "room_candybowl_0_1", "* (Pegar um doce?)");
	ds_map_add(global.textdata_pt, "room_candybowl_0_1_1", "Sim");
	ds_map_add(global.textdata_pt, "room_candybowl_0_1_2", "Não");
	ds_map_add(global.textdata_pt, "room_candybowl_0_2", "* (Você pegou um doce do pote.)");
	ds_map_add(global.textdata_pt, "room_candybowl_0_3", "* (Você conseguiu&um :YDoce 7-Belo;D.)");
	ds_map_add(global.textdata_pt, "room_candybowl_0_4_0", "* (Aperte :Y[");
	ds_map_add(global.textdata_pt, "room_candybowl_0_4_1", " ou ");
	ds_map_add(global.textdata_pt, "room_candybowl_0_4_2", "];D para abrir o menu.)");
	ds_map_add(global.textdata_pt, "room_candybowl_1_0", "* (Era um pote de doce.)");
	ds_map_add(global.textdata_pt, "room_candybowl_1_1", "* (Mas você pegou tudo.)");
	ds_map_add(global.textdata_pt, "room_candybowl_1_2", "* (Na verdade,^1 você pode pegar o pote e usar como armadura.)");
	ds_map_add(global.textdata_pt, "room_candybowl_1_3", "* (Pegar o pote?)");
	ds_map_add(global.textdata_pt, "room_candybowl_1_3_1", "Sim");
	ds_map_add(global.textdata_pt, "room_candybowl_1_3_2", "Não");
	ds_map_add(global.textdata_pt, "room_candybowl_1_4", "* (Você pegou o pote.)");
	ds_map_add(global.textdata_pt, "room_candybowl_1_5", "* (Você conseguiu&o :YPote de Doce;D.)");
	ds_map_add(global.textdata_pt, "room_candybowl_2", "* (Seu inventário está cheio.)");
	
	ds_map_add(global.textdata_pt, "room_candysign_0", "* \"Parabéns por concluir a nossa verificação do CAPTCHA&ESTÁGIO 1!\"");
	ds_map_add(global.textdata_pt, "room_candysign_1", "* \"A verificação não está terminada,^1 mas apenas pausada.\"");
	ds_map_add(global.textdata_pt, "room_candysign_2", "* \"Mas como recompensa,^1 você pode pegar alguns doces do pote.\"");
	
	// room_corridors_7
	ds_map_add(global.textdata_pt, "room_relaxsign_0", "* \"Ei!^1 Ficou cansado depois disso tudo?\"");
	ds_map_add(global.textdata_pt, "room_relaxsign_1", "* \"Se quiser,^1 você pode relaxar aqui o quanto quiser.\"");
	ds_map_add(global.textdata_pt, "room_relaxsign_2", "* \"Aí quando você estiver descansado,^1 você pode continuar!\"");
		
	// room_corridors_8
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_0", "* Ei,^1 Você.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_1", "* Tu É O Novo Membro,^1 Né?");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_2", "* Pode Me Ajudar Com Algo?");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_3", "* Meu Amigão Ficou Preso No Segundo Estágio Do Captcha 2.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_4", "* Eu Tô Aqui Porque Ele Pediu Pra Eu Chamar Ajuda.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_5", "* Eu Vou Te Dar Uma Recompensa.^1&* Não Se Preocupa.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_6", "* (Você quer ajudar o Armsguy?)");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_6_1", "Sim");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_0_6_2", "Não");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_1_0", "* Perfeito.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_1_1", "* Vou Ficar Esperando Por Vocês Aqui.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_1_2", "* Meu Medo De Altura É Grande De Mais Para Eu Chegar Perto Daquilo.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_2_0", "* Tá Certo.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_0_2_1", "* Eu Acho Que Eu Vou Procurar Por Alguma Outra Pessoa.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_0_0", "* Tu Pelo Menos Sabe Onde Tá O Captcha 2?");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_0_1", "* Tá Bem Ali Em Cima.^1&* Depois Daquela Porta Com Pilares.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_0", "* Muito Obrigado,^1 Humano.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_1", "* Como Eu Prometi,^1 Vou Te Dar Uma Recompensa.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_2", "* Não Sei Se Tu Vai Usar Isso,^1 Mas Eu Encontrei Por Aqui.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_3", "* É Tipo Uma Faca,^1 Só Que Estranha.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_4", "* Aqui.^1&* É Todo Seu.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_5", "* (Você conseguiu a :YKunai;D.)");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_1_6", "* Espero Que Você Goste.");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_2_0", "* O Quê?^1&* Tu Não Gostou?");
	ds_map_add(global.textdata_pt, "npc_armsguy_lost_1_2_1", "* ...^2 Desculpa.");
	
	ds_map_add(global.textdata_pt, "npc_trashguy_lost2", "* ...obrigado...");
		
	// obj_event_m6_precaptcha2
	ds_map_add(global.textdata_pt, "event_m6_precaptcha2_0", "* Ótimo!^1&* Já tem outro CAPTCHA.");
	ds_map_add(global.textdata_pt, "event_m6_precaptcha2_1", "* O mais rápido que nós formos mais cedo nós vamos sair.");
	ds_map_add(global.textdata_pt, "event_m6_precaptcha2_2", "* Bom,^1 vou deixar para você agora.");
	
	// room_corridors_9
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_2_0", "* \"[CAPTCHA - ESTÁGIO 2]\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_2_1", "* \"Esse é o segundo estágio da verificação do CAPTCHA.\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_2_2", "* \"Você tem que completar três quebra-cabeças para chegar no final do quarto.\"");
	ds_map_add(global.textdata_pt, "room_captcha_mainsign_2_3", "* \"Boa sorte!\"");
	
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_2_0", "* \"[CAPTCHA - INSTRUÇÕES]\"");
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_2_1", "* \"Seu objetivo é levar a&caixa do chão :Frosa;D para o chão :Lverde;D.\"");
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_2_2", "* \"A caixa pode apenas ser movida através do chão branco no mecanismo.\"");
	ds_map_add(global.textdata_pt, "room_captcha_guidesign_2_3", "* \"Você move a caixa ao interagir com ela.\"");
	
	ds_map_add(global.textdata_pt, "npc_trashguy_lost1_0", "* ...voce resolveu o puzzle...?");
	ds_map_add(global.textdata_pt, "npc_trashguy_lost1_1", "* ...agora eu consigo voltar e encontrar meu amigo...");
	ds_map_add(global.textdata_pt, "npc_trashguy_lost1_2", "* ...muito obrigado...");
	
	// obj_event_m6_postcaptcha2
	ds_map_add(global.textdata_pt, "event_m6_postcaptcha2_0", "* Por que você é tão bom nisso?!");
	ds_map_add(global.textdata_pt, "event_m6_postcaptcha2_1", "* De qualquer maneira,^1 vamos continuar!");
	
	// room_corridors_10
	ds_map_add(global.textdata_pt, "room_chocobowl_0", "* (É um pote de chocolate.)");
	ds_map_add(global.textdata_pt, "room_chocobowl_1", "* (Parece que algo aconteceu que o pote quebrou.)");
	ds_map_add(global.textdata_pt, "room_chocobowl_2", "* (Todos os chocolates foram esmagados,^1 menos um.)");
	ds_map_add(global.textdata_pt, "room_chocobowl_3", "* (Pegar o chocolate?)");
	ds_map_add(global.textdata_pt, "room_chocobowl_3_1", "Sim");
	ds_map_add(global.textdata_pt, "room_chocobowl_3_2", "Não");
	ds_map_add(global.textdata_pt, "room_chocobowl_4_0", "* (Você pegou o chocolate.)");
	ds_map_add(global.textdata_pt, "room_chocobowl_5_0", "* (Você conseguiu&o :YBaton Garoto;D.)");
	ds_map_add(global.textdata_pt, "room_chocobowl_4_1", "* (Seu inventário está cheio.)");
	
	// room_corridors_11
	ds_map_add(global.textdata_pt, "npc_trashguy_0_0", "* (É uma lata de lixo.)");
	ds_map_add(global.textdata_pt, "npc_trashguy_0_1", "* (Na verdade,^1 é um monstro horrível fingindo ser uma&lata de lixo normal.)");
	ds_map_add(global.textdata_pt, "npc_trashguy_1_0", "* (A vida realmente tem umas mudanças drásticas as vezes.)");
	
	ds_map_add(global.textdata_pt, "room_preclocksign_0", "* \"Ei!\"^1&* \"Quer ver algo legal?\"");
	ds_map_add(global.textdata_pt, "room_preclocksign_1", "* \"Está no próximo quarto,^1 vai dar uma olhada!\"");
	ds_map_add(global.textdata_pt, "room_preclocksign_2", "* \"A não ser que você esteja sem tempo.\"^1&* \"Você poderia só se atrasar.\"");
	
	// obj_event_brock_prebattle
	ds_map_add(global.textdata_pt, "event_brock_prebattle_0_0", "* TU REALMENTE ACHOU QUE EU NÃO IA TE VER?");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_0_1", "* MESMO DEPOIS D()");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_0_2", "* Ei,^1 relógio estúpido!^1&* Você não pode nos prender aqui!");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_0_3", "* CALA A BOCA!!!");
	
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_0", "* FINALMENTE SÓ NÓS DOIS.");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_1", "* TU PENSA QUE PODE SÓ PASSAR POR MIM E IGNORAR MINHA EXISTÊNCIA?!");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_2", "* DEFINITIVAMENTE NÃO,^1 AMIGÃO.");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_3", "* NÃO DEPOIS DE TUDO QUE VOCÊS HUMANOS FIZERAM COMIGO.");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_4", "* VOCÊ PROVAVELMENTE TÁ SE PERGUNTANDO O QUE EU VOU&FAZER COM VOCÊ.");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_5", "* ENTÃO...^1&* APENAS COMO HIPÓTESE...^1&* VAMOS DIZER QUE...");
	ds_map_add(global.textdata_pt, "event_brock_prebattle_1_6", "* VOCÊ VAI DESCOBRIR EM BREVE...!");
	
	// obj_event_brock_postbattle
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_0", "* BOM,^1 OBRIGADO AMIGÃO.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_1", "* EU NÃO QUERIA TE MATAR.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_2", "* EU ACHEI QUE TU QUERIA ME MATAR,^1 OU ALGO ASSIM.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_3", "* DE QUALQUER MANEIRA,^3 TEM ALGO QUE TU PRECISA SABER.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_4", "* DEPOIS QUE ELES INVADIRAM OS CORREDORES,^1 OS LÍDERES CRIARAM UMA REGRA.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_5", "* UMA REGRA HORRÍVEL,^1 NA VERDADE.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_6", "* ELA DIZ QUE TODO NOVO MEMBRO DEVE SER MORTO ANTES DE SAIR DOS CORREDORES.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_7", "* SE TU PISAR PERTO DA ÚLTIMA PORTA,^1 TU PROVAVELMENTE VAI LEVAR UM TIRO.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_8", "* EU VOU TENTAR FALAR COM O GABEE SOBRE TE DEIXAR IR.^1&* MAS NÃO PROMETO NADA.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_9", "* ... GABEE?^1&* ELE É O GUARDIÃO DOS CORREDORES.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_10", "* ELE É O QUE FAZ A REGRA FUNCIONAR.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_11", "* TALVEZ EU POSSA CONVENCER ELE A TE DEIXAR IR PRA CIDADE.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_12", "* E AÍ TU PODE SAIR DO SERVIDOR,^1 SE TU QUISER.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_13", "* BOM,^1 EU DEVERIA IR AGORA.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_14", "* NÃO TEM MUITA COISA PRA EU FAZER AQUI.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_15", "* FOI BOM TE CONHECER,^1 AMIGÃO.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_0_16", "* TE VEJO POR AÍ!!!!");
	
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_0", "* Onde está aquilo?");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_1", "* Para onde aquele relógio foi?");
	
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_2_0", "* ... O quê?^1&* Você deixou ele ir?");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_3_0", "* Isso não foi muito esperto de você.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_4_0", "* Ele poderia voltar para matar nós dois.");
	
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_2_1", "* ... O quê?^1&* Você matou ele?");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_3_1", "* Isso é uma surpresa.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_1_4_1", "* Entretanto,^1 uma aceitável,^1 sem dúvidas.");
	
	ds_map_add(global.textdata_pt, "event_brock_postbattle_2_0_0", "* Vamos apenas continuar.");
	ds_map_add(global.textdata_pt, "event_brock_postbattle_2_0_1", "* Bom,^1 vamos continuar!");
	
	// pulou, aproximou, vem, entra, rastejou, veio, apareceu
	
	// Dummy battle
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_0", "* Aqui estamos nós!");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_1", "* Você vê aqueles quatro botões em baixo?");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_2", "* Cada um deles têm sua própria função.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_3", "* Você tem que usar eles para interagir com o oponente.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_4", "* Sua ;UALMA;D,^1 representada por um :Rcoração;D,^1 marca sua posição.");
	
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_5", "* Em uma :YBATALHA;D,^1 tem duas maneiras de ganhar.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_6", "* A primeira é :YATACANDO;D o inimigo até a morte.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_7", "* Tente atacar o inimigo usando o botão :Y[LUTAR];D.");
	
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_8", "* Após você usar o botão,^1 a rodada do oponente&vai começar.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_9", "* Você vai ter que desviar de uma série de balas.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_10", "* Você consegue desviar controlando sua ;UALMA;D.");
	
	ds_map_add(global.textdata_pt, "battle_main_dummy_0_11", "* Tente usar o botão :Y[LUTAR];D!");
	
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_0", "* Isso foi ótimo!");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_1", "* A outra maneira de ganhar uma :YBATALHA;D é&:YPOUPANDO;D o inimigo.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_2", "* Entretanto,^1 você pode apenas :YPOUPAR;D o inimigo se ele gostar de você.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_3", "* Você pode fazer ele gostar de você :YAGINDO;D de certa maneira.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_4", "* Tente usar o botão :Y[AGIR];D e então :YCHEQUE;D o oponente.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_5", "* A opção :YCHECAR;D mostra informações do inimigo.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_6", "* Você pode apenas fazer ele gostar de você se saber do que ele gosta.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_1_7", "* Tente usar o botão&:Y[AGIR];D -> :YCHECAR;D!");
	
	ds_map_add(global.textdata_pt, "battle_main_dummy_2_0", "* Agora que você :YCHECOU;D ele,^1 é preciso fazer que ele goste de você.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_2_1", "* Você pode fazer ele gostar de você usando as outras opções do :Y[AGIR];D.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_2_2", "* Você tem que interagir com ele baseado no que ele gosta.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_2_3", "* Tente usar o botão&:Y[AGIR];D -> :Y???;D");
	
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_0", "* Aí está!");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_1", "* Você consegue ver que&o nome do inimigo&está :Yamarelo;D.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_2", "* Isso é porque você consegue :YPOUPAR;D o oponente!");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_3", "* Se você :YPOUPAR;D o inimigo,^1 esta :YBATALHA;D vai acabar.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_4", "* Outro botão importante é o :Y[ITEM];D.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_5", "* Você pode usar itens do seu inventário com este botão.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_6", "* Você pode se curar e equipar armas ou armaduras.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_7", "* Entretanto,^1 já que seu invetário está vazio,^1 você não pode usar ele.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_8", "* Mas não se esqueça de usa-lo quando necessário.");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_9", "* Agora use :Y[PIEDADE];D e&:YPOUPE;D o inimigo para ganhar esta :YBATALHA;D!");
	ds_map_add(global.textdata_pt, "battle_main_dummy_3_10", "* Tente usar o botão&:Y[PIEDADE];D -> :YPOUPAR;D!");
	
	ds_map_add(global.textdata_pt, "battle_enemyname_dummy", "Boneco");
	
	ds_map_add(global.textdata_pt, "battle_act_dummy_1", "Falar");
	ds_map_add(global.textdata_pt, "battle_act_dummy_2", "Gritar");
	
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_0_0", "* Boneco - [0 ATK | 0 DEF]^1 &* Um boneco com a aparência&de um gato.");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_0_1", "* Seu corpo é feito de tecido e de pelo artificial.");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_0_2", "* Mesmo que ele não tenha muito a dizer,^1 ele é um ótimo ouvinte.");
	
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_0", "* (Você tenta falar com o Boneco,^1 mas você não conseguiu pensar em um assunto...)");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_1_0_0", "* (Você tem uma ótima conversa sobre ");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_1_0_1_0", "jogos de computador");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_1_0_1_1", "cachorros");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_1_0_1_2", "bananas");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_1_0_2", "&com Boneco.)");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_1_1_1", "* (A cara de Boneco parece ficar mais rosa...)");
	
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_2_0", "* (Você grita na cara do Boneco.)");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_2_1", "* (Lágrimas saem dos olhos dele.)");
	ds_map_add(global.textdata_pt, "battle_act_result_dummy_2_2", "* Essa é a opção errada.");

	// Armsguy battle
	ds_map_add(global.textdata_pt, "battle_main_armsguy", "* Armsguy pula em seu caminho!");
	
	ds_map_add(global.textdata_pt, "battle_main_armsguy_0", "* Armsguy flexiona tão forte que ele vômita.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_1", "* Armsguy beija seu próprio braço e deixa a sua boca suja de slime.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_2", "* Armsguy bebe seu próprio suor e percebe que não é suor.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_3", "* Armsguy puxa uma carne podre de sua própria boca,^2 e come de novo.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_4", "* Armsguy mastiga uma seringa suja.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_5", "* Armsguy chama os outros monstros no quarto para assistir ele ganhar.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_6", "* Armsguy fica socando o ar como uma tentativa de te assustar.");
	ds_map_add(global.textdata_pt, "battle_main_armsguy_7", "* Armsguy encontra uma meia suja dentro de sua própria boca e joga para longe.");
	
	ds_map_add(global.textdata_pt, "battle_act_armsguy_1", "Pegar Slime");
	ds_map_add(global.textdata_pt, "battle_act_armsguy_2", "Soco Falso");
	
	ds_map_add(global.textdata_pt, "battle_act_result_armsguy_0_0", "* Armsguy - [5 ATK | 6 DEF]^1 &* Um slime vivo com braços dentro de um saco de lixo.");
	ds_map_add(global.textdata_pt, "battle_act_result_armsguy_0_1", "* Gosta de musculação,^1 força,^1 braços e slime.");
	ds_map_add(global.textdata_pt, "battle_act_result_armsguy_1", "* (Você tira uma parte do slime dos braços de Armsguy.)");
	ds_map_add(global.textdata_pt, "battle_act_result_armsguy_2", "* (Você soca a cara de Armsguy fingindo que está usando toda&a sua força.)");

	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_0", "Me Deixe Ser Cheio De Slime.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_1", "Me Dá Um Murro Na Cara.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_2", "Usa A Sua Força Em Mim.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_3", "Você Nunca Será Mais Forte Que Eu.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_4", "Eu Acho Que Academia Combina Com Você.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_5", "Que?^1&\"Dia de perna\"?");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_6", "Eu Sou Mais Forte.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_7", "Quer Quebrar As Suas Pernas?");
	
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_8", "Muito Obrigado.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_9", "Eu Acredito No Seu Potêncial.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_10", "Tá De Boa.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_clean_0", "Ei,^1 Vai Pra Longe.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_clean_1", "Tira As Suas Mãos De Mim.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_clean_2", "Não Toca Nos Meus Braços.");
		
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_punch_0", "Ai Que Dor.^1 Continua.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_punch_1", "É Assim Que Se Faz.");
	ds_map_add(global.textdata_pt, "battle_bubble_armsguy_punch_2", "Parabéns,^1 Eu Amei.");
	
	// Trashguy battle
	ds_map_add(global.textdata_pt, "battle_main_trashguy", "* Trashguy entrou em seu caminho!");
	
	ds_map_add(global.textdata_pt, "battle_main_trashguy_0", "* Você consegue ouvir Trashguy comer pão velho.");
	ds_map_add(global.textdata_pt, "battle_main_trashguy_1", "* Trashguy pega um ovo estragado e joga para longe.");
	ds_map_add(global.textdata_pt, "battle_main_trashguy_2", "* Trashguy encontra um saco de plástico com vômito e bebe ele.");
	ds_map_add(global.textdata_pt, "battle_main_trashguy_3", "* Trashguy está usando papel higiênico sujo para se limpar.");
	ds_map_add(global.textdata_pt, "battle_main_trashguy_4", "* Trashguy quase cai da lata de lixo.");
	
	ds_map_add(global.textdata_pt, "battle_act_trashguy_1", "Esvaziar");
	ds_map_add(global.textdata_pt, "battle_act_trashguy_2", "Chutar");
	
	ds_map_add(global.textdata_pt, "battle_act_result_trashguy_0_0", "* Trashguy - [6 ATK | 7 DEF]^1 &* Uma criatura misteriosa vivendo dentro de uma lata de lixo.");
	ds_map_add(global.textdata_pt, "battle_act_result_trashguy_0_1", "* Odeia lixo e o seu cheiro.^1&* Tem medo de viver fora de uma lata de lixo.");
	ds_map_add(global.textdata_pt, "battle_act_result_trashguy_1", "* (Você tira o lixo da lixeira do Trashguy.)");
	ds_map_add(global.textdata_pt, "battle_act_result_trashguy_2", "* (Você chuta a lata de lixo do Trasguy.)");
	
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_0", "...eu não aguento esse cheiro...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_1", "...eu só quero que esse lixo saia daqui...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_2", "...esse cheiro é terrível...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_3", "...eu acho que eu vou cair...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_4", "...por que eles sempre botam lixo aqui...");
	
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_5", "...isso é muito melhor...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_6", "...você é uma pessoa legal...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_7", "...você é diferente deles...");
	
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_empty_0", "...obrigado...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_empty_1", "...você não precisava...");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_empty_2", "...você é o melhor...");
		
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_kick_0", "...mas por quê...?");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_kick_1", "...o que eu te fiz...?");
	ds_map_add(global.textdata_pt, "battle_bubble_trashguy_kick_2", "...por que tu é assim...?");

	// Flitcher battle
	ds_map_add(global.textdata_pt, "battle_main_flitcher", "* Flitcher apareceu do nada.");
	
	ds_map_add(global.textdata_pt, "battle_main_flitcher_0", "* Flitcher encara para o norte o sul.");
	ds_map_add(global.textdata_pt, "battle_main_flitcher_1", "* Flitcher está movendo sua língua sem perceber.");
	ds_map_add(global.textdata_pt, "battle_main_flitcher_2", "* Flitcher está viajando na manteiga.");
	ds_map_add(global.textdata_pt, "battle_main_flitcher_3", "* Flitcher não sabe muito o porquê dele estar aqui.");
	
	ds_map_add(global.textdata_pt, "battle_act_flitcher_1", "Falar");
	ds_map_add(global.textdata_pt, "battle_act_flitcher_2", "Acenar");
	
	ds_map_add(global.textdata_pt, "battle_act_result_flitcher_0_0", "* Flitcher - [4 ATK | 6 DEF]^1&* Esse monstro não sabe muito o que está acontecendo.");
	ds_map_add(global.textdata_pt, "battle_act_result_flitcher_0_1", "* Ele odeia contato visual e qualquer conversa que envolva falar.");
	
	ds_map_add(global.textdata_pt, "battle_act_result_flitcher_1_0", "* (Você tenta falar com Flitcher...)");
	ds_map_add(global.textdata_pt, "battle_act_result_flitcher_1_1", "* (Ele se afasta.)^1&* (Ele parece assustado.)");
	
	ds_map_add(global.textdata_pt, "battle_act_result_flitcher_2", "* (Você acena para Flitcher.)^1&* (Ele parece...^1 feliz?)");

	// Broken Clock
	ds_map_add(global.textdata_pt, "battle_main_brock", "* Broken Clock bloqueia seu caminho!");
	
	ds_map_add(global.textdata_pt, "battle_main_brock_0", "* Broken Clock está pulsando com eletricidade.");
	ds_map_add(global.textdata_pt, "battle_main_brock_1", "* Broken Clock está voando na arena.");
	ds_map_add(global.textdata_pt, "battle_main_brock_2", "* Broken Clock ainda não confia em você.");
	ds_map_add(global.textdata_pt, "battle_main_brock_3", "* Broken Clock não tem nada a perder além de sua vida.");
	ds_map_add(global.textdata_pt, "battle_main_brock_4", "* Broken Clock está de alguma maneira quebrando regras de espaço e tempo.");
	ds_map_add(global.textdata_pt, "battle_main_brock_5", "* Broken Clock descobriu como viajar no tempo.");
	ds_map_add(global.textdata_pt, "battle_main_brock_6", "* Até Broken Clock está certo duas vezes no dia.");
	ds_map_add(global.textdata_pt, "battle_main_brock_7", "* Broken Clock é um relógio quebrado.");
	ds_map_add(global.textdata_pt, "battle_main_brock_8", "* Broken Clock está esperando pela sua resposta.");
	ds_map_add(global.textdata_pt, "battle_main_brock_9", "* Os movimentos de Broken Clock parecem estar mais lentos.");
	
	ds_map_add(global.textdata_pt, "battle_act_brock_1_0", "Gritar");
	ds_map_add(global.textdata_pt, "battle_act_brock_2_0", "Falar");
	ds_map_add(global.textdata_pt, "battle_act_brock_1_1", "Xingar");
	ds_map_add(global.textdata_pt, "battle_act_brock_2_1", "Ameaçar");
	ds_map_add(global.textdata_pt, "battle_act_brock_3", "Convencer");
	
	ds_map_add(global.textdata_pt, "battle_act_result_brock_0_0_0", "* Broken Clock - [10 ATK | 6 DEF]^1&* Um relógio permanentemente possuído por um fantasma.");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_0_1_0", "* Ele ainda não confia em você.^1 &* Ele está com medo e quer apenas sobreviver.");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_0_0_1", ds_map_find_value(global.textdata_pt, "battle_act_result_brock_0_0_0"));
	ds_map_add(global.textdata_pt, "battle_act_result_brock_0_1_1", "* Ele não pode voar para sempre.^1&* Ele vai se cansar em algum momento.");
	
	ds_map_add(global.textdata_pt, "battle_act_result_brock_1_0_0", "* (Você grita por ajuda,^1 implorando que alguém te escute...)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_1_1_0", "* (Mas ninguém veio.)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_1_0_1", "* (Você xinga Broken Clock...)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_1_1_1", "* (Ele riu.)");
	
	ds_map_add(global.textdata_pt, "battle_act_result_brock_2_0_0", "* (Você tenta falar com Broken Clock...)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_2_1_0", "* (Ele te ignorou.)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_2_0_1", "* (Você ameaça Broken Clock...)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_2_1_1", ds_map_find_value(global.textdata_pt, "battle_act_result_brock_2_1_0"));
	
	ds_map_add(global.textdata_pt, "battle_act_result_brock_3_0_0", "* (Você diz que você está perdido e que não sabe do que ele está falando.)");
	ds_map_add(global.textdata_pt, "battle_act_result_brock_3_0_1", "* (Você diz o que Broken Clock quer ouvir.)");
	
	ds_map_add(global.textdata_pt, "battle_act_result_brock_convinced", "* (Isso não importa mais.)");

		// bubble
	ds_map_add(global.textdata_pt, "battle_bubble_brock_0_0_0", "SABE O QUE EU MAIS ODEIO?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_0_1_0", "VOCÊ.^1 HUMANOS.^1 TODOS VOCÊS.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_1_0_0", "OS HUMANOS SÃO TODOS IGUAIS.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_1_1_0", "ELES NÃO SE IMPORTAM COM NADA OU NINGUÉM.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_1_2_0", "TUDO QUE ELES QUEREM É PODER,^1 DINHEIRO,^1 FAMA&OU SEI LÁ.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_2_0_0", "SE EU FOSSE CHUTAR,^1 EU DIRIA QUE TU É IGUAL A ELES.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_2_1_0", "TU REALMENTE ACHA QUE EU VOU TE POUPAR DESSE JEITO?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_2_2_0", "ASSIM,^1 SE EU QUISESSE MORRER,^1 TALVEZ.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_0_0", "DEIXA EU TE DAR UM EXEMPLO REAL.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_1_0", "QUATRO NOVOS MEMBROS APARECERAM E DESTRUÍRAM OS CORREDORES.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_2_0", "E SE ISSO NÃO FOSSE SUFICIENTE,^1 ELES ME QUEBRARAM.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_3_0", "SEM UM PINGO DE REMORSO!");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_0_0", "AÍ OS LÍDERES DESSE MUNDO ABANDORAM ESSE LUGAR.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_1_0", "OS CORREDORES TAVAM DESTRUÍDOS E QUASE INÚTEIS.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_2_0", "AQUELES NOVOS MEMBROS SÓ QUEBRARAM O QUE A GENTE TINHA!");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_3_0", "E ENTÃO TU QUER QUE EU TE POUPE,^1 AMIGÃO?");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_5_0_0", "ISSO NÃO FARIA MUITO SENTIDO,^1 NÉ?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_5_1_0", "TU DEVERIA ESTAR FELIZ QUE EU NÃO FIZ A COISA CERTA.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_5_2_0", "PORQUE DIFERENTE DE VOCÊ,^1 EU NÃO SOU UM ASSASSINO.");

	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_0_0", "NA VERDADE,^1 EU TENHO UMA IDEIA.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_1_0", "EU VOU TE DAR UMA CHANCE.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_2_0", "TENTA ME CONVENCER A TE DEIXAR IR.^1&EU DUVIDO.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_3_0", "VAMOS VER SE TU TEM A ALMA PURA QUE TU DIZ TER.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_fight_0_0", "QUE?^1 TU REALMENTE TENTOU ME BATER?!");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_fight_1_0", "TU É CEGO?^1&;RTU NÃO CONSEGUE ME ACERTAR ENQUANTO EU TO VOANDO;D.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_fight_2_0", "NÃO COM ESSA ARMA PODRE QUE TU TÁ USANDO.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince0_0_0", "ALÔ?^1 TEM ALGUÉM EM CASA?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince0_1_0", "EU ACABEI DE FALAR QUE TU PODE TENTAR ME CONVENCER.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince1_0_0", "TU É LOUCO OU SÓ MUITO BURRO?!");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince1_1_0", "TU PODE TENTAR ME CONVENCER.^1 AGORA.^1&NO ;R[AGIR];D.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince1_2_0", "AÍ TALVEZ EU TE DEIXE IR.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_0_0", "TÁ FALANDO SÉRIO...?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_1_0", "EU REALMENTE ACHEI QUE TU FOSSE UM DELES.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_2_0", "E QUE TU QUISESSE ME MATAR.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_3_0", "É...^2&ACHO QUE EU ERREI.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_4_0", "EU VOU TE POUPAR AGORA,^1 TÁ?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_5_0", "ME DESCULPA.^1&DE VERDADE.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_6_0", "OUTRA COISA,^1 O&MEE6 PROVAVELMENTE TÁ VIVO.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_convince2_7_0", "TU NÃO PRECISA SE PREOCUPAR COM ELE.");
	
		// bubble (geno)
	for (var i = 0; i < 2; i++)
	{
		for (var z = 0; z < 99; z++)
		{
			var _curmsg = ds_map_find_value(global.textdata_pt, "battle_bubble_brock_" + string(i) + "_" + string(z) + "_0");
			if (_curmsg != undefined)
				ds_map_add(global.textdata_pt, "battle_bubble_brock_" + string(i) + "_" + string(z) + "_1", _curmsg);
		}
	}

	ds_map_add(global.textdata_pt, "battle_bubble_brock_2_0_1", "E VOCÊ É UM EXEMPLO PERFEITO DELES.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_2_1_1", "POR QUE TU IA FAZER TUDO ISSO,^1 AFINAL?");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_2_2_1", "PORQUE TU É UM PSICOPATA.^3&ESSE É O PORQUÊ.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_0_1", "VOCÊ É O PIOR DE TODOS ELES.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_1_1", "ELES NÃO IRIAM MATAR TODO MUNDO SÓ PRA SE SENTIR BEM.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_3_2_1", "MAS MESMO ASSIM,^1 AQUI ESTAMOS NÓS.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_0_1", "EU ACHO QUE TU SÓ&É UMA ABERRAÇÃO,^1 MESMO.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_1_1", "NÃO SÓ UMA ABERRAÇÃO,^1 MAS UM IDIOTA TAMBÉM.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_2_1", "TU REALMENTE ACHA QUE ESSE GENOCÍDIO VAI FUNCIONAR?!");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_4_3_1", "É PORQUE TU AINDA NÃO CONHECEU OS HUMANOS LÁ FORA.");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_5_0_1", "TU AINDA TEM T-TEMPO PRA PARAR ISSO.^1 DE VERDADE.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_5_1_1", "EU POSSO ESQUECER T-TUDO ISSO E TE DEIXAR IR.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_5_2_1", "M-MAS TU NÃO VAI FAZER ISSO,^1 VAI?!");

	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_0_1", "O-OLHA...^1&E-EU NÃO QUERO TE MATAR.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_1_1", "ESPECIALMENTE S-SE EU TINHA A CHANCE DE N-NÃO TER QUE FAZER ISSO.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_2_1", "E EU TÔ MUITO C-CANSADO PRA CONTINUAR B-BATALHANDO.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_3_1", "P-POR FAVOR,^1 HUMANO.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_4_1", "SÓ ME POUPA E E-EU TE DEIXO IR.");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_6_5_1", "S-SEM RESSENTIMENTOS,^1 NÉ?");
	
	ds_map_add(global.textdata_pt, "battle_bubble_brock_fight_0_1", "O QUÊ?!");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_fight_1_1", "TU REALMENTE ACHOU QUE SERIA FÁCIL PRA ME MATAR?!");
	ds_map_add(global.textdata_pt, "battle_bubble_brock_fight_2_1", ";RTU NÃO PODE ME ACERTAR ENQUANDO EU TO VOANDO;D,^1 IDIOTA!");
	
	// Armsguy, Armsguy battle
	ds_map_add(global.textdata_pt, "battle_main_armsguy_armsguy", "* Uma dupla de Armsguys pulou em seu caminho!");
	
	// Trashguy, Armsguy battle
	ds_map_add(global.textdata_pt, "battle_main_trashguy_armsguy", "* Trashguy entrou em seu caminho!^1&* Armsguy decidiu ajudá-lo!");
	
	// Armsguy, Flitcher battle
	ds_map_add(global.textdata_pt, "battle_main_armsguy_flitcher", "* Armsguy pulou em seu caminho!^1&* ... Como o Flitcher tá aqui?!");
	
	// TrollFake battle
	ds_map_add(global.textdata_pt, "battle_main_tfk", "* TrollFake se aproximou...?");
	
	ds_map_add(global.textdata_pt, "battle_main_tfk_0", "* TrollFake está olhando para você.");
	ds_map_add(global.textdata_pt, "battle_main_tfk_1", "* TrollFake não é o real.");
	ds_map_add(global.textdata_pt, "battle_main_tfk_2", "* TrollFake sussura elogios para você.");
	ds_map_add(global.textdata_pt, "battle_main_tfk_3", "* TrollFake está rindo de suas próprias piadas.");
	ds_map_add(global.textdata_pt, "battle_main_tfk_4", "* TrollFake tenta agarrar sua mão,^1 mas você se afasta.");
	ds_map_add(global.textdata_pt, "battle_main_tfk_5", "* TrollFake faz algo explícito e age como se nada tivesse acontecido.");

	ds_map_add(global.textdata_pt, "battle_act_tfk_1", "Piada");
	ds_map_add(global.textdata_pt, "battle_act_tfk_2", "Ameaçar");
	ds_map_add(global.textdata_pt, "battle_act_tfk_3", "Elogiar");

	ds_map_add(global.textdata_pt, "battle_act_result_tfk_0", "* TrollFake - [5 ATK | 7 DEF]^1 &* Não é o real.^3 &* Enviado por uma força maior.");
	ds_map_add(global.textdata_pt, "battle_act_result_tfk_1", "* (Você conta a piada mais besta que você conseguiu pensar.)");
	ds_map_add(global.textdata_pt, "battle_act_result_tfk_2", "* (Você ameaça TrollFake.)");
	ds_map_add(global.textdata_pt, "battle_act_result_tfk_3", "* (Você diz para TrollFake que ele é engraçado.)");

	ds_map_add(global.textdata_pt, "battle_bubble_tfk_0_0", "Eu Sou O Real");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_1_0", "Não Dê Ouvidos Aos Jornais");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_1_1", "Apenas Correntes De Whatsapp Dizem a Verdade");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_2_0", "Estou Dando Doce De Graça");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_2_1", "Apenas Entre Em Minha Van Branca");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_3_0", "Sim,^1 Sou Racista");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_3_1", "Prefiro Ser Racional E Não Emocional");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_4_0", "Quer Ver Minha Foto De Divórcio");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_5_0", "Quem Está Assistindo Em " + string(current_year - irandom_range(12, 3)));
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_6_0", "Top 10 Batalhas Mais Épicas Dos Animes");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_7_0", "Ninguém:\\^1&Literalmente Ninguém:\\^1&Eu:\\ (Piada)");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_8_0", "Também Quero A Esposa Falecida Deste Homem");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_joke_0", "Pegue Logo Meu Upvote");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_joke_1", "Ri Muito Mais Do Que Eu Deveria");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_joke_2", "[!&\\$#] Mais Engraçada Que&Eu Já Vi");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_threat_0", "Me Sinto Atacado");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_threat_1", "Isso Já É Internet O Suficiente Por Hoje");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_threat_2", "Isso Me Deixou Em Lágrimas");
	
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_compliment_0", "Obrigado Pelo Ouro");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_compliment_1", "Dê Um Joinha Se Você Concorda");
	ds_map_add(global.textdata_pt, "battle_bubble_tfk_compliment_2", "Não Estou Chorando,^1&Você Está");
}