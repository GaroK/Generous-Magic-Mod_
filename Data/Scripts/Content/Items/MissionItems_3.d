//********************************************
//	Das Auge Innos (Das reparierte Auge, mit dem man mit den Drachen Spricht)
//********************************************

const int AM_EyeProtEdge = 10;
const int AM_EyeProtPoint = 10;
const int AM_EyeProtMage = 20;
const int AM_EyeProtFire = 30;

// -------------------------------------------

instance ItMi_InnosEye_MIS(C_ITEM)
{
	name						= "Eye of Innos";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_InnosEye_MIS.3DS";
	material					= MAT_STONE;

	on_equip					= Equip_InnosEye;
	on_unequip					= UnEquip_InnosEye;

	value						= 0;

	description					= name;
	text[0]						= "Energy pulses through the Eye.";			count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_InnosEye()
{
	Wld_PlayEffect("spellFX_Innoseye", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED", self, self, 0, 0, 0, FALSE);
	Wld_PlayEffect("FX_EarthQuake", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_MAGRUN_2_HEASHOOT");
	AI_StandUp(self);
	Snd_Play("SFX_INNOSEYE");

	self.protection [PROT_EDGE] += AM_EyeProtEdge;
	self.protection [PROT_BLUNT] += AM_EyeProtEdge;
	self.protection [PROT_POINT] += AM_EyeProtPoint;
	self.protection [PROT_FIRE] += AM_EyeProtFire;
	self.protection [PROT_MAGIC] += AM_EyeProtMage;

	PrintScreen("", -1, -1, FONT_Screen, 0);
};

func void UnEquip_InnosEye()
{
	self.protection [PROT_EDGE] -= AM_EyeProtEdge;
	self.protection [PROT_BLUNT] -= AM_EyeProtEdge;
	self.protection [PROT_POINT] -= AM_EyeProtPoint;
	self.protection [PROT_FIRE] -= AM_EyeProtFire;
	self.protection [PROT_MAGIC] -= AM_EyeProtMage;
};

instance ItMi_InnosEye_Discharged_Mis(C_Item)
{
	name						= "Eye of Innos";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	visual						= "ItMi_InnosEye_MIS.3DS";
	material					= MAT_STONE;

	on_equip					= Equip_ItMi_InnosEye_Discharged_Mis;

	value						= 0;

	description					= name;
	text[0]						= "The Eye is faded and does not shine.";			count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_ItMi_InnosEye_Discharged_Mis()
{
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

instance ItMi_InnosEye_Broken_Mis(C_Item)
{
	name						= "Eye of Innos";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	visual						= "ItMi_InnosEye_MIS.3DS";
	material					= MAT_STONE;

	on_equip					= Equip_ItMi_InnosEye_Broken_Mis;

	value						= 0;

	description					= name;
	text[0]						= TEXT_Innoseye_Setting;						count[0] = 0;
	text[1]						= TEXT_Innoseye_Gem;							count[1] = 0;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

func void Equip_ItMi_InnosEye_Broken_Mis()
{
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

//**********************************************************************************
//	ErmÃƒÂ¤chtigungsschreiben fÃƒÂ¼r SC fÃƒÂ¼r Pyrokar, das Auge Innos rauszurÃƒÂ¼cken.
// ----------------------------------------------------------------------------------

instance ItWr_PermissionToWearInnosEye_MIS(C_Item)
{
	name						= "Letter of Authorization";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_PermissionToWearInnosEye;

	value						= 0;

	description					= "Letter of authorization for Pyrokar.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string PermissionToWearInnosEye_1 = "The bearer of this note is to be granted entry into the sacred halls of the monastery.";
const string PermissionToWearInnosEye_2 = "His wishes regarding the possession of the Eye of Innos are to be fulfilled immediately.";
const string PermissionToWearInnosEye_3 = "These orders are to be regarded as valid through the strength of my position as lord of the island and representative of the King, as well as through the treaty of the division of the Church of Innos in year 2 of the Fire.";
const string PermissionToWearInnosEye_4 = "I will make no further statements to this end and expect my instructions to be abided by.";
const string PermissionToWearInnosEye_5 = "Innos bless the King.";
const string PermissionToWearInnosEye_6 = " Lord Hagen";
func void Use_PermissionToWearInnosEye()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_1);
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_2);
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_3);
				Doc_PrintLines	(nDocID, 0, PermissionToWearInnosEye_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PermissionToWearInnosEye_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PermissionToWearInnosEye_6);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_XardasBookForPyrokar_Mis
//**********************************************************************************

instance ItWr_XardasBookForPyrokar_Mis(C_ITEM)
{
	name						= "The Halls of Irdorath";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_XardasBookForPyrokar;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_XardasBookForPyrokar()
{
	Print(PRINT_IrdorathBookDoesntOpen);
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
};

//**********************************************************************************
//	ItKe_CHEST_SEKOB_XARDASBOOK_MIS Xardas SchlÃƒÂ¼ssel fÃƒÂ¼r die Truhe auf Sekobs Hof
//**********************************************************************************

instance ItKe_CHEST_SEKOB_XARDASBOOK_MIS(C_Item)
{
	name						= "Xardas' key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_02;

	description					= name;
	text[0]						= "for the chest on Sekob's farm.";			count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	ItWr_CorneliusTagebuch_Mis
//**********************************************************************************

instance ItWr_CorneliusTagebuch_Mis(C_ITEM)
{
	name						= "Diary";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_01.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseCorneliusTagebuch;

	value						= 0;

	description					= name;
	text[0]						= "The diary of Cornelius.";					count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string CorneliusTagebuch_1 = "If Larius keeps on like that, I'm going to look out for another position.";
const string CorneliusTagebuch_2 = "Something strange happened to me last night. I was visited in my home by one of those guys in black hoods we hear so much about lately. I wasn't really nervous, even though they're supposed to be so evil. You could almost feel the power those men have. But the voice was calm and kind of made you want to trust the guy.";
const string CorneliusTagebuch_3 = "He offered me 20,000 pieces of gold to make sure one of the mercenary's gets convicted. He said I'd know what he meant when it happened.";
const string CorneliusTagebuch_4 = "Of course I agreed right away, those mercenaries don't deserve any better anyway. If it weren't for them everything would be just fine for me here. And the gold will let me settle down to a comfortable retirement.";
const string CorneliusTagebuch_5 = "It's happened, they've arrested one of those mercenaries. It should be easy to keep my word.";
func void UseCorneliusTagebuch()
{
	Cornelius_IsLiar = TRUE;
	B_LogEntry(TOPIC_RESCUEBENNET, TOPIC_RESCUEBENNET_4);

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, CorneliusTagebuch_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, CorneliusTagebuch_2);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, CorneliusTagebuch_3);
				Doc_PrintLines	(nDocID, 1, CorneliusTagebuch_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, CorneliusTagebuch_5);
	Doc_Show(nDocID);

	PrintScreen("", -1, -1, FONT_Screen, 0);
};

//**********************************************************************************
//	ITWR_DementorObsessionBook_MIS // Joly: DementorBuch, der Bessenheit, Ein NSC trÃƒÂ¤gt dieses Buch mit sich, wenn er von einem Dementor kurzzeitig ÃƒÂ¼bernommen wurde.)
//**********************************************************************************

instance ITWR_DementorObsessionBook_MIS(C_ITEM)
{
	name						= "Almanac of the Possessed";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_DementorObsessionBook;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string DementorObsessionBook_1 = "edef Kon dirandorix";
const string DementorObsessionBook_2 = "in Sparady bell ";
const string DementorObsessionBook_3 = "el utoy";
const string DementorObsessionBook_4 = "Kho ray xaondron";
const string DementorObsessionBook_5 = "em piratoram endro";
const string DementorObsessionBook_6 = " VINO";
const string DementorObsessionBook_7 = "FERNANDO";
const string DementorObsessionBook_8 = " MALAK";
const string DementorObsessionBook_9 = "BROMOR";
const string DementorObsessionBook_10 = " ENGROM";
const string DementorObsessionBook_11 = " RANDOLPH";
const string DementorObsessionBook_12 = "SEKOB";
const string DementorObsessionBook_13 = " BRUTUS";
func void Use_DementorObsessionBook()
{
	Wld_PlayEffect("spellFX_Fear", hero, hero, 0, 0, 0, FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_ObsessionCounter = 100;
	B_SCIsObsessed(hero);

	if (hero.guild == GIL_KDF)
	{
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
				Doc_PrintLines	(nDocID, 0, DementorObsessionBook_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DementorObsessionBook_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DementorObsessionBook_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DementorObsessionBook_4);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, DementorObsessionBook_5);
		// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");

		if (Kapitel >= 3)
		{
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_6);
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_7);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_8);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_9);
		};

		if (Kapitel >= 4)
		{
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_10);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_11);
				Doc_PrintLine	(nDocID, 1, "");
		};

		if (Kapitel >= 5)
		{
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_12);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, DementorObsessionBook_13);
				Doc_PrintLine	(nDocID, 1, "");
		};

		Doc_Show(nDocID);
	};
};

