// ************************************************************
// 			  				   EXIT
// ************************************************************
instance DIA_Rupert_EXIT(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 999;
	condition		= DIA_Rupert_EXIT_Condition;
	information		= DIA_Rupert_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Rupert_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rupert_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Rupert_PICKPOCKET(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 900;
	condition		= DIA_Rupert_PICKPOCKET_Condition;
	information		= DIA_Rupert_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Rupert_PICKPOCKET_Condition()
{
	C_Beklauen(18, 10);
};

func void DIA_Rupert_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
	Info_AddChoice(DIA_Rupert_PICKPOCKET, DIALOG_BACK, DIA_Rupert_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rupert_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Rupert_PICKPOCKET_DoIt);
};

func void DIA_Rupert_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

func void DIA_Rupert_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rupert_PICKPOCKET);
};

// ************************************************************
// 			  				   Hello
// ************************************************************
instance DIA_Rupert_Hello(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_Hello_Condition;
	information		= DIA_Rupert_Hello_Info;
	important		= TRUE;
};

func int DIA_Rupert_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Hello_Info()
{
	AI_Output(self, other, "DIA_Rupert_Hello_03_00"); //Hallo Fremder!
	AI_Output(self, other, "DIA_Rupert_Hello_03_01"); //Du musst hungrig und durstig sein - kann ich dich vielleicht f�r meine Ware interessieren?
};

// ************************************************************
// 			  				 Zu Pal
// ************************************************************
instance DIA_Rupert_ZuPal(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_ZuPal_Condition;
	information		= DIA_Rupert_ZuPal_Info;
	description		= "Eigentlich bin ich auf dem Weg zu den Paladinen ...";
};

func int DIA_Rupert_ZuPal_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

func void DIA_Rupert_ZuPal_Info()
{
	AI_Output(other, self, "DIA_Rupert_ZuPal_15_00"); //Eigentlich bin ich auf dem Weg zu den Paladinen ...
	AI_Output(self, other, "DIA_Rupert_ZuPal_03_01"); //Da hast du schlechte Karten. Seit die Paladine sich im oberen Viertel breitgemacht haben, lassen sie kaum noch jemanden hinein.
};

// ************************************************************
// 			  			HelpMeIntoOV
// ************************************************************
instance DIA_Rupert_HelpMeIntoOV(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_HelpMeIntoOV_Condition;
	information		= DIA_Rupert_HelpMeIntoOV_Info;
	description		= "Kannst du mir helfen, ins obere Viertel zu kommen?";
};

func int DIA_Rupert_HelpMeIntoOV_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_ZuPal))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_HelpMeIntoOV_Info()
{
	AI_Output(other, self, "DIA_Rupert_HelpMeIntoOV_15_00"); //Kannst du mir helfen, ins obere Viertel zu kommen?
	AI_Output(self, other, "DIA_Rupert_HelpMeIntoOV_03_01"); //Ich? Nein, ich habe hier auch nicht viel zu melden!
	AI_Output(self, other, "DIA_Rupert_HelpMeIntoOV_03_02"); //Es gibt nur wenige Leute hier in der Unterstadt, die genug Einfluss haben, um dich an den Wachen vorbeizubringen.
	AI_Output(self, other, "DIA_Rupert_HelpMeIntoOV_03_03"); //Matteo, mein Boss, ist einer von ihnen. Vielleicht solltest du mal mit ihm reden.

	Log_CreateTopic(TOPIC_OV, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV, LOG_RUNNING);
	B_LogEntry(TOPIC_OV, TOPIC_OV_1);
	Log_AddEntry(TOPIC_OV, TOPIC_OV_2);
};

// ***************************************************************
//							WoMatteo
// ***************************************************************
instance DIA_Rupert_WoMatteo(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 1;
	condition		= DIA_Rupert_WoMatteo_Condition;
	information		= DIA_Rupert_WoMatteo_Info;
	description		= "Wo finde ich Matteo?";
};

func int DIA_Rupert_WoMatteo_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WoMatteo_Info()
{
	AI_Output(other, self, "DIA_Rupert_WoMatteo_15_00"); //Wo finde ich Matteo?
	AI_Output(self, other, "DIA_Rupert_WoMatteo_03_01"); //Du stehst direkt vor seinem Laden. Geh einfach rein. Er ist eigentlich immer da.

	if (Knows_Matteo == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader, TOPIC_CityTrader_8);
		Knows_Matteo = TRUE;
	};
};

// ***************************************************************
//							Wer hat Einflu�
// ***************************************************************
instance DIA_Rupert_WerEinfluss(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 2;
	condition		= DIA_Rupert_WerEinfluss_Condition;
	information		= DIA_Rupert_WerEinfluss_Info;
	description		= "Was ist mit den anderen einflussreichen B�rgern?";
};

func int DIA_Rupert_WerEinfluss_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_HelpMeIntoOV))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_WerEinfluss_Info()
{
	AI_Output(other, self, "DIA_Rupert_WerEinfluss_15_00"); //Was ist mit den anderen einflussreichen B�rgern?
	AI_Output(self, other, "DIA_Rupert_WerEinfluss_03_01"); //Die H�ndler und Handwerksmeister hier an der Hauptstra�e sind die wichtigsten Pers�nlichkeiten der Stadt.
	AI_Output(self, other, "DIA_Rupert_WerEinfluss_03_02"); //Du solltest versuchen, bei einem von ihnen als Lehrling angenommen zu werden - so wie ich.
	AI_Output(self, other, "DIA_Rupert_WerEinfluss_03_03"); //Seit ich bei Matteo arbeite, behandeln mich die Leute in der Stadt mit Respekt!

	B_LogEntry(TOPIC_OV, TOPIC_OV_3);
};

