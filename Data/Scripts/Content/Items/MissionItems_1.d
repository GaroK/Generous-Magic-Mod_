//****************************************************************************
//			SchlÃƒÂ¼ssel fÃƒÂ¼r Xardas Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Xardas(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A key to a chest";						count[2] = 0;
	text[3]						= "belonging to Xardas.";									count[3] = 0;
};

//**********************************************************************************
//	Canthars Kompromittierender Brief fÃƒÂ¼r Sarah die HÃƒÂ¤ndlerin
// ----------------------------------------------------------------------------------

instance ItWr_Canthars_KomproBrief_MIS(C_Item)
{
	name						= "Letter";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Canthars_KomproBrief;

	value						= 0;

	description					= "Canthar's letter to the merchant Sarah.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Canthars_KomproBrief_1 = " Last Warning";
const string Canthars_KomproBrief_2 = " I have already reminded you several";
const string Canthars_KomproBrief_3 = " times in the friendliest";
const string Canthars_KomproBrief_4 = " terms that I urgently require the";
const string Canthars_KomproBrief_5 = " weapons I ordered from you a week";
const string Canthars_KomproBrief_6 = " ago.";
const string Canthars_KomproBrief_7 = " If I don't hear from you very soon,";
const string Canthars_KomproBrief_8 = " Sarah, I will be forced to change my";
const string Canthars_KomproBrief_9 = " attitude to you. I hope we understand";
const string Canthars_KomproBrief_10 = " each other!!!!!!!!!!!!";
const string Canthars_KomproBrief_11 = " Onar";
func void Use_Canthars_KomproBrief()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_2);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_3);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_4);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_5);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_6);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_7);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_8);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_9);
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_10);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Canthars_KomproBrief_11);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//****************************************************************************
//			Rods Schwert
//			---------------------------------------------
//****************************************************************************
instance ItMw_2h_Rod(C_Item)
{
	name						= "Rod's Two-Hander";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_2HD_SWD;

	visual						= "ItMw_035_2h_sld_sword_01.3DS";
	material					= MAT_METAL;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_Rod;

	damageTotal					= Damage_Rod;
	damageType					= DAM_EDGE;
	range						= RANGE_Sld2hSchwert;

	value						= Value_Sld2hSchwert;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[2];
	text[4]						= NAME_TwoHanded;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//***************
// Coragons Silber
//***************
instance ItMi_CoragonsSilber(C_Item)
{
	name						= "Coragon's Silver";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverCup.3DS";
	material					= MAT_METAL;

	value						= Value_SilverCup;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*******************************
// PÃƒÂ¤ckchen fÃƒÂ¼r Thekla von Sagitta
//*******************************
instance ItMi_TheklasPaket(C_Item)
{
	name						= "Thekla's Parcel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_TheklasPacket;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_TheklasPacket()
{
	CreateInvItems(hero, ItPl_Mana_Herb_01, 3);
	CreateInvItems(hero, ItPl_Health_Herb_02, 1);
	CreateInvItems(hero, ItPl_Speed_Herb_01, 1);
	CreateInvItems(hero, ItPl_Blueplant, 2);

	Print(PRINT_GotPlants);
};

//*******************************
// Marias Goldener Teller
//*******************************
instance ItMi_MariasGoldPlate(C_Item)
{
	name						= "Heavy Gold Plate";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_GoldPlate.3DS";
	material					= MAT_METAL;

	value						= Value_GoldPlate;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The plate is engraved with the";				count[2] = 0;
	text[3]						= "names Onar and Maria.";				count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//*******************************
// Valentinos Ring
//*******************************

instance ItRi_ValentinosRing(C_Item) // bei Cassia als Belohnung
{
	name						= NAME_Ring;

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Prot_Edge_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ValentinosRing;
	on_unequip					= UnEquip_ValentinosRing;

	value						= Value_Ri_ProtEdge;

	description					= "Valentino's Ring";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Prot_Edge;								count[2] = Ri_ProtEdge;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_ValentinosRing()
{
	self.protection [PROT_EDGE] += Ri_ProtEdge;
	self.protection [PROT_BLUNT] += Ri_ProtEdge;
};

func void UnEquip_ValentinosRing()
{
	self.protection [PROT_EDGE] -= Ri_ProtEdge;
	self.protection [PROT_BLUNT] -= Ri_ProtEdge;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel fÃƒÂ¼r Dexter Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Dexter(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A key to a chest";						count[2] = 0;
	text[3]						= "belonging to Dexter.";									count[3] = 0;
};

//**********************************************************************************
//	Constantinos KrÃƒÂ¤uterliste
// ----------------------------------------------------------------------------------

instance ItWr_Kraeuterliste(C_Item)
{
	name						= "List";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Kraeuterliste;

	value						= 0;

	description					= "Constantino's list of herbs.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string Kraeuterliste_1 = "Alchemical Herbs";
const string Kraeuterliste_2 = "Healing Plant";
const string Kraeuterliste_3 = "Healing Herb";
const string Kraeuterliste_4 = "Healing Root";
const string Kraeuterliste_5 = "Fire Nettle";
const string Kraeuterliste_6 = "Fireweed";
const string Kraeuterliste_7 = "Fire Root";
const string Kraeuterliste_8 = "Goblin Berry";
const string Kraeuterliste_9 = "Dragonroot";
const string Kraeuterliste_10 = "Snapperweed";
const string Kraeuterliste_11 = "Meadow Knotweed";
const string Kraeuterliste_12 = "King's Sorrel";
const string Kraeuterliste_13 = "Note: Let a potential apprentice fetch the plants for you. That way you'll know if he's any good. ";
const string Kraeuterliste_14 = "Regards, Zuris.";
func void Use_Kraeuterliste()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_2);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_3);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_4);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_5);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_6);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_7);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_8);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_9);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_10);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_11);
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_12);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Kraeuterliste_13);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Kraeuterliste_14);
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus

	Doc_Show(nDocID);
};