//**********************************************************************************
//	ItWr_PyrokarsObsessionList
//**********************************************************************************

instance ItWr_PyrokarsObsessionList(C_Item)
{
	name						= "Pyrokar's Magic Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS"; // VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_PyrokarsObsessionList;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string PyrokarsObsessionList_1 = "The Possessed";
const string PyrokarsObsessionList_2 = "FERNANDO";
const string PyrokarsObsessionList_3 = "VINO";
const string PyrokarsObsessionList_4 = "MALAK";
const string PyrokarsObsessionList_5 = "BROMOR";
const string PyrokarsObsessionList_6 = "ENGROM";
const string PyrokarsObsessionList_7 = "RANDOLPH";
const string PyrokarsObsessionList_8 = "SEKOB";
const string PyrokarsObsessionList_9 = "BRUTUS";
func void Use_PyrokarsObsessionList()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages

	if (Kapitel >= 3)
	{
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_5);
	};

	if (Kapitel >= 4)
	{
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_7);
	};

	if (Kapitel >= 5)
	{
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, PyrokarsObsessionList_9);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	};

	Doc_Show(nDocID);
};

/******************************************************************************************/
//	Heiltrank fÃƒÂ¼r Hilda //
/******************************************************************************************/
instance ItPo_HealHilda_MIS(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_HealHilda;

	value						= Value_HpEssenz;

	description					= "Healing of the Black Fever";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpEssenz;
};

