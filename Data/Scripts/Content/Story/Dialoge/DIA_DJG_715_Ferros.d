//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_DJG_715_Ferros_EXIT(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 999;
	condition		= DIA_DJG_715_Ferros_EXIT_Condition;
	information		= DIA_DJG_715_Ferros_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
instance DIA_DJG_715_Ferros_Hello(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 4;
	condition		= DIA_DJG_715_Ferros_Hello_Condition;
	information		= DIA_DJG_715_Ferros_Hello_Info;
	description		= "Wo kommst du her?";
};

func int DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_Hello_15_00"); //Wo kommst du her?
	AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_01"); //Vom Festland. Meine Leute und ich sind hierher geflohen.
	AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_02"); //Die Lage dort wird immer schlimmer, die Orks hinterlassen nur noch niedergebrannte D�rfer.
	AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_03"); //Der K�nig hat keine Kontrolle mehr �ber sein Reich.

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_DJG_715_Ferros_Hello_01_04"); //Ihr Paladine habt versagt, wenn du mich fragst.
	};
};

//*********************************************************************
//	Info Friends
//*********************************************************************
instance DIA_DJG_715_Ferros_Friends(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 5;
	condition		= DIA_DJG_715_Ferros_Friends_Condition;
	information		= DIA_DJG_715_Ferros_Friends_Info;
	description		= "Wo sind deine Leute jetzt?";
};

func int DIA_DJG_715_Ferros_Friends_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_Friends_15_00"); //Wo sind deine Leute jetzt?
	AI_Output(self, other, "DIA_DJG_715_Ferros_Friends_01_01"); //Ich hab mich von ihnen getrennt.
	AI_Output(self, other, "DIA_DJG_715_Ferros_Friends_01_02"); //Sie dachten, sie k�nnen sich alles nehmen, was sie wollen, auch wenn es ihnen nicht geh�rt. Ohne mich.
};

//*********************************************************************
//	Info War
//*********************************************************************
instance DIA_DJG_715_Ferros_War(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 6;
	condition		= DIA_DJG_715_Ferros_War_Condition;
	information		= DIA_DJG_715_Ferros_War_Info;
	description		= "Wei�t du noch mehr �ber den Krieg?";
};

