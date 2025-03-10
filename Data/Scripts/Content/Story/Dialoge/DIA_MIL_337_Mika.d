///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_EXIT(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 999;
	condition		= DIA_Mika_EXIT_Condition;
	information		= DIA_Mika_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mika_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Refuse Talk wenn Lares am Start
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Refuse(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 1;
	condition		= DIA_Mika_Refuse_Condition;
	information		= DIA_Mika_Refuse_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Mika_Refuse_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (Lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Mika_Refuse_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WOHIN(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 4;
	condition		= DIA_Mika_WOHIN_Condition;
	information		= DIA_Mika_WOHIN_Info;
	important		= TRUE;
};

func int DIA_Mika_WOHIN_Condition()
{
	if (Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info()
{
	AI_Output(self, other, "DIA_Mika_WOHIN_12_00"); //Hey, hey. Not so fast. Strolling about alone out here is dangerous. Where do you come from?

	Info_ClearChoices(DIA_Mika_WOHIN);

	Info_AddChoice(DIA_Mika_WOHIN, "That's none of your business.", DIA_Mika_WOHIN_weg);
	Info_AddChoice(DIA_Mika_WOHIN, "From one of the farms.", DIA_Mika_WOHIN_Bauern);
	Info_AddChoice(DIA_Mika_WOHIN, "From the city!", DIA_Mika_WOHIN_stadt);
};

func void DIA_Mika_WOHIN_stadt()
{
	AI_Output(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //From the city!
	AI_Output(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //Well, well. Then what are you doing wandering around out here, so far from the protective walls of the city?

	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern()
{
	AI_Output(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //From one of the farms.
	AI_Output(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //A farmer, eh? Hmm. Then you shouldn't be walking along these dangerous paths all by yourself. Who knows who might be lying in wait for you.

	Info_ClearChoices(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg()
{
	AI_Output(other, self, "DIA_Mika_WOHIN_weg_15_00"); //That's none of your business.
	AI_Output(self, other, "DIA_Mika_WOHIN_weg_12_01"); //If you say so. But don't go whining about it afterwards if somebody skins you. Have a nice day.

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGefaehrlich
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASGEFAEHRLICH(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 5;
	condition		= DIA_Mika_WASGEFAEHRLICH_Condition;
	information		= DIA_Mika_WASGEFAEHRLICH_Info;
	description		= "What's so dangerous out here?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info()
{
	AI_Output(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //What's so dangerous out here?
	AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //Many things.
	if (other.protection[PROT_EDGE] < ITAR_Leather_L.protection [PROT_EDGE]) // Joly: kleiner als die LederrÃƒÂ¼stung
	{
		AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //For one thing, there's the bandits. They'd polish off a little wimp like you for breakfast.
		AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //If the bandits don't catch you, then the wild animals in the forest or the mercenaries roaming around will take care of you.
		AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //So, first get yourself some decent armor before you go out.
	};

	AI_Output(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //I bet you'll be yelling for my help after the next bend in the road.
};

///////////////////////////////////////////////////////////////////////
//	Info waskostetHilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASKOSTETHILFE(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 6;
	condition		= DIA_Mika_WASKOSTETHILFE_Condition;
	information		= DIA_Mika_WASKOSTETHILFE_Info;
	description		= "Just assuming I would fall back on your help.";
};

func int DIA_Mika_WASKOSTETHILFE_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Mika_WASGEFAEHRLICH))
	{
		return TRUE;
	};
};

func void DIA_Mika_WASKOSTETHILFE_Info()
{
	AI_Output(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //Just assuming I would fall back on your help. How much would that cost me?
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //I am merely a humble servant of the king and would not enjoy fleecing a helpless little citizen of the realm.
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //But you know, if you put it like that, I wouldn't object to a little financial backing to promote our future business relationship.
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //10 gold coins should do for starters. What do you think?

	Info_ClearChoices(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice(DIA_Mika_WASKOSTETHILFE, "I'll think about it.", DIA_Mika_WASKOSTETHILFE_nochnicht);
	Info_AddChoice(DIA_Mika_WASKOSTETHILFE, "Why not? Here's your 10 coins.", DIA_Mika_WASKOSTETHILFE_ja);
};

func void DIA_Mika_WASKOSTETHILFE_ja()
{
	AI_Output(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //Why not? Here's your 10 coins.

	if (B_GiveInvItems(other, self, ItMi_Gold, 10))
	{
		AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //Terrific. If you need my help, you know where to find me.
		AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //But please do me a favor, don't come to me with any trifles. I can't stand that, you hear??

		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //You haven't got the money. Maybe you should think again whether you really want my help.
	};

	AI_StopProcessInfos(self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht()
{
	AI_Output(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //I'll think about it.
	AI_Output(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //Suit yourself. Have a nice death.

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ueberlegt
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_UEBERLEGT(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 7;
	condition		= DIA_Mika_UEBERLEGT_Condition;
	information		= DIA_Mika_UEBERLEGT_Info;
	permanent		= TRUE;
	description		= "I changed my mind. I'll pay you the 10 gold coins.";
};

func int DIA_Mika_UEBERLEGT_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Mika_WASKOSTETHILFE))
	&& (Mika_Helps == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Mika_UEBERLEGT_Info()
{
	AI_Output(other, self, "DIA_Mika_UEBERLEGT_15_00"); //I changed my mind. I'll pay you the 10 gold coins.

	if (B_GiveInvItems(other, self, ItMi_Gold, 10))
	{
		AI_Output(self, other, "DIA_Mika_UEBERLEGT_12_01"); //Wonderful. Better late than never. And now?

		Mika_Helps = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Mika_UEBERLEGT_12_02"); //(angry) Come back when you have the money.
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info HILFE
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_HILFE(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 8;
	condition		= DIA_Mika_HILFE_Condition;
	information		= DIA_Mika_HILFE_Info;
	permanent		= TRUE;
	description		= "I need your help.";
};

func int DIA_Mika_HILFE_Condition()
{
	if (Mika_Helps == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Mika_HILFE_Info()
{
	AI_Output(other, self, "DIA_Mika_HILFE_15_00"); //I need your help.
	AI_Output(self, other, "DIA_Mika_HILFE_12_01"); //If it's absolutely necessary ... What's wrong?

	Info_ClearChoices(DIA_Mika_HILFE);

	Info_AddChoice(DIA_Mika_HILFE, "I'm being chased by bandits.", DIA_Mika_HILFE_schongut);
	Info_AddChoice(DIA_Mika_HILFE, "I'm being attacked by monsters.", DIA_Mika_HILFE_monster);

	if ((!Npc_IsDead(Alvares))
	&& (!Npc_IsDead(Engardo))
	&& ((Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo(other, DIA_Sarah_Bauern))))
	{
		Info_AddChoice(DIA_Mika_HILFE, "The farmer Akil is under attack by mercenaries.", DIA_Mika_HILFE_Akil);
	};
};

func void DIA_Mika_HILFE_Akil()
{
	AI_Output(other, self, "DIA_Mika_HILFE_Akil_15_00"); //The farmer Akil is under attack by mercenaries.
	AI_Output(self, other, "DIA_Mika_HILFE_Akil_12_01"); //(agitated) What? Those riff-raff are hanging around on Akil's farm? Then let's not waste any time. Follow me.

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP(Xp_Ambient);
	B_LogEntry(TOPIC_AkilsSLDStillthere, TOPIC_AkilsSLDStillthere_2);

	Npc_ExchangeRoutine(self, "Akil");
};

func void DIA_Mika_HILFE_monster()
{
	AI_Output(other, self, "DIA_Mika_HILFE_monster_15_00"); //I'm being attacked by monsters.
	AI_Output(self, other, "DIA_Mika_HILFE_monster_12_01"); //But I don't see any monsters right now. I'm sure you're just making that up.

	AI_StopProcessInfos(self);
};

func void DIA_Mika_HILFE_schongut()
{
	AI_Output(other, self, "DIA_Mika_HILFE_schongut_15_00"); //I'm being chased by bandits.
	AI_Output(self, other, "DIA_Mika_HILFE_schongut_12_01"); //Really? Where are they then? If you were being chased, I should be able to see at least one of them, right?

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Zack
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Zack(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 8;
	condition		= DIA_Mika_Zack_Condition;
	information		= DIA_Mika_Zack_Info;
	important		= TRUE;
};

func int DIA_Mika_Zack_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_FARM2_PATH_03") < 500)
	&& ((!Npc_IsDead(Alvares)) || (!Npc_IsDead(Engardo))))
	{
		return TRUE;
	};
};

func void DIA_Mika_Zack_Info()
{
	AI_Output(self, other, "DIA_Mika_Zack_12_00"); //Now watch how this works.
	Info_AddChoice(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los);
};

func void DIA_Mika_Zack_los()
{
	AI_StopProcessInfos(self);
	// Joly: B_attack funzt hier nicht und ist auch nicht nÃƒÂ¶tig!!!!!!!!!!!
	if (!Npc_IsDead(Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};

	if (!Npc_IsDead(Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};
};

///////////////////////////////////////////////////////////////////////
//	Info WiederNachHause
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WIEDERNACHHAUSE(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 9;
	condition		= DIA_Mika_WIEDERNACHHAUSE_Condition;
	information		= DIA_Mika_WIEDERNACHHAUSE_Info;
	important		= TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition()
{
	if ((Npc_GetDistToWP(self, "NW_FARM2_PATH_03") < 10000)
	&& (Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info()
{
	AI_Output(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //All right. That's that. I'll be off then.

	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self, "Start");
	B_GivePlayerXP(Xp_Ambient);
};

// ############################################
// ##
// ## Kapitel 3
// ##
// ############################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Kap3_EXIT(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 999;
	condition		= DIA_Mika_Kap3_EXIT_Condition;
	information		= DIA_Mika_Kap3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Mika_Kap3_EXIT_Condition()
{
	if (Kapitel >= 3)
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//***************************************************
//		Perm Kap3
//***************************************************

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Kap3u4u5_PERM(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 39;
	condition		= DIA_Mika_Kap3u4u5_PERM_Condition;
	information		= DIA_Mika_Kap3u4u5_PERM_Info;
	permanent		= TRUE;
	description		= "All quiet?";
};

func int DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Mika_WOHIN))
	&& (Npc_IsDead(Alvares))
	&& (Npc_IsDead(Engardo)))
	{
		return TRUE;
	};
};

func void DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output(other, self, "DIA_Mika_Kap3u4u5_PERM_15_00"); //All quiet?
	AI_Output(self, other, "DIA_Mika_Kap3u4u5_PERM_12_01"); //You're still alive. I'm impressed.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Mika_PICKPOCKET(C_INFO)
{
	npc				= Mil_337_Mika;
	nr				= 900;
	condition		= DIA_Mika_PICKPOCKET_Condition;
	information		= DIA_Mika_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_80;
};

func int DIA_Mika_PICKPOCKET_Condition()
{
	C_Beklauen(65, 75);
};

func void DIA_Mika_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
	Info_AddChoice(DIA_Mika_PICKPOCKET, DIALOG_BACK, DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Mika_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};

func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Mika_PICKPOCKET);
};
