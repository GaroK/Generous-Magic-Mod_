///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_EXIT(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 999;
	condition		= DIA_Ignaz_EXIT_Condition;
	information		= DIA_Ignaz_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Ignaz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ignaz_PICKPOCKET(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 900;
	condition		= DIA_Ignaz_PICKPOCKET_Condition;
	information		= DIA_Ignaz_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Ignaz_PICKPOCKET_Condition()
{
	C_Beklauen(38, 50);
};

func void DIA_Ignaz_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET, DIALOG_BACK, DIA_Ignaz_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ignaz_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ignaz_PICKPOCKET_DoIt);
};

func void DIA_Ignaz_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

func void DIA_Ignaz_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ignaz_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Hallo(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 2;
	condition		= DIA_Ignaz_Hallo_Condition;
	information		= DIA_Ignaz_Hallo_Info;
	important		= TRUE;
};

func int DIA_Ignaz_Hallo_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Hallo_Info()
{
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_00"); //Ah - you've come just in time. I'm in need of an assistant for a magic experiment.
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_01"); //I'm sure you're eager to do me a favor for science's sake.
	AI_Output(other, self, "DIA_Ignaz_Hallo_15_02"); //Easy, my friend. First tell me what this is all about.
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_03"); //I have developed a new spell. A Spell of Oblivion.
	AI_Output(self, other, "DIA_Ignaz_Hallo_14_04"); //I've already successfully carried out a few practical applications, but I don't have the time to conduct one final test.
};

///////////////////////////////////////////////////////////////////////
//	Info Lerninhalte Traenke
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Traenke(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 3;
	condition		= DIA_Ignaz_Traenke_Condition;
	information		= DIA_Ignaz_Traenke_Info;
	description		= "What's in it for me if I help you?";
};

func int DIA_Ignaz_Traenke_Condition()
{
	if (MIS_Ignaz_Charm != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Traenke_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Traenke_15_00"); //What's in it for me if I help you?
	AI_Output(self, other, "DIA_Ignaz_Traenke_14_01"); //I could teach you how to brew potions.
	AI_Output(self, other, "DIA_Ignaz_Traenke_14_02"); //I know the recipes for healing and mana essences and for speed potions.
	// AI_Output(self, other, "DIA_Ignaz_Traenke_14_03");// AuÃƒÅ¸erdem kann ich dir beibringen, wie du ein Elixier der Geschicklichkeit herstellst.
};

///////////////////////////////////////////////////////////////////////
//	Info Experiment
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Experiment(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 4;
	condition		= DIA_Ignaz_Experiment_Condition;
	information		= DIA_Ignaz_Experiment_Info;
	description		= "Tell me more about the experiment and the spell.";
};

func int DIA_Ignaz_Experiment_Condition()
{
	return TRUE;
};

func void DIA_Ignaz_Experiment_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Experiment_15_00"); //Tell me more about the experiment and the spell.
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_01"); //The spell serves to make somebody disremember various events.
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_02"); //So far, I have only found it to work when the person in question is angry - for instance, if he has just been knocked down, or robbed.
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_03"); //Even if he has only witnessed such a deed, he will scratch it from his memory.
	AI_Output(other, self, "DIA_Ignaz_Experiment_15_04"); //So I'm supposed to knock somebody down and then put a spell on him?
	// AI_Output(other, self, "DIA_Ignaz_Add_15_00"); // Das macht dann wohl nur Sinn, wenn derjenige nach der SchlÃƒÂ¤gerei WIRKLICH verÃƒÂ¤rgert ist.
	// AI_Output(other, self, "DIA_Ignaz_Add_15_01"); // (zu sich) Hier im Hafenviertel sind SchlÃƒÂ¤gereien nichts UngewÃƒÂ¶hnliches. Also mÃƒÂ¼ÃƒÅ¸te ich mir schon woanders ein Opfer suchen...
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_05"); //Yes, I think you get the point. But to make somebody angry, it is enough to attack him - you don't have to knock him down.
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_06"); //So you should pick somebody who's by himself - if there are other people around, you'll just get into trouble with Lord Andre.
	AI_Output(self, other, "DIA_Ignaz_Experiment_14_07"); //Also, it makes no sense to cast the spell on someone who's busy attacking you. Wait for the right moment.
};

///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_teilnehmen(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 5;
	condition		= DIA_Ignaz_teilnehmen_Condition;
	information		= DIA_Ignaz_teilnehmen_Info;
	description		= "All right, I'll try out that spell.";
};