//**********************************************************************************
// Neoras Mana Rezept
// ----------------------------------------------------------------------------------

instance ItWr_ManaRezept(C_Item)
{
	name						= "Recipe";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ManaRezept;

	value						= 20;

	description					= "Recipe for magical essence.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string ManaRezept_1 = "Magic Potions";
const string ManaRezept_2 = "To brew magic potions, a skilled alchemist needs:";
const string ManaRezept_3 = "Fire Nettle";
const string ManaRezept_4 = "Fireweed";
const string ManaRezept_5 = "Fire Root";
const string ManaRezept_6 = "He also requires a plant of";
const string ManaRezept_7 = "Meadow Knotweed";
const string ManaRezept_8 = "Master Neoras";
func void Use_ManaRezept()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ManaRezept_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ManaRezept_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ManaRezept_3);
				Doc_PrintLine	(nDocID, 0, ManaRezept_4);
				Doc_PrintLine	(nDocID, 0, ManaRezept_5);
				Doc_PrintLines	(nDocID, 0, ManaRezept_6);
				Doc_PrintLine	(nDocID, 0, ManaRezept_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ManaRezept_8);
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus

	Doc_Show(nDocID);
};

// **************************************************************************************

instance ItWr_Passierschein(C_Item)
{
	name						= "Pass";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePassierschein;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "These papers permit me to";							count[3] = 0;
	text[4]						= "pass the city guards.";		count[4] = 0;
};

const string Passierschein_1 = " Pass";
const string Passierschein_2 = " Khorinis ";
const string Passierschein_3 = " This document entitles the";
const string Passierschein_4 = " bearer to move freely in the lower areas";
const string Passierschein_5 = " of Khorinis for an unlimited time period.";
const string Passierschein_6 = " Larius";
const string Passierschein_7 = " the King's governor";
func void UsePassierschein()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_BookHeadline);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passierschein_1);
				Doc_PrintLine	(nDocID, 0, Passierschein_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, Passierschein_3);
				Doc_PrintLine	(nDocID, 0, Passierschein_4);
				Doc_PrintLine	(nDocID, 0, Passierschein_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passierschein_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passierschein_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Kraut Paket fÃƒÂ¼r MIS_ANDRE_WAREHOUSE
//			---------------------------------------------
//****************************************************************************
instance ItMi_HerbPaket(C_Item)
{
	name						= "Parcel of Weed";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A heavy, sticky package that";				count[2] = 0;
	text[3]						= "stinks of swampweed.";					count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = 200;
};

//****************************************************************************
//				Lagerhaus SchlÃƒÂ¼ssel fÃƒÂ¼r MIS_ANDRE_WAREHOUSE
//			---------------------------------------------
//****************************************************************************
instance ItKe_Storage(C_Item)
{
	name						= "Storehouse Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the harbor";							count[2] = 0;
	text[3]						= "storehouse.";							count[3] = 0;
};

const int HP_Hering = 20;
//****************************************************************************
//				Alternativer Fish - danke Levelbereich !
//			---------------------------------------------
//****************************************************************************
instance ItFo_SmellyFish(C_Item)
{
	name						= "Herring";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "FOOD";
	on_state[0]					= Use_SmellyFish;

	value						= 0;

	description					= "A herring.";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Hering;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Fish;
};

func void Use_SmellyFish()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Hering);
};