func void Use_HealHilda()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
};

// *****************************************************
// 		Maleths verlorener Gehstock
// *****************************************************
instance ItMw_MalethsGehstock_MIS(C_Item)
{
	name						= "Walking Stick";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_AXE;

	visual						= "Itmw_008_1h_pole_01.3ds";
	material					= MAT_WOOD;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_VLKMace;

	damageTotal					= Damage_VLKMace;
	damageType					= DAM_BLUNT;
	range						= RANGE_VLKMace;

	value						= Value_VLKMace;

	description					= name;
	text[0]						= "The letter 'M' has been";							count[0] = 0;
	text[1]						= "engraved at the top.";		count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[2];
	text[4]						= NAME_OneHanded;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// *****************************************************
// 		Maleths BanditenGeldbeutel
// *****************************************************

instance ItMi_MalethsBanditGold(C_Item)
{
	name						= "A bag full of gold!";

	mainflag					= ITEM_KAT_NONE;
	flags						= 0;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_MalethsBanditGold;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_MalethsBanditGold()
{
	B_PlayerFindItem(ItMi_Gold, 300);
};

// *****************************************************
// 		MoleratFett fÃƒÂ¼r "die Winde klemmt"
// *****************************************************

instance ItMi_Moleratlubric_MIS(C_Item)
{
	name						= "Molerat Fat";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Moleratlubric.3ds";
	material					= MAT_WOOD;

	value						= Value_Pitch;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= NAME_Value;									count[4] = value;
};

//*****************************************************
//	Babos Brief
//*****************************************************

instance ItWr_BabosLetter_MIS(C_Item)
{
	name						= "Letter to Babo";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_BabosLetter;

	value						= 0;

	description					= "A letter to Babo.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string BabosLetter_1 = "Dear Babo,";
const string BabosLetter_2 = "No doubt you're wondering how we came to write you this letter. We took all our savings to Master Marlas and asked him to write these lines for you. We wish you all the best for the future and are sending you a picture as a farewell gift, so that you'll always remember us during those long nights at the monastery.";
const string BabosLetter_3 = "Good luck. Hope you like the picture.";
const string BabosLetter_4 = "Feht and Bonka";
func void Use_BabosLetter()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, BabosLetter_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, BabosLetter_2);
				Doc_PrintLines	(nDocID, 0, BabosLetter_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, BabosLetter_4);

	Doc_Show(nDocID);
};

//********************************************************
//	BabosPinup
//********************************************************

instance ItWr_BabosPinUp_MIS(C_Item)
{
	name						= "Picture of Woman";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_BabosPinUp;

	value						= 0;

	description					= "A picture of a nude woman.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

func void Use_BabosPinUp()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Map_Pinup.TGA", 0);
	Doc_Show(nDocID);
};

//********************************************************
//	BabosDocs
//********************************************************

instance ItWr_BabosDocs_MIS(C_Item)
{
	name						= "Bundle of Papers";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_BabosDocs;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Several documents rolled";					count[2] = 0;
	text[3]						= "together.";									count[3] = 0;
};

func void Use_BabosDocs()
{
	BaboSDocsOpen = TRUE;

	CreateInvItems(self, ItWr_BabosLetter_MIS, 1);
	CreateInvItems(self, ItWr_BabosPinUp_MIS, 1);
};

//*************************************************************
//	igaraz SchlÃƒÂ¼ssel
//*************************************************************

instance ItKe_IgarazChest_Mis(C_Item)
{
	name						= "Chest Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to a chest";							count[2] = 0;
	text[3]						= "belonging to Igaraz.";						count[3] = 0;
};

//**********************************************************************************
//	ItWr_Astronomy_Mis
//**********************************************************************************

instance ItWr_Astronomy_Mis(C_ITEM)
{
	name						= "The Divine Power of the Stars";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_02.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Astronomy;

	value						= 400;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

var int Astronomy_once;

const string Astronomy_1 = "... but when the strength of an ox is combined with the principles of a warrior, then beware of the events that may come to pass.";
const string Astronomy_2 = "The unbound strength of the ox and the perseverance of the warrior can topple the ancient balance of the powers. The cosmic boundary between the dimensions grows weak - so weak that it becomes easy for the shadow creatures of Beliar to enter our world.";
const string Astronomy_3 = "What would ensue from this is shown to us by the wars of ancient times, when the link between the worlds was still strong. The henchmen of Evil brought death and destruction to the world, and only the help of Innos and the Chosen One could ward off Evil from mankind.";
const string Astronomy_4 = "If such a threat should ever exist again, then may Innos protect us, for there has not been another Chosen of Innos for over a hundred years.";
func void Use_Astronomy()
{
	if (Astronomy_once == FALSE)
	{
		B_RaiseAttribute_Bonus_Independent(self, ATR_MANA_MAX, 2);
		Print(PRINT_ReadAstronomy);
		Astronomy_once = TRUE;
	};

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Book_Mage_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Mage_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Astronomy_1);
				Doc_PrintLines	(nDocID, 0, Astronomy_2);
	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, Astronomy_3);
				Doc_PrintLines	(nDocID, 1, Astronomy_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, "");
	Doc_Show(nDocID);
};

