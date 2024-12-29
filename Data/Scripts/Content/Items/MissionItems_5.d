//**********************************************************************************
//	ItWr_XardasLetterToOpenBook_MIS an den SC um die HALLEN von Irdorath zu öffnen!
// ----------------------------------------------------------------------------------

instance ItWr_XardasLetterToOpenBook_MIS(C_Item)
{
	name						= "Xardas' Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasLetterToOpenBook;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string XardasLetterToOpenBook_1 = "I suspected one of the dragons in the Valley of Mines was the source of Evil.";
const string XardasLetterToOpenBook_2 = "I was wrong.";
const string XardasLetterToOpenBook_3 = "If everything has come to pass as I expect,";
const string XardasLetterToOpenBook_4 = "you should now be seeking the Halls of Irdorath.";
const string XardasLetterToOpenBook_5 = "The book you gave to Pyrokar contains all the clues you need.";
const string XardasLetterToOpenBook_6 = "I should have known why the Seekers wanted it";
const string XardasLetterToOpenBook_7 = "so badly.";
const string XardasLetterToOpenBook_8 = "You must get it back!";
const string XardasLetterToOpenBook_9 = "The words 'XARAK BENDARDO' open it. Don't tell anyone about this!";
const string XardasLetterToOpenBook_10 = "I will attend to more important things now.";
const string XardasLetterToOpenBook_11 = "I can't help you with your last task. Only you can defeat the source of Evil.";
const string XardasLetterToOpenBook_12 = "We shall meet again!";
const string XardasLetterToOpenBook_13 = " Xardas.";
func void Use_XardasLetterToOpenBook()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_1);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_2);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_3);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_4);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_5);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_6);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_7);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_8);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_9);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_10);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_11);
				Doc_PrintLines	(nDocID, 0, XardasLetterToOpenBook_12);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, XardasLetterToOpenBook_13);
	Doc_Show(nDocID);

	if (MIS_Xardas_SCCanOpenIrdorathBook == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_2);
	};

	MIS_Xardas_SCCanOpenIrdorathBook = TRUE; // Joly: Spieler kann nun das Buch im Kloster lesen und findet so die geheime Bibliothek!
};

//**********************************************************************************
//	ItKe_MonastarySecretLibrary_Mis Schlüssel zur geheimen Bibliothek
//**********************************************************************************

instance ItKe_MonastarySecretLibrary_Mis(C_Item)
{
	name						= "Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_02;

	description					= name;
	text[0]						= "from the book 'The Halls of Irdorath'";		count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Mis
//**********************************************************************************

instance ItWr_HallsofIrdorath_Mis(C_ITEM)
{
	name						= "The Halls of Irdorath";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_HallsofIrdorath;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_HallsofIrdorath()
{
	if (MIS_Xardas_SCCanOpenIrdorathBook == TRUE)
	{
		B_Say(self, self, "$SCOPENSIRDORATHBOOK");

		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", hero, hero, 0, 0, 0, FALSE);
		Snd_Play("SFX_HealObsession");

		CreateInvItems(hero, ItWr_HallsofIrdorath_Open_Mis, 1);
		CreateInvItems(hero, ItKe_MonastarySecretLibrary_Mis, 1);
		CreateInvItems(hero, ItWr_UseLampIdiot_Mis, 1);

		Print(PRINT_IrdorathBookHiddenKey);
		B_GivePlayerXP(XP_HallsofIrdorathIsOpen);
		ItWr_HallsofIrdorathIsOpen = TRUE;

		B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_3);
	}
	else
	{
		CreateInvItems(hero, ItWr_HallsofIrdorath_Mis, 1); // Joly: wegen MAPSEALED!!!!!

		Print(PRINT_IrdorathBookDoesntOpen);
		Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};

//**********************************************************************************
//	ItWr_HallsofIrdorath_Open_Mis
//**********************************************************************************

instance ItWr_HallsofIrdorath_Open_Mis(C_ITEM)
{
	name						= "The Halls of Irdorath";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_HallsofIrdorath_Open;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string HallsofIrdorath_Open_1 = "... and so I concealed the entrance to the library behind a secret door, to protect my records of Beliar's temples.";
const string HallsofIrdorath_Open_2 = "If my brothers had known of these records, those fools would probably have destroyed them all.";
const string HallsofIrdorath_Open_3 = "Now, all they know is that these temples used to exist.";
const string HallsofIrdorath_Open_4 = "Just to be sure, I have sworn some servants to protect the library.";
const string HallsofIrdorath_Open_5 = "The key opens the last door.";
func void Use_HallsofIrdorath_Open()
{
	if (ItWr_SCReadsHallsofIrdorath == FALSE)
	{
		B_LogEntry(TOPIC_BuchHallenVonIrdorath, TOPIC_BuchHallenVonIrdorath_4);
	};

	ItWr_SCReadsHallsofIrdorath = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_MAGE_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_MAGE_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, HallsofIrdorath_Open_1);
				Doc_PrintLines	(nDocID, 0, HallsofIrdorath_Open_2);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, HallsofIrdorath_Open_3);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, HallsofIrdorath_Open_4);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, HallsofIrdorath_Open_5);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_XardasSeamapBook_Mis