//****************************************************************************
//				Komischer Fisch von den Banditen mit Nachricht an Halvor
//			---------------------------------------------
//****************************************************************************
instance ItFo_HalvorFish_MIS(C_Item)
{
	name						= "Strange Fish";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_HalvorFish;

	value						= 0;

	description					= "A weird-looking fish.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "There's something wrong with this fish.";	count[2] = 0;
	text[3]						= "Looks like it's been sewn up ...";			count[3] = 0;
};

func void Use_HalvorFish()
{
	CreateInvItems(hero, ItWr_HalvorMessage, 1);
	Print(PRINT_FishLetter);
};

//****************************************************************************
//				Nachricht von Halvor an die Banditen, im Fisch versteckt
//			---------------------------------------------
//****************************************************************************
instance ItWr_HalvorMessage(C_Item)
{
	name						= "Stinking Note";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseHalvorMessage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "This note was hidden inside a fish.";	count[2] = 0;
};

const string HalvorMessage_1 = " Keep your heads low, guys! ";
const string HalvorMessage_2 = " The militia's getting suspicious.";
const string HalvorMessage_3 = " Don't do anything until you hear from me again!";
const string HalvorMessage_4 = " Halvor";
func void UseHalvorMessage()
{
	Knows_Halvor = TRUE;

	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, HalvorMessage_1);
				Doc_PrintLine	(nDocID, 0, HalvorMessage_2);
				Doc_PrintLine	(nDocID, 0, HalvorMessage_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, HalvorMessage_4);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Komischer Fisch von Halvor als Schweigegeld
//			---------------------------------------------
//****************************************************************************
/*
instance ItFo_HalvorFish(C_Item)
{
	name						= "Seltsamer Fisch";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Fish.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_HalvorFish;

	value						= 0;

	description					= "Seltsam aussehender Fisch";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Irgendwas ist in diesem Fisch versteckt";	count[2] = 0;
};

func void Use_HalvorFish()
{
	CreateInvItems(hero, ItMi_Nugget, 1);
	PrintScreen(PRINT_FoundOreNugget, -1, YPOS_LEVELUP, FONT_ScreenSmall, 2);
};

*/
//****************************************
//	Alriks Schwert
//****************************************

