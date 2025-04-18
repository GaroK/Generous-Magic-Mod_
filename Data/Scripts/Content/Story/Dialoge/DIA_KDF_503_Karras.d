///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP1_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP1_EXIT_Condition;
	information		= DIA_Karras_KAP1_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP1_EXIT_Condition()
{
	if (Kapitel <= 1)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Hello(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 1;
	condition		= DIA_Karras_Hello_Condition;
	information		= DIA_Karras_Hello_Info;
	important		= TRUE;
};

func int DIA_Karras_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk)
	&& (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Karras_Hello_Info()
{
	if (hero.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_00"); //What can I do for you, novice?
	}
	else if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_01"); //What can I do for you, Brother?
	}
	else if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_02"); //The honorable warriors of Innos rarely stray into these rooms.
		AI_Output(self, other, "DIA_Karras_Hello_10_03"); //What can I do for you?
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_Hello_10_04"); //(mistrustful) What are you doing here?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Mission
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Mission(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Mission_Condition;
	information		= DIA_Karras_Mission_Info;
	description		= "I have come to read the scriptures.";
};

func int DIA_Karras_Mission_Condition()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Mission_Info()
{
	AI_Output(other, self, "DIA_Karras_Mission_15_00"); //I have come to read the scriptures.
	AI_Output(self, other, "DIA_Karras_Mission_10_01"); //I understand. If you can ever make some time between your tedious studies, come to me.
	AI_Output(self, other, "DIA_Karras_Mission_10_02"); //There is yet another matter for which I could use a discreet novice.
};

///////////////////////////////////////////////////////////////////////
//	Info Aufgabe
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Aufgabe(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Aufgabe_Condition;
	information		= DIA_Karras_Aufgabe_Info;
	description		= "You have an assignment for me?";
};

func int DIA_Karras_Aufgabe_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Karras_Mission))
	{
		return TRUE;
	};
};

func void DIA_Karras_Aufgabe_Info()
{
	AI_Output(other, self, "DIA_Karras_Aufgabe_15_00"); //You have an assignment for me?
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_01"); //Yes. It's about this crazy Ignaz. He lives in Khorinis and experiments with various potions and healing draughts. But also magic spells.
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_02"); //And that's exactly what worries me. I ask myself if his magic is pleasing to Innos.
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_03"); //In order to test this, I need some of his spell scrolls.
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_04"); //I want you to go into the city and obtain three of his spell scrolls for me.
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_05"); //But not a word to anyone - is that clear?
	AI_Output(other, self, "DIA_Karras_Aufgabe_15_06"); //Sure.
	AI_Output(self, other, "DIA_Karras_Aufgabe_10_07"); //Here are 150 gold pieces. That should cover your expenses.

	MIS_KarrasVergessen = LOG_RUNNING;

	Log_CreateTopic(Topic_KarrasCharm, LOG_MISSION);
	Log_SetTopicStatus(Topic_KarrasCharm, LOG_RUNNING);
	B_LogEntry(Topic_KarrasCharm, Topic_KarrasCharm_1);

	B_GiveInvItems(self, other, ItMi_Gold, 150);
};

///////////////////////////////////////////////////////////////////////
//	Info Success
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Success(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Success_Condition;
	information		= DIA_Karras_Success_Info;
	description		= "Here are the spell scrolls you wanted.";
};

func int DIA_Karras_Success_Condition()
{
	if ((MIS_KarrasVergessen == LOG_RUNNING)
	&& (Npc_HasItems(other, ItSc_Charm) >= 3))
	{
		return TRUE;
	};
};

