//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_None_101_Mario_EXIT(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 999;
	condition		= DIA_None_101_Mario_EXIT_Condition;
	information		= DIA_None_101_Mario_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_None_101_Mario_EXIT_Condition()
{
	return TRUE;
};

func void DIA_None_101_Mario_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Was machst du hier?
//*********************************************************************
instance DIA_None_101_Mario_Job(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 4;
	condition		= DIA_None_101_Mario_Job_Condition;
	information		= DIA_None_101_Mario_Job_Info;
	permanent		= TRUE;
	description		= "What are you doing here?";
};

func int DIA_None_101_Mario_Job_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == FALSE)
	&& (Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Job_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_Job_15_00"); //What are you doing here?
	AI_Output(self, other, "DIA_None_101_Mario_Job_07_01"); //I hope it won't be too long before a ship comes in where I can hire on.
	AI_Output(self, other, "DIA_None_101_Mario_Job_07_02"); //This hanging around is really getting on my nerves.
};

//*********************************************************************
//	Du suchst doch Leute?
//*********************************************************************
instance DIA_None_101_Mario_YouNeedMe(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 4;
	condition		= DIA_None_101_Mario_YouNeedMe_Condition;
	information		= DIA_None_101_Mario_YouNeedMe_Info;
	important		= TRUE;
};

func int DIA_None_101_Mario_YouNeedMe_Condition()
{
	if ((Kapitel == 5)
	&& (MIS_SCKnowsWayToIrdorath == TRUE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YouNeedMe_Info()
{
	AI_Output(self, other, "DIA_None_101_Mario_YouNeedMe_07_00"); //I've heard that you're looking for people for your ship?
	AI_Output(other, self, "DIA_None_101_Mario_YouNeedMe_15_01"); //And?
	AI_Output(self, other, "DIA_None_101_Mario_YouNeedMe_07_02"); //I'm in!

	Log_CreateTopic(TOPIC_Crew, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Crew, LOG_RUNNING);
	B_LogEntry(TOPIC_Crew, TOPIC_Crew_6);
};

//*********************************************************************
//	Warum sollte ich dich mitnehmen?
//*********************************************************************
instance DIA_None_101_Mario_WhyNeedYou(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 5;
	condition		= DIA_None_101_Mario_WhyNeedYou_Condition;
	information		= DIA_None_101_Mario_WhyNeedYou_Info;
	description		= "Why would I take you along?";
};

func int DIA_None_101_Mario_WhyNeedYou_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyNeedYou_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_WhyNeedYou_15_00"); //Why would I take you along?
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_01"); //Quite simply, because you need me.
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_02"); //I'm ... I was a lieutenant with the royal navy.
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_03"); //I've served as a marine on the King Rhobar and the Pride of Myrtana.
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_04"); //In the Battle of the Eastern Archipelago, I single-handedly sent two dozen orcs back to Beliar's realm.
	AI_Output(self, other, "DIA_None_101_Mario_WhyNeedYou_07_05"); //Unfortunately, there were too few of us after our flagship sank, and we were forced to retreat.
};

//*********************************************************************
//	Wieso bist du dann hier?
//*********************************************************************
instance DIA_None_101_Mario_WhyHere(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 7;
	condition		= DIA_None_101_Mario_WhyHere_Condition;
	information		= DIA_None_101_Mario_WhyHere_Info;
	description		= "Why are you here, then?";
};

func int DIA_None_101_Mario_WhyHere_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_WhyHere_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_WhyHere_15_00"); //Why are you here, then?
	AI_Output(self, other, "DIA_None_101_Mario_WhyHere_07_01"); //The fleet is routed, and the payroll coffers are empty.
	AI_Output(self, other, "DIA_None_101_Mario_WhyHere_07_02"); //After my discharge I wound up stranded in this dump, and I'm looking for a new berth.
};

//*********************************************************************
//	Was kannst du?
//*********************************************************************
instance DIA_None_101_Mario_Abilities(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 8;
	condition		= DIA_None_101_Mario_Abilities_Condition;
	information		= DIA_None_101_Mario_Abilities_Info;
	description		= "What can you do?";
};

func int DIA_None_101_Mario_Abilities_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_WhyNeedYou))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_Abilities_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_Abilities_15_00"); //What can you do?
	AI_Output(self, other, "DIA_None_101_Mario_Abilities_07_01"); //I'm trained for boarding and close combat, plus I'm a passable shot with the ship's cannon.
	AI_Output(self, other, "DIA_None_101_Mario_Abilities_07_02"); //I bet there's a thing or two that I can teach you on the trip.

	B_LogEntry(TOPIC_Crew, TOPIC_Crew_7);
};

