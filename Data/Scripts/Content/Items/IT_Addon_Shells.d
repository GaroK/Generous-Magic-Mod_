// ---------------------------------------------------------------------
//	Item Werte
// ---------------------------------------------------------------------
const int Value_Shell_01 = 30;
const int Value_Shell_02 = 60;

var int Shell_Opener;
// + Schneckenmuschel
// ---------------------------------------------------------------------
func void B_OpenShell()
{
	// Muschel zerbricht beim Ãƒâ€“ffnen --> keine leere Muschel

	var int shellomizer;
	shellomizer = Hlp_Random(100);

	Shell_Opener = (Shell_Opener + 1);

	if (Shell_Opener == 1) // die erste Muschel die der Spieler ÃƒÂ¶ffnet
	{
		B_PlayerFindItem(ItMi_Addon_WhitePearl, 1);
	}
	else if (Shell_Opener == 25)
	{
		// Schwarze Perle
		B_PlayerFindItem(ItMi_DarkPearl, 1);

	} // ------------------Jetzt gibt's zufÃƒÂ¤llig Items-----------------
	else
	{
		if (shellomizer >= 80)
		{
			// weiÃƒÅ¸e Perle
			B_PlayerFindItem(ItMi_Addon_WhitePearl, 1);
		}
		else if (shellomizer >= 55)
		{
			// Muschelfleisch
			B_PlayerFindItem(ItFo_Addon_Shellflesh, 1);
		}
		else if (shellomizer >= 50)
		{
			B_PlayerFindItem(ItMi_Aquamarine, 1);
		}
		else if (shellomizer >= 40)
		{
			B_PlayerFindItem(ItMi_Quartz, 1);
		}
		else if (shellomizer >= 35)
		{
			B_PlayerFindItem(ItMi_Rockcrystal, 1);
		}
		else if (shellomizer >= 25)
		{
			B_PlayerFindItem(ItMi_Sulfur, 1);
		}
		else // leere Muschel 25
		{
			B_Say_Overlay(self, self, "$NOTHINGTOGET02");
			AI_PrintScreen(PRINT_NOTHINGTOGET02, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
		};
	};
};

// ---------------------------------------------------------------------
//	Klappmuschel
// ---------------------------------------------------------------------
instance ItMi_Addon_Shell_01(C_Item)
{
	name						= "Gaper clam";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Shell_01.3ds";
	material					= MAT_STONE;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Shell_01;

	value						= Value_Shell_01;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

func void Use_Shell_01()
{
	B_OpenShell();
};

// ---------------------------------------------------------------------
//	Hornmuschel
// ---------------------------------------------------------------------
instance ItMi_Addon_Shell_02(C_Item)
{
	name						= "Spiny clam";

	mainflag					= ITEM_KAT_NONE;
	flags						= ITEM_MULTI;

	visual						= "ItMi_Shell_02.3ds";
	material					= MAT_STONE;

	scemeName					= "MAPSEALED";
	on_state[0]					= Use_Shell_02;

	value						= Value_Shell_02;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= "";											count[1] = 0;
	text[2]						= "";											count[2] = 0;
	text[3]						= "";											count[3] = 0;
	text[4]						= "";											count[4] = 0;
	text[5]						= NAME_Value;									count[5] = value;
	INV_ZBIAS					= INVCAM_ENTF_MISC2_STANDARD;
};

func void Use_Shell_02()
{
	B_OpenShell();
};