func int DIA_Ignaz_teilnehmen_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Ignaz_Experiment))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_teilnehmen_Info()
{
	AI_Output(other, self, "DIA_Ignaz_teilnehmen_15_00"); //All right, I'll try out that spell.
	AI_Output(self, other, "DIA_Ignaz_teilnehmen_14_01"); //Then take this spell scroll and find yourself a suitable guinea pig.
	AI_Output(self, other, "DIA_Ignaz_teilnehmen_14_02"); //Once you're done, come back and tell me how it went.

	B_GiveInvItems(self, other, ITSC_Charm, 1);
	MIS_Ignaz_Charm = LOG_RUNNING;

	Log_CreateTopic(TOPIC_Ignaz, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Ignaz, LOG_RUNNING);
	B_LogEntry(TOPIC_Ignaz, TOPIC_Ignaz_1);
	Log_AddEntry(TOPIC_Ignaz, TOPIC_Ignaz_2);

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info teilnhemen
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Running(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 2;
	condition		= DIA_Ignaz_Running_Condition;
	information		= DIA_Ignaz_Running_Info;
	description		= "About the experiment ...";
};

func int DIA_Ignaz_Running_Condition()
{
	if ((MIS_Ignaz_Charm == LOG_RUNNING)
	&& (Charm_Test == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Running_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Running_15_00"); //About the experiment ...
	AI_Output(self, other, "DIA_Ignaz_Running_14_01"); //Have you been successful, then? Or have you just wasted the spell scroll? Huh?
	AI_Output(self, other, "DIA_Ignaz_Running_14_02"); //If you need more spell scrolls, you can buy them from me.
};

///////////////////////////////////////////////////////////////////////
//	Info Danach
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Danach(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 6;
	condition		= DIA_Ignaz_Danach_Condition;
	information		= DIA_Ignaz_Danach_Info;
	description		= "I used the spell scroll.";
};

func int DIA_Ignaz_Danach_Condition()
{
	if ((Charm_Test == TRUE)
	&& (MIS_Ignaz_Charm == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Danach_Info()
{
	AI_Output(other, self, "DIA_Ignaz_Danach_15_00"); //I used the spell scroll.
	AI_Output(self, other, "DIA_Ignaz_Danach_14_01"); //Fine, fine. And were you successful?
	AI_Output(other, self, "DIA_Ignaz_Danach_15_02"); //Yes, it worked.
	AI_Output(self, other, "DIA_Ignaz_Danach_14_03"); //Excellent. One small success for science, but a big one for me!
	AI_Output(self, other, "DIA_Ignaz_Danach_14_04"); //Now I can use my time to instruct you in the arts of alchemy.
	AI_Output(self, other, "DIA_Ignaz_Danach_14_05"); //I could also give you some useful things if you want.

	Ignaz_TeachAlchemy = TRUE;
	Log_CreateTopic(Topic_CityTeacher, LOG_NOTE);
	B_LogEntry(Topic_CityTeacher, Topic_CityTeacher_6);
	MIS_Ignaz_Charm = LOG_SUCCESS;
	B_GivePlayerXP(XP_MIS_Ignaz_Charm);

	// PATCH fallls alle Scrolls aufgekauft oder geplÃƒÂ¼ndert wurden
	CreateInvItems(self, ITSC_Charm, 3);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Trade(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 6;
	condition		= DIA_Ignaz_Trade_Condition;
	information		= DIA_Ignaz_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Show me your wares.";
};

func int DIA_Ignaz_Trade_Condition()
{
	if ((MIS_Ignaz_Charm == LOG_SUCCESS)
	|| (Npc_KnowsInfo(other, DIA_Ignaz_Running)))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Ignaz_Trade_15_00"); //Show me your wares.
};

///////////////////////////////////////////////////////////////////////
//	Info Teach
///////////////////////////////////////////////////////////////////////
instance DIA_Ignaz_Teach(C_INFO)
{
	npc				= VLK_498_Ignaz;
	nr				= 2;
	condition		= DIA_Ignaz_Teach_Condition;
	information		= DIA_Ignaz_Teach_Info;
	permanent		= TRUE;
	description		= "Instruct me in the art of alchemy.";
};

// ----------------------------------------
var int DIA_Ignaz_Teach_permanent;
// ----------------------------------------

func int DIA_Ignaz_Teach_Condition()
{
	if ((DIA_Ignaz_Teach_permanent == FALSE)
	&& (Ignaz_TeachAlchemy == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ignaz_Teach_Info()
{
	var int talente;
	talente = 0;
	AI_Output(other, self, "DIA_Ignaz_Teach_15_00"); //Instruct me in the art of alchemy.

	if ((PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	|| (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE))
	{
		Info_ClearChoices(DIA_Ignaz_Teach);
		Info_AddChoice(DIA_Ignaz_Teach, DIALOG_BACK, DIA_Ignaz_Teach_BACK);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Speed] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach, B_BuildLearnString(NAME_Speed_Potion, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Speed)), DIA_Ignaz_Teach_Speed);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach, B_BuildLearnString(NAME_ManaPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Ignaz_Teach_Mana);
		talente = (talente + 1);
	};

	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(DIA_Ignaz_Teach, B_BuildLearnString(NAME_HealthPotion1, B_GetLearnCostTalent(other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Ignaz_Teach_Health);
		talente = (talente + 1);
	};

	if (talente > 0)
	{
		if (Alchemy_Explain != TRUE)
		{
			AI_Output(self, other, "DIA_Ignaz_Teach_14_01"); //To prepare a potion at the alchemist's bench, you need a laboratory flask.
			AI_Output(self, other, "DIA_Ignaz_Teach_14_02"); //And you're going to need different plants or other ingredients for each potion.
			// AI_Output(self, other,"DIA_Ignaz_Teach_14_03"); // Eins noch. Falls du vorhast, das Wissen um Elixiere der Geschicklichkeit zu lernen, solltest du wissen, dass die benÃƒÂ¶tigten Pflanzen dafÃƒÂ¼r sehr selten sind.
			Alchemy_Explain = TRUE;
		}
		else
		{
			AI_Output(self, other, "DIA_Ignaz_Teach_14_04"); //What do you want to know?
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Ignaz_Teach_14_05"); //You have learned all that I can teach you.
		DIA_Ignaz_Teach_permanent = TRUE;
	};
};

func void DIA_Ignaz_Teach_Health()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Health_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Mana()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Mana_01);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_Speed()
{
	B_TeachPlayerTalentAlchemy(self, other, POTION_Speed);
	Info_ClearChoices(DIA_Ignaz_Teach);
};

func void DIA_Ignaz_Teach_BACK()
{
	Info_ClearChoices(DIA_Ignaz_Teach);
};