//*********************************************************************
//	Was verlangst du?
//*********************************************************************
instance DIA_None_101_Mario_YourPrice(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 9;
	condition		= DIA_None_101_Mario_YourPrice_Condition;
	information		= DIA_None_101_Mario_YourPrice_Info;
	description		= "What are you asking?";
};

func int DIA_None_101_Mario_YourPrice_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_YourPrice_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_YourPrice_15_00"); //What are you asking?
	AI_Output(self, other, "DIA_None_101_Mario_YourPrice_07_01"); //What can I ask? I'd be glad to get away from here.
	AI_Output(self, other, "DIA_None_101_Mario_YourPrice_07_02"); //A hand for a bunk. I help you and you take me along.
};

//*********************************************************************
//	Die Reise kann gefÃƒÂ¤hrlich werden.
//*********************************************************************
instance DIA_None_101_Mario_CouldBeDangerous(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 10;
	condition		= DIA_None_101_Mario_CouldBeDangerous_Condition;
	information		= DIA_None_101_Mario_CouldBeDangerous_Info;
	description		= "The journey may be perilous.";
};

func int DIA_None_101_Mario_CouldBeDangerous_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YourPrice))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_CouldBeDangerous_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_CouldBeDangerous_15_00"); //The journey may be perilous.
	AI_Output(self, other, "DIA_None_101_Mario_CouldBeDangerous_07_01"); //I'm used to danger. When you're out there, every day is dangerous.
	AI_Output(self, other, "DIA_None_101_Mario_CouldBeDangerous_07_02"); //The next storm could be your death, and the monsters of the deep could swallow your ship whole.
	AI_Output(self, other, "DIA_None_101_Mario_CouldBeDangerous_07_03"); //And I don't need to mention the orcish galleys, do I? Believe me, there's nothing I'm afraid of. A sailor who's afraid is already dead.
};

//*********************************************************************
//	Kein Bedarf!
//*********************************************************************
instance DIA_None_101_Mario_DontNeedYou(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 13;
	condition		= DIA_None_101_Mario_DontNeedYou_Condition;
	information		= DIA_None_101_Mario_DontNeedYou_Info;
	description		= "I have no use for you.";
};

func int DIA_None_101_Mario_DontNeedYou_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_DontNeedYou_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_DontNeedYou_15_00"); //I have no use for you.
	AI_Output(self, other, "DIA_None_101_Mario_DontNeedYou_07_01"); //I'm the best sailor you'll find here.
	AI_Output(self, other, "DIA_None_101_Mario_DontNeedYou_07_02"); //From the look of you, you don't know the first thing about navigation.
	AI_Output(self, other, "DIA_None_101_Mario_DontNeedYou_07_03"); //So think twice before you trust anyone.
};

//*********************************************************************
//	Gute Leute kann ich immer brauchen.
//*********************************************************************
instance DIA_None_101_Mario_NeedGoodMen(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 2;
	condition		= DIA_None_101_Mario_NeedGoodMen_Condition;
	information		= DIA_None_101_Mario_NeedGoodMen_Info;
	description		= "I can always use good people.";
};

func int DIA_None_101_Mario_NeedGoodMen_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_None_101_Mario_YouNeedMe))
	&& (Mario_IsOnBoard == FALSE))
	{
		return TRUE;
	};
};