///////////////////////
// Besessenheit heilen.
///////////////////////

var int SC_ObsessionTimes;

instance ItPo_HealObsession_MIS(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItMi_Flask.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= Use_HealObsession;

	value						= Value_HpEssenz;

	description					= "Healing of Possession";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Essenz;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_HpEssenz;
};

func void Use_HealObsession()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Essenz);
	SC_ObsessionTimes = SC_ObsessionTimes + 1;
	B_ClearSCObsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET", hero, hero, 0, 0, 0, FALSE);
	Snd_Play("SFX_HealObsession");
};

//************************************************
//	Die Golem Truhe
//************************************************

instance ItSe_Golemchest_Mis(C_Item)
{
	name						= "Leather Satchel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_GolemChest;

	value						= 0;

	description					= "A leather bag.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The bag is full of coins.";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_GolemChest()
{
	CreateInvItems(hero, ItMi_Gold, 50);
	Print(PRINT_FoundGold50);
	Print(PRINT_FoundRing);
	CreateInvItems(hero, ItRi_Prot_Total_02, 1);
	Snd_Play("Geldbeutel");
};

//////////////////////////////////////////////////////////////////////////////
//
//	ItWr_ShatteredGolem_MIS
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_ShatteredGolem_MIS(C_Item)
{
	name						= "A very old map."; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ShatteredGolem_Mis;

	value						= 150;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_ShatteredGolem_Mis()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_ShatteredGolem_MIS);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_ShatteredGolem.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//**********************************************************************************
//	Diegos Brief an den Richter
// ----------------------------------------------------------------------------------

instance ItWr_DiegosLetter_MIS(C_Item)
{
	name						= "Letter from Diego";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_DiegosLetter_Mis;

	value						= 0;

	description					= "Diego's letter to Gerbrandt.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string DiegosLetter_Mis_1 = "Gerbrandt, ";
const string DiegosLetter_Mis_2 = "You know, you should have killed me.";
const string DiegosLetter_Mis_3 = "I'm back in town and looking for you. And when I find you, I'm gonna slice you like a pudding. You've known me long enough to be sure I won't be fooled lightly.";
const string DiegosLetter_Mis_4 = "I guess when you had me thrown in the Barrier, you never dreamed I might come back. Well, you were wrong.";
const string DiegosLetter_Mis_5 = "I've come for what's owed to me.";
const string DiegosLetter_Mis_6 = "Your only chance to stay alive is to beat it fast and leave your business to me. That'd make us quits.";
const string DiegosLetter_Mis_7 = "Diego";
func void Use_DiegosLetter_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, DiegosLetter_Mis_1);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_2);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_3);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_4);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_5);
				Doc_PrintLines	(nDocID, 0, DiegosLetter_Mis_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, DiegosLetter_Mis_7);
	Doc_Show(nDocID);
};

