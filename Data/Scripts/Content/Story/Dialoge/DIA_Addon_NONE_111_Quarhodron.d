///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_EXIT(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 999;
	condition		= DIA_Addon_Quarhodron_EXIT_Condition;
	information		= DIA_Addon_Quarhodron_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Quarhodron_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Quarhodron_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Hello(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 5;
	condition		= DIA_Addon_Quarhodron_Hello_Condition;
	information		= DIA_Addon_Quarhodron_Hello_Info;
	permanent		= TRUE;
	important		= TRUE;
};

var int DIA_Addon_Quarhodron_Hello_NoPerm;
func int DIA_Addon_Quarhodron_Hello_Condition()
{
	if ((Npc_IsInState(self, ZS_Talk))
	&& (DIA_Addon_Quarhodron_Hello_NoPerm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_Info()
{
	if ((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	|| (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE))
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_00"); //Why do you disturb my rest, guardian?
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_01"); //(angry) Tell me, what do you desire?

		Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "What is there in the temple of Adanos?", DIA_Addon_Quarhodron_Hello_schwert);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "Someone has forced his way into the temple of Adanos.", DIA_Addon_Quarhodron_Hello_raven);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "Grant me access to the temple of Adanos.", DIA_Addon_Quarhodron_Hello_tempel);
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "The land is afflicted with earthquakes.", DIA_Addon_Quarhodron_Hello_erdbeben);
		DIA_Addon_Quarhodron_Hello_NoPerm = TRUE;
		Npc_RemoveInvItems(hero, ItWr_Addon_SUMMONANCIENTGHOST, 1); // Joly: sonst gammelt das ding unnÃƒÂ¼tz herum.
		SC_TalkedToGhost = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_02"); //Bengla anthani, Osiri?
		B_Say(other, self, "$CANTUNDERSTANDTHIS");
		AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_11_03"); //(loudly) Bengla anthani?
		AI_StopProcessInfos(self);
	};
};

var int DIA_Addon_Quarhodron_Hello_ChoiceCounter;
var int B_Quarhodron_Hello_KommZumPunkt_OneTime;
func void B_Quarhodron_Hello_KommZumPunkt()
{
	if ((DIA_Addon_Quarhodron_Hello_ChoiceCounter >= 3)
	&& (B_Quarhodron_Hello_KommZumPunkt_OneTime == FALSE))
	{
		Info_AddChoice(DIA_Addon_Quarhodron_Hello, "The praised wisdom of the ancestors is truly overwhelming.", DIA_Addon_Quarhodron_Hello_frech);
		B_Quarhodron_Hello_KommZumPunkt_OneTime = TRUE;
	};
};

func void DIA_Addon_Quarhodron_Hello_erdbeben()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_erdbeben_15_00"); //The land is plagued by earthquakes. We must do something or the entire island will sink into the sea.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_01"); //There is nothing left for us to do.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_erdbeben_11_02"); //The wrath of Adanos has fallen upon Jharkendar to punish the unbelievers.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_raven()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_00"); //Someone has forced his way into the temple of Adanos.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_raven_11_01"); //Nonsense. I myself sealed the door. It is impossible to pass.
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_raven_15_02"); //Indeed?
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_tempel()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_tempel_15_00"); //Grant me access to the temple of Adanos.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_tempel_11_01"); //The temple will remain closed for all eternity. Thus did we in the council decide.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_schwert()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_schwert_15_00"); //What is there in the temple of Adanos?
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_schwert_11_01"); //My greatest sorrow, my greatest disappointment.
	DIA_Addon_Quarhodron_Hello_ChoiceCounter = (DIA_Addon_Quarhodron_Hello_ChoiceCounter + 1);
	B_Quarhodron_Hello_KommZumPunkt();
};

func void DIA_Addon_Quarhodron_Hello_frech()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Hello_frech_15_00"); //The praised wisdom of the ancestors is truly overwhelming.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_01"); //A man of your standing does not speak to me thus.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_02"); //I cannot free myself of the impression that you are not the one you pretend to be.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_03"); //If you require my aid, you must first prove yourself to me.
	AI_Output(self, other, "DIA_Addon_Quarhodron_Hello_frech_11_04"); //Answer my questions, so that I may be sure that I do not reveal myself to strangers.

	Log_CreateTopic(TOPIC_Addon_Quarhodron, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_3);

	Info_ClearChoices(DIA_Addon_Quarhodron_Hello);
};