instance ItMw_AlriksSword_Mis(C_Item)
{
	name						= "Alrik's Sword";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_MISSION | ITEM_SWD;

	visual						= "ItMw_025_1h_Sld_Sword_01.3DS";
	material					= MAT_METAL;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_Alrik;

	damageTotal					= damage_Alrik;
	damageType					= DAM_EDGE;
	range						= range_Alrik;

	on_equip					= Equip_AlriksSword;
	on_unequip					= UnEquip_AlriksSword;

	value						= value_Alrik;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Str_needed;								count[3] = cond_value[2];
	text[4]						= NAME_OneHanded;								count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Equip_AlriksSword()
{
	B_AddFightSkill(self, NPC_TALENT_1H, 10);
};

func void UnEquip_AlriksSword()
{
	B_AddFightSkill(self, NPC_TALENT_1H, -10);
};

//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//			---------------------------------------------
//****************************************************************************
instance ItWr_VatrasMessage(C_Item)
{
	name						= "Sealed Message";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= UseVatrasMessage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A message from Vatras";					count[2] = 0;
	text[3]						= "for the Fire Mages.";					count[3] = 0;
};

const string VatrasMessage_1 = "Dear Isgaroth,";
const string VatrasMessage_2 = "I sense the ever-growing presence of another force.";
const string VatrasMessage_3 = "It's a force so far unknown to us. Can it be that there are vassals of Beliar near?";
const string VatrasMessage_4 = "I could be mistaken, but I believe Father Pyrokar would be wise to take the matter in hand. ";
const string VatrasMessage_5 = "May our prayers be answered.";
const string VatrasMessage_6 = "Vatras";
func void UseVatrasMessage()
{
	CreateInvItems(self, ItWr_VatrasMessage_Open, 1);
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, VatrasMessage_1);
				Doc_PrintLines	(nDocID, 0, VatrasMessage_2);
				Doc_PrintLines	(nDocID, 0, VatrasMessage_3);
				Doc_PrintLines	(nDocID, 0, VatrasMessage_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasMessage_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, VatrasMessage_6);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Botschaft von Vatras an die Magier des Feuers
//				Das Siegel wurde geÃƒÂ¶ffnet
//			---------------------------------------------
//****************************************************************************
instance ItWr_VatrasMessage_Open(C_Item)
{
	name						= "Message";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseVatrasMessageOpen;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A message from Vatras";					count[2] = 0;
	text[3]						= "for the Fire Mages.";					count[3] = 0;
	text[4]						= "The seal has been broken.";					count[4] = 0;
};

const string VatrasMessageOpen_1 = "Dear Isgaroth,";
const string VatrasMessageOpen_2 = "I sense the ever-growing presence of another force.";
const string VatrasMessageOpen_3 = "It's a force so far unknown to us. Can it be that there are vassals of Beliar near?";
const string VatrasMessageOpen_4 = "I could be mistaken, but I believe Father Pyrokar would be wise to take the matter in hand. ";
const string VatrasMessageOpen_5 = "May our prayers be answered.";
const string VatrasMessageOpen_6 = "Vatras";
func void UseVatrasMessageOpen()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, VatrasMessageOpen_1);
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_2);
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_3);
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasMessageOpen_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, VatrasMessageOpen_6);
	Doc_Show(nDocID);
};

//****************************************************
//		HotelschlÃƒÂ¼ssel
//****************************************************
instance ItKe_Hotel(C_Item)
{
	name						= "Room Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the hotel";						count[2] = 0;
	text[3]						= "room.";									count[3] = 0;
};

//****************************************************
//		SchlÃƒÂ¼ssel zur Diebesgilde
//****************************************************
instance ItKe_ThiefGuildKey_MIS(C_Item)
{
	name						= "Rusty Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "This key has been damaged by salty seawater.";	count[2] = 0;
};

//****************************************************
//		SchlÃƒÂ¼ssel zur Diebesgilde vom Hotel
//****************************************************
instance ItKe_ThiefGuildKey_Hotel_MIS(C_Item)
{
	name						= "Rusty Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the hotel cellar.";				count[2] = 0;
};