//*************************************************************************************
//		Diegos Goldschatz
//*************************************************************************************

instance ItSe_DiegosTreasure_Mis(C_Item)
{
	name						= "Full Leather Satchel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_DiegosTreasure;

	value						= 0;

	description					= "Diego's old leather bag.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_DiegosTreasure()
{
	OpenedDiegosBag = TRUE;

	B_PlayerFindItem(ItMi_Gold, DiegosTreasure);
};

//*************************************************************************************
//		Ulthars heilendes Wasser zum reinigen der Wegschreine (nur PAL)
//*************************************************************************************

instance ItMi_UltharsHolyWater_Mis(C_Item)
{
	name						= "Ulthar's Holy Water";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_HolyWater.3ds";
	material					= MAT_WOOD;

	value						= Value_HolyWater;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	ItWr_MinenAnteil_Mis
// ----------------------------------------------------------------------------------
var int ItWr_MinenAnteil_Mis_OneTime;
instance ItWr_MinenAnteil_Mis(C_Item)
{
	name						= "Khorinis Ore Mine Share";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MinenAnteil_Mis;

	value						= Value_HpElixier;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string MinenAnteil_Mis_1 = "Ore Mine Share";
const string MinenAnteil_Mis_2 = "By the King's Bill of Property gained from Royal Lands, the bearer of this document is granted prospecting rights on the King's land.";
const string MinenAnteil_Mis_3 = "He must limit his scraping to the area of one small royal realmlot.";
const string MinenAnteil_Mis_4 = "According to the Bill of Scrapeland Size, small royal realmlots measure 16 paces in horizontal and 3 paces in vertical extension.";
const string MinenAnteil_Mis_5 = "The Prospector of the Realm is unbound by any duties of free access and protection of scraping cells.";
const string MinenAnteil_Mis_6 = "If the tenant is unable to pay the rent due, all rights to the land are returned to the Realm.";
const string MinenAnteil_Mis_7 = " Signed";
const string MinenAnteil_Mis_8 = " Prospector of the King";
const string MinenAnteil_Mis_9 = " Salandril";
func void Use_MinenAnteil_Mis()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_1);
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_2);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_3);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_4);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_5);
				Doc_PrintLines	(nDocID, 0, MinenAnteil_Mis_6);
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_7);
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, MinenAnteil_Mis_9);
	Doc_Show(nDocID);

	SC_KnowsProspektorSalandril = TRUE;

	if (ItWr_MinenAnteil_Mis_OneTime == FALSE)
	{
		B_LogEntry(TOPIC_MinenAnteile, TOPIC_MinenAnteile_1);

		if (Npc_IsDead(Salandril))
		{
			B_LogEntry(TOPIC_MinenAnteile, TOPIC_MinenAnteile_2);
		};

		ItWr_MinenAnteil_Mis_OneTime = TRUE;
	};
};

//**********************************************************************************
//	Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