func void DIA_Karras_Success_Info()
{
	AI_Output(other, self, "DIA_Karras_Success_15_00"); //Here are the spell scrolls you wanted.
	AI_Output(self, other, "DIA_Karras_Success_10_01"); //Well done, my young friend.
	AI_Output(self, other, "DIA_Karras_Success_10_02"); //But now it is time that you devote yourself to your studies.
	AI_Output(self, other, "DIA_Karras_Success_10_03"); //And take this spell scroll as a reward.

	MIS_KarrasVergessen = LOG_SUCCESS;
	B_GivePlayerXP(XP_KarrasCharm);
	B_GiveInvItems(other, self, ItSc_Charm, 3);
	B_GiveInvItems(self, other, ItSc_SumWolf, 1);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_Trade(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Trade_Condition;
	information		= DIA_Karras_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Show me your wares.";
};

func int DIA_Karras_Trade_Condition()
{
	if (hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void DIA_Karras_Trade_Info()
{
	B_GiveTradeInv(self);
	AI_Output(other, self, "DIA_Karras_Trade_15_00"); //Show me your wares.
};

///////////////////////////////////////////////////////////////////////
//	Info JOB
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_JOB(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_JOB_Condition;
	information		= DIA_Karras_JOB_Info;
	description		= "What exactly is your job?";
};

func int DIA_Karras_JOB_Condition()
{
	return TRUE;
};

func void DIA_Karras_JOB_Info()
{
	AI_Output(other, self, "DIA_Karras_JOB_15_00"); //What exactly is your job?
	AI_Output(self, other, "DIA_Karras_JOB_10_01"); //It is my responsibility to train mages in the art of spherical manifestation.
	AI_Output(other, self, "DIA_Karras_JOB_15_02"); //What does that mean?
	AI_Output(self, other, "DIA_Karras_JOB_10_03"); //Well, I teach them how to summon creatures or beings from other states or spheres.
	AI_Output(self, other, "DIA_Karras_JOB_10_04"); //This is usually called summoning, although this expression alone is insufficient for the art of calling a servant.
	AI_Output(self, other, "DIA_Karras_JOB_10_05"); //Furthermore, I own some interesting spell scrolls which Gorax does not have.

	if (other.guild == GIL_NOV)
	{
		AI_Output(self, other, "DIA_Karras_JOB_10_06"); //But I only make them available to members of the Order.
	};

	Log_CreateTopic(Topic_KlosterTrader, LOG_NOTE);
	B_LogEntry(Topic_KlosterTrader, Topic_KlosterTrader_3);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_TEACH(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 10;
	condition		= DIA_Karras_TEACH_Condition;
	information		= DIA_Karras_TEACH_Info;
	permanent		= TRUE;
	description		= "Teach me (create runes).";
};

func int DIA_Karras_TEACH_Condition()
{
	if (other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Karras_TEACH_Info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other, self, "DIA_Karras_TEACH_15_00"); //Teach me.

	Info_ClearChoices(DIA_Karras_TEACH);

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 1)
	&& (PLAYER_TALENT_RUNES [SPL_SummonGoblinSkeleton] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonGoblinSkeleton, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGoblinSkeleton)), DIA_Karras_TEACH_SUMGOBL);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 2)
	&& (PLAYER_TALENT_RUNES [SPL_SummonWolf] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonWolf, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonWolf)), DIA_Karras_TEACHSummonWolf);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 3)
	&& (PLAYER_TALENT_RUNES [SPL_SummonSkeleton] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonSkeleton, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonSkeleton)), DIA_Karras_TEACH_SummonSkeleton);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 4)
	&& (PLAYER_TALENT_RUNES [SPL_SummonGolem] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonGolem, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonGolem)), DIA_Karras_TEACH_SummonGolem);
		abletolearn = (abletolearn + 1);
	};

	if ((Npc_GetTalentSkill(other, NPC_TALENT_MAGE) >= 5)
	&& (PLAYER_TALENT_RUNES [SPL_SummonDemon] == FALSE))
	{
		Info_AddChoice(DIA_Karras_TEACH, B_BuildLearnString(NAME_SPL_SummonDemon, B_GetLearnCostTalent(other, NPC_TALENT_RUNES, SPL_SummonDemon)), DIA_Karras_TEACH_SummonDemon);
		abletolearn = (abletolearn + 1);
	};

		if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 4)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};

		/*if (Npc_GetTalentSkill (other, NPC_TALENT_MAGE) >= 6)
		&& (PLAYER_TALENT_RUNES [SPL_ArmyOfDarkness] == FALSE)
		{
			Info_AddChoice	(DIA_Karras_TEACH, B_BuildLearnString (NAME_SPL_ArmyOfDarkness, B_GetLearnCostTalent (other, NPC_TALENT_RUNES, SPL_ArmyOfDarkness)) ,DIA_Karras_TEACH_ArmyOfDarkness);
			abletolearn = (abletolearn +1);
		};*/

	if (abletolearn < 1)
	{
		AI_Output(self, other, "DIA_Karras_TEACH_10_01"); //For the moment, there is nothing you can learn from me.
	}
	else
	{
		Info_AddChoice(DIA_Karras_TEACH, DIALOG_BACK, DIA_Karras_TEACH_BACK);
	};
};

