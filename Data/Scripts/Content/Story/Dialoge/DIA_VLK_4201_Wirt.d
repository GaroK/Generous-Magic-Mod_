///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Wirt_EXIT(C_INFO)
{
	npc				= VLK_4201_Wirt;
	nr				= 999;
	condition		= DIA_Wirt_EXIT_Condition;
	information		= DIA_Wirt_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Wirt_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Wirt_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Wirt_PICKPOCKET(C_INFO)
{
	npc				= VLK_4201_Wirt;
	nr				= 900;
	condition		= DIA_Wirt_PICKPOCKET_Condition;
	information		= DIA_Wirt_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Wirt_PICKPOCKET_Condition()
{
	C_Beklauen(60, 65);
};

func void DIA_Wirt_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
	Info_AddChoice(DIA_Wirt_PICKPOCKET, DIALOG_BACK, DIA_Wirt_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Wirt_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Wirt_PICKPOCKET_DoIt);
};

func void DIA_Wirt_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

func void DIA_Wirt_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Wirt_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Wirt_Hallo(C_INFO)
{
	npc				= VLK_4201_Wirt;
	nr				= 2;
	condition		= DIA_Wirt_Hallo_Condition;
	information		= DIA_Wirt_Hallo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Wirt_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Wirt_Hallo_Info()
{
	var int randy;
	randy = Hlp_Random(2);

	AI_Output(self, other, "DIA_Wirt_Hallo_14_00"); //Hey, come closer. Take a break and have a sip of cool beer.

	if (self.aivar [AIV_TalkedToPlayer] == FALSE)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_01"); //Lord Andre is springing for a few barrels of free beer.
		AI_StopProcessInfos(self);
	}
	else if (randy == 0)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_02"); //Nothing hits the spot like a cool pint after work.
		AI_StopProcessInfos(self);
	}
	else if (randy == 1)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_03"); //The paladins will set everything right. So take another draught and have a good time.

		B_GiveInvItems(self, other, ItFo_Beer, 1);
		AI_StopProcessInfos(self);
	}
	else if (randy == 2)
	{
		AI_Output(self, other, "DIA_Wirt_Hallo_14_04"); //You can say what you want about Khorinis, but our 'Dark Paladine' is simply the best in all of Myrtana.
		AI_StopProcessInfos(self);
	};
};

/*
Wenn du ein Problem hast und es lÃƒÂ¤sst sich lÃƒÂ¶sen, dann denk nicht weiter drÃƒÂ¼ber nach.
Und wenn du es nicht lÃƒÂ¶sen kannst, dann brauchst du auch nicht weiter drÃƒÂ¼ber nachzudenken.
*/
