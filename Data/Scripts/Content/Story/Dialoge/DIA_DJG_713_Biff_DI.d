//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Biff_DI_EXIT(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 999;
	condition		= DIA_Biff_DI_EXIT_Condition;
	information		= DIA_Biff_DI_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Biff_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info HALLO
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_HALLO(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 10;
	condition		= DIA_Biff_DI_HALLO_Condition;
	information		= DIA_Biff_DI_HALLO_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_HALLO_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_HALLO_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_HALLO_07_00"); //And? Where are the riches you promised me?

	if (Npc_KnowsInfo(other, DIA_Biff_DI_ORKS) == FALSE)
	{
		AI_Output(other, self, "DIA_Biff_DI_HALLO_15_01"); //So what did I tell you earlier, at sea?
	};

	AI_Output(other, self, "DIA_Biff_DI_HALLO_15_02"); //For now, your task is to guard this ship.
	AI_Output(other, self, "DIA_Biff_DI_HALLO_15_03"); //I don't fancy swimming all the way back.
	AI_Output(self, other, "DIA_Biff_DI_HALLO_07_04"); //Crap. If I had known that, I'd have stayed in Khorinis.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info perm
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_perm(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 5;
	condition		= DIA_Biff_DI_perm_Condition;
	information		= DIA_Biff_DI_perm_Info;
	permanent		= TRUE;
	description		= "All ship-shape aboard?";
};

func int DIA_Biff_DI_perm_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Biff_DI_HALLO))
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_perm_Info()
{
	AI_Output(other, self, "DIA_Biff_DI_perm_15_00"); //All ship-shape aboard?
	AI_Output(self, other, "DIA_Biff_DI_perm_07_01"); //(irritated) Yeah, yeah. All is quiet.
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ORKS
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_ORKS(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 5;
	condition		= DIA_Biff_DI_ORKS_Condition;
	information		= DIA_Biff_DI_ORKS_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_ORKS_Condition()
{
	if ((Npc_GetDistToWP(self, "DI_SHIP_03") < 1000)
	&& (ORkSturmDI == TRUE)
	&& ((Npc_IsDead(UndeadDragon)) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_ORKS_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_ORKS_07_00"); //Those dirty beasts!
	AI_Output(other, self, "DIA_Biff_DI_ORKS_15_01"); //Damnit, what are you doing up here? You're supposed to guard the ship.
	AI_Output(self, other, "DIA_Biff_DI_ORKS_07_02"); //It's not going to sink any time soon, man.
	B_GivePlayerXP(XP_Ambient);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "Start");
};

///////////////////////////////////////////////////////////////////////
//	Info UNDEADDRGDEAD
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_UNDEADDRGDEAD(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 4;
	condition		= DIA_Biff_DI_UNDEADDRGDEAD_Condition;
	information		= DIA_Biff_DI_UNDEADDRGDEAD_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_UNDEADDRGDEAD_Condition()
{
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_UNDEADDRGDEAD_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_00"); //Was that it, then?
	AI_Output(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_01"); //That was it for now.
	AI_Output(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_02"); //Now, can I ...
	AI_Output(other, self, "DIA_Biff_DI_UNDEADDRGDEAD_15_03"); //You can raid the entire island for all I care.
	AI_Output(self, other, "DIA_Biff_DI_UNDEADDRGDEAD_07_04"); //Great.

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "PlunderTempel");
};

///////////////////////////////////////////////////////////////////////
//	Info plunder
///////////////////////////////////////////////////////////////////////
instance DIA_Biff_DI_plunder(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 5;
	condition		= DIA_Biff_DI_plunder_Condition;
	information		= DIA_Biff_DI_plunder_Info;
	important		= TRUE;
};

func int DIA_Biff_DI_plunder_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Npc_KnowsInfo(other, DIA_Biff_DI_plunder))
	&& (Npc_IsDead(UndeadDragon)))
	{
		return TRUE;
	};
};

func void DIA_Biff_DI_plunder_Info()
{
	AI_Output(self, other, "DIA_Biff_DI_plunder_07_00"); //Damn. Not now.
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Biff_DI_PICKPOCKET(C_INFO)
{
	npc				= DJG_713_Biff_DI;
	nr				= 900;
	condition		= DIA_Biff_DI_PICKPOCKET_Condition;
	information		= DIA_Biff_DI_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_100;
};

func int DIA_Biff_DI_PICKPOCKET_Condition()
{
	C_Beklauen(92, 450);
};

func void DIA_Biff_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET, DIALOG_BACK, DIA_Biff_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_DI_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Biff_DI_PICKPOCKET_DoIt);
};

func void DIA_Biff_DI_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};

func void DIA_Biff_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_DI_PICKPOCKET);
};