func void DIA_Karras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Karras_TEACH);
};

func void DIA_Karras_TEACH_SUMGOBL()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGoblinSkeleton);
};

func void DIA_Karras_TEACHSummonWolf()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonWolf);
};

func void DIA_Karras_TEACH_SummonSkeleton()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonSkeleton);
};

func void DIA_Karras_TEACH_SummonGolem()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonGolem);
};

func void DIA_Karras_TEACH_SummonDemon()
{
	B_TeachPlayerTalentRunes(self, other, SPL_SummonDemon);
};

func void DIA_Karras_TEACH_ArmyOfDarkness()
{
	B_TeachPlayerTalentRunes(self, other, SPL_ArmyOfDarkness);
};

///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE4(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 3;
	condition		= DIA_Karras_CIRCLE4_Condition;
	information		= DIA_Karras_CIRCLE4_Info;
	permanent		= TRUE;
	description		= "I want to learn the fourth Circle of Magic.";
};

func int DIA_Karras_CIRCLE4_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE4_Info()
{
	AI_Output(other, self, "DIA_Karras_CIRCLE4_15_00"); //I want to learn the fourth Circle of Magic.

	if (MIS_ReadyforChapter4 == TRUE)
	{
		if (B_TeachMagicCircle(self, other, 4))
		{
			AI_Output(self, other, "DIA_Karras_CIRCLE4_10_01"); //Good. All the signs are fulfilled. Enter now the fourth circle, so that the power of the new magic will be within you.
			AI_Output(self, other, "DIA_Karras_CIRCLE4_10_02"); //You have come a long way, and Innos will continue to light your path.
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_CIRCLE4_10_03"); //It is still not finished.
	};
};

/////////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_CIRCLE5(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 3;
	condition		= DIA_Karras_CIRCLE5_Condition;
	information		= DIA_Karras_CIRCLE5_Info;
	permanent		= TRUE;
	description		= "I want to learn the fifth Circle of Magic.";
};

