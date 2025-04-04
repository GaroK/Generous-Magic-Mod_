///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_EXIT_Condition;
	information		= DIA_Hilda_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_EXIT_Condition()
{
	if (Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Hallo(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_Hallo_Condition;
	information		= DIA_Hilda_Hallo_Info;
	important		= TRUE;
};

func int DIA_Hilda_Hallo_Condition()
{
	if ((MIS_Lobart_Rueben != LOG_SUCCESS)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Hallo_Info()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Hilda_Hallo_17_00"); //Hey, who invited you? Get out of the house right now. There's no alms to be had here.
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_Hallo_17_01"); //Yes, what is it?
	};

	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Was zu essen? (PERM)
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_WasZuEssen(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_WasZuEssen_Condition;
	information		= DIA_Hilda_WasZuEssen_Info;
	permanent		= TRUE;
	description		= "Can you give me something to eat?";
};

func int DIA_Hilda_WasZuEssen_Condition()
{
	if (((Npc_KnowsInfo(other, DIA_Hilda_Hallo)) || (MIS_Lobart_Rueben == LOG_SUCCESS))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_WasZuEssen_Info()
{
	if (hero.guild == GIL_NONE)
	{
		var int Rueben_TagNull;

		AI_Output(other, self, "DIA_Hilda_WasZuEssen_15_00"); //Can you give me something to eat?

		if (MIS_Lobart_Rueben == LOG_SUCCESS)
		{
			if (!Npc_KnowsInfo(other, DIA_Hilda_PfanneTooLate))
			{
				if (Hilda_Stew_Day != Wld_GetDay())
				{
					B_GiveInvItems(self, other, ItFo_Stew, 1);

					AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_01"); //Here, take this. You're a good lad.

					Hilda_Stew_Day = Wld_GetDay();
				}

				else if ((Wld_GetDay() == 0)
				&& (Rueben_TagNull == FALSE))
				{
					AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_02"); //You can come back for more tomorrow.
					B_GiveInvItems(self, other, ItFo_Stew, 1);
					Hilda_Stew_Day = Wld_GetDay();
					Rueben_TagNull = TRUE;

					Log_CreateTopic(Topic_Bonus, LOG_NOTE);
					B_LogEntry(Topic_Bonus, Topic_Bonus_6);
				}
				else // heute schon bekommen
				{
					AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_03"); //You've had your portion for today! Come back later.
				};
			}
			else // Pfanne zu spÃƒÂ¤t
			{
				AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_04"); //We don't feed idlers here. Go away!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_05"); //Only those who work here get something to eat!
		};
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_WasZuEssen_17_06"); //I'm sure you have enough money to buy yourself something in town.
	};
};

///////////////////////////////////////////////////////////////////////
//	RÃƒÂ¼ben bringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_BringBeet(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 1;
	condition		= DIA_Hilda_BringBeet_Condition;
	information		= DIA_Hilda_BringBeet_Info;
	description		= "I've got a few turnips here for you ...";
};

func int DIA_Hilda_BringBeet_Condition()
{
	if ((MIS_Lobart_RuebenToHilda == LOG_RUNNING)
	&& (Npc_HasItems(other, ItPl_Beet) >= 1)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_BringBeet_Info()
{
	AI_Output(other, self, "DIA_Hilda_BringBeet_15_00"); //I've got a few turnips here for you ...

	if (Npc_HasItems(other, ItPl_Beet) >= 20)
	{
		B_GiveInvItems(other, self, ItPl_Beet, Npc_HasItems(other, ItPl_Beet));

		AI_Output(self, other, "DIA_Hilda_BringBeet_17_01"); //Great! (laughs) That should be enough to fatten those guys up!
		AI_Output(self, other, "DIA_Hilda_BringBeet_17_02"); //Since you're here anyway - I saw a traveling trader pass by here a few minutes ago.
		AI_Output(self, other, "DIA_Hilda_BringBeet_17_03"); //I think he stopped on his way to town. Go to him and see whether he's got a decent frying pan for me.

		MIS_Lobart_RuebenToHilda = LOG_SUCCESS;
		B_GivePlayerXP(XP_Ambient); // damit der Logeintrag verschwindet
	}
	else
	{
		if (hero.guild == GIL_NONE)
		{
			AI_Output(self, other, "DIA_Hilda_BringBeet_17_04"); //What?! Is that supposed to be all?
		}
		else
		{
			AI_Output(self, other, "DIA_Hilda_BringBeet_17_05"); //It's not enough.
		};

		AI_Output(self, other, "DIA_Hilda_BringBeet_17_06"); //Go out to the field and get more, the men are hungry!
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Einkaufen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_Einkaufen(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_Einkaufen_Condition;
	information		= DIA_Hilda_Einkaufen_Info;
	description		= "Give me the gold, and I'll go see the merchant for you ...";
};

func int DIA_Hilda_Einkaufen_Condition()
{
	if ((MIS_Lobart_RuebenToHilda == LOG_SUCCESS)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_Einkaufen_Info()
{
	AI_Output(other, self, "DIA_Hilda_Einkaufen_15_00"); //Give me the gold, and I'll go see the merchant for you ...

	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Hilda_Einkaufen_17_01"); //Are you saying I can trust you? Just don't spend the money on booze, do you hear?!
	};

	B_GiveInvItems(self, other, ItMi_Gold, 20);

	MIS_Hilda_PfanneKaufen = LOG_RUNNING;
	MIS_Hilda_PfanneKaufen_Day = B_GetDayPlus();

	Log_CreateTopic(TOPIC_Hilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Hilda, LOG_RUNNING);
	B_LogEntry(TOPIC_Hilda, TOPIC_Hilda_1);
};

///////////////////////////////////////////////////////////////////////
//	Pfanne geholt
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneGeholt(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_PfanneGeholt_Condition;
	information		= DIA_Hilda_PfanneGeholt_Info;
	description		= "Here's your frying pan.";
};

func int DIA_Hilda_PfanneGeholt_Condition()
{
	if ((MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (Npc_HasItems(other, itmi_pan) > 0)
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneGeholt_Info()
{
	AI_Output(other, self, "DIA_Hilda_PfanneGeholt_15_00"); //Here's your frying pan.
	B_GiveInvItems(other, self, itmi_pan, 1);
	AI_Output(self, other, "DIA_Hilda_PfanneGeholt_17_01"); //Fine. Let's see, then, whether it's any good ...

	MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
	B_GivePlayerXP(XP_HildaHolPfanne);
};

///////////////////////////////////////////////////////////////////////
//	Pfanne zu spÃƒÂ¤t
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_PfanneTooLate(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 1;
	condition		= DIA_Hilda_PfanneTooLate_Condition;
	information		= DIA_Hilda_PfanneTooLate_Info;
	important		= TRUE;
};

func int DIA_Hilda_PfanneTooLate_Condition()
{
	if ((MIS_Hilda_PfanneKaufen == LOG_RUNNING)
	&& (MIS_Hilda_PfanneKaufen_Day <= (Wld_GetDay() - 1))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_PfanneTooLate_Info()
{
	if (hero.guild == GIL_NONE)
	{
		AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_00"); //You still dare come back here? What have you done with my money, you good-for-nothing?!
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_01"); //You've had enough time now. Where's the money I gave you for the pan?
	};

	if (Npc_HasItems(other, itmi_pan) > 0)
	{
		AI_Output(other, self, "DIA_Hilda_PfanneTooLate_15_02"); //Sorry, it took me a while. Here's your frying pan!

		B_GiveInvItems(other, self, itmi_pan, 1);

		AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_03"); //Arrh, give the thing here, then. The very nerve - unbelievable!

		MIS_Hilda_PfanneKaufen = LOG_SUCCESS;
		B_GivePlayerXP(XP_HildaHolPfanne / 2);

		AI_StopProcessInfos(self);
	}
	else // keine Pfanne
	{
		if (Npc_HasItems(other, itmi_gold) >= 20)
		{
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_04"); //Ah! You've still got it! Give it back to me. Now.
			B_GiveInvItems(other, self, ItMi_Gold, 20);
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_05"); //The very nerve - unbelievable!
		}
		else // kein Gold
		{
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_06"); //You don't have it any more! I gave you 20 gold pieces!
			AI_Output(self, other, "DIA_Hilda_PfanneTooLate_17_07"); //Get out of my sight, you filthy thief!

			B_MemorizePlayerCrime(self, other, CRIME_THEFT);
		};

		MIS_Hilda_PfanneKaufen = LOG_FAILED;
		B_CheckLog();
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Klamotten uas Truhe geklaut
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Hilda_TruheRumgemacht(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 2;
	condition		= DIA_Hilda_TruheRumgemacht_Condition;
	information		= DIA_Hilda_TruheRumgemacht_Info;
	important		= TRUE;
};

func int DIA_Hilda_TruheRumgemacht_Condition()
{
	if ((Mob_HasItems("CHEST_LOBART", ITAR_Bau_L) == FALSE)
	&& (Lobart_Kleidung_Verkauft == FALSE)
	&& (!(Npc_KnowsInfo(other, DIA_Lobart_STOLENCLOTHS) && (Lobart_Kleidung_gestohlen == FALSE)))
	&& (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Hilda_TruheRumgemacht_Info()
{
	AI_Output(self, other, "DIA_Hilda_TruheRumgemacht_17_00"); //DenkÃ‚Â´ bloss nicht, ich hÃƒÂ¤tte nicht gesehen, wie du an der Kiste 'rumgemacht hast.
	AI_Output(self, other, "DIA_Hilda_TruheRumgemacht_17_01"); //Raus hier aber schnell. Sonst holÃ‚Â´ ich meinen Mann!

	AI_StopProcessInfos(self);
};

*/

// #####################################################################
// ##
// ##
// ## KAPITEL 3
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************
instance DIA_Hilda_KAP3_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP3_EXIT_Condition;
	information		= DIA_Hilda_KAP3_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP3_EXIT_Condition()
{
	if (Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Krank
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_KRANK(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 30;
	condition		= DIA_Hilda_KRANK_Condition;
	information		= DIA_Hilda_KRANK_Info;
	permanent		= TRUE;
	description		= "Aren't you feeling well?";
};

func int DIA_Hilda_KRANK_Condition()
{
	if ((Kapitel >= 3)
	&& ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	&& (MIS_HealHilda != LOG_SUCCESS))
	{
		return TRUE;
	};
};

var int DIA_Hilda_KRANK_OnTime;
func void DIA_Hilda_KRANK_Info()
{
	AI_Output(other, self, "DIA_Hilda_KRANK_15_00"); //Aren't you feeling well?
	AI_Output(self, other, "DIA_Hilda_KRANK_17_01"); //No, not at all. I've got this awful fever again.
	AI_Output(self, other, "DIA_Hilda_KRANK_17_02"); //I should really go and see the town healer, but I'm too weak for that.

	if (DIA_Hilda_KRANK_OnTime == FALSE)
	{
		Info_ClearChoices(DIA_Hilda_KRANK);
		Info_AddChoice(DIA_Hilda_KRANK, "Get well soon. I've got to go.", DIA_Hilda_KRANK_besserung);
		Info_AddChoice(DIA_Hilda_KRANK, "Can I help?", DIA_Hilda_KRANK_helfen);

		DIA_Hilda_KRANK_OnTime = TRUE;
	};

	MIS_HealHilda = LOG_RUNNING;
};

func void DIA_Hilda_KRANK_besserung()
{
	AI_Output(other, self, "DIA_Hilda_KRANK_besserung_15_00"); //Get well soon. I've got to go.
	AI_Output(self, other, "DIA_Hilda_KRANK_besserung_17_01"); //Let's hope that times will be better soon.
	AI_StopProcessInfos(self);
};

func void DIA_Hilda_KRANK_helfen()
{
	AI_Output(other, self, "DIA_Hilda_KRANK_helfen_15_00"); //Can I help?
	AI_Output(self, other, "DIA_Hilda_KRANK_helfen_17_01"); //It would be wonderful if you could go to Vatras and get me my medicine.
	AI_Output(self, other, "DIA_Hilda_KRANK_helfen_17_02"); //He'll know what is to be done! I can't do it any more.

	Log_CreateTopic(TOPIC_HealHilda, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HealHilda, LOG_RUNNING);
	B_LogEntry(TOPIC_HealHilda, TOPIC_HealHilda_1);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Heilungbringen
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_HEILUNGBRINGEN(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 31;
	condition		= DIA_Hilda_HEILUNGBRINGEN_Condition;
	information		= DIA_Hilda_HEILUNGBRINGEN_Info;
	description		= "I've got your medicine.";
};

func int DIA_Hilda_HEILUNGBRINGEN_Condition()
{
	if (Npc_HasItems(other, ItPo_HealHilda_MIS))
	{
		return TRUE;
	};
};

func void DIA_Hilda_HEILUNGBRINGEN_Info()
{
	AI_Output(other, self, "DIA_Hilda_HEILUNGBRINGEN_15_00"); //I've got your medicine.
	B_GiveInvItems(other, self, ItPo_HealHilda_MIS, 1);
	AI_Output(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_01"); //Really. Our society needs more people like you. Thank you so much.
	B_UseItem(self, ItPo_HealHilda_MIS);
	AI_Output(self, other, "DIA_Hilda_HEILUNGBRINGEN_17_02"); //I hope that these few coins are enough.
	CreateInvItems(self, ItMi_Gold, 50);
	B_GiveInvItems(self, other, ItMi_Gold, 50);
	MIS_HealHilda = LOG_SUCCESS;
	B_GivePlayerXP(XP_HealHilda);
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info disturb
///////////////////////////////////////////////////////////////////////
instance DIA_Hilda_DISTURB(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 32;
	condition		= DIA_Hilda_DISTURB_Condition;
	information		= DIA_Hilda_DISTURB_Info;
	permanent		= TRUE;
	description		= "How are you?";
};

func int DIA_Hilda_DISTURB_Condition()
{
	if ((MIS_HealHilda == LOG_SUCCESS)
	|| (
	((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	&& (Kapitel > 3)
	))
	{
		return TRUE;
	};
};

func void DIA_Hilda_DISTURB_Info()
{
	if (MIS_HealHilda == LOG_SUCCESS)
	{
		AI_Output(other, self, "DIA_Hilda_DISTURB_15_00"); //How are you?
		AI_Output(self, other, "DIA_Hilda_DISTURB_17_01"); //A little better already, thanks to you.
	}
	else
	{
		AI_Output(self, other, "DIA_Hilda_DISTURB_17_02"); //Not that great.
	};
};

// #####################################################################
// ##
// ##
// ## KAPITEL 4
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP4
// ************************************************************
instance DIA_Hilda_KAP4_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP4_EXIT_Condition;
	information		= DIA_Hilda_KAP4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP4_EXIT_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 5
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP5
// ************************************************************
instance DIA_Hilda_KAP5_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP5_EXIT_Condition;
	information		= DIA_Hilda_KAP5_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP5_EXIT_Condition()
{
	if (Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// #####################################################################
// ##
// ##
// ## KAPITEL 6
// ##
// ##
// #####################################################################

// ************************************************************
// 	  				   EXIT KAP6
// ************************************************************
instance DIA_Hilda_KAP6_EXIT(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 999;
	condition		= DIA_Hilda_KAP6_EXIT_Condition;
	information		= DIA_Hilda_KAP6_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Hilda_KAP6_EXIT_Condition()
{
	if (Kapitel == 6)
	{
		return TRUE;
	};
};

func void DIA_Hilda_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Hilda_PICKPOCKET(C_INFO)
{
	npc				= BAU_951_Hilda;
	nr				= 900;
	condition		= DIA_Hilda_PICKPOCKET_Condition;
	information		= DIA_Hilda_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40_Female;
};

func int DIA_Hilda_PICKPOCKET_Condition()
{
	C_Beklauen(26, 35);
};

func void DIA_Hilda_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
	Info_AddChoice(DIA_Hilda_PICKPOCKET, DIALOG_BACK, DIA_Hilda_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Hilda_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Hilda_PICKPOCKET_DoIt);
};

func void DIA_Hilda_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};

func void DIA_Hilda_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Hilda_PICKPOCKET);
};
