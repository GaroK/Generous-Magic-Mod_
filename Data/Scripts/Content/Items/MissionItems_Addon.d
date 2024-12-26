//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//			---------------------------------------------
//****************************************************************************
instance ItWr_SaturasFirstMessage_Addon_Sealed(C_Item)
{
	name						= "Versiegelte Botschaft";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_SaturasFirstMessage_Sealed;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Diese Botschaft wurde sorgf�ltig versiegelt.";count[2] = 0;
};

var int Use_SaturasFirstMessage_OneTime;
const string SaturasFirstMessage_1 = "Werter Vatras,";
const string SaturasFirstMessage_2 = "Wir sind bis zum Portal vorgedrungen. Du hattest recht.";
const string SaturasFirstMessage_3 = "Es scheint tats�chlich so, als seien sie Adanos-gl�ubige gewesen. Ich bitte dich, das anhand meiner Aufzeichnungen nochmal zu pr�fen.";
const string SaturasFirstMessage_4 = "Wir haben schon seit Tagen keines dieser seltsamen Wesen aus Stein ausmachen k�nnen.";
const string SaturasFirstMessage_5 = "Trotzdem bebt die Erde immer noch aus nicht erkennbaren Gr�nden.";
const string SaturasFirstMessage_6 = "Ich vermute, dass uns das Studium bald mehr Aufkl�rung dar�ber bescheren wird.";
const string SaturasFirstMessage_7 = "Das Ornament, das wir gefunden haben, hat eine weitaus wichtigere Bedeutung, als wir zuerst angenommen haben. Es scheint ein wichtiges Schl�sselartefakt zu sein. Ist aber leider nicht vollst�ndig. Wir m�ssen es noch weiter studieren.";
const string SaturasFirstMessage_8 = "Entsende eines unserer Kinder vom 'Ring des Wassers', um es uns zur�ck zu bringen. Wenn es geht, schicke nicht Cavalorn.";
const string SaturasFirstMessage_9 = "Ich habe ihn damit beauftragt, dir diesen Brief zu �berbringen. Ich denke, damit hat er erst einmal genug getan.";
const string SaturasFirstMessage_10 = "Ich hoffe, dass wir das Richtige tun.";
const string SaturasFirstMessage_11 = "Saturas";
func void Use_SaturasFirstMessage()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, SaturasFirstMessage_1);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_2);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_3);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_4);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_5);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_6);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_7);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_8);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_9);
				Doc_PrintLines	(nDocID, 0, SaturasFirstMessage_10);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, SaturasFirstMessage_11);
	Doc_Show(nDocID);

	if ((Use_SaturasFirstMessage_OneTime == FALSE)
	&& (MIS_Addon_Cavalorn_Letter2Vatras != LOG_SUCCESS))
	{
		Log_CreateTopic(TOPIC_Addon_KDW, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_KDW, TOPIC_Addon_KDW_2);
		Use_SaturasFirstMessage_OneTime = TRUE;
	};

	if (SC_KnowsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_1);
	};

	if (SC_IsRanger == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_RingOfWater, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_RingOfWater, TOPIC_Addon_RingOfWater_2);
	};

	SC_KnowsRanger = TRUE;
};

func void Use_SaturasFirstMessage_Sealed()
{
	CreateInvItems(self, ItWr_SaturasFirstMessage_Addon, 1);
	SaturasFirstMessageOpened = TRUE;
	Use_SaturasFirstMessage();
};