func int DIA_Karras_CIRCLE5_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void DIA_Karras_CIRCLE5_Info()
{
	AI_Output(other, self, "DIA_Karras_CIRCLE5_15_00"); //I want to learn the fifth Circle of Magic.

	if (Kapitel >= 5)
	{
		if (B_TeachMagicCircle(self, other, 5))
		{
			AI_Output(self, other, "DIA_Karras_CIRCLE5_10_01"); //Then enter now into the fifth circle of magic. You will command mightier magic than ever before.
			AI_Output(self, other, "DIA_Karras_CIRCLE5_10_02"); //Use its power wisely, Brother - for the darkness is still strong and so are your enemies.
			AI_Output(self, other, "DIA_Karras_CIRCLE5_10_03"); //I cannot accompany you into the sixth and highest Circle of magic. Pyrokar himself will ordain you when the time comes.

			B_LogEntry(Topic_KlosterTeacher, Topic_KlosterTeacher_2);
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_CIRCLE4_10_04"); //The time is not yet ripe.
	};
};

// #####################################################################
// ##
// ## Kapitel 2
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP2_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP2_EXIT_Condition;
	information		= DIA_Karras_KAP2_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP2_EXIT_Condition()
{
	if (Kapitel == 2)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ## Kapitel 3
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP3_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP3_EXIT_Condition;
	information		= DIA_Karras_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_ChasePedro(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 31;
	condition		= DIA_Karras_ChasePedro_Condition;
	information		= DIA_Karras_ChasePedro_Info;
	important		= TRUE;
};

func int DIA_Karras_ChasePedro_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void DIA_Karras_ChasePedro_Info()
{
	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Karras_ChasePedro_10_00"); //Brother, you cannot lose any time. You must hunt down Pedro and return the Eye of Innos to the monastery.
		AI_Output(self, other, "DIA_Karras_ChasePedro_10_01"); //If the Eye is not retrieved, we shall all be lost.
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_ChasePedro_10_02"); //What are you doing here? Shouldn't you be on your way and looking for the underhanded traitor Pedro?

		Info_ClearChoices(DIA_Karras_ChasePedro);
		Info_AddChoice(DIA_Karras_ChasePedro, "Later. There's something I have to take care of first.", DIA_Karras_ChasePedro_Later);
		Info_AddChoice(DIA_Karras_ChasePedro, "He's not going to get very far.", DIA_Karras_ChasePedro_WontEscape);
	};
};

func void DIA_Karras_ChasePedro_Later()
{
	AI_Output(other, self, "DIA_Karras_ChasePedro_Later_15_00"); //Later. There's something I have to take care of first.
	AI_Output(self, other, "DIA_Karras_ChasePedro_Later_10_01"); //Do you have any idea what this loss means for the monastery? The Eye of Innos is a powerful weapon.
	AI_Output(self, other, "DIA_Karras_ChasePedro_Later_10_02"); //No one can foresee what the enemy intends to do with the amulet, but he is planning something and we must prevent it.
	AI_Output(self, other, "DIA_Karras_ChasePedro_Later_10_03"); //So get moving immediately and track down the thief!

	AI_StopProcessInfos(self);
};

func void DIA_Karras_ChasePedro_WontEscape()
{
	AI_Output(other, self, "DIA_Karras_ChasePedro_WontEscape_15_00"); //He's not going to get very far.
	AI_Output(self, other, "DIA_Karras_ChasePedro_WontEscape_10_01"); //I hope so for your sake. If he should escape because you've been lollygagging here, I will personally drag you before the tribunal.
	AI_Output(other, self, "DIA_Karras_ChasePedro_WontEscape_15_02"); //What would you accuse me of?
	AI_Output(self, other, "DIA_Karras_ChasePedro_WontEscape_10_03"); //Conspiracy with the enemy. It takes little imagination to picture the punishment for such an offense.
	AI_Output(self, other, "DIA_Karras_ChasePedro_WontEscape_10_04"); //And now see to it that you lose no more time, otherwise the next time we meet, it will be at the stake.

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_NeedInfo(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 31;
	condition		= DIA_Karras_NeedInfo_Condition;
	information		= DIA_Karras_NeedInfo_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_Karras_NeedInfo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Karras_ChasePedro))
	&& (KAPITEL == 3)
	&& (hero.Guild != GIL_KDF)
	&& (MIS_NOVIZENCHASE == LOG_RUNNING)
	&& (Npc_IsInState(self, ZS_Talk)))
	{
		return TRUE;
	};
};

func void DIA_Karras_NeedInfo_Info()
{
	AI_Output(self, other, "DIA_Karras_NeedInfo_10_00"); //You know everything you need to know. Now be on your way!

	AI_StopProcessInfos(self);
};

//********************************************************************
//		Auge gefunden
//********************************************************************