instance ItAm_Prot_BlackEye_Mis(C_Item)
{
	name						= "Soul Summoning Amulet";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItAm_Hp_Mana_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	value						= Value_Am_HpMana;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "Protection from the Black Look";			count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

//**********************************************************************************
//	Gestein aus gesegneter Erde fÃƒÂ¼r das Schutzamulett gegen den Schwarzen Blick
//**********************************************************************************

instance ItMi_KarrasBlessedStone_Mis(C_Item)
{
	name						= "Stone from Blessed Soil";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_Rockcrystal.3ds";
	visual_skin					= 0;
	material					= MAT_STONE;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Komprobrief fÃƒÂ¼r Lee
// ----------------------------------------------------------------------------------

instance ItWr_RichterKomproBrief_MIS(C_Item)
{
	name						= "Judge's Assignment";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_RichterKomproBrief;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string RichterKomproBrief_1 = "Morgahard, you good-for-nothing wretch. Carry out my orders, or I'll have to change my tune and arrest the lot of you.";
const string RichterKomproBrief_2 = "It's gotta happen tomorrow night. Larius is getting suspicious.";
const string RichterKomproBrief_3 = "If we don't drag the money out of his pockets now, it may be too late. I'll make sure you meet him on the marketplace this evening.";
const string RichterKomproBrief_4 = "But don't make a show of it, or you'll have the militia down on you before you know what's happening.";
const string RichterKomproBrief_5 = "By the way: If he happens to peg out in the process, that's fine by me.";
const string RichterKomproBrief_6 = " Chief Judge and ";
const string RichterKomproBrief_7 = " King's Secretary";
func void Use_RichterKomproBrief()
{
	SCKnowsRichterKomproBrief = TRUE;

	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_1);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_2);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_3);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_4);
				Doc_PrintLines	(nDocID, 0, RichterKomproBrief_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RichterKomproBrief_6);
				Doc_PrintLine	(nDocID, 0, RichterKomproBrief_7);
				Doc_PrintLine	(nDocID, 0, "");

	Doc_Show(nDocID);
};

//**********************************************************************************
//	ItWr_MorgahardTip
// ----------------------------------------------------------------------------------

instance ItWr_MorgahardTip(C_Item)
{
	name						= "Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MorgahardTip;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string MorgahardTip_1 = "I've gone on ahead. I hope we'll all meet again when things have calmed down a mite.";
const string MorgahardTip_2 = "Don't worry, boys. If all else fails, I'll ask Onar to see to it for us.";
const string MorgahardTip_3 = "It'll be all right.";
const string MorgahardTip_4 = " M.";
func void Use_MorgahardTip()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MorgahardTip_1);
				Doc_PrintLines	(nDocID, 0, MorgahardTip_2);
				Doc_PrintLines	(nDocID, 0, MorgahardTip_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, MorgahardTip_4);
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//////////////////////////////////////////////////////////////////////////////
//
//	MAP der Schreine
//
//////////////////////////////////////////////////////////////////////////////

instance ItWr_Map_Shrine_MIS(C_Item)
{
	name						= "Map of the Holy Shrines"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_Shrine_MIS;

	value						= 200;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_Shrine_MIS()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_Shrine_MIS);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_Shrine.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//**********************************************************************************
//	ItWr_VinosKellergeister_Mis
//**********************************************************************************

instance ItWr_VinosKellergeister_Mis(C_ITEM)
{
	name						= "The Spirit of the Wine";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_VinosKellergeister_Mis;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string VinosKellergeister_Mis_1 = "Power of the Grape";
const string VinosKellergeister_Mis_2 = "... I've tried a lot in my time, but this fruit that was brought to me from abroad last week has exceeded all expectations ...";
const string VinosKellergeister_Mis_3 = "... the juice of this grape is fruitier than any you'll find in this part of the country ...";
const string VinosKellergeister_Mis_4 = "... so far so good. But it still makes me nervous to think what might happen if I'm caught in my secret still. I've no idea what the militia will do to me if they find me here. They might even throw me through the Barrier ...";
const string VinosKellergeister_Mis_5 = "... They've gotten suspicious. I'm going to go and leave all this until things have calmed down a bit and get back to work when I can be sure they're not onto me any more ...";
func void Use_VinosKellergeister_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "BOOK_RED_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "BOOK_RED_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VinosKellergeister_Mis_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VinosKellergeister_Mis_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	// Absatz
				Doc_PrintLines	(nDocID, 0, VinosKellergeister_Mis_3);
				Doc_PrintLines	(nDocID, 0, "");

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_BookHeadline); // -1 -> all pages
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, VinosKellergeister_Mis_4);
				Doc_PrintLine	(nDocID, 1, "");
	// Absatz
				Doc_PrintLines	(nDocID, 1, VinosKellergeister_Mis_5);
	Doc_Show(nDocID);
};
