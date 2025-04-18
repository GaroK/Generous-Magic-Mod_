// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance Addon_10008_Bandit_EXIT(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 999;
	condition		= Addon_10008_Bandit_EXIT_Condition;
	information		= Addon_10008_Bandit_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int Addon_10008_Bandit_EXIT_Condition()
{
	return TRUE;
};

func void Addon_10008_Bandit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_10008_Bandit_PICKPOCKET(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 900;
	condition		= DIA_Addon_10008_Bandit_PICKPOCKET_Condition;
	information		= DIA_Addon_10008_Bandit_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_10008_Bandit_PICKPOCKET_Condition()
{
	C_Beklauen(55, 99);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
	Info_AddChoice(DIA_Addon_10008_Bandit_PICKPOCKET, DIALOG_BACK, DIA_Addon_10008_Bandit_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_10008_Bandit_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_10008_Bandit_PICKPOCKET_DoIt);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
};

func void DIA_Addon_10008_Bandit_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info Hi
// ---------------------------------------------------------------------
instance DIA_Addon_10008_Bandit_Hi(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 2;
	condition		= DIA_Addon_10008_Bandit_Hi_Condition;
	information		= DIA_Addon_10008_Bandit_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_10008_Bandit_Hi_Condition()
{
	if ((Npc_GetDistToNpc(other, Skinner) <= 600)
	&& (!Npc_IsDead(Skinner))
	&& (Skinner.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_00"); //DON'T wake him!
	AI_Output(other, self, "DIA_Addon_10008_Bandit_Hi_15_01"); //What???
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_02"); //If you want to do yourself a favor, then stay away from Skinner.
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_03"); //The fellow is unpredictable. He killed the last guy who woke him up.
	AI_Output(self, other, "DIA_Addon_10008_Bandit_Hi_01_04"); //Let him sleep, for everybody's sake.
};

// --------------------------------------------------------------------
//	Info soup
// ---------------------------------------------------------------------
instance DIA_Addon_10008_Bandit_soup(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 2;
	condition		= DIA_Addon_10008_Bandit_soup_Condition;
	information		= DIA_Addon_10008_Bandit_soup_Info;
	description		= "Are you a digger?";
};

func int DIA_Addon_10008_Bandit_soup_Condition()
{
	return TRUE;
};

func void DIA_Addon_10008_Bandit_soup_Info()
{
	AI_Output(other, self, "DIA_Addon_10008_Bandit_soup_15_00"); //Are you a digger?
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_01"); //Because of the pants? No, I just wear them because they're comfortable.
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_02"); //All I do here is cook meat stew. Here, you can try some - it'll make you strong.
	B_GiveInvItems(self, other, ItFo_Addon_Meatsoup, 1);
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_03"); //It's always important to train your strength - there are many dangers lurking out there.
	AI_Output(self, other, "DIA_Addon_10008_Bandit_soup_01_04"); //If you want, I can help you to get stronger.

	Log_CreateTopic(Topic_Addon_BDT_Teacher, LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Teacher, Topic_Addon_BDT_Teacher_2);
};

//*******************************************
//	TechPlayer
//*******************************************
instance DIA_Addon_10008_Bandit_Teach(C_INFO)
{
	npc				= BDT_10008_Addon_Bandit;
	nr				= 7;
	condition		= DIA_Addon_10008_Bandit_Teach_Condition;
	information		= DIA_Addon_10008_Bandit_Teach_Info;
	permanent		= TRUE;
	description		= "I want to be stronger.";
};

func int DIA_Addon_10008_Bandit_Teach_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_10008_Bandit_soup))
	{
		return TRUE;
	};
};

func void DIA_Addon_10008_Bandit_Teach_Info()
{
	AI_Output(other, self, "DIA_Addon_10008_Bandit_Teach_15_00"); //I want to be stronger.

	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_10008_Bandit_Teach_STR_5);
};

func void DIA_Addon_10008_Bandit_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
};

func void DIA_Addon_10008_Bandit_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);

	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_10008_Bandit_Teach_STR_5);
};

func void DIA_Addon_10008_Bandit_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);

	Info_ClearChoices(DIA_Addon_10008_Bandit_Teach);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, DIALOG_BACK, DIA_Addon_10008_Bandit_Teach_Back);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Addon_10008_Bandit_Teach_STR_1);
	Info_AddChoice(DIA_Addon_10008_Bandit_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Addon_10008_Bandit_Teach_STR_5);
};
