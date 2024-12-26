// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Lutero_EXIT(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 999;
	condition		= DIA_Lutero_EXIT_Condition;
	information		= DIA_Lutero_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Lutero_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Lutero_EXIT_Info()
{
	AI_StopProcessInfos(self);

	if ((Lutero_Krallen == LOG_RUNNING)
	&& (MIS_Fajeth_Kill_Snapper == LOG_SUCCESS)
	&& (Npc_KnowsInfo(other, DIA_Bilgot_KNOWSLEADSNAPPER) == FALSE))
	{
		Lutero_Krallen = LOG_OBSOLETE;
		B_CheckLog();
	};
};

//************************************************************
//	Hallo
//************************************************************
instance DIA_Lutero_Hallo(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Hallo_Condition;
	information		= DIA_Lutero_Hallo_Info;
	important		= TRUE;
};

func int DIA_Lutero_Hallo_Condition()
{
	if (((other.guild != GIL_NONE)
	|| (other.guild != GIL_NOV))
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Hallo_Info()
{
	AI_Output(self, other, "DIA_Lutero_Hallo_13_00"); //Mein Name ist Lutero. Ich handle mit den verschiedensten Sachen.
	AI_Output(other, self, "DIA_Lutero_Hallo_15_01"); //Welche Ware bietest du an?
	AI_Output(self, other, "DIA_Lutero_Hallo_13_02"); //Nun, vor allem seltene und ausgefallene Dinge. Bisher ist es mir immer gelungen, die W�nsche meiner Kunden zu erf�llen.

	Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_19);
};

//************************************************************
//	GetLost
//************************************************************
instance DIA_Lutero_GetLost(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_GetLost_Condition;
	information		= DIA_Lutero_GetLost_Info;
	important		= TRUE;
};

func int DIA_Lutero_GetLost_Condition()
{
	if (((other.guild == GIL_NONE)
	|| (other.guild == GIL_NOV))
	&& Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Lutero_GetLost_Info()
{
	if (other.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Lutero_GetLost_13_00"); //Verschwinde Bursche! Hast du nichts zu tun? Dann such dir Arbeit - aber woanders!
	}
	else
	{
		AI_Output(self, other, "DIA_Lutero_GetLost_13_01"); //Was willst du, Novize? Solltest du nicht im Kloster sein?
	};

	AI_StopProcessInfos(self);
};

//************************************************************
//	Snapper
//************************************************************
instance DIA_Lutero_Snapper(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Snapper_Condition;
	information		= DIA_Lutero_Snapper_Info;
	description		= "Suchst du bestimmte Gegenst�nde?";
};

func int DIA_Lutero_Snapper_Condition()
{
	if ((other.guild != GIL_NONE)
	&& (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Snapper_Info()
{
	AI_Output(other, self, "DIA_Lutero_Snapper_15_00"); //Suchst du bestimmte Gegenst�nde?
	AI_Output(self, other, "DIA_Lutero_Snapper_13_01"); //Ja, f�r meinen derzeitigen Auftrag ben�tige ich die Krallen eines Snappers.
	AI_Output(self, other, "DIA_Lutero_Snapper_13_02"); //Aber keine einfachen Krallen. Es muss schon was Besonderes sein. Die Krallen einer m�chtigen Bestie, die viele M�nner get�tet hat, oder etwas Derartiges.
	AI_Output(other, self, "DIA_Lutero_Snapper_15_03"); //Wo finde ich Snapper?
	AI_Output(self, other, "DIA_Lutero_Snapper_13_04"); //Es gibt ein paar hier auf der Insel, die meisten hausen jedoch im Minental.
	AI_Output(other, self, "DIA_Lutero_Snapper_15_05"); //Und was springt f�r mich dabei raus?

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_06"); //Ich kann dir einen Runenstein besorgen.
	}
	else
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_07"); //Ich kann dir einen Ring der Unbezwingbarkeit besorgen.
	};

	AI_Output(other, self, "DIA_Lutero_Hello_15_08"); //Ich werde mal sehen, was sich machen l�sst.

	Log_CreateTopic(Topic_Lutero, LOG_MISSION);
	Log_SetTopicStatus(Topic_Lutero, LOG_RUNNING);
	B_LogEntry(Topic_Lutero, Topic_Lutero_1);

	Lutero_Krallen = LOG_RUNNING;
};

//************************************************************
//	Kralle abliefern
//************************************************************
instance DIA_Lutero_Kralle(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Kralle_Condition;
	information		= DIA_Lutero_Kralle_Info;
	description		= "Ich habe besondere Snapperkrallen f�r dich. ";
};

func int DIA_Lutero_Kralle_Condition()
{
	if ((Npc_HasItems(other, ItAt_ClawLeader) >= 1)
	&& (Npc_KnowsInfo(other, DIA_Lutero_Snapper)))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Kralle_Info()
{
	AI_Output(other, self, "DIA_Lutero_Kralle_15_00"); //Ich habe besondere Snapperkrallen f�r dich.
	Lutero_Krallen = LOG_SUCCESS;
	B_GivePlayerXP(XP_Ambient);
	AI_Output(self, other, "DIA_Lutero_Kralle_13_01"); //Das wird meinen Kunden freuen.
	B_GiveInvItems(other, self, ItAt_ClawLeader, 1);

	if (other.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_02"); //Den Runenstein habe ich allerdings nicht hier. Aber ich wei�, wo er liegt.
		AI_Output(self, other, "DIA_Lutero_Hello_13_03"); //Wenn du von der Stadt zur Herberge gehst, kommst du unter einer Br�cke hindurch.
		AI_Output(self, other, "DIA_Lutero_Hello_13_04"); //Dort, in einer H�hle, hat ein Freund von mir einen Runenstein in einer Truhe hinterlegt. Hier ist der Schl�ssel.
		B_GiveInvItems(self, other, ITKE_RUNE_MIS, 1);
	}
	else
	{
		AI_Output(self, other, "DIA_Lutero_Hello_13_05"); //Hier ist der Ring, den ich dir versprochen habe.
		B_GiveInvItems(self, other, ItRi_Prot_Total_01, 1);
	};
};

//************************************************************
//	Trade
//************************************************************
instance DIA_Lutero_Trade(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 5;
	condition		= DIA_Lutero_Trade_Condition;
	information		= DIA_Lutero_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Zeig mir deine Ware.";
};

func int DIA_Lutero_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Lutero_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Lutero_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Lutero_Trade_15_00"); //Zeig mir deine Ware.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Lutero_PICKPOCKET(C_INFO)
{
	npc				= VLK_404_Lutero;
	nr				= 900;
	condition		= DIA_Lutero_PICKPOCKET_Condition;
	information		= DIA_Lutero_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Lutero_PICKPOCKET_Condition()
{
	C_Beklauen(58, 65);
};

func void DIA_Lutero_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
	Info_AddChoice(DIA_Lutero_PICKPOCKET, DIALOG_BACK, DIA_Lutero_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lutero_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Lutero_PICKPOCKET_DoIt);
};

func void DIA_Lutero_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};

func void DIA_Lutero_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lutero_PICKPOCKET);
};