func void DIA_None_101_Mario_NeedGoodMen_Info()
{
	AI_Output(other, self, "DIA_None_101_Mario_NeedGoodMen_15_00"); //I can always use good people.
	AI_Output(self, other, "DIA_None_101_Mario_NeedGoodMen_07_01"); //Sure thing, I'll see you on the ship.

	B_GivePlayerXP(XP_Crewmember_Success);

	Mario_IsOnBoard = LOG_SUCCESS;
	crewmember_Count = (Crewmember_Count + 1);
	AI_StopProcessInfos(self);
	if (MIS_ReadyforChapter6 == TRUE)
	{
		Npc_ExchangeRoutine(self, "SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self, "WAITFORSHIP");
	};
};

///////////////////////////////////////////////////////////////////////
//	I kann dich doch nicht gebrauchen!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_LeaveMyShip(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 11;
	condition		= DIA_Mario_LeaveMyShip_Condition;
	information		= DIA_Mario_LeaveMyShip_Info;
	permanent		= TRUE;
	description		= "I can't use you after all!";
};

func int DIA_Mario_LeaveMyShip_Condition()
{
	if ((Mario_IsOnBOard == LOG_SUCCESS)
	&& (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mario_LeaveMyShip_Info()
{
	AI_Output(other, self, "DIA_Mario_LeaveMyShip_15_00"); //I can't use you after all!
	AI_Output(self, other, "DIA_Mario_LeaveMyShip_07_01"); //As you like. You know where to find me!

	Mario_IsOnBoard = LOG_OBSOLETE; // Log_Obsolete ->der Sc kann ihn wiederholen, Log_Failed ->hat die Schnauze voll, kommt nicht mehr mit!
	crewmember_Count = (Crewmember_Count - 1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self, "ShipOff");
};

///////////////////////////////////////////////////////////////////////
//	Ich habs mir ÃƒÂ¼berlegt!
///////////////////////////////////////////////////////////////////////
instance DIA_Mario_StillNeedYou(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 11;
	condition		= DIA_Mario_StillNeedYou_Condition;
	information		= DIA_Mario_StillNeedYou_Info;
	permanent		= TRUE;
	description		= "I can use you after all!";
};

func int DIA_Mario_StillNeedYou_Condition()
{
	if (((Mario_IsOnBOard == LOG_OBSOLETE) // Hier brauch man natÃƒÂ¼rlich nur eine variable abfragen
	|| (Mario_IsOnBOard == LOG_FAILED))
	&& (crewmember_count < Max_Crew))
	{
		return TRUE;
	};
};

func void DIA_Mario_StillNeedYou_Info()
{
	AI_Output(other, self, "DIA_Mario_StillNeedYou_15_00"); //I can use you after all!

	if (Mario_IsOnBoard == LOG_OBSOLETE)
	{
		AI_Output(self, other, "DIA_Mario_StillNeedYou_07_01"); //I knew it! I'll see you on the ship!

		Mario_IsOnBoard = LOG_SUCCESS;
		crewmember_Count = (Crewmember_Count + 1);
		AI_StopProcessInfos(self);
		if (MIS_ReadyforChapter6 == TRUE)
		{
			Npc_ExchangeRoutine(self, "SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self, "WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Mario_StillNeedYou_07_02"); //You can't treat me like that. I'll gut you!

		AI_StopProcessInfos(self);

		B_Attack(self, other, AR_NONE, 1);
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc				= NONE_101_MARIO;
	nr				= 900;
	condition		= DIA_MARIO_PICKPOCKET_Condition;
	information		= DIA_MARIO_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_MARIO_PICKPOCKET_Condition()
{
	C_Beklauen(71, 220);
};

func void DIA_MARIO_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_MARIO_PICKPOCKET);
	Info_AddChoice(DIA_MARIO_PICKPOCKET, DIALOG_BACK, DIA_MARIO_PICKPOCKET_BACK);
	Info_AddChoice(DIA_MARIO_PICKPOCKET, DIALOG_PICKPOCKET, DIA_MARIO_PICKPOCKET_DoIt);
};

func void DIA_MARIO_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_MARIO_PICKPOCKET);
};

func void DIA_MARIO_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_MARIO_PICKPOCKET);
};
