// *****************************************************************
// // Joly: Auge Innos nicht dabei? Kein Problem. Xardas hilft auch dir Idiot!!!!!!!!!!!!
// Vorsicht: Nur f�r D.A.U.s
// *****************************************************************

instance ItSe_XardasNotfallBeutel_MIS(C_Item)
{
	name						= "�u�erst seltsamer Lederbeutel";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI | ITEM_MISSION;

	visual						= "ItMi_Pocket.3ds";
	material					= MAT_METAL;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_XardasNotfallBeutel;

	value						= 0;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "In dem Beutel scheinen";						count[1] = 0;
	text[2]						= "ein harter Gegenstand ";						count[2] = 0;
	text[3]						= "und ein Schriftst�ck zu sein.";				count[3] = 0;
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
	name						= "Xardas� Ermahnungsbrief";

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

const string XardasErmahnungFuerIdioten_1 = "Mein junger Sch�tzling, du hast mich bitter entt�uscht. Wie konntest nur mit dem Schiff aufbrechen, ohne das Auge Innos in deinem Gep�ck?";
const string XardasErmahnungFuerIdioten_2 = "Ich kann nur hoffen, dass deine Nachl�ssigkeit Grenzen hat. Sonst wirst du niemals die Welt von dem �bel dieser Welt befreien und ich werde dich pers�nlich t�ten m�ssen f�r deine Dummheit.";
const string XardasErmahnungFuerIdioten_3 = "                      Xardas";
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
	name						= "alter Brief";

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
	text[3]						= "mit zittriger Schrift geschrieben";			count[3] = 0;
};

const string Krypta_Garon_1 = "Ich habe versagt. Meine Bem�hungen Inubis auf den Pfad der Rechtschaffenen zur�ck zu bringen waren vergebens ";
const string Krypta_Garon_2 = "Erst dachte ich, ich sei tot. Doch es steckt noch Kraft in den alten Knochen Ivans. ";
const string Krypta_Garon_3 = "Inubis ist wiederauferstanden von den Toten. Verbannt vom alten Orden der Paladine sinnt er nur noch nach Rache f�r seinen Fluch.";
const string Krypta_Garon_4 = "Viele seiner Anh�nger sind ihm gefolgt. Ich wei� nicht, wie es passieren konnte, dass ein Feldherr wie Inubis so dem B�sen verf�llt. ";
const string Krypta_Garon_5 = "In dieser Krypta habe ich sein Grab gefunden. Doch ob ich jemals einem Menschen davon berichten kann, ist nicht gewiss. Darum schreibe ich diese Zeilen in der Hoffnung, dass sie gefunden werden.";
const string Krypta_Garon_6 = "Seid gewarnt. Ein m�chtiger Feind streckt seine Klauen nach den Seelen der Rechtschaffenen. Inubis wird nicht der letzte sein.";
const string Krypta_Garon_7 = "M�ge Innos eure Seelen besch�tzen.";
const string Krypta_Garon_8 = "                                 Ivan";
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
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus

	Doc_Show(nDocID);
};

//****************************************************************************
//				DragonIsle_Undead_Schl�ssel
//			---------------------------------------------
//****************************************************************************

//**********************************************************************************
//	Knastt�rschl�ssel f�r Pedros Zelle auf DI
//**********************************************************************************