func int DIA_DJG_715_Ferros_War_Condition()
{
	if (Npc_KnowsInfo(other, DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_War_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_War_15_00"); //Wei�t du noch mehr �ber den Krieg?

	if (hero.guild == GIL_PAL)
	{
		AI_Output(self, other, "DIA_DJG_715_Ferros_War_01_01"); //Schon lange nicht mehr bei deinem K�nig gewesen, was?
	};

	AI_Output(self, other, "DIA_DJG_715_Ferros_War_01_02"); //Die Orks sind vor der Hauptstadt. Aber ob sie schon gefallen ist, wei� ich nicht.
	AI_Output(self, other, "DIA_DJG_715_Ferros_War_01_03"); //Das letzte, was ich geh�rt habe, ist, dass der K�nig tot sei. Ich glaube aber nicht daran.
};

//*********************************************************************
//	Was machst du hier in der Burg?
//*********************************************************************
instance DIA_DJG_715_Ferros_OldCamp(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 7;
	condition		= DIA_DJG_715_Ferros_OldCamp_Condition;
	information		= DIA_DJG_715_Ferros_OldCamp_Info;
	description		= "Was machst du hier in der Burg?";
};

func int DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_15_00"); //Was machst du hier in der Burg?
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_01_01"); //Ich habe von den Drachen geh�rt und wollte helfen, sie zu bek�mpfen.
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_01_02"); //Leider habe ich mein Schwert verloren, als ich durch die Orks geschlichen bin. Jetzt sitze ich hier fest.
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_01_03"); //Ohne Schwert komme ich hier nicht wieder weg, und die Schwerter, die ich hier kaufen kann, sind der letzte Schrott.

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, "Viel Gl�ck bei der Suche.", DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, "Was kriege ich, wenn ich dir ein gutes Schwert besorge?", DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, "Ich werde dein Schwert finden.", DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem(ItMW_1H_FerrosSword_Mis, "FP_OW_ITEM_08");
	MIS_FerrosSword = LOG_RUNNING;

	Log_CreateTopic(TOPIC_FerrosSword, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword, LOG_RUNNING);
	B_LogEntry(TOPIC_FerrosSword, TOPIC_FerrosSword_1);
};

func void DIA_DJG_715_Ferros_OldCamp_No()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_No_15_00"); //Viel Gl�ck bei der Suche.
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_No_01_01"); //Ich frag mich wirklich, warum ich �berhaupt hierher gekommen bin.

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Price()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_Price_15_00"); //Was kriege ich, wenn ich dir ein gutes Schwert besorge?
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_Price_01_01"); //Ich kann dir leider nichts geben. Ich hab mein letztes Geld f�r das Schwert ausgegeben.

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Yes()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_OldCamp_Yes_15_00"); //Ich werde dein Schwert finden.
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_Yes_01_01"); //Das w�r' Klasse. Am besten suchst du auf der hohen Klippe im S�den danach.
	AI_Output(self, other, "DIA_DJG_715_Ferros_OldCamp_Yes_01_02"); //Dort, wo die Orkzelte stehen, habe ich es vermutlich verloren.
	B_LogEntry(TOPIC_FerrosSword, TOPIC_FerrosSword_2);

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

//*********************************************************************
//	Info FerrosAnySword
//*********************************************************************
instance DIA_DJG_715_Ferros_FerrosAnySword(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 6;
	condition		= DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information		= DIA_DJG_715_Ferros_FerrosAnySword_Info;
	description		= "Vielleicht hab ich ein anderes Schwert f�r dich.";
};

func int DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	if ((MIS_FerrosSword == LOG_RUNNING)
	&& ((Npc_HasItems(other, ItMW_1H_Special_01) >= 1)
	|| (Npc_HasItems(other, ItMW_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00"); //Vielleicht hab ich ein anderes Schwert f�r dich.

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);

	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, DIALOG_BACK, DIA_DJG_715_Ferros_FerrosAnySword_Back);

	if (Npc_HasItems(other, ItMW_1H_Special_01) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, NAME_ItMw_1H_Special_01, DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};

	if (Npc_HasItems(other, ItMW_1H_Special_02) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, NAME_ItMw_1H_Special_02, DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Back()
{
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void B_Ferros_FerrosAnySword_Give()
{
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00"); //Das ist eine gute Klinge. Eine ausgezeichnete Arbeit.
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01"); //Bist du sicher, dass du sie mir einfach geben willst?
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade()
{
	B_Ferros_FerrosAnySword_Give();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "Nein, die brauche ich selbst.", DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "Ja, nimm sie!", DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade()
{
	B_Ferros_FerrosAnySword_Give();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "Nein, die brauche ich selbst.", DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, "Ja, nimm sie!", DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

func void B_Ferros_FerrosAnySword_Yes1()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00"); //Ja, nimm sie.
};

func void B_Ferros_FerrosAnySword_Yes2()
{
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00"); //Danke, ich stehe in deiner Schuld.
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01"); //Als Dank werde ich dir zeigen, wie du mit ein paar Tricks deine Kraft und dein Geschick im Kampf besser nutzen kannst.

	Log_CreateTopic(TOPIC_Teacher, LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, TOPIC_Teacher_4);
};

func void B_Ferros_FerrosAnySword_No()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00"); //Nein, die brauche ich selbst.
	AI_Output(self, other, "DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01"); //Kann ich verstehen.
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other, self, ItMW_1H_Special_01, 1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other, self, ItMW_1H_Special_02, 1);
	B_Ferros_FerrosAnySword_Yes2();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No()
{
	B_Ferros_FerrosAnySword_No();

	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

//*********************************************************************
//	Info FerrosHisSword
//*********************************************************************
instance DIA_DJG_715_Ferros_FerrosHisSword(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 6;
	condition		= DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information		= DIA_DJG_715_Ferros_FerrosHisSword_Info;
	description		= "Ich hab dein Schwert gefunden.";
};

func int DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	if ((MIS_FerrosSword == LOG_RUNNING)
	&& (Npc_HasItems(other, ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output(other, self, "DIA_DJG_715_Ferros_FerrosHisSword_15_00"); //Ich hab dein Schwert gefunden.
	B_GiveInvItems(other, self, ItMw_1h_FerrosSword_Mis, 1);
	B_Ferros_FerrosAnySword_Yes2();
	MIS_FerrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

//*******************************************
//	TechPlayer
//*******************************************
instance DIA_Ferros_Teach(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 1;
	condition		= DIA_Ferros_Teach_Condition;
	information		= DIA_Ferros_Teach_Info;
	permanent		= TRUE;
	description		= "Zeig mir, wie ich meine F�higkeiten verbessere.";
};

func int DIA_Ferros_Teach_Condition()
{
	if (MIS_FerrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ferros_Teach_Info()
{
	AI_Output(other, self, "DIA_Ferros_Teach_15_00"); //Zeig mir, wie ich meine F�higkeiten verbessere.

	if (MIS_OCGateOpen == TRUE)
	{
		AI_Output(self, other, "DIA_Ferros_Teach_01_01"); //Nach diesem Orkangriff mach ich gar nix mehr. Bin froh, dass ich noch lebe, Mann.
	}
	else
	{
		AI_Output(self, other, "DIA_Ferros_Teach_01_02"); //Ein guter K�mpfer muss lernen, seine F�higkeiten direkt auf seine Waffe zu �bertragen.

		Info_ClearChoices(DIA_Ferros_Teach);
		Info_AddChoice(DIA_Ferros_Teach, DIALOG_BACK, DIA_Ferros_Teach_Back);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ferros_Teach_STR_1);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ferros_Teach_STR_5);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ferros_Teach_DEX_1);
		Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ferros_Teach_DEX_5);
	};
};

func void DIA_Ferros_Teach_Back()
{
	Info_ClearChoices(DIA_Ferros_Teach);
};

func void DIA_Ferros_Teach_STR_1()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 1, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR1, B_GetLearnCostAttribute(other, ATR_STRENGTH)), DIA_Ferros_Teach_STR_1);
};

func void DIA_Ferros_Teach_STR_5()
{
	B_TeachAttributePoints(self, other, ATR_STRENGTH, 5, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnSTR5, B_GetLearnCostAttribute(other, ATR_STRENGTH) * 5), DIA_Ferros_Teach_STR_5);
};

func void DIA_Ferros_Teach_DEX_1()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 1, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX1, B_GetLearnCostAttribute(other, ATR_DEXTERITY)), DIA_Ferros_Teach_DEX_1);
};

func void DIA_Ferros_Teach_DEX_5()
{
	B_TeachAttributePoints(self, other, ATR_DEXTERITY, 5, T_MED);
	Info_AddChoice(DIA_Ferros_Teach, B_BuildLearnString(PRINT_LearnDEX5, B_GetLearnCostAttribute(other, ATR_DEXTERITY) * 5), DIA_Ferros_Teach_DEX_5);
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Ferros_AllDragonsDead(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 5;
	condition		= DIA_Ferros_AllDragonsDead_Condition;
	information		= DIA_Ferros_AllDragonsDead_Info;
	description		= "Alle Drachen sind tot.";
};

func int DIA_Ferros_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Ferros_AllDragonsDead_15_00"); //Alle Drachen sind tot.
	AI_Output(self, other, "DIA_Ferros_AllDragonsDead_01_01"); //Gut gemacht, wenn wir mehr Leute wie dich h�tten, dann w�re es wahrscheinlich nie so weit gekommen.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Ferros_PICKPOCKET(C_INFO)
{
	npc				= DJG_715_Ferros;
	nr				= 900;
	condition		= DIA_Ferros_PICKPOCKET_Condition;
	information		= DIA_Ferros_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_60;
};

func int DIA_Ferros_PICKPOCKET_Condition()
{
	C_Beklauen(56, 75);
};

func void DIA_Ferros_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
	Info_AddChoice(DIA_Ferros_PICKPOCKET, DIALOG_BACK, DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ferros_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};