///////////////////////////////////////////////////////////////////////
//	Info ChasePedro
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_InnosEyeRetrieved(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 1; // damit auch ganz sicher diese Info kommt (wg hello)!!!!
	condition		= DIA_Karras_InnosEyeRetrieved_Condition;
	information		= DIA_Karras_InnosEyeRetrieved_Info;
	description		= "I have brought back the Eye of Innos.";
};

func int DIA_Karras_InnosEyeRetrieved_Condition()
{
	if ((KAPITEL == 3)
	&& (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Karras_InnosEyeRetrieved_Info()
{
	AI_Output(other, self, "DIA_Karras_InnosEyeRetrieved_15_00"); //I have brought back the Eye of Innos.
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_01"); //I am relieved that you were able to snatch the Eye away from the enemy.
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_02"); //But the danger has not been averted. Evil is making further plans and is proceeding with unusual aggression.
	AI_Output(other, self, "DIA_Karras_InnosEyeRetrieved_15_03"); //I've already figured that out for myself.
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_04"); //Do not mock me. The situation is serious, very serious, and we don't know whom we can trust.
	AI_Output(self, other, "DIA_Karras_InnosEyeRetrieved_10_05"); //The enemy has already succeeded in leading the novice Pedro into temptation, and he may have success with many others.

	B_GivePlayerXP(XP_AMBIENT);
};

///////////////////////////////////////////////////////////////////////
//	KAP3_Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP3_Perm(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 5;
	condition		= DIA_Karras_KAP3_Perm_Condition;
	information		= DIA_Karras_KAP3_Perm_Info;
	permanent		= TRUE;
	description		= "How are your studies coming along?";
};

func int DIA_Karras_KAP3_Perm_Condition()
{
	if ((Kapitel >= 3)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB)))
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP3_Perm_Info()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_15_00"); //How are your studies coming along?

	if ((MIS_KarrasResearchDMT == FALSE)
	&& (PyrokarToldKarrasToResearchDMT == TRUE)
	&& (hero.guild == GIL_KDF))
	{
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_01"); //I have been able to find out something about the Seekers.
		AI_Output(other, self, "DIA_Karras_KAP3_Perm_15_02"); //And what would that be?
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_03"); //They are quite obviously of demonic origin. Well, at least they are, or were, under the influence of demons.
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_04"); //Be careful if you meet them.
		AI_Output(other, self, "DIA_Karras_KAP3_Perm_15_05"); //What a novel concept.
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_06"); //I'm sorry, but I don't have enough material to make a more precise statement.
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_07"); //But if you could manage to bring me something of theirs to examine ...

		MIS_KarrasResearchDMT = LOG_RUNNING;
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_7);

		Info_ClearChoices(DIA_Karras_KAP3_Perm);
		Info_AddChoice(DIA_Karras_KAP3_Perm, DIALOG_BACK, DIA_Karras_KAP3_Perm_Back);
		Info_AddChoice(DIA_Karras_KAP3_Perm, "I shall see what I can do.", DIA_Karras_KAP3_Perm_WillSee);
		Info_AddChoice(DIA_Karras_KAP3_Perm, "Could the Sleeper be involved in this?", DIA_Karras_KAP3_Perm_Sleeper);
		Info_AddChoice(DIA_Karras_KAP3_Perm, "What kind of material do you need?", DIA_Karras_KAP3_Perm_Material);
	}
	else if (MIS_KarrasResearchDMT == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_08"); //I am still working on the interpretation of the evidence about the Seekers.
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_09"); //As soon as I know something, I will of course inform you immediately.
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_KAP3_Perm_10_10"); //The enemy has many faces. Which of them presents the greatest danger for the monastery is awfully difficult to determine.
	};
};

func void DIA_Karras_KAP3_Perm_Back()
{
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

func void DIA_Karras_KAP3_Perm_Sleeper()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_Sleeper_15_00"); //Could the Sleeper be involved in this?
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Sleeper_10_01"); //I have heard the story of the Sleeper. But from a distance I cannot say anything about it.
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Sleeper_10_02"); //There are countless demons, and any of them could be involved.
};