///////////////////////////////////////////////////////////////////////
//	Info Fragen
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_Fragen(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 5;
	condition		= DIA_Addon_Quarhodron_Fragen_Condition;
	information		= DIA_Addon_Quarhodron_Fragen_Info;
	permanent		= TRUE;
	description		= "Ask away.";
};

func int DIA_Addon_Quarhodron_Fragen_Condition()
{
	if (QuarhodronIstZufrieden == FALSE)
	{
		return TRUE;
	};
};

var int Quarhodrons_NextQuestion;
var int QuarhodronIstZufrieden;
var int Quarhodrons_RichtigeAntworten;
const int Quarhodron_AlleFragenGestellt = 100;
var int B_Quarhodron_Fragen_ChoicesOneTime;

func void B_Quarhodron_TestFailed()
{
	AI_Output(self, other, "DIA_Addon_Quarhodron_TestFailed_11_00"); //Your wrong answers reveal your evil intentions.
	AI_Output(self, other, "DIA_Addon_Quarhodron_TestFailed_11_01"); //I shall not help you.
	AI_StopProcessInfos(self);
};

func void B_Quarhodron_Fragen_Choices()
{
	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_4);

	if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		if ((Quarhodrons_NextQuestion == 1)
		&& (Quarhodrons_RichtigeAntworten == 0))
		{
			AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_00"); //I do not believe you.
			AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_01"); //I think you should only return when you have decided to tell me the truth.
			AI_StopProcessInfos(self);
		}
		else
		{
			if (Quarhodrons_NextQuestion == 1)
			{
				if (B_Quarhodron_Fragen_ChoicesOneTime == FALSE)
				{
					AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_02"); //(thinking) The abilities of a guardian of the dead would have allowed you to waken me, that is true.
					AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_03"); //If you are truly the one you claim to be, you will be able to answer all of my questions.
					AI_Output(self, other, "DIA_Addon_Quarhodron_Add_11_00"); //Except for one...

					B_Quarhodron_Fragen_ChoicesOneTime = TRUE;
				};

				Quarhodrons_NextQuestion = 2;
			};

			if (Quarhodrons_NextQuestion == 7)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_04"); //Who sealed the portal to guard the world from Evil?
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_5);
				Quarhodrons_NextQuestion = Quarhodron_AlleFragenGestellt;
			}
			else if (Quarhodrons_NextQuestion == 6)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_05"); //Who alleviates suffering and attends to the ill?
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_6);
				Quarhodrons_NextQuestion = 7;
			}
			else if (Quarhodrons_NextQuestion == 5)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_06"); //Who has the final word in the Council of Five?
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_7);
				Quarhodrons_NextQuestion = 6;
			}
			else if (Quarhodrons_NextQuestion == 4)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_07"); //Who brought the Evil upon us?
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_8);
				Quarhodrons_NextQuestion = 5;
			}
			else if (Quarhodrons_NextQuestion == 3)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_08"); //Who can give me a direct order?
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_9);
				Quarhodrons_NextQuestion = 4;
			}
			else if (Quarhodrons_NextQuestion == 2)
			{
				AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_Choices_11_09"); //Who once protected the people of Jharkendar from enemy attacks?
				B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_10);
				Quarhodrons_NextQuestion = 3;
			};

			Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);

			if (Quarhodrons_NextQuestion >= Quarhodron_AlleFragenGestellt)
			{
				Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "There's no way I could know that.", DIA_Addon_Quarhodron_Fragen_NoPlan);
			}
			else
			{
				Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "There's no way I could know that.", DIA_Addon_Quarhodron_Fragen_NoPlan);
			};

			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "The scholars.", DIA_Addon_Quarhodron_Fragen_gele);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "The guardians of the dead.", DIA_Addon_Quarhodron_Fragen_totenw);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "The priests.", DIA_Addon_Quarhodron_Fragen_prie);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "The warrior caste.", DIA_Addon_Quarhodron_Fragen_warr);
			Info_AddChoice(DIA_Addon_Quarhodron_Fragen, "The healers.", DIA_Addon_Quarhodron_Fragen_heiler);
		};
	};
};

var int DIA_Addon_Quarhodron_Fragen_Info_OneTime;