instance ItKe_OrkKnastDI_MIS(C_Item)
{
	name						= "Schl�ssel des Orkischen Obersts";

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

instance ItKe_EVT_UNDEAD_01(C_Item) // Schl�ssel f�r erste T�r
{
	name						= "Schl�ssel des Archol";

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
//	Schl�ssel zum Labyrinth der Untoten auf DI
//**********************************************************************************

instance ItKe_EVT_UNDEAD_02(C_Item)
{
	name						= "Schl�ssel des Schl�sselmeisters";

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
//	Kammerschl�ssel f�r�s Tor zum Saal des Untoten Drachen.
//**********************************************************************************

instance ItKe_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name						= "Kammerschl�ssel des Schwarzmagiers";

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
//	Schriftrolle f�r�s Tor zum Saal des Untoten Drachen.
//**********************************************************************************

instance ItWr_LastDoorToUndeadDrgDI_MIS(C_Item)
{
	name						= "Schriftrolle des Schwarzmagiers";

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
const string ItWr_LastDoorToUndeadDrgDI_MIS_3 = "Das Auge der Macht erleuchte deinen Weg";
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
				Doc_SetMargins(nDocID, -1, 200, 50, 50, 50, 1); // 0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus

	Doc_Show(nDocID);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_2);
};

//**********************************************************************************
//	Schl�ssel zur Truhe in der Kammer des OberDementors.
//**********************************************************************************
instance ItKe_ChestMasterDementor_MIS(C_Item)
{
	name						= "Truhenschl�ssel des Schwarzmagiers";

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
	name						= "Rezept";

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

const string RezeptFuerMegaTrank_1 = "Ich habe eine sehr alte Kunst ins Leben zur�ck rufen k�nnen. Ich f�rchte, dass Feodaron von meinen Ergebnissen nicht sehr erbaut w�re.";
const string RezeptFuerMegaTrank_2 = "Es hie�e schlicht und ergreifend, dass ich seine gesammte Brut in meinem Labor zu einem Trank verarbeiten m�sste. Wenn er nicht st�ndig auf seinen Eiern sitzen w�rde, wie ein Huhn, h�tte ich es schon l�ngst ausprobiert. Aber vor seinem Odem habe ich doch noch ein wenig Respekt.";
const string RezeptFuerMegaTrank_3 = "Embarla Firgasto:";
const string RezeptFuerMegaTrank_4 = "10 Dracheneier, Eine zerriebene schwarze Perle und eine Prise Schwefel.";
const string RezeptFuerMegaTrank_5 = "Die Emulsion wird zum kochen gebracht und anschlie�end unter st�ndigem R�hren durch den Destillator getrieben.";
const string RezeptFuerMegaTrank_6 = "Das Elixier ist mit vorsicht zu verwenden. Es hat schwere Nebenwikungen. Der gesamte Manahaushalt wird durcheinander geraten.";
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
	name						= "Tagebuch";

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

const string Diary_BlackNovice_1 = "Ich warte jetzt schon geschlagene 36 Tage auf meine Einberufung. Ich glaube schon nicht mehr daran, dass sie mich aufnehmen werden. Ich habe doch schon alles getan, was sie mir aufgetragen haben. Alles habe ich ihnen hinterher getragen.";
const string Diary_BlackNovice_2 = "Der Schl�sselmeister hat mich angewiesen, die Gitter zu versiegeln. Ich bin bis heute noch nicht dazu gekommen. Wenn das so weiter geht, wird es noch jemand schaffen, einfach so durch das Tor zu marschieren.";
const string Diary_BlackNovice_3 = "Nur zu bl�de, dass ich mir die Kombinationen nicht merken kann. ";
const string Diary_BlackNovice_4 = "Ich w�re schon l�ngst einmal heimlich in der gro�en Halle gewesen. Ich kann es kaum erwarten, den Meister zu sehen. Ob sie mich zu ihm lassen, wenn ich erst einmal zu ihnen geh�re?";
const string Diary_BlackNovice_5 = "Habe gestern mein Gl�ck versucht. Bin aber schon an den zwei Hebelkammern gescheitert, bevor ich die drei Schalter des Westfl�gels in der richtigen Reihenfolge dr�cken konnte. Der Hund hat die Kammern abgeschlossen. Morgen werde ich versuchen, ihm den Schl�ssel abzunehmen...";
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
				Doc_SetMargins(nDocID, -1, 30, 20, 275, 20, 1); // 0 -> margins are in pixels (Position des Textes von den R�nder des TGAs aus, links,oben,rechts,unten)
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
	name						= "alter Brief";

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

const string ZugBruecke_1 = "   Letzte Warnung!";
const string ZugBruecke_2 = "Es ist mir v�llig egal, ob ihr die Br�cke von der anderen Seite �berqueren k�nnt, oder nicht. Wenn es nach mir ginge, w�rdet ihr sowieso alle in der H�lle schmoren.";
const string ZugBruecke_3 = "Ich werde die Br�cke eingezogen lassen, solange ich mich in meiner Residenz befinde. Wenn ich nochmal jemanden dabei erwische, dass er mit Pfeil und Bogen auf die Schalter schie�t um her�ber zu kommen, dann werde ich den Sch�tzen eigenh�ndig am n�chten Baum aufh�ngen.";
const string ZugBruecke_4 = "                      Archol";
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
//	ItMi_PowerEye zum �ffnen der letzten T�r
//**********************************************************************************

instance ItMi_PowerEye(C_Item)
{
	name						= "Auge der Macht";

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