//**********************************************************************************

instance ItWr_XardasSeamapBook_Mis(C_ITEM)
{
	name						= "Dusty Book";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_01.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasSeamapBook_Mis;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string XardasSeamapBook_Mis_1 = "... I am now certain that the building is the Halls of Irdorath. They are located on an island quite near the harbor of Khorinis. Beliar's interest in the ore mines is obvious ...";
const string XardasSeamapBook_Mis_2 = "... The stronger they are, the more valuable they seem to be to him as undead servants. These converted paladins are very hard for any warrior to defeat. One of them has fallen into my hands. I only hope the others won't notice his presence down here ...";
const string XardasSeamapBook_Mis_3 = "...the converted paladin no longer seems to react to any stimuli. I have stored his armor and the rest of his belongings in the back room. The door can only be opened from inside. I have built a teleport rune to get into the room. I have placed the instructions for it in the almanac so that the One can find them...";
const string XardasSeamapBook_Mis_4 = "... The signs are unmistakable! When the One comes, he will need all the help we can give him. Beliar is already too strong. If have succeeded in obtaining some valuable artifacts which I will keep down here just in case. I suspect the Chosen One will come from among our ranks,";
const string XardasSeamapBook_Mis_5 = "so I have written instructions in the almanac for him.";
const string XardasSeamapBook_Mis_6 = "... I am now certain. We cannot stay the hand of fate. As soon as Beliar feels strong enough, he will arise and seek to rule the world. I must find the One, else we are all doomed.";
const string XardasSeamapBook_Mis_7 = "... There will be war, a war for the fate of the world. I seem to be the only one capable of interpreting the signs. All around me seem to ignore them. The One will come, and his coming will herald the beginning of the war. It is a war as old as time itself, but the end appears to be coming into view.";
const string XardasSeamapBook_Mis_8 = "I will not stand idly by and watch as others take the fate of the world into their hands.";
const string XardasSeamapBook_Mis_9 = "... I have studied the ancient writings and I have found out how to create the legendary weapons of the ancient Dragon Lords. However, I have no idea how to obtain the ingredients. I have entered the recipe in the almanac just in case. Who knows what terrors the future may bring - maybe even dragons.";
func void Use_XardasSeamapBook_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_BROWN_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_BROWN_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_1);
				Doc_PrintLines	(nDocID, 0, "");

	if (hero.guild == GIL_PAL)
	{
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_2);

		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_3);
	};

	if (hero.guild == GIL_KDF)
	{
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_4);

		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_5);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_6);
	};

	if (hero.guild == GIL_DJG)
	{
				Doc_PrintLines	(nDocID, 0, XardasSeamapBook_Mis_7);

		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den Ränder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_8);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, XardasSeamapBook_Mis_9);
	};

	Doc_Show(nDocID);
};

//**********************************************************************
//	geheime Nachricht geheimer Schalter Lampe
//**********************************************************************

instance ItWr_UseLampIdiot_Mis(C_Item)
{
	name						= "Crumpled Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseItWr_UseLampIdiot_Mis;

	value						= 50;

	description					= name;
	text[0]						= "from the book 'The Halls of Irdorath'";		count[0] = 0;
};

const string ItWr_UseLampIdiot_Mis_1 = " The lamp carries light ";
const string ItWr_UseLampIdiot_Mis_2 = " into the lower regions";
func void UseItWr_UseLampIdiot_Mis()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, ItWr_UseLampIdiot_Mis_1);
				Doc_PrintLine	(nDocID, 0, ItWr_UseLampIdiot_Mis_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_Seamap_Irdorath
//**********************************************************************************

instance ItWr_Seamap_Irdorath(C_Item)
{
	name						= "Sea Chart to Isle of Irdorath";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Seamap_Irdorath;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Seamap_Irdorath()
{
	var int nDocID;

	nDocID = Doc_CreateMap(); // DocManager
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "Map_NewWorld_Seamap.tga", 1); // 1 -> DO NOT SCALE
	Doc_Show(nDocID);

	if ((MIS_ShipIsFree == FALSE)
	&& (Kapitel < 6))
	{
		B_Say(self, self, "$IRDORATHTHEREYOUARE");
	};

	if (MIS_SCKnowsWayToIrdorath == FALSE)
	{
		Log_CreateTopic(TOPIC_SHIP, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SHIP, LOG_RUNNING);
		B_LogEntry(TOPIC_SHIP, TOPIC_SHIP_3);
		B_GivePlayerXP(XP_SCKnowsWayToIrdorath);
	};

	MIS_SCKnowsWayToIrdorath = TRUE;
};

//**********************************************************************
//	Gefälschter Brief von Lee zum benutzen des Schiffes
//**********************************************************************

instance ITWr_ForgedShipLetter_MIS(C_Item)
{
	name						= "Ship Bill";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseITWr_ForgedShipLetter_MIS;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "Letter of Authorization";						count[3] = 0;
	text[4]						= "for the paladins' ship.";				count[4] = 0;
};

const string ITWr_ForgedShipLetter_MIS_1 = "Letter of Authorization";
const string ITWr_ForgedShipLetter_MIS_2 = " This document entitles the";
const string ITWr_ForgedShipLetter_MIS_3 = " bearer to move freely on Lord Hagen's";
const string ITWr_ForgedShipLetter_MIS_4 = " royal war galley and to guide the ship";
const string ITWr_ForgedShipLetter_MIS_5 = " for an unlimited time period.";
const string ITWr_ForgedShipLetter_MIS_6 = " Royal Seal";
func void UseITWr_ForgedShipLetter_MIS()
{
	var int nDocID;

// Joly:VORSICHT : Dieser Brief ist ein ERMÄCHTIGUNGSSCHREIBEN für das Schiff und kann von LEE oder dem Richter stammen. NICHT zwangsläufig von Lord Hagen oder gefälscht!!!!!!!!!

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_2);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_3);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_4);
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ITWr_ForgedShipLetter_MIS_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

