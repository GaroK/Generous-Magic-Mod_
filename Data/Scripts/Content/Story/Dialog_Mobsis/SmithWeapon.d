var int Erzwaffen;
var int Normalwaffen;

//*******************************************************
//	SmithWeapon Dialog abbrechen
//*******************************************************
instance PC_SmithWeapon_End(C_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_SmithWeapon_End_Condition;
	information		= PC_SmithWeapon_End_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_SmithWeapon_End_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	{
		return TRUE;
	};
};

func void PC_SmithWeapon_End_Info()
{
	CreateInvItems(self, ItMiSwordRaw, 1);
	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
	NormalWaffen = FALSE;
};

//*******************************************************

// *****************
// AmboÃƒÅ¸-Dialoge
// -------------
// hÃƒÂ¤ngen am Spieler
// *****************

//*******************************************************
instance PC_Common(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_Common_Condition;
	information		= PC_Common_Info;
	permanent		= TRUE;
	description		= "Forge regular weapons";
};

func int PC_Common_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_Common_Info()
{
	Normalwaffen = TRUE;
};

//*******************************************************
instance PC_Ore(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_Ore_Condition;
	information		= PC_Ore_Info;
	permanent		= TRUE;
	description		= "Forge ore weapons";
};

func int PC_Ore_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_Ore_Info()
{
	Erzwaffen = TRUE;
};

//*******************************************************
instance PC_CommonBACK(C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_CommonBACK_Condition;
	information		= PC_CommonBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};

func int PC_CommonBACK_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (Normalwaffen == TRUE)
	&& (Erzwaffen == FALSE))
	{
		return TRUE;
	};
};

func void PC_CommonBACK_Info()
{
	Normalwaffen = FALSE;
};

//*******************************************************
instance PC_OreBACK(C_INFO)
{
	npc				= PC_Hero;
	nr				= 99;
	condition		= PC_OreBACK_Condition;
	information		= PC_OreBACK_Info;
	permanent		= TRUE;
	description		= DIALOG_BACK;
};