//****************************************************
//		PfortenschlÃƒÂ¼ssel Tempel von Innos
//****************************************************
instance ItKe_Innos_MIS(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the portal of the";					count[2] = 0;
	text[3]						= "monastery of Innos.";							count[3] = 0;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
instance ItKe_KlosterSchatz(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the monastery's";							count[2] = 0;
	text[3]						= "treasury.";					count[3] = 0;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel Vorratskammer Kloster
//			---------------------------------------------
//****************************************************************************
instance ItKe_KlosterStore(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the monastery's";							count[2] = 0;
	text[3]						= "larder.";					count[3] = 0;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel Schlafgemach Player
//			---------------------------------------------
//****************************************************************************
instance ItKe_KDFPlayer(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the chamber";							count[2] = 0;
	text[3]						= "in the monastery.";							count[3] = 0;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel Bibliothek Kloster
//			---------------------------------------------
//****************************************************************************
instance ItKe_KlosterBibliothek(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key to the monastery's";							count[2] = 0;
	text[3]						= "library.";						count[3] = 0;
};

//****************************************************************************
//			Extra Wurst Gorax Mission
//			---------------------------------------------
//****************************************************************************
instance ItFo_Schafswurst(C_Item)
{
	name						= "Sheep Sausage";

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Sausage.3DS";
	material					= MAT_LEATHER;

	scemeName					= "FOOD";
	on_state[0]					= Use_Schafswurst;

	value						= Value_Sausage;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Sausage;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Sausage;
};

func void Use_Schafswurst()
{
	Npc_ChangeAttribute(self, ATR_HITPOINTS, HP_Sausage);
};

/******************************************************************************************/
instance ItPo_Perm_LittleMana(C_Item)
{
	name						= NAME_Trank;

	mainflag					= ITEM_KAT_POTIONS;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_MANAPOTION";

	visual						= "ItPo_Perm_Mana.3ds";
	material					= MAT_GLAS;

	scemeName					= "POTIONFAST";
	on_state[0]					= UseItPo_LittleMana;

	value						= 150;

	description					= "Essence of Spirit";
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_ManaMax;							count[1] = 3;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value;
};

func void UseItPo_LittleMana()
{
	B_RaiseAttribute_Bonus_Independent(self, ATR_MANA_MAX, 3);
	Npc_ChangeAttribute(self, ATR_MANA, 3);
};

//****************************************************
//		Hammer Innos, fÃƒÂ¼r Golem PrÃƒÂ¼fung
//****************************************************
instance Holy_Hammer_MIS(C_Item)
{
	name						= "Sacred Hammer";

	mainflag					= ITEM_KAT_NF;
	flags						= ITEM_MISSION | ITEM_2HD_AXE;

	owner						= Nov_608_Garwig;
	visual						= "ItMw_030_2h_kdf_hammer_01.3DS";
	material					= MAT_METAL;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_HolyHammer;

	damageTotal					= Damage_HolyHammer;
	damageType					= DAM_BLUNT;
	range						= Range_HolyHammer;

	value						= Value_HolyHammer;

	description					= name;
	// FIXME_Noki: TAB
	/*
	description = name;
	TEXT[2] = NAME_Damage; COUNT[2] = damageTotal;
	TEXT[3] = NAME_Str_needed; COUNT[3] = cond_value[2];
	TEXT[4] = NAME_OneHanded;
	TEXT[5] = NAME_Value; COUNT[5] = value;

	Die Konstanten stehen in der Tuning_Melee_Weapons.d M.F.
	*/
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Damage:                 ??";				count[2] = 0;
	text[3]						= "Strength required:        ??";				count[3] = 0;
	text[4]						= "Two-Handed Weapon";					count[4] = 0;
	text[5]						= "Value:  unable to determine";					count[5] = value;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel fÃƒÂ¼r die Truhe in der MagierhÃƒÂ¶hle
//			---------------------------------------------
//****************************************************************************
instance ItKe_MagicChest(C_Item)
{
	name						= "Old Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "An old iron key.";				count[2] = 0;
	text[3]						= "It could belong to a";						count[3] = 0;
	text[4]						= "padlock.";					count[4] = 0;
};

//****************************************************************************
//			gefÃƒÂ¤lschter Passierschein von Lee
//			---------------------------------------------
//****************************************************************************
instance ItWr_Passage_MIS(C_Item)
{
	name						= "Peace Offer for the Paladins";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePassage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "With this note I should be able to";			count[3] = 0;
	text[4]						= "see Lord Hagen.";				count[4] = 0;
};

const string Passage_1 = "Honored Lord Hagen,";
const string Passage_2 = "We are both aware of your situation. I therefore propose the following arrangement:";
const string Passage_3 = "Grant my men and myself total absolution before Innos and before the King.";
const string Passage_4 = "In return, we offer to assist you in the defense of the town and the surrounding lands.";
const string Passage_5 = "Moreover, I personally shall see to it that my men steer clear of the surrounding farms - except, of course, that of Onar, where we will continue to be stationed.";
const string Passage_6 = "I am aware that there is enough room for myself and some of my men on the ship aboard which you will depart to the mainland. When you set sail, I want to be on board.";
const string Passage_7 = "I beseech you: Make your decision with all the wisdom given to you.";
const string Passage_8 = "Signed General Lee";
func void UsePassage()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passage_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Passage_2);
				Doc_PrintLines	(nDocID, 0, Passage_3);
				Doc_PrintLines	(nDocID, 0, Passage_4);
				Doc_PrintLines	(nDocID, 0, Passage_5);
				Doc_PrintLines	(nDocID, 0, Passage_6);
				Doc_PrintLines	(nDocID, 0, Passage_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Passage_8);
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus

	Doc_Show(nDocID);
};

//****************************************************************************
//			Nachricht des Banditen -> Plot Wo ist die Armee?
//			---------------------------------------------
//****************************************************************************

instance ItWr_BanditLetter_MIS(C_Item)
{
	name						= "Message";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseBanditLetter;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
};

const string BanditLetter_1 = "Stop all men who come";
const string BanditLetter_2 = " from the mountains.";
const string BanditLetter_3 = "If someone comes along the pass,";
const string BanditLetter_4 = " it will probably be an old man.";
const string BanditLetter_5 = "Don't let him fool you -";
const string BanditLetter_6 = " he is a dangerous sorcerer. ";
const string BanditLetter_7 = "Keep an eye on him.";
const string BanditLetter_8 = "It's possible the guy we're looking for";
const string BanditLetter_9 = " will contact him. ";
const string BanditLetter_10 = "With this letter I'm sending you";
const string BanditLetter_11 = " thirty pieces of gold.";
const string BanditLetter_12 = "I will give another thirty to anyone";
const string BanditLetter_13 = " who kills the man.";
const string BanditLetter_14 = "Bring his head to the old mine near the landowner.";
const string BanditLetter_15 = "...D.";
func void UseBanditLetter()
{
	var int nDocID;

	/*
	if (Bdt13_Dexter_verraten == FALSE)
	{
		Bdt13_Dexter_verraten = TRUE;

		Log_CreateTopic(Topic_Bandits, LOG_MISSION);
		Log_SetTopicStatus(Topic_Bandits, LOG_RUNNING);
		B_LogEntry(Topic_Bandits, "Der AnfÃƒÂ¼hrer der Banditen ist Dexter. Er versteckt sich bei einer Mine, beim GroÃƒÅ¸bauer.");
		MIS_Steckbriefe = LOG_RUNNING;
	};

		*/

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetFont(nDocID, 0, FONT_Book);
				Doc_PrintLine	(nDocID, 0, BanditLetter_1);
				Doc_PrintLine	(nDocID, 0, BanditLetter_2);
				Doc_PrintLine	(nDocID, 0, BanditLetter_3);
				Doc_PrintLine	(nDocID, 0, BanditLetter_4);
				Doc_PrintLine	(nDocID, 0, BanditLetter_5);
				Doc_PrintLine	(nDocID, 0, BanditLetter_6);
				Doc_PrintLine	(nDocID, 0, BanditLetter_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BanditLetter_8);
				Doc_PrintLine	(nDocID, 0, BanditLetter_9);
				Doc_PrintLine	(nDocID, 0, BanditLetter_10);
				Doc_PrintLine	(nDocID, 0, BanditLetter_11);
				Doc_PrintLine	(nDocID, 0, BanditLetter_12);
				Doc_PrintLine	(nDocID, 0, BanditLetter_13);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BanditLetter_14);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, BanditLetter_15);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1);
	Doc_Show(nDocID);
};