func void DIA_Karras_KAP3_Perm_Corpse()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_Corpse_15_00"); //Do you want me to bring you a corpse, then?
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Corpse_10_01"); //No, are you crazy? The dangers posed by a demonic being within the walls of the monastery are much too great.
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Corpse_10_02"); //It will be enough if you find some objects which are typical for these beings.
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Corpse_10_03"); //The remains of the demonic aura which clings to them should offer enough clues for an examination.
};

func void DIA_Karras_KAP3_Perm_Material()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_Material_15_00"); //What kind of material do you need?
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_Material_10_01"); //What do I know - any objects which specially belong to these beings.

	Info_AddChoice(DIA_Karras_KAP3_Perm, "Do you want me to bring you a corpse?", DIA_Karras_KAP3_Perm_Corpse);
};

func void DIA_Karras_KAP3_Perm_WillSee()
{
	AI_Output(other, self, "DIA_Karras_KAP3_Perm_WillSee_15_00"); //I shall see what I can do.
	AI_Output(self, other, "DIA_Karras_KAP3_Perm_WillSee_10_01"); //It would certainly be very useful. In the meantime, I will carry out my own personal research.
	Info_ClearChoices(DIA_Karras_KAP3_Perm);
};

//********************************************************************
//	Ich habe hier dieses Buch.
//********************************************************************
instance DIA_Karras_HaveBook(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_HaveBook_Condition;
	information		= DIA_Karras_HaveBook_Info;
	description		= "I've got an almanac of the Possessed here.";
};

