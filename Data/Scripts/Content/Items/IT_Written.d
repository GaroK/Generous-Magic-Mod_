//**********************************************************************************
//	StandardBrief
//**********************************************************************************

instance StandardBrief(C_Item)
{
	name						= "Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseStandardBrief;

	value						= 0;

	description					= "StandardLetter";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string StandardBrief_1 = "StandardLetter";
const string StandardBrief_2 = "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla";
func void UseStandardBrief()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, StandardBrief_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StandardBrief_2);

	Doc_Show(nDocID);
};

//**********************************************************************************
//	StandardBuch
//**********************************************************************************

instance StandardBuch(C_ITEM)
{
	name						= "StandardBook";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseStandardBuch;

	value						= 100;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string StandardBuch_1 = "StandardBook Page 1";
const string StandardBuch_2 = "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla";
const string StandardBuch_3 = "Bla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bBla blaBla blaBla blaBlaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla blaBla bla";
const string StandardBuch_4 = "StandardBook Page 2";
func void UseStandardBuch()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StandardBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, StandardBuch_2);
	// Absatz
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 0, StandardBuch_3);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, StandardBuch_4);
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, StandardBuch_2);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, StandardBuch_2);
	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////
//
//	MAPS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_NewWorld(C_Item)
{
	name						= "Land Map of Khorinis"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld;

	value						= 250;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

instance ItWr_Map_NewWorld_City(C_Item)
{
	name						= "City Map of Khorinis"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_City;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_City()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_City);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_City.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -6900, 11800, 21600, -9400);
	Doc_Show(Document);
};

instance ItWr_Map_OldWorld(C_Item)
{
	name						= "Map of the Valley of Mines";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_OldWorld;

	value						= 350;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_OldWorld()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_OldWorld);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_OldWorld.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(Document, -78500, 47500, 54000, -53000);
	Doc_Show(Document);
};

var int Lerne_Einhand;
var int Lerne_Zweihand;
// ---------------------------------------------------------------------------------------------------------------------------
//						Einhandkampf
// ---------------------------------------------------------------------------------------------------------------------------
instance ItWr_EinhandBuch(C_ITEM)
{
	name						= "Art of Fighting";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_04.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseEinhandBuch;

	value						= 5000;

	description					= "Southern Defense Art";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A book on the art of";						count[2] = 0;
	text[3]						= "one-handed fighting.";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string EinhandBuch_1 = "Southern Defense Art";
const string EinhandBuch_2 = "A southerner uses less physical strength than a northerner, instead relying on agility. In the hot climate of his home he prefers light armor which permits him to move more freely. The southerner has therefore developed a style of fighting that is fundamentally different from what we are used to. ";
const string EinhandBuch_3 = "Probably the most famous maneuver a southerner uses is the one-armed block and backstep. The backstep enables the fighter to weaken the blow from his assailant's attack, at the same time taking up a superb stance from which to counterattack.";
func void UseEinhandBuch()
{
	if (Lerne_Einhand == FALSE)
	{
		B_RaiseFightTalent(self, NPC_TALENT_1H, 5);
		Print(PRINT_Learn1H);
		Lerne_Einhand = TRUE;
		Snd_Play("Levelup");
	};

	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, EinhandBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, EinhandBuch_2);

				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, EinhandBuch_3);
				Doc_PrintLine	(nDocID, 1, "");

	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------------------------------------------------------
//						Zweihandkampf
// ---------------------------------------------------------------------------------------------------------------------------
instance ItWr_ZweihandBuch(C_ITEM)
{
	name						= "Fighting Tactics";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_03.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseZweihandBuch;

	value						= 5000;

	description					= "Double Blocks";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A book on the art of";						count[2] = 0;
	text[3]						= "two-handed fighting.";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string ZweihandBuch_1 = "Double Blocks";
const string ZweihandBuch_2 = "Blocking the enemy's blade with a two-handed weapon is a method used by strong fighters to stop the impetus of attacks and force their assailants to abruptly end their assault combinations. ";
const string ZweihandBuch_3 = "The usually resulting halt of the opponent's movement is an opportunity to take the initiative and defeat the enemy with skilled strokes. ";
func void UseZweihandBuch()
{
	if (Lerne_Zweihand == FALSE)
	{
		B_RaiseFightTalent(self, NPC_TALENT_2H, 5);
		Print(PRINT_Learn2H);
		Lerne_Zweihand = TRUE;
		Snd_Play("Levelup");
	};

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Red_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Red_R.tga", 0);

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ZweihandBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ZweihandBuch_2);

				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, "");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, ZweihandBuch_3);

	Doc_Show(nDocID);
};