instance ITKE_OC_MAINGATE_MIS(C_Item)
{
	name						= "Main Gate Guard's Tower Key";

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

instance ITKE_SHIP_LEVELCHANGE_MIS(C_Item) // Joly: führt zum Levelchange Kapitel 6!!!!!!!!!!!!!!!!!!!!!!
{
	name						= "Key to Captain's Quarters";

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

instance ItPo_PotionOfDeath_01_Mis(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_PotionOfDeath;

	value						= 10;

	description					= "The Tears of Innos";
	text[0]						= "";											count[0] = 0;
	text[1]						= "???";										count[1] = Mana_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void UseItPo_PotionOfDeath()
{
	if (hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE", hero, hero, 0, 0, 0, FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];

		Npc_ChangeAttribute(self, ATR_STRENGTH, 5);
		self.aivar[REAL_STRENGTH] = self.aivar[REAL_STRENGTH] + 5;
		Npc_ChangeAttribute(self, ATR_DEXTERITY, 5);
		self.aivar[REAL_DEXTERITY] = self.aivar[REAL_DEXTERITY] + 5;

		PrintScreen(PRINT_LearnSTR5, -1, 45, FONT_SCREEN, 2);
		PrintScreen(PRINT_LearnDex5, -1, 55, FONT_SCREEN, 2);
		PrintScreen(PRINT_FullyHealed, - 1, 65, FONT_Screen, 2);
		Mdl_ApplyOverlayMDSTimed(self, "HUMANS_SPRINT.MDS", Time_Speed);
	}
	else
	{
		AI_Wait(hero, 3);
		AI_PlayAni(self, "S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN", hero, hero, 0, 0, 0, FALSE);
		B_Say(self, self, "$Dead");
		AI_StopFX(self, "VOB_MAGICBURN");
		Npc_ChangeAttribute(self, ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self, "S_FIRE_VICTIM");
	};
};

instance ItPo_PotionOfDeath_02_Mis(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_PotionOfDeath;

	value						= 10;

	description					= "The Tears of Innos";
	text[0]						= "";											count[0] = 0;
	text[1]						= "The potion lends Fire Mages special powers.";count[1] = 0;
	text[2]						= "Any other user will find his death in it.";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//************************************************
//	Amulett des Todes
//************************************************

instance ItAm_AmulettOfDeath_Mis(C_Item)
{
	name						= "Divine Aura of Innos";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItAm_Prot_Fire_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ItAm_AmulettOfDeath_Mis;
	on_unequip					= UnEquip_ItAm_AmulettOfDeath_Mis;

	value						= 1000;

	description					= "The divine aura of Innos.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "This amulet protects the bearer";		count[2] = 0;
	text[3]						= "from all forms of damage.";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_ItAm_AmulettOfDeath_Mis()
{
	self.protection [PROT_EDGE] += 30;
	self.protection [PROT_BLUNT] += 30;
	self.protection [PROT_POINT] += 30;
	self.protection [PROT_FIRE] += 30;
	self.protection [PROT_MAGIC] += 30;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("FX_EarthQuake", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	AI_StandUp(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void UnEquip_ItAm_AmulettOfDeath_Mis()
{
	self.protection [PROT_EDGE] -= 30;
	self.protection [PROT_BLUNT] -= 30;
	self.protection [PROT_POINT] -= 30;
	self.protection [PROT_FIRE] -= 30;
	self.protection [PROT_MAGIC] -= 30;
};

/******************************************************************************************/
//	Heiltrank für Randolph //
/******************************************************************************************/
instance ItPo_HealRandolph_MIS(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_HealRandolph;

	value						= Value_HpEssenz;

	description					= "Healing of Addiction";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpEssenz;
};

func void Use_HealRandolph()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
};