func void DIA_Addon_Quarhodron_Fragen_Info()
{
	Quarhodrons_NextQuestion = 0;
	Quarhodrons_RichtigeAntworten = 0;
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_15_00"); //Ask away.

	if (DIA_Addon_Quarhodron_Fragen_Info_OneTime == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_11_01"); //I am Quarhodron, the old warlord of Jharkendar.
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_11_02"); //You have woken me.

		DIA_Addon_Quarhodron_Fragen_Info_OneTime = TRUE;
	};

	AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_11_03"); //To which caste of Jharkendar do you belong?

	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_warr()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_warr_15_00"); //The warrior caste.
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 3) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	if (Quarhodrons_NextQuestion == 5) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_prie()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_prie_15_00"); //The priests.
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 4) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_gele()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_gele_15_00"); //The scholars.
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 6) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_totenw()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_totenw_15_00"); //The guardians of the dead.
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_heiler()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_heiler_15_00"); //The healers.
	if (Quarhodrons_NextQuestion == 0) { Quarhodrons_NextQuestion = 1; };
	if (Quarhodrons_NextQuestion == 7) { Quarhodrons_RichtigeAntworten = (Quarhodrons_RichtigeAntworten + 1); };
	B_Quarhodron_Fragen_Choices();
};

func void DIA_Addon_Quarhodron_Fragen_NoPlan()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_Fragen_NoPlan_15_00"); //I don't know.

	if ((Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	&& (Quarhodrons_RichtigeAntworten >= 6))
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_01"); //Good. I trust you and shall grant you my aid.
		QuarhodronIstZufrieden = TRUE;
		Info_ClearChoices(DIA_Addon_Quarhodron_Fragen);
	}
	else if (Quarhodrons_NextQuestion == Quarhodron_AlleFragenGestellt)
	{
		B_Quarhodron_TestFailed();
	}
	else
	{
		AI_Output(self, other, "DIA_Addon_Quarhodron_Fragen_NoPlan_11_02"); //Then do not waste my time.
		AI_StopProcessInfos(self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GibMirKey
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Quarhodron_GibMirKey(C_INFO)
{
	npc				= NONE_ADDON_111_Quarhodron;
	nr				= 5;
	condition		= DIA_Addon_Quarhodron_GibMirKey_Condition;
	information		= DIA_Addon_Quarhodron_GibMirKey_Info;
	description		= "(demand the key to the temple)";
};

func int DIA_Addon_Quarhodron_GibMirKey_Condition()
{
	if (QuarhodronIstZufrieden == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Quarhodron_GibMirKey_Info()
{
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_00"); //Now listen here. A truly evil fellow has gained access to the temple of Adanos.
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_01"); //If you don't let me into the temple right now, it will probably be too late and everything will go down the drain.
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_02"); //That cannot be! The high priest KHARDIMON and I are the only ones in Jharkendar who know how to open the gate to Adanos' temple.
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_03"); //Well. Then your pal KHARDIMON must have blabbed.
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_04"); //I'm telling you, the gate was open. I saw it myself.
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_05"); //Well. There is truth in your voice. I shall no longer doubt your words.
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_06"); //I should hope so.
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_07"); //Take, then, the password. It is written on this stone tablet. Speak the words at the sealed gate of the temple and it will open.
	CreateInvItems(self, ItMi_TempelTorKey, 1);
	B_GiveInvItems(self, other, ItMi_TempelTorKey, 1);
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_08"); //(already half dead) My time is done. Alas, I can no longer help you.
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_09"); //(already half dead) But remember: beware the chambers of Adanos. Else your death is certain.
	AI_Output(other, self, "DIA_Addon_Quarhodron_GibMirKey_15_10"); //Wait. What ABOUT the chambers?
	AI_Output(self, other, "DIA_Addon_Quarhodron_GibMirKey_11_11"); //(already half dead) My strength is failing. Farewell. We shall meet again in the realm of the dead.
	AI_StopProcessInfos(self);

	B_LogEntry(TOPIC_Addon_Quarhodron, TOPIC_Addon_Quarhodron_11);

	Log_CreateTopic(TOPIC_Addon_Kammern, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Kammern, LOG_RUNNING);
	B_LogEntry(TOPIC_Addon_Kammern, TOPIC_Addon_Kammern_1);

	Ghost_SCKnowsHow2GetInAdanosTempel = TRUE;
};
