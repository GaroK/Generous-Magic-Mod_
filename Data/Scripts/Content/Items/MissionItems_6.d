// *****************************************************************
// // Joly: Auge Innos nicht dabei? Kein Problem. Xardas hilft auch dir Idiot!!!!!!!!!!!!
// Vorsicht: Nur fÃƒÂ¼r D.A.U.s
// *****************************************************************

instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name						= "Very Strange Leather Satchel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_XardasNotfallBeutel;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "The bag seems to";						count[1] = 0;
	text[2]						= "contain a hard object";						count[2] = 0;
	text[3]						= "and a document.";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_XardasNotfallBeutel()
{
	CreateInvItems(hero, ItWr_XardasErmahnungFuerIdioten_MIS, 1);
	CreateInvItems(hero, ItMi_InnosEye_Discharged_Mis, 1);

	var string concatText;

	concatText = ConcatStrings("2", PRINT_ItemsErhalten);
	Print(concatText);
};

//**********************************************************************************
//	ItWr_XardasErmahnungFuerIdioten_MIS
//**********************************************************************************

instance ItWr_XardasErmahnungFuerIdioten_MIS(C_Item)
{
	name						= "Xardas' Warning Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasErmahnungFuerIdioten;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string XardasErmahnungFuerIdioten_1 = "My young protégé, you disappoint me greatly. How could you leave on the ship and not take the Eye of Innos?";
const string XardasErmahnungFuerIdioten_2 = "I can only hope that there are limits to your negligence. Otherwise you will never rid the world of Evil and I will be forced to personally execute you for your stupidity.";
const string XardasErmahnungFuerIdioten_3 = " Xardas";
func void Use_XardasErmahnungFuerIdioten()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, XardasErmahnungFuerIdioten_1);
				Doc_PrintLines	(nDocID, 0, XardasErmahnungFuerIdioten_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, XardasErmahnungFuerIdioten_3);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	Brief in der Krypta
// ----------------------------------------------------------------------------------

instance ItWr_Krypta_Garon(C_Item)
{
	name						= "Old letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Krypta_Garon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "in shaky handwriting.";			count[3] = 0;
};

const string Krypta_Garon_1 = "I have failed. In vain I have tried to keep Inubis on the path of Good.";
const string Krypta_Garon_2 = "At first I believed I was dead. But there is strength left yet in Ivan's old bones.";
const string Krypta_Garon_3 = "Inubis has arisen from the dead. Banished by the ancient order of the paladins, he now seeks revenge for his curse.";
const string Krypta_Garon_4 = "Many of his followers are with him. I have no idea how a warlord like Inubis could become so evil.";
const string Krypta_Garon_5 = "I found his tomb in this crypt. But I am uncertain whether I will ever be able to report my find. Therefore I write these lines and hope that they may be found.";
const string Krypta_Garon_6 = "Be warned. A mighty enemy is reaching out for the souls of the just. Inubis will not be the last.";
const string Krypta_Garon_7 = "May Innos save your souls.";
const string Krypta_Garon_8 = " Ivan";
func void Use_Krypta_Garon()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_1);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_2);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_3);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_4);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_5);
				Doc_PrintLines	(nDocID, 0, Krypta_Garon_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Krypta_Garon_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Krypta_Garon_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus

	Doc_Show(nDocID);
};

//****************************************************************************
//				DragonIsle_Undead_SchlÃƒÂ¼ssel
//			---------------------------------------------
//****************************************************************************

//**********************************************************************************
//	KnasttÃƒÂ¼rschlÃƒÂ¼ssel fÃƒÂ¼r Pedros Zelle auf DI
//**********************************************************************************

instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name						= "Key of the Orcish Colonel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItKe_EVT_UNDEAD_01(C_Item) // SchlÃƒÂ¼ssel fÃƒÂ¼r erste TÃƒÂ¼r
{
	name						= "Key of Archol";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= name;											count[2] = 0;
};

//**********************************************************************************
//	SchlÃƒÂ¼ssel zum Labyrinth der Untoten auf DI
//**********************************************************************************

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name						= "Key of the Key Master";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	KammerschlÃƒÂ¼ssel fÃƒÂ¼rÃ‚Â´s Tor zum Saal des Untoten Drachen.
//**********************************************************************************

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name						= "Black Magician's Room Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Schriftrolle fÃƒÂ¼rÃ‚Â´s Tor zum Saal des Untoten Drachen.
//**********************************************************************************

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name						= "Black Magician's Scroll";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_LastDoorToUndeadDrgDI_MIS;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ItWr_LastDoorToUndeadDrgDI_MIS_1 = "KHADOSH ";
const string ItWr_LastDoorToUndeadDrgDI_MIS_2 = "EMEM KADAR";
const string ItWr_LastDoorToUndeadDrgDI_MIS_3 = "The Eye of Power illuminate your path.";
func void Use_ItWr_LastDoorToUndeadDrgDI_MIS()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_LastDoorToUndeadDrgDI_MIS_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_LastDoorToUndeadDrgDI_MIS_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_LastDoorToUndeadDrgDI_MIS_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus

	Doc_Show(nDocID);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_2);
};