//****************************************************************************
//			Steckbrief vom Spieler
//			---------------------------------------------
//****************************************************************************
instance ItWr_Poster_MIS(C_Item)
{
	name						= "Wanted Note";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UsePoster;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "A picture of me!";							count[3] = 0;
	text[4]						= "";											count[4] = 0;
};

func void UsePoster()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Gesucht.TGA", 0);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Banditen Truhen SchlÃƒÂ¼ssel
//			---------------------------------------------
//****************************************************************************
instance ItKe_Bandit(C_Item)
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
	text[2]						= "The key belonged";								count[2] = 0;
	text[3]						= "to a bandit.";						count[3] = 0;
};

//****************************************************************************
//				Bospers Jagdbogen
//			---------------------------------------------
//****************************************************************************
instance ItRw_Bow_L_03_MIS(C_Item)
{
	name						= "Hunting Bow";

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_BOW | ITEM_MISSION;

	munition					= ItRw_Arrow;

	visual						= "ItRw_Bow_L_03.mms";
	material					= MAT_WOOD;

	cond_atr[2]					= ATR_DEXTERITY;
	cond_value[2]				= Condition_Jagdbogen;

	damageTotal					= Damage_Jagdbogen;
	damageType					= DAM_POINT;

	value						= Value_Jagdbogen;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_Dex_needed;								count[3] = cond_value[2];
	text[4]						= "Bosper's hunting bow.";							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//****************************************************************************
//				Constantinos Schutzring
//			---------------------------------------------
//****************************************************************************
instance ItRi_Prot_Point_01_MIS(C_Item)
{
	name						= "Constantino's Ring";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Prot_Point_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_ItRi_Prot_Point_01_MIS;
	on_unequip					= UnEquip_ItRi_Prot_Point_01_MIS;

	value						= Value_Ri_ProtPoint;

	description					= "Wood Protection";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Prot_Point;								count[2] = Ri_ProtPoint;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_ItRi_Prot_Point_01_MIS()
{
	self.protection [PROT_POINT] += Ri_ProtPoint;
};

func void UnEquip_ItRi_Prot_Point_01_MIS()
{
	self.protection [PROT_POINT] -= Ri_ProtPoint;
};

//****************************************************************************
//				Eddas Statue
//			---------------------------------------------
//****************************************************************************
instance ItMi_EddasStatue(C_Item)
{
	name						= "Statue of Innos";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_InnosStatue.3DS";
	material					= MAT_METAL;

	value						= 50;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Innos, Lord of Justice";				count[2] = 0;
	text[3]						= "bless and guard me,";						count[3] = 0;
	text[4]						= "and spare me from harm.";			count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//****************************************************************************
//				Crypta-SchlÃƒÂ¼ssel
//			---------------------------------------------
//****************************************************************************
instance ItKe_EVT_CRYPT_01(C_Item)
{
	name						= "Old Brass key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key from the skeleton in room 1";		count[2] = 0;
};

instance ItKe_EVT_CRYPT_02(C_Item)
{
	name						= "Old Brass key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key from the skeleton in room 2";		count[2] = 0;
};

instance ItKe_EVT_CRYPT_03(C_Item)
{
	name						= "Old Brass key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "The key from the skeleton in room 3";			count[2] = 0;
};

const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_Item)
{
	name						= "Old Knight's Armor";

	mainflag					= ITEM_KAT_ARMOR;
	flags						= 0;

	wear						= WEAR_TORSO;

	visual						= "ItAr_Pal_H.3ds";
	visual_change				= "Armor_Pal_Skeleton.asc";
	visual_skin					= 0;
	material					= MAT_LEATHER;

	protection[PROT_EDGE]		= 100;
	protection[PROT_BLUNT]		= 100;
	protection[PROT_POINT]		= 100;
	protection[PROT_FIRE]		= 50;
	protection[PROT_MAGIC]		= 50;

	value						= VALUE_ITAR_PAL_SKEL;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Prot_Edge;								count[1] = protection[PROT_EDGE];
	text[2]						= NAME_Prot_Point;								count[2] = protection[PROT_POINT];
	text[3]						= NAME_Prot_Fire;								count[3] = protection[PROT_FIRE];
	text[4]						= NAME_Prot_Magic;								count[4] = protection[PROT_MAGIC];
	text[5]						= NAME_Value;									count[5] = value;
};

//****************************************************************************
//				SchlÃƒÂ¼ssel zu Valentinos Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Valentino(C_Item)
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
	text[2]						= "The key to a chest";						count[2] = 0;
	text[3]						= "belonging to Valentino.";								count[3] = 0;
};

//****************************************************************************
//				SchlÃƒÂ¼ssel zur Truhe OV Noname Typen
//			---------------------------------------------
//****************************************************************************
instance ItKe_Buerger(C_Item)
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
	text[2]						= "It was lying around on a windowsill.";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

//****************************************************************************
//				SchlÃƒÂ¼ssel Richter Truhe
//			---------------------------------------------
//****************************************************************************
instance ItKe_Richter(C_Item)
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
	text[2]						= "The key to a chest";						count[2] = 0;
	text[3]						= "belonging to the judge.";								count[3] = 0;
};

