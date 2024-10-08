//****************************************************************************
//				Erzfisch  (Halvor)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_ErzFisch (C_Item)
{	
	name 				=	"Ball-shaped Fish";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_ErzFisch;

	description			= 	name;
	TEXT[2]				= 	"Something is hidden inside this fish.";		
	
};

	FUNC VOID Use_ErzFisch()
	{
		B_PlayerFindItem (ItMi_Nugget,1);
	};
//****************************************************************************
//				Goldfisch  (Halvor)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_GoldFisch (C_Item)
{	
	name 				=	"Heavy Fish";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_GoldFisch;

	description			= 	name;
	TEXT[2]				= 	"Something is hidden inside this fish.";		
	
};

	FUNC VOID Use_GoldFisch()
	{
		B_PlayerFindItem (ItMI_Gold,50);
	};	
//****************************************************************************
//				Ringfisch  (Halvor) (Protcetion Fire Ring)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_Ringfisch (C_Item)
{	
	name 				=	"Small Fish";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_Ringfisch;

	description			= 	name;
	TEXT[2]				= 	"Something is hidden inside this fish.";		
	
};

	FUNC VOID Use_Ringfisch()
	{
		B_PlayerFindItem (ItRi_Prot_Fire_01,1);
	};	
//****************************************************************************
//				Lockpickfisch  (Halvor)
//			---------------------------------------------
//****************************************************************************
INSTANCE ItSe_LockpickFisch (C_Item)
{	
	name 				=	"Light Fish";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;
	
	value 				=	25;
	
	visual 				=	"ItFo_Fish.3DS";
	material 			=	MAT_LEATHER;
	scemeName			=	"MAPSEALED";
	on_state[0]			=	Use_LockpickFisch;

	description			= 	name;
	TEXT[2]				= 	"Something is hidden inside this fish.";		
	
};

	FUNC VOID Use_LockpickFisch()
	{
		B_PlayerFindItem (ITKE_Lockpick,3);
	};


//****************************************************************************
//			Allgemeine Goldbeutel (25, 50, 100)
//			---------------------------------------------
//****************************************************************************		

//------------- 25 Gold -----------------------
INSTANCE ItSe_GoldPocket25	(C_Item)
{
	name 				=	"Leather Satchel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GoldPocket25;
	
	description			= 	"A leather bag.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"There are a few coins jingling inside.";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GoldPocket25 ()
{
		B_PlayerFindItem (ItMI_Gold,25);	
};
//------------- 50 Gold -----------------------
INSTANCE ItSe_GoldPocket50	(C_Item)
{
	name 				=	"Leather Satchel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	50;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GoldPocket50;
	
	description			= 	"A leather bag.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"The bag is full of coins.";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GoldPocket50 ()
{
		B_PlayerFindItem (ItMI_Gold,50);
};
//------------- 100 Gold -----------------------
INSTANCE ItSe_GoldPocket100	(C_Item)
{
	name 				=	"Leather Satchel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   GoldPocket100;
	
	description			= 	"A leather bag.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"A heavy bag full";
	TEXT[3]				= 	"of gold coins.";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID GoldPocket100 ()
{
		B_PlayerFindItem (ItMI_Gold,100);
};	
//------------- Hannas Beutel -----------------------
INSTANCE ItSe_HannasBeutel	(C_Item)
{
	name 				=	"Leather Satchel";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	100;

	visual 				=	"ItMi_Pocket.3ds";
	scemename			=	"MAPSEALED";	
	material 			=	MAT_LEATHER;
	on_state[0]			=   HannasBeutel;
	
	description			= 	"A leather bag.";
	
	TEXT[0]				= 	"";
	TEXT[1]				= 	"";
	TEXT[2]				= 	"Hanna gave it to me.";
	TEXT[3]				= 	"";
	TEXT[4]				= 	"";
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

FUNC VOID HannasBeutel ()
{
		CreateInvItems (hero,ITKE_Lockpick,10);
		CreateInvItems (hero,ItKe_ThiefTreasure,1);
		Print (PRINT_HannasBeutel);
};	