//**********************************************************************************
//	SchlÃƒÂ¼ssel zur Truhe in der Kammer des OberDementors.
//**********************************************************************************
instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name						= "Black Magician's Chest Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_03;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Der Schwarzmagiernovize
//**********************************************************************************

//**********************************************************************************
//	ItWr_Rezept_MegaDrink_MIS
//**********************************************************************************

instance ItWr_Rezept_MegaDrink_MIS(C_Item)
{
	name						= "Recipe";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_RezeptFuerMegaTrank;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string RezeptFuerMegaTrank_1 = "I have revived an ancient art. I fear Feodaron would not be impressed with my achievement.";
const string RezeptFuerMegaTrank_2 = "It means, quite simply, that I would have to mix his entire brood in my laboratory into a potion. If only he didn't sit on his eggs like some chicken all the time, I'd have tried it out. But he still inspires me with some respect.";
const string RezeptFuerMegaTrank_3 = "Embarla Firgasto:";
const string RezeptFuerMegaTrank_4 = "11 dragon eggs, one powderized black pearl and a pinch of sulfur.";
const string RezeptFuerMegaTrank_5 = "The emulsion is brought to the boil and must be stirred constantly as it passes through the distiller.";
const string RezeptFuerMegaTrank_6 = "The elixir must be used with care. It has strong side effects and can upset the entire mana system.";
func void Use_RezeptFuerMegaTrank()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_1);
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RezeptFuerMegaTrank_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_4);
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_5);
				Doc_PrintLines	(nDocID, 0, RezeptFuerMegaTrank_6);

	Doc_Show(nDocID);

	PLAYER_TALENT_ALCHEMY[POTION_MegaDrink] = TRUE;
};

//**********************************************************************************
//	Tagebuch des SchwarzmagierNovizen
//**********************************************************************************

instance ItWr_Diary_BlackNovice_MIS(C_ITEM)
{
	name						= "Diary";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Diary_BlackNovice;

	value						= 100;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string Diary_BlackNovice_1 = "I've been waiting to be called up for 36 days now. I'm beginning to doubt they'll take me on. But I've done all they asked me to. I've fetched and carried for them like some old housemaid.";
const string Diary_BlackNovice_2 = "The key master instructed me to seal the bars. I still haven't gotten around to it. If things go on this way, anyone might just stroll in through the gate.";
const string Diary_BlackNovice_3 = "It's a shame I can't remember the combinations.";
const string Diary_BlackNovice_4 = "I'd have sneaked into the great Hall ages ago. I can hardly wait to see the Master. I wonder if they'll let me see him once I'm one of them.";
const string Diary_BlackNovice_5 = "I tried my luck yesterday. But I failed the two lever chambers before I could even press the three switches in the west wing in the right order. That dog locked the chambers! Tomorrow I'm going to try and get the key off him ...";
func void Use_Diary_BlackNovice()
{
	var int nDocID;
	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_RED_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_RED_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Diary_BlackNovice_1);
	// Absatz
				Doc_PrintLines	(nDocID, 0, Diary_BlackNovice_2);
				Doc_PrintLines	(nDocID, 0, Diary_BlackNovice_3);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Diary_BlackNovice_4);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, Diary_BlackNovice_5);
	Doc_Show(nDocID);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_3);
};

//**********************************************************************************
//	ItWr_ZugBruecke_MIS
//**********************************************************************************

instance ItWr_ZugBruecke_MIS(C_Item)
{
	name						= "Old letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ZugBruecke;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ZugBruecke_1 = "Last warning!";
const string ZugBruecke_2 = "I don't care if you can cross the bridge from the other side or not. If I had any say, you'd all rot in hell.";
const string ZugBruecke_3 = "I'm gonna leave the bridge drawn in as long as I'm in my domain. And if I catch one more person trying to hit the switches with a bow and arrow to get over, I will personally hang the idiot from the nearest tree!";
const string ZugBruecke_4 = " Archol";
func void Use_ZugBruecke()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ZugBruecke_1);
				Doc_SetMargins(nDocID, -1, 50, 50, 70, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ZugBruecke_2);
				Doc_PrintLines	(nDocID, 0, ZugBruecke_3);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ZugBruecke_4);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItMi_PowerEye zum ÃƒÂ¶ffnen der letzten TÃƒÂ¼r
//**********************************************************************************

instance ItMi_PowerEye(C_Item)
{
	name						= "Eye of Power";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_DarkPearl.3ds";
	material					= MAT_METAL;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC_STANDARD;
};