func int DIA_Karras_HaveBook_Condition()
{
	if ((MIS_KarrasResearchDMT == LOG_RUNNING)
	&& (Npc_HasItems(hero, ITWR_DementorObsessionBook_MIS) >= 1)
	&& (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

var int KarrasGotResearchDMTBook_Day;
func void DIA_Karras_HaveBook_Info()
{
	AI_Output(other, self, "DIA_Karras_HaveBook_15_00"); //I've got an almanac of the Possessed here. Maybe you can find some use for it.
	AI_Output(self, other, "DIA_Karras_HaveBook_10_01"); //Show me.

	Npc_RemoveInvItems(other, ITWR_DementorObsessionBook_MIS, 1);
	AI_PrintScreen(PRINT_ItemGegeben, -1, YPOS_ItemGiven, FONT_ScreenSmall, 2); // "1 Gegenstand gegeben"

	AI_Output(self, other, "DIA_Karras_HaveBook_10_02"); //Yes, that may do. I will examine the book.
	AI_Output(self, other, "DIA_Karras_HaveBook_10_03"); //But I'm already sure of one thing.
	AI_Output(self, other, "DIA_Karras_HaveBook_10_04"); //In my opinion, the Seekers are an utterly perverted life form created by Beliar.
	AI_Output(self, other, "DIA_Karras_HaveBook_10_05"); //These beings are of partly demonic and partly human origin.
	AI_Output(self, other, "DIA_Karras_HaveBook_10_06"); //However, I am still unable to tell at this point whether we are looking at a type of spiritual possession, or a purely physical mutation.
	AI_Output(self, other, "DIA_Karras_HaveBook_10_07"); //Come back later. Then I will certainly know more.
	MIS_KarrasResearchDMT = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_8);
	KarrasGotResearchDMTBook_Day = Wld_GetDay();
	B_GivePlayerXP(XP_KarrasResearchDMT);
};

//********************************************************************
//	ResearchDMTEnd
//********************************************************************
instance DIA_Karras_ResearchDMTEnd(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_ResearchDMTEnd_Condition;
	information		= DIA_Karras_ResearchDMTEnd_Info;
	permanent		= TRUE;
	description		= "Found out anything new about the Seekers yet?";
};

func int DIA_Karras_ResearchDMTEnd_Condition()
{
	if ((MIS_KarrasResearchDMT == LOG_SUCCESS)
	&& (hero.guild == GIL_KDF)
	&& (SC_KnowsMadPsi == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ResearchDMTEnd_Info()
{
	AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_00"); //Found out anything new about the Seekers yet?

	if (KarrasGotResearchDMTBook_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_01"); //Yes. Now I know who or what the Seekers really are.
		AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_02"); //Fire away!
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_03"); //They were once human, like you or I. They made the abominable mistake of devoting themselves to the impure magic of a very powerful archdemon.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_04"); //Under the influence of this archdemon as well as very powerful drugs, they existed only to serve him until they were reduced to mere shadows of themselves.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_05"); //Today, they are nothing but tools of evil, without a will of their own, and they will never cease to hunt the followers of Innos.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_06"); //We must be careful. They still seem to shun these hallowed halls of Innos.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_07"); //However, if their power continues to grow, I don't know if we'll still be safe here.
		AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_08"); //Thanks. That was very enlightening.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_09"); //Indeed? That only raises more questions for me. For example, who were they before, and which archdemon made them what they are now?
		AI_Output(other, self, "DIA_Karras_ResearchDMTEnd_15_10"); //I've got a notion. This all sounds like the Brotherhood of the Sleeper. I know those guys.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_11"); //I hope you know what you're getting involved in. Take care of yourself, my Brother.
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_12"); //But, of course. Here is your almanac. I don't need it any longer.

		CreateInvItems(other, ITWR_DementorObsessionBook_MIS, 1);
		AI_PrintScreen(PRINT_ItemErhalten, -1, YPOS_ItemTaken, FONT_ScreenSmall, 2); // "1 Gegenstand erhalten"

		SC_KnowsMadPsi = TRUE;
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_9);
		B_GivePlayerXP(XP_SC_KnowsMadPsi);
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_ResearchDMTEnd_10_13"); //I'm working on it. Come back later.
	};
};

//********************************************************************
//	Prot_BlackEye (ItAm_Prot_BlackEye_Mis)
//********************************************************************
instance DIA_Karras_Prot_BlackEye(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_Prot_BlackEye_Condition;
	information		= DIA_Karras_Prot_BlackEye_Info;
	permanent		= TRUE;
	description		= "Is there a way to protect oneself against the mental attacks of the Seekers?";
};

func int DIA_Karras_Prot_BlackEye_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Pyrokar_AskKarrasAboutDMTAmulett == TRUE)
	&& (MIS_Karras_FindBlessedStone == FALSE)
	&& (Npc_KnowsInfo(other, DIA_Karras_JOB)))
	{
		return TRUE;
	};
};

func void DIA_Karras_Prot_BlackEye_Info()
{
	AI_Output(other, self, "DIA_Karras_Prot_BlackEye_15_00"); //Is there a way to protect oneself against the mental attacks of the Seekers?

	if (SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_01"); //Indeed. An amulet prepared with stone from blessed soil could have a protective effect.
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_02"); //Unfortunately, I do not have enough of these stones available.
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_03"); //Some of our prayer shrines which we have erected are composed of them.
		AI_Output(other, self, "DIA_Karras_Prot_BlackEye_15_04"); //All right. I shall scare up some of that.
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_05"); //Yes, do that. But don't even think of damaging the shrines, do you hear me?
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_10);
		MIS_Karras_FindBlessedStone = LOG_RUNNING;
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_Prot_BlackEye_10_06"); //No idea. I still know too little to answer that. Ask me about it later.
	};
};

//********************************************************************
//	KarrasBlessedStone (ItAm_Prot_BlackEye_Mis)
//********************************************************************
instance DIA_Karras_KarrasBlessedStone(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_KarrasBlessedStone_Condition;
	information		= DIA_Karras_KarrasBlessedStone_Info;
	description		= "I've got some stone here from blessed soil.";
};

func int DIA_Karras_KarrasBlessedStone_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (Npc_HasItems(other, ItMi_KarrasBlessedStone_Mis))
	&& (MIS_Karras_FindBlessedStone == LOG_RUNNING))
	{
		return TRUE;
	};
};