//****************************************************************************
//				Cavalorn's Brief an Vatras von Saturas
//				Das Siegel wurde ge�ffnet
//			---------------------------------------------
//****************************************************************************
instance ItWr_SaturasFirstMessage_Addon(C_Item)
{
	name						= "Ge�ffnete Botschaft";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_SaturasFirstMessage;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Saturas` Brief an Vatras";					count[2] = 0;
};

//****************************************************************************
//				Portalschl�sselbruchst�ck
//			---------------------------------------------
//****************************************************************************

instance ItMi_Ornament_Addon(C_ITEM)
{
	name						= "Ornament";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_PortalRing_05.3DS";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "Bruchst�ck eines grossen Ornamentrings";		count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC5_STANDARD;
};

instance ItMi_Ornament_Addon_Vatras(C_ITEM) // Joly: gibt Vatras dem SC um ihn zu Lares zu bringen. Nur hiermit wird Saturas zufrieden gestellt -> erst dann Nefarius Auftrag!!!!!!!!!
{
	name						= "Ornament";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_PortalRing_05.3DS";
	material					= MAT_METAL;

	value						= 0;

	description					= name;
	text[0]						= "Bruchst�ck eines grossen Ornamentrings";		count[0] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC5_STANDARD;
};

//****************************************************************************
//				ItWr_Map_NewWorld_Ornaments_Addon
//			---------------------------------------------
//****************************************************************************

instance ItWr_Map_NewWorld_Ornaments_Addon(C_Item)
{
	name						= "Nefarius's Karte"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_Ornaments;

	value						= 250;

	description					= name;
	text[0]						= "auf dieser Karte sind die Stellen markiert";	count[0] = 0;
	text[1]						= "an denen Nefarius die fehlenden Ornamente vermutet";count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_Ornaments()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Ornaments_Addon);
	};

	SC_SAW_ORNAMENT_MAP = TRUE;

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_Ornaments.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//****************************************************************************
//				ItWr_Map_NewWorld_Dexter
//			---------------------------------------------
//****************************************************************************

instance ItWr_Map_NewWorld_Dexter(C_Item)
{
	name						= "Landkarte Khorinis"; //

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Map_NewWorld_Dexter;

	value						= 210;

	description					= name;
	text[0]						= "Skip hat mir die Stelle markiert,";			count[0] = 0;
	text[1]						= "wo ich den Kopf der Banditen";				count[1] = 0;
	text[2]						= "Dexter finden kann.";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_Map_NewWorld_Dexter()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Map_NewWorld_Dexter);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_NewWorld_Dexter.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(Document, -28000, 50500, 95500, -42500);
	Doc_Show(Document);
};

//****************************************************************************
//				ItRi_Ranger_Addon
//			---------------------------------------------
//****************************************************************************

prototype Rangerring_Prototype(C_ITEM)
{
	name = "Aquamarinring";

	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION; // Joly:kein Multiitem. Die ringe sind individuell

	value = Value_Ri_HpMana;

	visual = "ItRi_Hp_Mana_01.3ds";

	visual_skin = 0;
	material = MAT_METAL;
	on_equip = Equip_ItRi_Ranger_Addon;
	on_unequip = UnEquip_ItRi_Ranger_Addon;

	description = "Erkennungszeichen des 'Rings des Wassers'";

	TEXT[5] = NAME_Value;
	COUNT[5] = value;

	INV_ZBIAS = INVCAM_ENTF_RING_STANDARD;
	INV_ROTZ = INVCAM_Z_RING_STANDARD;
	INV_ROTX = INVCAM_X_RING_STANDARD;
};

func void Equip_ItRi_Ranger_Addon()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if (ENTERED_ADDONWORLD == FALSE) // Joly:wegen Lance' Ring
		{
			if (Npc_HasItems(hero, ItRi_Ranger_Addon) == FALSE)
			{
				RangerRingIsLaresRing = TRUE;
			};
		};

		SCIsWearingRangerRing = TRUE;
		Print(PRINT_Addon_SCIsWearingRangerRing);
	};
};

func void UnEquip_ItRi_Ranger_Addon()
{
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(hero))
	{
		if (SC_IsRanger == FALSE)
		{
			SCIsWearingRangerRing = FALSE;
		};

		RangerRingIsLaresRing = FALSE;
	};
};

// Lares Ring
instance ItRi_Ranger_Lares_Addon(Rangerring_Prototype)
{
	TEXT[1] = "Dieser Ring geh�rt Lares";
};

// PCs Ring
instance ItRi_Ranger_Addon(Rangerring_Prototype)
{
	TEXT[1] = "Dieser Ring geh�rt mir";
};

// Lance Ring
instance ItRi_LanceRing(Rangerring_Prototype)
{
	TEXT[1] = "Dieser Ring geh�rt Lance";
};

//****************************************************************************
//				ItMi_PortalRing_Addon
//			---------------------------------------------
//****************************************************************************

instance ItMi_PortalRing_Addon(C_Item)
{
	name						= "Ornamentring";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_PortalRing_01.3DS";
	material					= MAT_STONE;

	value						= 0;

	description					= "Dieser Ring �ffnet das Portal";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
	INV_ZBIAS					= INVCAM_ENTF_MISC3_STANDARD;
};

//**********************************************************************************
//	Empfehlungsschreiben f�r Andre, Miliz zu werden (von Martin)
// ----------------------------------------------------------------------------------

instance ItWr_Martin_MilizEmpfehlung_Addon(C_Item)
{
	name						= "Martins Empfehlungsschreiben";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_MartinMilizEmpfehlung_Addon;

	value						= 0;

	description					= "Empfehlungsschreiben f�r Lord Andre";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "dieses Schreiben soll mir helfen bei";		count[2] = 0;
	text[3]						= "der Miliz aufgenommen zu werden";			count[3] = 0;
};

const string MartinMilizEmpfehlung_Addon_1 = "Geehrter Lord Andre";
const string MartinMilizEmpfehlung_Addon_2 = "Mit diesem Schreiben �bermittle ich euch einen neuen Rekruten f�r unsere Miliz.";
const string MartinMilizEmpfehlung_Addon_3 = "Er hat sich bei mir schon durch einige schwierige und standesgem�sse Dienste verdient gemacht.";
const string MartinMilizEmpfehlung_Addon_4 = "Ich bin mir sicher, dass er sich sehr gut eignet um den K�nig und das Wohl der B�rger dieser Stadt zu sch�tzen.";
const string MartinMilizEmpfehlung_Addon_5 = "Innos sch�tze den K�nig";
const string MartinMilizEmpfehlung_Addon_6 = "     Proviantmeister Martin";
func void Use_MartinMilizEmpfehlung_Addon()
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
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_2);
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_3);
				Doc_PrintLines	(nDocID, 0, MartinMilizEmpfehlung_Addon_4);
				Doc_PrintLine	(nDocID, 0, MartinMilizEmpfehlung_Addon_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, MartinMilizEmpfehlung_Addon_6);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Ravens Befehle an Dexter
// ----------------------------------------------------------------------------------

instance ItWr_RavensKidnapperMission_Addon(C_Item)
{
	name						= "Befehle";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_RavensKidnapperMission_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Ich habe dieses Schreiben ";					count[2] = 0;
	text[3]						= "dem Banditen Dexter abgenommen";				count[3] = 0;
};

var int Use_RavensKidnapperMission_Addon_OneTime;
const string RavensKidnapperMission_Addon_1 = "Dexter, du Mistkerl!";
const string RavensKidnapperMission_Addon_2 = "Als ich noch Erzbaron war, warst du nicht so unzuverl�ssig.";
const string RavensKidnapperMission_Addon_3 = "Wenn du es nicht schaffst, noch mehr B�rger aus der Stadt zu entf�hren und zu mir zu entsenden, dann werden wir bald ein handfestes Problem mit den Jungs in unserem Versteck haben. ";
const string RavensKidnapperMission_Addon_4 = "Ich brauche hier mehr Sklaven, sonst starten die Jungs hier noch eine Revolte. Und was das hei�t, muss ich dir nicht sagen, oder?";
const string RavensKidnapperMission_Addon_5 = "Ich stehe kurz davor in den Tempel hinein zu gelangen. Da kann ich mir St�rungen dieser Art nicht leisten.";
const string RavensKidnapperMission_Addon_6 = "Und noch ein Problem:";
const string RavensKidnapperMission_Addon_7 = "Auf kurz oder lang m�ssen wir einen Weg �ber die hohen Berge im Nordosten von Khorinis finden. Die Piraten machen die �berfahrten sicher nicht mehr lange mit, wenn wir sie nicht mehr daf�r bezahlen.";
const string RavensKidnapperMission_Addon_8 = "     Raven";
func void Use_RavensKidnapperMission_Addon()
{
	if ((Use_RavensKidnapperMission_Addon_OneTime == FALSE)
	&& (MIS_Addon_Vatras_WhereAreMissingPeople != 0))
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
		B_LogEntry(TOPIC_Addon_WhoStolePeople, TOPIC_Addon_WhoStolePeople_3);
		Use_RavensKidnapperMission_Addon_OneTime = TRUE;
	};

	SCKnowsMissingPeopleAreInAddonWorld = TRUE;

	var int nDocID;

	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_2);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_3);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_4);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_5);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_6);
				Doc_PrintLines	(nDocID, 0, RavensKidnapperMission_Addon_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, RavensKidnapperMission_Addon_8);
	Doc_Show(nDocID);
};

//**********************************************************************************
//	Empfehlungsschreiben f�r Pedro, ins Kloster eingelassen zu werden.
// ----------------------------------------------------------------------------------

instance ItWr_Vatras_KDFEmpfehlung_Addon(C_Item)
{
	name						= "Vatras Empfehlungsschreiben";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_VatrasKDFEmpfehlung_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "dieses Schreiben soll mir helfen ohne";		count[2] = 0;
	text[3]						= "Tribut ins Kloster der Feuermagier";			count[3] = 0;
	text[4]						= "eingelassen zu werden.";						count[4] = 0;
};

const string VatrasKDFEmpfehlung_Addon_1 = "Br�der des Feuers";
const string VatrasKDFEmpfehlung_Addon_2 = "Mir wurde soeben zugetragen, dass es einen Tribut erfordert, in eure Gefilde eingelassen zu werden.";
const string VatrasKDFEmpfehlung_Addon_3 = "Ich �bermittle mit diesem Schreiben eine gl�ubigen Mann, der Novize in euren Reihen werden will.";
const string VatrasKDFEmpfehlung_Addon_4 = "     Vatras";
func void Use_VatrasKDFEmpfehlung_Addon()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasKDFEmpfehlung_Addon_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, VatrasKDFEmpfehlung_Addon_2);
				Doc_PrintLines	(nDocID, 0, VatrasKDFEmpfehlung_Addon_3);
				// Doc_PrintLine	(nDocID, 0, "Ich hoffe, dass ich nicht pers�nlich erscheinen muss ihm den Einlass ");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, VatrasKDFEmpfehlung_Addon_4);
	Doc_Show(nDocID);
};

/******************************************************************************************/
instance ItMi_LostInnosStatue_Daron(C_Item)
{
	name						= "Wertvolle Innos Statue";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_InnosStatue.3DS";
	material					= MAT_METAL;

	value						= Value_InnosStatue;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

//**********************************************************************************
//	Abschiedsbrief von Lucia an Elvrich
// ----------------------------------------------------------------------------------

instance ItWr_LuciasLoveLetter_Addon(C_Item)
{
	name						= "Lucias Abschiedsbrief";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_LuciasLoveLetter_Addon;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

const string LuciasLoveLetter_Addon_1 = "Liebster Elvrich";
const string LuciasLoveLetter_Addon_2 = "Mir fehlen die Worte um zu beschreiben, wie leid es mir tut.";
const string LuciasLoveLetter_Addon_3 = "Ich wei�, dass du es nicht verstehen wirst, aber ich bin zu dem Schluss gekommen, dass es besser f�r uns beide ist, wenn du dir ein anst�ndigeres M�dchen als mich suchst.";
const string LuciasLoveLetter_Addon_4 = "Von dort, wo ich jetzt hin gehe, werde ich nicht mehr zur�ck kehren. Vergiss mich. Eine Dirne wie ich ist nichts f�r so einen aufrechten Kerl, wie du einer bist. Leb' wohl.";
const string LuciasLoveLetter_Addon_5 = "     Lucia";
func void Use_LuciasLoveLetter_Addon()
{
	Log_CreateTopic(TOPIC_Addon_Lucia, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lucia, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Lucia, TOPIC_Addon_Lucia_1);
	MIS_LuciasLetter = LOG_RUNNING;
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_2);
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_3);
				Doc_PrintLines	(nDocID, 0, LuciasLoveLetter_Addon_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, LuciasLoveLetter_Addon_5);
	Doc_Show(nDocID);
};

//****************************************************************************
//				Effectitems
//			---------------------------------------------
//****************************************************************************

prototype EffectItemPrototype_Addon(C_Item)
{
	name = "Stein";

	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;

	value = Value_Coal;

	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;

	description = name;
	TEXT[5] = NAME_Value;
	COUNT[5] = value;

	INV_ZBIAS = INVCAM_ENTF_MISC_STANDARD;
};

instance ItMi_AmbossEffekt_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FARM_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_FOREST_Addon(EffectItemPrototype_Addon)
{
};

instance ItMi_OrnamentEffekt_BIGFARM_Addon(EffectItemPrototype_Addon)
{
};

/******************************************************************************************/
// Hacke
instance ItMi_Rake(C_Item)
{
	name						= "Hacke";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Rake.3DS";
	material					= MAT_WOOD;

	scemeName					= "RAKE";
	on_state[1]					= Use_Rake;

	value						= Value_Rake;

	description					= name;
	// text[3]					= "(L�sst sich bei ge�ffnetem Inventar benutzen)";
	// text[4]					= "('Aktionstaste' + 'Pfeil- Vorne' gedr�ckt halten)";

	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
	// INV_ROTX					= 180;
};

func void Use_Rake()
{
	// B_SCUsesRake (self); // Schatz ausgraben ist jetzt Mobsi mit itmw_2h_Axe_L_01
};

/******************************************************************************************/
instance ItRi_Addon_BanditTrader(C_Item) // H�ndlergildenring
{
	name						= "Gildenring";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING;

	visual						= "ItRi_Prot_Point_02.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	value						= 5;

	description					= "Gravierter Ring";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "der �bersee-H�ndlergilde Araxos";			count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

//**********************************************************************************
//	ItWr_Addon_BanditTrader
// ----------------------------------------------------------------------------------

instance ItWr_Addon_BanditTrader(C_Item)
{
	name						= "Lieferung";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_ItWr_Addon_BanditTrader;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Dieses Schreiben habe ich bei";				count[2] = 0;
	text[3]						= "den Banditen hinter Sekobs Hof gefunden.";	count[3] = 0;
};

var int Use_ItWr_Addon_BanditTrader_OneTime;
const string ItWr_Addon_BanditTrader_1 = "15 Kurzschwerter";
const string ItWr_Addon_BanditTrader_2 = "20 Degen";
const string ItWr_Addon_BanditTrader_3 = "25 Laib Brot";
const string ItWr_Addon_BanditTrader_4 = "15 Flaschen Wein";
const string ItWr_Addon_BanditTrader_5 = "Das war das letzte Mal. ";
const string ItWr_Addon_BanditTrader_6 = "Die Sache wird mir langsam zu hei�";
const string ItWr_Addon_BanditTrader_7 = "     Fernando";
func void Use_ItWr_Addon_BanditTrader()
{
	BanditTrader_Lieferung_Gelesen = TRUE;
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_1);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_2);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_3);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_4);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_5);
				Doc_PrintLines	(nDocID, 0, ItWr_Addon_BanditTrader_6);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, ItWr_Addon_BanditTrader_7);
	Doc_Show(nDocID);

	if ((MIS_Vatras_FindTheBanditTrader != 0)
	&& (Use_ItWr_Addon_BanditTrader_OneTime == FALSE))
	{
		B_LogEntry(TOPIC_Addon_BanditTrader, TOPIC_Addon_BanditTrader_1);
		Use_ItWr_Addon_BanditTrader_OneTime = TRUE;
	};
};

//****************************************************************************
//				Vatras schickt SC zu Saturas
//			---------------------------------------------
//****************************************************************************
instance ItWr_Vatras2Saturas_FindRaven(C_Item)
{
	name						= "Botschaft";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_02.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Vatras2Saturas_FindRaven_Sealed;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Vatras Schreiben f�r Saturas";				count[2] = 0;
};

const string Vatras2Saturas_FindRaven_1 = "Werter Saturas";
const string Vatras2Saturas_FindRaven_2 = "Ich hoffe, ihr seid schon bald am Ziel. Unsere Situation hier in der Stadt scheint sich zur Zeit etwas zu entspannen. Aber ich f�rchte, die Ruhe tr�gt. Ihr solltet euch beeilen. Ich brauche euch hier.";
const string Vatras2Saturas_FindRaven_3 = "Ich habe deine Aufzeichnungen studiert und kann deinen Verdacht best�tigen. Die Schriftzeichen deuten tats�chlich auf eine Adanosgl�ubige Kultur hin. Seid also vorsichtig und lasst euch nicht von falschen Propheten blenden.";
const string Vatras2Saturas_FindRaven_4 = "Die vermissten B�rger von Khorinis wurden von dem ehemaligen Erzbaron Raven in die Region verschleppt, in die das Portal offensichtlich f�hren wird.";
const string Vatras2Saturas_FindRaven_5 = "Noch eines: Ich habe euch Hilfe entsendet. Der �berbringer dieser Nachricht ist etwas ganz besonderes. Er hat so einen bemerkenswerten Glanz in seinen Augen. Ich bin mir nicht sicher, aber es k�nnte ER sein, auch wenn wir ihn uns anders vorgestellt haben.";
const string Vatras2Saturas_FindRaven_6 = "Pr�fe ihn. Ich denke, ich habe recht.";
const string Vatras2Saturas_FindRaven_7 = "     Vatras";
func void Use_Vatras2Saturas_FindRaven()
{
	var int nDocID;
	nDocID = Doc_Create();
	Doc_SetPages(nDocID, 1);
	Doc_SetPage(nDocID, 0, "letters.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book);
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1);
				Doc_PrintLine	(nDocID, 0, Vatras2Saturas_FindRaven_1);
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_2);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_3);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_4);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_5);
				Doc_PrintLines	(nDocID, 0, Vatras2Saturas_FindRaven_6);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, Vatras2Saturas_FindRaven_7);
	Doc_Show(nDocID);
};

func void Use_Vatras2Saturas_FindRaven_Sealed()
{
	CreateInvItems(self, ItWr_Vatras2Saturas_FindRaven_opened, 1);
	Vatras2Saturas_FindRaven_Open = TRUE;
	Use_Vatras2Saturas_FindRaven();
};

instance ItWr_Vatras2Saturas_FindRaven_opened(C_Item)
{
	name						= "Ge�ffnete Botschaft";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION;

	visual						= "ItWr_Scroll_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_Vatras2Saturas_FindRaven;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Vatras Schreiben f�r Saturas";				count[2] = 0;
};

// ------------------------------------------------------------------------------------------
// Amulett des suchenden Irrlichts
// ------------------------------------------------------------------------------------------
instance ItAm_Addon_WispDetector(C_Item)
{
	name						= "Erzamulett";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_AMULET;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER_BLUE";

	visual						= "ItAm_Mana_01.3ds";
	visual_skin					= 0;
	material					= MAT_METAL;

	on_equip					= Equip_WispDetector;
	on_unequip					= UnEquip_WispDetector;

	value						= Value_Am_DexStrg;

	description					= "Erzamulett des suchenden Irrlichts";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_AMULETTE_STANDARD;
};

var int Equip_WispDetector_OneTime;

func void Equip_WispDetector()
{
	if (Equip_WispDetector_OneTime == FALSE)
	{
		PLAYER_TALENT_WISPDETECTOR[WISPSKILL_NF] = TRUE; // das erste Talent gibt's gratis
		WispSearching = WispSearch_NF;
		Equip_WispDetector_OneTime = TRUE;
	};

	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);
	AI_Teleport(DetWsp, "TOT");
	Wld_SpawnNpcRange(self, Wisp_Detector, 1, 500);
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE", Wisp_Detector, Wisp_Detector, 0, 0, 0, FALSE);
	Snd_Play("MFX_Transform_Cast");
	// Wld_PlayEffect("spellFX_SummonCreature_ORIGIN", hero, hero, 0, 0, 0, FALSE );
};

func void UnEquip_WispDetector()
{
	var C_Npc DetWsp;
	DetWsp = Hlp_GetNpc(Wisp_Detector);

	if (Npc_IsDead(DetWsp) == FALSE)
	{
		Snd_Play("WSP_Dead_A1");
	};

	AI_Teleport(DetWsp, "TOT");
	B_RemoveNpc(DetWsp);
	AI_Teleport(DetWsp, "TOT");
};

// Alligatorfleisch

instance ItFo_Addon_Krokofleisch_Mission(C_Item)
{
	name						= "Sumpfrattenfleisch";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItFoMuttonRaw.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MEAT";

	value						= Value_RawMeat;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Riecht irgendwie fischig!";					count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_RawMeat;
};

instance ItRi_Addon_MorgansRing_Mission(C_Item)
{
	name						= "Morgans Ring";

	mainflag					= ITEM_KAT_MAGIC;
	flags						= ITEM_RING | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_ITEMGLIMMER";

	visual						= "ItRi_Prot_Total_02.3DS";
	material					= MAT_METAL;

	on_equip					= Equip_MorgansRing;
	on_unequip					= UnEquip_MorgansRing;

	value						= 500;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Der Ring ist mit lauter feinen Runen verziert.";count[1] = 0;
	text[2]						= NAME_ADDON_BONUS_1H;							count[2] = 10;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_RING_STANDARD;
	INV_ROTX					= INVCAM_X_RING_STANDARD;
	INV_ROTZ					= INVCAM_Z_RING_STANDARD;
};

func void Equip_MorgansRing()
{
	B_AddFightSkill(self, NPC_TALENT_1H, 10);
};

func void UnEquip_MorgansRing()
{
	B_AddFightSkill(self, NPC_TALENT_1H, -10);
};

instance ItMi_Focus(C_Item)
{
	name						= "Fokusstein";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_MANAPOTION";

	visual						= "ItMi_Focus.3DS";
	material					= MAT_STONE;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

// ---------------------------------------------------------------------------
//				Stahl Paket f�r Huno
// ---------------------------------------------------------------------------
instance ItMi_Addon_Steel_Paket(C_Item)
{
	name						= "Stahl - Paket";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Packet.3ds";
	material					= MAT_LEATHER;

	value						= 300;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Diese Paket ist WIRKLICH schwer";			count[2] = 0;
	text[3]						= "Es enth�lt einen dicken Stahlklumpen";		count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// ------------------------------------------------------------------------------------------
// 	ItWr_StonePlateCommon_Addon
// ------------------------------------------------------------------------------------------
instance ItWr_StonePlateCommon_Addon(C_Item)
{
	name						= "Alte Steintafel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_StonePlate_Read_06.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_StonePlateCommon;

	value						= value_StonePlateCommon;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Eine graue Steintafel";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value_StonePlateCommon;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string StonePlateCommon_1 = "Die Kaste der Krieger hatte den Zorn unseres Gottes heraufbeschworen.";
const string StonePlateCommon_2 = "RHADEMES, der Nachfolger QUAHODRONS, wurde gebannt. Aber seine b�se Macht erreichte uns selbst vom Ort seiner Verbannung noch.";
const string StonePlateCommon_3 = "Wir waren machtlos dagegen.";
const string StonePlateCommon_4 = "ADANOS Zorn hat JHARKENDAR getroffen!";
func void Use_StonePlateCommon()
{
	var int nDocID;

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		nDocID = Doc_Create(); // DocManager
		Doc_SetPages(nDocID, 1); // wieviel Pages
		Doc_SetPage(nDocID, 0, "Maya_Stoneplate_03.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, StonePlateCommon_4);
	}
	else // Spieler beherrscht Sprache nicht
	{
		nDocID = Doc_Create(); // DocManager
		Doc_SetPages(nDocID, 1); // wieviel Pages
		Doc_SetPage(nDocID, 0, "Maya_Stoneplate_02.TGA", 0);
		/*
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "Oksefd nodnf Kwe. Erfjkemvfj Hwoqmnyhan ckh Sebnejbuwd Weinfiwjf Ihwqpjrnn.");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "RHADEMES revfnbrebuiwe QUAHODRON ewohjfribwe wef Gkjsdhad smoelk. Ihdh Znshen Fjewheege Egdgsmkd Ygc slje smoelkor.");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "Esfjwedbwe ewzbfujbwe Iuhdfb");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "ADANOS Ygc Egdgsmkd JHARKENDAR!");
		*/
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//				Die 5 Steintafeln
// ---------------------------------------------------------------------------

instance ItMi_Addon_Stone_01(C_Item) // Esteban und Thorus // Joly:Die Banditen benutzen diese Steintafeln als Zahlungsmittel.
{
	name						= "Rote Steintafel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_03.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_01;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Eine rote Steintafel";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_01_1 = "Wir, die letzten drei Anf�hrer des Rates der F�nf, haben die Kammern des Tempels mit Fallen versehen und den Eingang versteckt, auf das das Schwert nie wieder das Tageslicht erblicke.";
const string Addon_Stone_01_2 = "Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhndter rygilliambwe ewzbfujbwe Iuhdfb. Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.";
func void Use_Addon_Stone_01()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_02.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_01_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_01_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 5
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_05(C_Item) // Valley - Totenw�chter
{
	name						= "Gelbe Steintafel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_04.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_05;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Eine gelbe Steintafel";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_05_1 = "Ich, der sich gegen den Entschlu� der Drei gestellt hatte, erbaute die erste Falle. Und nur ich kenne die richtige Pforte.";
const string Addon_Stone_05_2 = "Fjewheege Egdgsmkd Ygc slje asdkjhnead Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe Iuhdfb. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh.";
func void Use_Addon_Stone_05()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_01.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_05_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_05_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 3
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_03(C_Item) // Valley - Priester
{
	name						= "Blaue Steintafel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_05.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_03;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Eine blaue Steintafel";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_03_1 = "KHARDIMON ersann die zweite Falle. Und nur der, der den Weg des Lichts bis zum Ende geht, wird die dritte Kammer erreichen.";
const string Addon_Stone_03_2 = "KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Gkjsdhad Uhnd Esfjwedbwe ewzbfujbwe.";
func void Use_Addon_Stone_03()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_03.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_03_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_03_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 4
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_04(C_Item) // DAS DING AUS DEM SENAT /SUMPF // Joly: Haus der Heiler
{
	name						= "Gr�ne Steintafel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_01.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_04;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Eine gr�ne Steintafel";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_04_1 = "Die dritte Falle wurde von QUARHODRON erbaut, und nur er wei�, wie man die Pforte �ffnet.";
const string Addon_Stone_04_2 = "Esfjwedbwe ewzbfujbwe. Fjewheege QUARHODRON Ygc slje asdkjhnead. Sebnejbuwd Weinfiwjf Ihwqpjrnn. Gkjsdhad Uhnd.";
func void Use_Addon_Stone_04()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_04.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_04_1);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_04_2);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

// ---------------------------------------------------------------------------
//		Steintafel 5
// ---------------------------------------------------------------------------
instance ItMi_Addon_Stone_02(C_Item) // Bibliothek der Erbauer.
{
	name						= "Violette Steintafel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	wear						= WEAR_EFFECT;
	effect						= "SPELLFX_WEAKGLIMMER";

	visual						= "ItMi_StonePlate_Read_02.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_Addon_Stone_02;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Eine violette Steintafel";					count[2] = 0;
	text[3]						= "";											count[3] = 0;
	INV_ROTX					= - 90;
	INV_ROTY					= 0;
	INV_ROTZ					= 0;
};

// ---------------------------------------------------------------------------
const string Addon_Stone_02_1 = "QUARHODRON war es auch, der mit der Hilfe von KHARDIMON das �u�ere Tor zum Tempel versiegelte. Keiner von beiden hat das Ritual �berlebt.";
const string Addon_Stone_02_2 = "Nur ich blieb zur�ck, um von den Ereignissen zu erz�hlen.";
const string Addon_Stone_02_3 = "Ich hoffe, da� RHADEMES f�r alle Zeiten im Tempel verrottet!";
const string Addon_Stone_02_4 = "QUARHODRON Ygc slje asdkjhnead. KHARDIMON Weinfiwjf Ihwqpjrnn. Erfjkemvfj Hwoqmnyhan ckh. Fjewheege Egdgsmkd Esfjwedbwe asdkjhnead. Gkjsdhad Uhnd.";
const string Addon_Stone_02_5 = "Revfnbrebuiwe ewohjfribwe wef. Sebnejbuwd Weinfiwjf Ihwqpjrnn.";
const string Addon_Stone_02_6 = "Erfjkemvfj RHADEMES Fjewheege Egdgsmkd!";
func void Use_Addon_Stone_02()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Adanos_Stoneplate_05.TGA", 0);
				Doc_SetFont(nDocID, -1, FONT_Book); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 70, 50, 90, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_2);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_3);
	}
	else
	{
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_4);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_5);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, Addon_Stone_02_6);
		B_Say(self, self, "$CANTREADTHIS");
	};

				Doc_PrintLine	(nDocID, 0, "");
	Doc_Show(nDocID);
};

//*******************************************
//		Der goldene Kompass
//*******************************************

instance ItMI_Addon_Kompass_Mis(C_Item)
{
	name						= "Goldener Kompass";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Compass_01.3DS";
	material					= MAT_STONE;

	value						= 500;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= "";											count[5] = 0;
};

//*******************************************
//			Morgans Schatz
//*******************************************

instance ItSE_Addon_FrancisChest(C_Item)
{
	name						= "Schatzkiste";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_GoldChest.3ds";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= FrancisChest;

	value						= 200;

	description					= "Eine Schatzkiste";
	text[0]						= "Die Kiste ziemlich schwer.";					count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void FrancisChest()
{
	CreateInvItems(hero, ItMi_GoldChest, 1);
	CreateInvItems(hero, ItMw_FrancisDagger_Mis, 1);
	CreateInvItems(hero, Itmi_Gold, 153);
	CreateInvItems(hero, ItMi_GoldCup, 1);
	CreateInvItems(hero, ItMi_SilverNecklace, 1);
	CreateInvItems(hero, ITWR_Addon_FrancisAbrechnung_Mis, 1);

	Snd_Play("Geldbeutel");
	Print(PRINT_FRANCIS_CHEST);
};

instance ITWR_Addon_FrancisAbrechnung_Mis(C_ITEM)
{
	name						= "Heuerbuch";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_02_05.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseFrancisAbrechnung_Mis;

	value						= 100;

	description					= NAME;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string FrancisAbrechnung_Mis_1 = "Kauffahrer 'Seejungfrau'";
const string FrancisAbrechnung_Mis_2 = "Beute gesamt: 14560 Gold";
const string FrancisAbrechnung_Mis_3 = "-----------------------";
const string FrancisAbrechnung_Mis_4 = "Mannschaft : 9840 ";
const string FrancisAbrechnung_Mis_5 = "Offiziere   : 2500 ";
const string FrancisAbrechnung_Mis_6 = "Kapit�n    : 1000 ";
const string FrancisAbrechnung_Mis_7 = "-----------------------";
const string FrancisAbrechnung_Mis_8 = "eigener Anteil: 2220";
const string FrancisAbrechnung_Mis_9 = "Fernh�ndler 'Miriam'";
const string FrancisAbrechnung_Mis_10 = "Beute gesamt: 4890 Gold";
const string FrancisAbrechnung_Mis_11 = "-----------------------";
const string FrancisAbrechnung_Mis_12 = "Mannschaft : 2390 ";
const string FrancisAbrechnung_Mis_13 = "Offiziere   : 500 ";
const string FrancisAbrechnung_Mis_14 = "Kapit�n    : 500 ";
const string FrancisAbrechnung_Mis_15 = "----------------------";
const string FrancisAbrechnung_Mis_16 = "eigener Anteil: 1000 ";
const string FrancisAbrechnung_Mis_17 = "Handelsschiff 'Nico'";
const string FrancisAbrechnung_Mis_18 = "Beute gesamt: 9970 ";
const string FrancisAbrechnung_Mis_19 = "----------------------";
const string FrancisAbrechnung_Mis_20 = "Mannschaft : 5610 ";
const string FrancisAbrechnung_Mis_21 = "Offiziere   : 1500";
const string FrancisAbrechnung_Mis_22 = "Kapit�n    : 1000";
const string FrancisAbrechnung_Mis_23 = "----------------------";
const string FrancisAbrechnung_Mis_24 = "eigener Anteil: 1860";
const string FrancisAbrechnung_Mis_25 = "Kauffahrer 'Maria'";
const string FrancisAbrechnung_Mis_26 = "Beute gesamt: 7851 Gold";
const string FrancisAbrechnung_Mis_27 = "----------------------";
const string FrancisAbrechnung_Mis_28 = "Mannschaft : 4400 ";
const string FrancisAbrechnung_Mis_29 = "Offiziere   : 750 ";
const string FrancisAbrechnung_Mis_30 = "Kapit�n    : 1000 ";
const string FrancisAbrechnung_Mis_31 = "----------------------";
const string FrancisAbrechnung_Mis_32 = "eigener Anteil: 1701 ";
func void UseFrancisAbrechnung_Mis()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_2);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_3);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_4);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_5);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_6);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_7);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_8);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_9);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_10);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_11);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_12);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_13);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_14);
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_15);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, FrancisAbrechnung_Mis_16);
				Doc_PrintLine	(nDocID, 0, "");

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_17);
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_18);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_19);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_20);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_21);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_22);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_23);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_24);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_25);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_26);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_27);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_28);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_29);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_30);
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_31);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLine	(nDocID, 1, FrancisAbrechnung_Mis_32);
				Doc_PrintLine	(nDocID, 1, "");

	Francis_HasProof = TRUE;

	Doc_Show(nDocID);

	B_Say(self, self, "$ADDON_THISLITTLEBASTARD");
};

// -----------------------------------------------------------------------
//		Gregs Logbuch
// -----------------------------------------------------------------------

instance ITWR_Addon_GregsLogbuch_Mis(C_ITEM)
{
	name						= "Logbuch";

	mainflag					= ITEM_KAT_DOCS;
	flags						= 0;

	visual						= "ItWr_Book_01.3ds"; // BUCH VARIATIONEN: ItWr_Book_01.3DS, ItWr_Book_02_01.3DS, ItWr_Book_02_02.3DS, ItWr_Book_02_03.3DS, ItWr_Book_02_04.3DS, ItWr_Book_02_05.3DS
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= UseGregsLogbuch;

	value						= 100;

	description					= "Logbuch von Greg";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

const string GregsLogbuch_1 = "Ich kann diesen Strand nicht mehr sehen. �berall Sand. Ich kann schon gar nicht mehr richtig schlafen, weil es �berall juckt. Wird Zeit, dass Raven das Gold f�r die Gefangen r�berschiebt und wir wieder in See stechen k�nnen. Werde wohl mal ein ernstes Wort mit dem Aufgeblasen Fatzke sprechen m�ssen.";
const string GregsLogbuch_2 = "Was erlaubt sich dieses Arsch? Hat mich von seinen stinkenden Schergen am Tor abwimmeln lassen. Der wird mich noch kennenlernen! Seinen Speichellecker Bloodwyn werde ich eigenh�ndig zu Fischfutter verarbeiten";
const string GregsLogbuch_3 = "Wenn er nicht bald zahlt, werde ich andere Seiten aufziehen. ";
const string GregsLogbuch_4 = "Die Banditen werden langsam aufs�ssig. Die letzte Lieferung haben sie immer noch nicht bezahlt. Wir haben einfach zu wenig Informationen. Ich muss rausfinden, was Raven hier will.";
const string GregsLogbuch_5 = "Ich werde mit dem Gro�teil der Mannschaft zum Festland fahren und das Erz in Sicherheit bringen. Francis bleibt mit ein paar Leuten hier und befestigt das Lager. ";
const string GregsLogbuch_6 = "Damit die Zeit nicht ungenutzt verstreicht, habe ich Bones die R�stung gegeben. Er wird f�r mich ins Banditenlager schleichen und dort rausfinden, was Raven vorhat.";
func void UseGregsLogbuch()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 2); // wieviel Pages

	Doc_SetPage(nDocID, 0, "Book_Brown_L.tga", 0); // VARIATIONEN: BOOK_BROWN_L.tga, BOOK_MAGE_L.tga, BOOK_RED_L.tga
	Doc_SetPage(nDocID, 1, "Book_Brown_R.tga", 0); // VARIATIONEN: BOOK_BROWN_R.tga, BOOK_MAGE_R.tga, BOOK_RED_R.tga

	// 1.Seite

				Doc_SetMargins(nDocID, 0, 275, 20, 30, 20, 1); // 0 -> margins are in pixels
				Doc_SetFont(nDocID, 0, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 0, GregsLogbuch_1);
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLines	(nDocID, 0, GregsLogbuch_2);
				Doc_PrintLines	(nDocID, 0, GregsLogbuch_3);

	// 2.Seite
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
				Doc_SetFont(nDocID, 1, FONT_Book); // -1 -> all pages
				Doc_PrintLines	(nDocID, 1, GregsLogbuch_4);
				Doc_PrintLine	(nDocID, 1, "");
				Doc_PrintLines	(nDocID, 1, GregsLogbuch_5);
				Doc_PrintLines	(nDocID, 1, GregsLogbuch_6);

	Greg_GaveArmorToBones = TRUE;

	Doc_Show(nDocID);
};

// -----------------------------------------------------------------------
// Bloodwyns Truhenschl�ssel - Schwere Garder�stung
// -----------------------------------------------------------------------
instance ITKE_Addon_Bloodwyn_01(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= "Bloodwyn's Schl�ssel";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Passt zu einer Truhe";						count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// -----------------------------------------------------------------------
// Heiler Truhenschl�ssel -
// -----------------------------------------------------------------------
instance ITKE_Addon_Heiler(C_Item)
{
	name						= NAME_Key;

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItKe_Key_02.3ds";
	material					= MAT_METAL;

	value						= Value_Key_01;

	description					= "Schl�ssel eines Steinw�chters";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Passt zu einer Truhe";						count[2] = 0;
	text[3]						= "In einem seltsamen alten Geb�ude im Sumpf";	count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

instance ItMi_TempelTorKey(C_ITEM)
{
	name						= "Steintafel des Quarhodron";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItMi_StonePlate_Read_06.3ds";
	material					= MAT_STONE;

	scemeName					= "MAP";
	on_state[0]					= Use_TempelTorKey;

	value						= 0;

	description					= "";
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "Der Schl�ssel zum Tempel Adanos.";			count[2] = 0;
};

const string TempelTorKey_1 = "  Jhehedra Akhantar";
func void Use_TempelTorKey()
{
	var int nDocID;

	nDocID = Doc_Create(); // DocManager
	Doc_SetPages(nDocID, 1); // wieviel Pages
	Doc_SetPage(nDocID, 0, "Maya_Stoneplate_03.TGA", 0);
				Doc_SetFont(nDocID, 0, FONT_BookHeadline); // -1 -> all pages
				Doc_SetMargins(nDocID, -1, 50, 50, 50, 50, 1); // 0 -> margins are in pixels
				Doc_PrintLine	(nDocID, 0, "");
				// Doc_SetFont( nDocID, 0, FONT_Book ); // -1 -> all pages
				Doc_PrintLine	(nDocID, 0, "");
				Doc_PrintLine	(nDocID, 0, "");
				// Doc_PrintLines	(nDocID, 0, "  Eligam Shameris");

				Doc_PrintLine	(nDocID, 0, TempelTorKey_1);

	Doc_Show(nDocID);
};

// -----------------------------------------------------------------------
//	Bloodwyns Kopf
// -----------------------------------------------------------------------
instance ItMi_Addon_Bloodwyn_Kopf(C_Item)
{
	name						= "Bloodwyn's Kopf";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItMi_Head_Bloodwyn_01.3ds";
	material					= MAT_LEATHER;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

// ------------------------------------------------------------------------

instance ItWR_Addon_TreasureMap(C_Item)
{
	name						= "Schatzkarte";

	mainflag					= ITEM_KAT_DOCS;
	flags						= ITEM_MISSION | ITEM_MULTI;

	visual						= "ItWr_Map_01.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAP";
	on_state[0]					= Use_TreasureMap;

	value						= 250;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "Auf der Karte sind einige Stellen markiert.";count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};

func void Use_TreasureMap()
{
	if (Npc_IsPlayer(self))
	{
		B_SetPlayerMap(ItWr_Addon_TreasureMap);
	};

	var int Document;
	Document = Doc_CreateMap();
	Doc_SetPages(Document, 1);
	Doc_SetPage(Document, 0, "Map_AddonWorld_Treasures.tga", TRUE); // TRUE = scale to fullscreen
	Doc_SetLevel(Document, "Addon\AddonWorld.zen");
	Doc_SetLevelCoords(Document, -47783, 36300, 43949, -32300); // Joly:gut so
	Doc_Show(Document);
};

// ------------------------------------------------------------------------

instance ItMi_Addon_GregsTreasureBottle_MIS(C_Item)
{
	name						= "Flaschenpost";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MISSION;

	visual						= "ItFo_Water.3DS";
	material					= MAT_LEATHER;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_GregsBottle;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "In der Flasche befindet sich ein St�ck Papier";count[2] = 0;
};

func void Use_GregsBottle()
{
	B_PlayerFindItem(ItWR_Addon_TreasureMap, 1);
};

/******************************************************************************************/
instance itmi_erolskelch(C_Item)
{
	name						= "Zerkratzte silberne Schale";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_SilverChalice.3DS";
	material					= MAT_METAL;

	value						= 125;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
};