//****************************************************************************
//				SchlÃƒÂ¼ssel Salandril
//			---------------------------------------------
//****************************************************************************
instance ItKe_Salandril(C_Item)
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
	text[2]						= "belonging to Salandril the Alchemist.";				count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

//****************************************************************************
//				SchlÃƒÂ¼ssel Truhe ...wo die Paladine schlafen
//			---------------------------------------------
//****************************************************************************
instance ItKe_PaladinTruhe(C_Item)
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
	text[2]						= "A small brass key from";				count[2] = 0;
	text[3]						= "the house of the paladins.";					count[3] = 0;
};

//****************************************************************************
//				Diebsgilde Schatz (Insel)
//			---------------------------------------------
//****************************************************************************
instance ItKe_ThiefTreasure(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A small key.";						count[2] = 0;
};

//****************************************************************************
//				Diebsgilde Fingers TÃƒÂ¼r
//			---------------------------------------------
//****************************************************************************
instance ItKe_Fingers(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_03.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "A rusty door key";					count[2] = 0;
	text[3]						= "from the sewers.";						count[3] = 0;
};

//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

instance ItWr_Schuldenbuch(C_ITEM)
{
	name						= "Book of Debts";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_05.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseSchuldBuch;

	value						= 100;

	description					= "Lehmar's book of debts.";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string SchuldBuch_1 = "Deals and Debts";
const string SchuldBuch_2 = "I, Master Thorben, carpenter of Khorinis, owe to the honorable Lehmar a debt of 200 gold coins.";
const string SchuldBuch_3 = " Thorben";
const string SchuldBuch_4 = "I, Coragon, innkeeper of Khorinis, owe the honorable Lehmar a debt of 150 in gold.";
const string SchuldBuch_5 = " Coragon";
const string SchuldBuch_6 = "I, Hanna, hotelier of Khorinis, owe the honorable Lehmar a debt of 250 gold coins.";
const string SchuldBuch_7 = " Hanna";
func void UseSchuldBuch()
{
	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 2);

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0);
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0);

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, SchuldBuch_1);
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, SchuldBuch_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, SchuldBuch_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, SchuldBuch_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, SchuldBuch_5);
	// Absatz
				Doc_PrintLine	(nDocID, 0, "");

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den RÃƒÂ¤nder des TGAs aus, links,oben,rechts,unten)
				// Doc_SetFont( nDocID, 1, FONT_BookHeadline ); // -1 -> all pages
				// Doc_PrintLine	(nDocID, 1, "");
				// Doc_PrintLines	(nDocID, 1, "StandardBuch Seite 2");
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, SchuldBuch_6);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, SchuldBuch_7);
	// Absatz
				Doc_PrintLines	(nDocID, 1, "");
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Lehmars Schuldenbuch
//**********************************************************************************

