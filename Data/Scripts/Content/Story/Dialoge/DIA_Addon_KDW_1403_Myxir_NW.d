///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_EXIT(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 999;
	condition		= DIA_Addon_Myxir_EXIT_Condition;
	information		= DIA_Addon_Myxir_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Myxir_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Myxir_NW_PICKPOCKET(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 900;
	condition		= DIA_Addon_Myxir_NW_PICKPOCKET_Condition;
	information		= DIA_Addon_Myxir_NW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wÃƒÂ¤re einfach seine Spruchrolle zu stehlen)";
};

func int DIA_Addon_Myxir_NW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Myxir_NW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Myxir_NW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Myxir_NW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Myxir_NW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Myxir_NW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItSc_LightningFlash, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Myxir_NW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Myxir_NW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_NW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Hallo(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_Hallo_Condition;
	information		= DIA_Addon_Myxir_Hallo_Info;
	description		= "Everything all right?";
};

func int DIA_Addon_Myxir_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Addon_Myxir_Hallo_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_Hallo_15_00"); //Everything all right?
	AI_Output(self, other, "DIA_Addon_Myxir_Hallo_12_01"); //It's very brave of you to just walk in here.
};

///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_WasMachstDu(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_WasMachstDu_Condition;
	information		= DIA_Addon_Myxir_WasMachstDu_Info;
	description		= "What are you doing here?";
};

func int DIA_Addon_Myxir_WasMachstDu_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Myxir_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WasMachstDu_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_WasMachstDu_15_00"); //What are you doing here?
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_01"); //I'm studying the language of the builders.
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_02"); //The language is the key to understanding the ancient people.
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_03"); //Each one of us must learn it, or this expedition will be over before it even begins.
	AI_Output(self, other, "DIA_Addon_Myxir_WasMachstDu_12_04"); //The builders used stone tablets to pass on their knowledge. Unfortunately, many of them are broken or were stolen long ago.
};

///////////////////////////////////////////////////////////////////////
//	Info Steintafeln
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Steintafeln(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 5;
	condition		= DIA_Addon_Myxir_Steintafeln_Condition;
	information		= DIA_Addon_Myxir_Steintafeln_Info;
	description		= "What's on these stone tablets, then?";
};

func int DIA_Addon_Myxir_Steintafeln_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Steintafeln_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_Steintafeln_15_00"); //What's on these stone tablets, then?
	AI_Output(self, other, "DIA_Addon_Myxir_Steintafeln_12_01"); //They contain the collected knowledge of the ancient people.
	AI_Output(self, other, "DIA_Addon_Myxir_Steintafeln_12_02"); //Some of them increase knowledge of combat and magic by magical means.
	AI_Output(self, other, "DIA_Addon_Myxir_Steintafeln_12_03"); //For someone who can read the tablets, they are a real treasure.

	Log_CreateTopic(TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Stoneplates, TOPIC_Addon_Stoneplates_1);
};

///////////////////////////////////////////////////////////////////////
//	Info WillYouTeachMe
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_WillYouTeachMe(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 10;
	condition		= DIA_Addon_Myxir_WillYouTeachMe_Condition;
	information		= DIA_Addon_Myxir_WillYouTeachMe_Info;
	description		= "Can you teach me to read the language?";
};

func int DIA_Addon_Myxir_WillYouTeachMe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Addon_Myxir_WasMachstDu))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_WillYouTeachMe_Info()
{
	AI_Output(other, self, "DIA_Addon_Myxir_WillYouTeachMe_15_00"); //Can you teach me to read the language?
	AI_Output(self, other, "DIA_Addon_Myxir_WillYouTeachMe_12_01"); //Well. Why not? I'll gladly pass on my knowledge to you.
	Myxir_Addon_TeachPlayer = TRUE;

	Log_CreateTopic(TOPIC_Addon_Stoneplates, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Stoneplates, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Stoneplates, LogText_Addon_MyxirTeach);

	Log_CreateTopic(TOPIC_Addon_KDWTeacher, LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher, LogText_Addon_MyxirTeach);
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Myxir_Teach(C_INFO)
{
	npc				= KDW_1403_Addon_Myxir_NW;
	nr				= 90;
	condition		= DIA_Addon_Myxir_Teach_Condition;
	information		= DIA_Addon_Myxir_Teach_Info;
	permanent		= TRUE;
	description		= "Teach me that language.";
};

var int DIA_Addon_Myxir_Teach_NoPerm;

func int DIA_Addon_Myxir_Teach_Condition()
{
	if ((Myxir_Addon_TeachPlayer == TRUE)
	&& (DIA_Addon_Myxir_Teach_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_Info()
{
	B_DIA_Addon_Myxir_TeachRequest();

	if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE))
	{
		Info_ClearChoices(DIA_Addon_Myxir_Teach);
		Info_AddChoice(DIA_Addon_Myxir_Teach, DIALOG_BACK, DIA_Addon_Myxir_Teach_BACK);
	};

	if (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		B_DIA_Addon_Myxir_TeachL1();
		Info_AddChoice(DIA_Addon_Myxir_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_1, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_1)), DIA_Addon_Myxir_Teach_LANGUAGE_1);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL2();
		Info_AddChoice(DIA_Addon_Myxir_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_2, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_2)), DIA_Addon_Myxir_Teach_LANGUAGE_2);
	}
	else if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	&& (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		B_DIA_Addon_Myxir_TeachL3();
		Info_AddChoice(DIA_Addon_Myxir_Teach, B_BuildLearnString(NAME_ADDON_LEARNLANGUAGE_3, B_GetLearnCostTalent(other, NPC_TALENT_FOREIGNLANGUAGE, LANGUAGE_3)), DIA_Addon_Myxir_Teach_LANGUAGE_3);
	}
	else
	{
		B_DIA_Addon_Myxir_TeachNoMore();
		DIA_Addon_Myxir_Teach_NoPerm = TRUE;
	};
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_X()
{
	B_DIA_Addon_Myxir_Teach_LANGUAGE_X();
};

func void DIA_Addon_Myxir_Teach_BACK()
{
	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_1()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_1))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_2()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_2))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};

func void DIA_Addon_Myxir_Teach_LANGUAGE_3()
{
	if (B_TeachPlayerTalentForeignLanguage(self, other, LANGUAGE_3))
	{
		DIA_Addon_Myxir_Teach_LANGUAGE_X();
	};

	Info_ClearChoices(DIA_Addon_Myxir_Teach);
};