func int PC_OreBACK_Condition()
{
	if ((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (Normalwaffen == FALSE)
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_OreBACK_Info()
{
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_1H_Common(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_1H_Common_Condition;
	information		= PC_ItMw_1H_Common_Info;
	permanent		= TRUE;
};

func int PC_ItMw_1H_Common_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE))
	&& (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Common_Info()
{
	CreateInvItems(hero, ItMw_1H_Common_01, 1);
	Print(PRINT_SmithSuccess);

	B_ENDPRODUCTIONDIALOG();
	Normalwaffen = FALSE;
};

//*******************************************************
instance PC_WEAPON_1H_Harad_01(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_WEAPON_1H_Harad_01_Condition;
	information		= PC_WEAPON_1H_Harad_01_Info;
	permanent		= TRUE;
};

func int PC_WEAPON_1H_Harad_01_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_01] == TRUE))
	&& (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_01_Info()
{
	CreateInvItems(hero, ItMw_Schwert1, 1);
	Print(PRINT_SmithSuccess);

	B_ENDPRODUCTIONDIALOG();
	Normalwaffen = FALSE;
};

//*******************************************************
instance PC_WEAPON_1H_Harad_02(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_WEAPON_1H_Harad_02_Condition;
	information		= PC_WEAPON_1H_Harad_02_Info;
	permanent		= TRUE;
};

func int PC_WEAPON_1H_Harad_02_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_02] == TRUE))
	&& (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_02_Info()
{
	CreateInvItems(hero, ItMw_Schwert4, 1);
	Print(PRINT_SmithSuccess);

	B_ENDPRODUCTIONDIALOG();
	Normalwaffen = FALSE;
};

//*******************************************************
instance PC_WEAPON_1H_Harad_03(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_WEAPON_1H_Harad_03_Condition;
	information		= PC_WEAPON_1H_Harad_03_Info;
	permanent		= TRUE;
};

func int PC_WEAPON_1H_Harad_03_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_03] == TRUE))
	&& (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_03_Info()
{
	CreateInvItems(hero, ItMw_Rubinklinge, 1);
	Print(PRINT_SmithSuccess);

	B_ENDPRODUCTIONDIALOG();
	Normalwaffen = FALSE;
};

//*******************************************************
instance PC_WEAPON_1H_Harad_04(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_WEAPON_1H_Harad_04_Condition;
	information		= PC_WEAPON_1H_Harad_04_Info;
	permanent		= TRUE;
};

func int PC_WEAPON_1H_Harad_04_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Harad_04] == TRUE))
	&& (Normalwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_WEAPON_1H_Harad_04_Info()
{
	CreateInvItems(hero, ItMw_ElBastardo, 1);
	Print(PRINT_SmithSuccess);

	B_ENDPRODUCTIONDIALOG();
	Normalwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_1H_Special_01(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_1H_Special_01_Condition;
	information		= PC_ItMw_1H_Special_01_Info;
	permanent		= TRUE;
};

func int PC_ItMw_1H_Special_01_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_01] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_01_Info()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 1)
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 1);

		CreateInvItems(hero, ItMw_1H_Special_01, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_2H_Special_01(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_2H_Special_01_Condition;
	information		= PC_ItMw_2H_Special_01_Info;
	permanent		= TRUE;
};

func int PC_ItMw_2H_Special_01_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_01] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_01_Info()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 2);

		CreateInvItems(hero, ItMw_2H_Special_01, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_1H_Special_02(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_1H_Special_02_Condition;
	information		= PC_ItMw_1H_Special_02_Info;
	permanent		= TRUE;
};

func int PC_ItMw_1H_Special_02_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_02] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_02_Info()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 2)
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 2);

		CreateInvItems(hero, ItMw_1H_Special_02, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_2H_Special_02(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_2H_Special_02_Condition;
	information		= PC_ItMw_2H_Special_02_Info;
	permanent		= TRUE;
};

func int PC_ItMw_2H_Special_02_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_02] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_02_Info()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 3);

		CreateInvItems(hero, ItMw_2H_Special_02, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_1H_Special_03(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_1H_Special_03_Condition;
	information		= PC_ItMw_1H_Special_03_Info;
	permanent		= TRUE;
};

func int PC_ItMw_1H_Special_03_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_03] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_03_Info()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 3)
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 3);

		CreateInvItems(hero, ItMw_1H_Special_03, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_2H_Special_03(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_2H_Special_03_Condition;
	information		= PC_ItMw_2H_Special_03_Info;
	permanent		= TRUE;
};

func int PC_ItMw_2H_Special_03_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_03] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_03_Info()
{
	if (Npc_HasItems(hero, ItMi_Nugget) >= 4)
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 4);

		CreateInvItems(hero, ItMw_2H_Special_03, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_1H_Special_04(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_1H_Special_04_Condition;
	information		= PC_ItMw_1H_Special_04_Info;
	permanent		= TRUE;
};

func int PC_ItMw_1H_Special_04_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_1H_Special_04] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_1H_Special_04_Info()
{
	if ((Npc_HasItems(hero, ItMi_Nugget) >= 4)
	&& (Npc_HasItems(hero, ItAt_DragonBlood) >= 5))
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 4);
		Npc_RemoveInvItems(hero, ItAt_DragonBlood, 5);

		CreateInvItems(hero, ItMw_1H_Special_04, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************
instance PC_ItMw_2H_Special_04(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_ItMw_2H_Special_04_Condition;
	information		= PC_ItMw_2H_Special_04_Info;
	permanent		= TRUE;
};

func int PC_ItMw_2H_Special_04_Condition()
{
	if (((PLAYER_MOBSI_PRODUCTION == MOBSI_SMITHWEAPON)
	&& (PLAYER_TALENT_SMITH[WEAPON_2H_Special_04] == TRUE))
	&& (Erzwaffen == TRUE))
	{
		return TRUE;
	};
};

func void PC_ItMw_2H_Special_04_Info()
{
	if ((Npc_HasItems(hero, ItMi_Nugget) >= 5)
	&& (Npc_HasItems(hero, ItAt_DragonBlood) >= 5))
	{
		Npc_RemoveInvItems(hero, ItMi_Nugget, 5);
		Npc_RemoveInvItems(hero, ItAt_DragonBlood, 5);

		CreateInvItems(hero, ItMw_2H_Special_04, 1);
		Print(PRINT_SmithSuccess);
	}
	else
	{
		Print(PRINT_ProdItemsMissing);
		CreateInvItems(self, ItMiSwordRaw, 1);
	};

	B_ENDPRODUCTIONDIALOG();
	Erzwaffen = FALSE;
};

//*******************************************************

// ****************************************************
// SMITHWEAPON_S1
// --------------
// Funktion wird durch AmboÃƒÅ¸-Mobsi-Benutzung aufgerufen!
// benÃƒÂ¶tigtes Item dafÃƒÂ¼r: ItMiSwordrawhot
// *****************************************************

func void SMITHWEAPON_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);

	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SMITHWEAPON;
		AI_ProcessInfos(her);
	};

	PC_ItMw_1H_Common.description = NAME_ItMw_1H_Common_01;
	PC_ItMw_1H_Special_01.description = ConcatStrings(NAME_ItMw_1H_Special_01, PRINT_Smith_1H_Special_01);
	PC_ItMw_2H_Special_01.description = ConcatStrings(NAME_ItMw_2H_Special_01, PRINT_Smith_2H_Special_01);
	PC_ItMw_1H_Special_02.description = ConcatStrings(NAME_ItMw_1H_Special_02, PRINT_Smith_1H_Special_02);
	PC_ItMw_2H_Special_02.description = ConcatStrings(NAME_ItMw_2H_Special_02, PRINT_Smith_2H_Special_02);
	PC_ItMw_1H_Special_03.description = ConcatStrings(NAME_ItMw_1H_Special_03, PRINT_Smith_1H_Special_03);
	PC_ItMw_2H_Special_03.description = ConcatStrings(NAME_ItMw_2H_Special_03, PRINT_Smith_2H_Special_03);
	PC_ItMw_1H_Special_04.description = ConcatStrings(NAME_ItMw_1H_Special_04, PRINT_Smith_1H_Special_04);
	PC_ItMw_2H_Special_04.description = ConcatStrings(NAME_ItMw_2H_Special_04, PRINT_Smith_2H_Special_04);

	PC_WEAPON_1H_Harad_01.description = NAME_Addon_Harad_01;
	PC_WEAPON_1H_Harad_02.description = NAME_Addon_Harad_02;
	PC_WEAPON_1H_Harad_03.description = NAME_Addon_Harad_03;
	PC_WEAPON_1H_Harad_04.description = NAME_Addon_Harad_04;
};