instance ItPl_Sagitta_Herb_MIS(C_Item)
{
	name						= "Sun Aloe";

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItPl_Strength_Herb_01.3DS";
	material					= MAT_WOOD;

	scemeName					= "FOOD";

	value						= Value_Strength_Herb_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Strength_Herb_01;
};

//****************************************************************************
//			SchlÃƒÂ¼ssel fÃƒÂ¼r die obernen Schlafzimmer in der Taverne (MITTE DER WELT!)
//			---------------------------------------------
//****************************************************************************
instance ITKE_ORLAN_HOTELZIMMER(C_Item)
{
	name						= "Room Key";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_01.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "from the tavern 'The Dead Harpy'.";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
};

instance ItRw_DragomirsArmbrust_MIS(C_Item)
{
	name						= "Dragomir's Crossbow";

	mainflag					= ITEM_KAT_FF;
	flags						= ITEM_CROSSBOW;

	munition					= ItRw_Bolt;

	visual						= "ItRw_Crossbow_L_02.mms";
	material					= MAT_WOOD;

	cond_atr[2]					= ATR_STRENGTH;
	cond_value[2]				= Condition_LeichteArmbrust;

	damageTotal					= Damage_LeichteArmbrust;
	damageType					= DAM_POINT;

	value						= Value_LeichteArmbrust;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= NAME_Damage;									count[2] = damageTotal;
	text[3]						= NAME_STR_needed;								count[3] = cond_value[2];
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};