var int KarrasMakesBlessedStone_Day;
func void DIA_Karras_KarrasBlessedStone_Info()
{
	AI_Output(other, self, "DIA_Karras_KarrasBlessedStone_15_00"); //I've got some stone here from blessed soil.
	B_GiveInvItems(other, self, ItMi_KarrasBlessedStone_Mis, 1);
	AI_Output(self, other, "DIA_Karras_KarrasBlessedStone_10_01"); //Good. I hope all the prayer shrines are still in their places.
	AI_Output(self, other, "DIA_Karras_KarrasBlessedStone_10_02"); //All right. I shall make you a protective amulet against the black look of the Seekers.
	AI_Output(self, other, "DIA_Karras_KarrasBlessedStone_10_03"); //Give me some time. I shall get right to work.
	KarrasMakesBlessedStone_Day = Wld_GetDay();
	MIS_Karras_FindBlessedStone = LOG_SUCCESS;
	B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_11);
	B_GivePlayerXP(XP_Karras_FoundBlessedStone);
	AI_StopProcessInfos(self);
};

//********************************************************************
//	ItAm_Prot_BlackEye_Mis
//********************************************************************
instance DIA_Karras_ItAm_Prot_BlackEye_Mis(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 2;
	condition		= DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition;
	information		= DIA_Karras_ItAm_Prot_BlackEye_Mis_Info;
	permanent		= TRUE;
	description		= "So what about the protective amulet you promised me?";
};

var int DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm;
func int DIA_Karras_ItAm_Prot_BlackEye_Mis_Condition()
{
	if ((hero.guild == GIL_KDF)
	&& (MIS_Karras_FindBlessedStone == LOG_SUCCESS)
	&& (DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Karras_ItAm_Prot_BlackEye_Mis_Info()
{
	AI_Output(other, self, "DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00"); //So what about the protective amulet you promised me?

	if (KarrasMakesBlessedStone_Day <= (Wld_GetDay() - 2))
	{
		AI_Output(self, other, "DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01"); //I'm finished. Here, take a look. It has turned out beautifully.
		CreateInvItems(self, ItAm_Prot_BlackEye_Mis, 1);
		B_GiveInvItems(self, other, ItAm_Prot_BlackEye_Mis, 1);
		AI_Output(self, other, "DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02"); //Carry it with you always and the Seekers will not be able to drag you down into their mental abyss.
		AI_Output(other, self, "DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03"); //Thank you.
		B_LogEntry(TOPIC_DEMENTOREN, TOPIC_DEMENTOREN_12);
		DIA_Karras_ItAm_Prot_BlackEye_Mis_NoPerm = TRUE;
		B_GivePlayerXP(XP_Ambient);
	}
	else
	{
		AI_Output(self, other, "DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04"); //Patience. I'm still working on it.
	};
};

// #####################################################################
// ##
// ## Kapitel 4
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Kap4 Exit
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP4_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP4_EXIT_Condition;
	information		= DIA_Karras_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ## Kapitel 5
// ##
// #####################################################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Karras_KAP5_EXIT(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 999;
	condition		= DIA_Karras_KAP5_EXIT_Condition;
	information		= DIA_Karras_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Karras_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Karras_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Karras_PICKPOCKET(C_INFO)
{
	npc				= KDF_503_Karras;
	nr				= 900;
	condition		= DIA_Karras_PICKPOCKET_Condition;
	information		= DIA_Karras_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Karras_PICKPOCKET_Condition()
{
	C_Beklauen(49, 35);
};

func void DIA_Karras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
	Info_AddChoice(DIA_Karras_PICKPOCKET, DIALOG_BACK, DIA_Karras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Karras_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Karras_PICKPOCKET_DoIt);
};

func void DIA_Karras_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};

func void DIA_Karras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Karras_PICKPOCKET);
};