// ***************************************************************
//							Work
// ***************************************************************
instance DIA_Rupert_Work(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 3;
	condition		= DIA_Rupert_Work_Condition;
	information		= DIA_Rupert_Work_Info;
	description		= "Ich brauche Geld und ich bin auf der Suche nach Arbeit.";
};

func int DIA_Rupert_Work_Condition()
{
	if (hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Rupert_Work_Info()
{
	AI_Output(other, self, "DIA_Rupert_Work_15_00"); //Ich brauche Geld und ich bin auf der Suche nach Arbeit.
	AI_Output(self, other, "DIA_Rupert_Work_03_01"); //Ich hab geh�rt, Bosper hat �rger mit seinem Lieferanten. Sein Laden ist direkt gegen�ber.
	AI_Output(self, other, "DIA_Rupert_Work_03_02"); //Es hei�t, er zahlt ganz gut.
};

// ***************************************************************
//							YourOffer
// ***************************************************************
instance DIA_Rupert_YourOffer(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 4;
	condition		= DIA_Rupert_YourOffer_Condition;
	information		= DIA_Rupert_YourOffer_Info;
	description		= "Was hast du anzubieten?";
};

func int DIA_Rupert_YourOffer_Condition()
{
	return TRUE;
};

func void DIA_Rupert_YourOffer_Info()
{
	AI_Output(other, self, "DIA_Rupert_YourOffer_15_00"); //Was hast du anzubieten?
	AI_Output(self, other, "DIA_Rupert_YourOffer_03_01"); //Zurzeit hab ich nicht allzu viel Auswahl.
	if ((hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG))
	{
		AI_Output(self, other, "DIA_Rupert_YourOffer_03_02"); //Der verdammte Gro�bauer liefert nicht mehr und was von den kleinen H�fen kommt, reicht nicht aus, um den Bedarf der Stadt zu decken.
	};
};

// ************************************************************
//								Trade
// ************************************************************
instance DIA_Rupert_Trade(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 900;
	condition		= DIA_Rupert_Trade_Condition;
	information		= DIA_Rupert_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Zeig mir deine Ware";
};

func int DIA_Rupert_Trade_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Rupert_YourOffer))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Trade_Info()
{
	if (Npc_HasItems(self, itfo_cheese) < 5)
	{
		CreateInvItems(self, ItFo_cheese, 5);
	};

	AI_Output(other, self, "DIA_Rupert_Trade_15_00"); //Zeig mir deine Ware.
	if ((hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL))
	{
		AI_Output(self, other, "DIA_Rupert_Trade_03_01"); //Ich muss mich f�r meine bescheidene Auswahl entschuldigen. Ein Mann eurer Position ist sicher Besseres gewohnt.
	};
};

// ************************************************************
// 			  				 Bauernaufstand
// ************************************************************
instance DIA_Rupert_Bauernaufstand(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 4;
	condition		= DIA_Rupert_Bauernaufstand_Condition;
	information		= DIA_Rupert_Bauernaufstand_Info;
	description		= "Erz�hl mir mehr �ber den Bauernaufstand.";
};

func int DIA_Rupert_Bauernaufstand_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_YourOffer))
	&& (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Bauernaufstand_Info()
{
	AI_Output(other, self, "DIA_Rupert_Bauernaufstand_15_00"); //Erz�hl mir mehr �ber den Bauernaufstand.
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_01"); //Die Sache ist ganz einfach: Onar, der fette Gro�bauer, will keinen Tribut mehr an die Stadt zahlen.
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_02"); //Das muss man sich mal vorstellen! Wir sind im Krieg mit den Orks, und der Fettwanst will alles f�r sich haben!
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_03"); //Normalerweise greift die Stadtwache in solchen F�llen hart durch.
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_04"); //Aber jetzt kommt das Beste: Es hei�t, Onar hat sich S�ldner angeheuert, um sich die Truppen der Stadt vom Hals zu halten!
	AI_Output(self, other, "DIA_Rupert_Bauernaufstand_03_05"); //S�LDNER! Das Ganze wird noch in einem verdammten Krieg enden! Als ob EIN Krieg nicht reichen w�rde ...
};

// ***************************************************************
//							S�ldner
// ***************************************************************
instance DIA_Rupert_Mercs(C_INFO)
{
	npc				= VLK_458_Rupert;
	nr				= 4;
	condition		= DIA_Rupert_Mercs_Condition;
	information		= DIA_Rupert_Mercs_Info;
	description		= "Was wei�t du �ber Onars S�ldner?";
};

func int DIA_Rupert_Mercs_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Rupert_Bauernaufstand))
	&& (hero.guild != GIL_SLD)
	&& (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Rupert_Mercs_Info()
{
	AI_Output(other, self, "DIA_Rupert_Mercs_15_00"); //Was wei�t du �ber Onars S�ldner?
	AI_Output(self, other, "DIA_Rupert_Mercs_03_01"); //Ich hab geh�rt, die meisten von ihnen sind ehemalige Str�flinge aus der Minenkolonie.
	AI_Output(self, other, "DIA_Rupert_Mercs_03_02"); //Und ihr Anf�hrer soll 'ne gro�e Nummer beim K�nig gewesen sein - ein General oder so was - den sie als Verr�ter eingelocht haben!
	AI_Output(self, other, "DIA_Rupert_Mercs_03_03"); //Schlimme Zeiten sind das!
};
