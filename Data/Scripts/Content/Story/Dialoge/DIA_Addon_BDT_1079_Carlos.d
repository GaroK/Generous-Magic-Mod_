// ---------------------------------------------------------------------
//	Info EXIT
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_EXIT(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 999;
	condition		= DIA_Addon_Carlos_EXIT_Condition;
	information		= DIA_Addon_Carlos_EXIT_Info;
	permanent		= TRUE;
	description		= "See you. (END)";
};

func int DIA_Addon_Carlos_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Carlos_PICKPOCKET(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 900;
	condition		= DIA_Addon_Carlos_PICKPOCKET_Condition;
	information		= DIA_Addon_Carlos_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Addon_Carlos_PICKPOCKET_Condition()
{
	C_Beklauen(71, 85);
};

func void DIA_Addon_Carlos_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET, DIALOG_BACK, DIA_Addon_Carlos_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Carlos_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Carlos_PICKPOCKET_DoIt);
};

func void DIA_Addon_Carlos_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};

func void DIA_Addon_Carlos_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Carlos_PICKPOCKET);
};

// ---------------------------------------------------------------------
//	Info HI
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_HI(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 1;
	condition		= DIA_Addon_Carlos_HI_Condition;
	information		= DIA_Addon_Carlos_HI_Info;
	important		= TRUE;
};

func int DIA_Addon_Carlos_HI_Condition()
{
	if (Npc_IsDead(Franco))
	{
		return TRUE;
	};
};

func void DIA_Addon_Carlos_HI_Info()
{
	AI_Output(self, other, "DIA_Addon_Carlos_HI_12_00"); //Hey, are you the new guy who knocked down Franco?

	Info_ClearChoices(DIA_Addon_Carlos_HI);
	Info_AddChoice(DIA_Addon_Carlos_HI, "What? Me? No!", DIA_Addon_Carlos_HI_No);
	Info_AddChoice(DIA_Addon_Carlos_HI, "Yes. Why?", DIA_Addon_Carlos_HI_Yes);
};

func void DIA_Addon_Carlos_HI_Yes()
{
	AI_Output(other, self, "DIA_Addon_Carlos_HI_Yes_15_00"); //Yes, why?
	AI_Output(self, other, "DIA_Addon_Carlos_HI_Yes_12_01"); //(angry) Because now I have to take over his job. You did a great job! Thanks a lot!
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};

func void DIA_Addon_Carlos_HI_No()
{
	AI_Output(other, self, "DIA_Addon_Carlos_HI_No_15_00"); //What? Me? No!
	AI_Output(self, other, "DIA_Addon_Carlos_HI_No_12_01"); //Ah! No offense!
	Info_ClearChoices(DIA_Addon_Carlos_HI);
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_Attentat(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 2;
	condition		= DIA_Addon_Carlos_Attentat_Condition;
	information		= DIA_Addon_Carlos_Attentat_Info;
	description		= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};

func int DIA_Addon_Carlos_Attentat_Condition()
{
	if (MIS_Judas == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Carlos_Attentat_Info()
{
	B_Say(other, self, "$ATTENTAT_ADDON_DESCRIPTION");

	AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_00"); //After the attacker was dead, Thorus assigned me to get a new man for the camp.

	if (Logan_Inside == TRUE)
	{
		AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_01"); //And Franco sent Logan.
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_02"); //And Franco sent a new guy.
	};

	AI_Output(self, other, "DIA_Addon_Carlos_Attentat_12_03"); //Hey, I just do what Thorus tells me. I don't know anything about the attack itself.
};

// ---------------------------------------------------------------------
//	PERM
// ---------------------------------------------------------------------
instance DIA_Addon_Carlos_PERM(C_INFO)
{
	npc				= BDT_1079_Addon_Carlos;
	nr				= 3;
	condition		= DIA_Addon_Carlos_PERM_Condition;
	information		= DIA_Addon_Carlos_PERM_Info;
	permanent		= TRUE;
	description		= "And what's it like leading the hunters?";
};

func int DIA_Addon_Carlos_PERM_Condition()
{
	return TRUE;
};

func void DIA_Addon_Carlos_PERM_Info()
{
	AI_Output(other, self, "DIA_Addon_Carlos_PERM_15_00"); //And what's it like leading the hunters?
	AI_Output(self, other, "DIA_Addon_Carlos_PERM_12_00"); //Leave me alone!
	AI_StopProcessInfos(self);
};
