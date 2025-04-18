//****************************
// 		PC_Sleep
//****************************

func void PC_Sleep(var int t)
{
	AI_StopProcessInfos(self); // [SK] ->muss hier stehen um das update zu gewÃƒÂ¤hrleisten

	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
	self.aivar[AIV_INVINCIBLE] = FALSE;
	if (Wld_IsTime(00, 00, t, 00))
	{
		Wld_SetTime(t, 00);
	}
	else
	{
		t = t + 24;
		Wld_SetTime(t, 00);
	};

	Wld_StopEffect("DEMENTOR_FX");

	// FIXME_Nico: dauert zu lange um es vernuenftig zu machen.
	// Wld_PlayEffect("SLEEP_BLEND", hero, hero, 0, 0, 0, FALSE);

	if (SC_IsObsessed == TRUE)
	{
		PrintScreen(PRINT_SleepOverObsessed, -1, -1, FONT_Screen, 2);
	}
	else
	{
		PrintScreen(PRINT_SleepOver, -1, -1, FONT_Screen, 2);
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		hero.attribute[ATR_MANA] = hero.attribute[ATR_MANA_MAX];
	};

	// -------- AssessEnterRoom-Wahrnehmung versenden --------
	PrintGlobals(PD_ITEM_MOBSI);
	Npc_SendPassivePerc(hero, PERC_ASSESSENTERROOM, NULL, hero); // ...damit der Spieler dieses Feature nicht zum HÃƒÂ¼tteplÃƒÂ¼ndern ausnutzt!
};

func void SLEEPABIT_S1()
{
	var C_Npc her; her = Hlp_GetNpc(PC_Hero);
	var C_Npc rock; rock = Hlp_GetNpc(PC_Rockefeller);

	//***ALT** if(Hlp_GetInstanceID(self)== Hlp_GetInstanceID(Hero)) // MH: geÃƒÂ¤ndert, damit kontrollierte NSCs nicht schlafen kÃƒÂ¶nnen!
	if ((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(rock)))
	{
		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_SLEEPABIT;
		AI_ProcessInfos(her);

		if (SC_IsObsessed == TRUE)
		{
			Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
		};
	};
};

// -------------------- Gar nicht schlafen -------------------------
instance PC_NoSleep(c_Info)
{
	npc				= PC_Hero;
	nr				= 999;
	condition		= PC_NoSleep_Condition;
	information		= PC_NoSleep_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int PC_NoSleep_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_NoSleep_Info()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.aivar[AIV_INVINCIBLE] = FALSE;
	PLAYER_MOBSI_PRODUCTION = MOBSI_NONE;
};

// ---------------------- morgens --------------------------------------
instance PC_SleepTime_Morning(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_SleepTime_Morning_Condition;
	information		= PC_SleepTime_Morning_Info;
	permanent		= TRUE;
	description		= "Sleep till next morning";
};

func int PC_SleepTime_Morning_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Morning_Info()
{
	PC_Sleep(8);
};

// --------------------- mittags -----------------------------------------
instance PC_SleepTime_Noon(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_SleepTime_Noon_Condition;
	information		= PC_SleepTime_Noon_Info;
	permanent		= TRUE;
	description		= "Sleep till midday";
};

func int PC_SleepTime_Noon_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Noon_Info()
{
	PC_Sleep(12);
};

// ---------------------- abend --------------------------------------
instance PC_SleepTime_Evening(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_SleepTime_Evening_Condition;
	information		= PC_SleepTime_Evening_Info;
	permanent		= TRUE;
	description		= "Sleep till next evening";
};

func int PC_SleepTime_Evening_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Evening_Info()
{
	PC_Sleep(20);
};

// ------------------------ nacht -----------------------------------------
instance PC_SleepTime_Midnight(C_INFO)
{
	npc				= PC_Hero;
	nr				= 0;
	condition		= PC_SleepTime_Midnight_Condition;
	information		= PC_SleepTime_Midnight_Info;
	permanent		= TRUE;
	description		= "Sleep till midnight";
};

func int PC_SleepTime_Midnight_Condition()
{
	if (PLAYER_MOBSI_PRODUCTION == MOBSI_SLEEPABIT)
	{
		return 1;
	};
};

func void PC_SleepTime_Midnight_Info()
{
	PC_Sleep(0);
};
