// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_BAU_16_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_BAU_16_EXIT_Condition;
	information		= DIA_BAU_16_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_BAU_16_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_BAU_16_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_BAU_16_JOIN_Condition;
	information		= DIA_BAU_16_JOIN_Info;
	permanent		= TRUE;
	description		= "Ich will mehr �ber die S�ldner wissen!";
};

func int DIA_BAU_16_JOIN_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_BAU_16_JOIN_Info()
{
	AI_Output(other, self, "DIA_BAU_16_JOIN_15_00"); //Ich will mehr �ber die S�ldner wissen!
	AI_Output(self, other, "DIA_BAU_16_JOIN_16_01"); //Sie lungern den ganzen Tag auf dem Hof rum, pr�geln sich hin und wieder mal und finden das auch noch lustig.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_BAU_16_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_BAU_16_PEOPLE_Condition;
	information		= DIA_BAU_16_PEOPLE_Info;
	permanent		= TRUE;
	description		= "Wer hat hier das Sagen?";
};

func int DIA_BAU_16_PEOPLE_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_BAU_16_PEOPLE_15_00"); //Wer hat hier das Sagen?
	AI_Output(self, other, "DIA_BAU_16_PEOPLE_16_01"); //Wenn du mich fragst, sind das die S�ldner.
	AI_Output(self, other, "DIA_BAU_16_PEOPLE_16_02"); //Onar bezahlt sie, aber die meisten von ihnen machen, was sie wollen.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_BAU_16_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_BAU_16_LOCATION_Condition;
	information		= DIA_BAU_16_LOCATION_Info;
	permanent		= TRUE;
	description		= "Was kannst du mir �ber die Gegend hier erz�hlen?";
};

func int DIA_BAU_16_LOCATION_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_LOCATION_Info()
{
	AI_Output(other, self, "DIA_BAU_16_LOCATION_15_00"); //Was kannst du mir �ber die Gegend hier erz�hlen?
	AI_Output(self, other, "DIA_BAU_16_LOCATION_16_01"); //Es gibt drei H�fe hier. Onars im Osten und Sekobs im Norden das Tals.
	AI_Output(self, other, "DIA_BAU_16_LOCATION_16_02"); //Im S�dwesten gibt es einen Aufgang zur Hochebene. Dort liegt Bengars Hof.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_BAU_16_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_BAU_16_STANDARD_Condition;
	information		= DIA_BAU_16_STANDARD_Info;
	permanent		= TRUE;
	description		= "Was gibt's Neues?";
};

func int DIA_BAU_16_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_BAU_16_STANDARD_Info()
{
	AI_Output(other, self, "DIA_BAU_16_STANDARD_15_00"); //Was gibt's Neues?

	if (Kapitel == 1)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_01"); //Die Truppen aus der Stadt holen uns nicht mehr Vieh und Ernte weg! Wir spielen das Spiel nicht mehr mit, wir k�nnen uns jetzt selbst verteidigen!
	};

	if (Kapitel == 2)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_02"); //Es hei�t, es w�rde sich eine Armee im Minental sammeln. Bald werden sie hier sein.
	};

	if (Kapitel == 3)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_03"); //Ich habe geh�rt, dass es im Minental Drachen geben soll. Kaum zu glauben.
	};

	if (Kapitel == 4)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_04"); //Einige der S�ldner sind abgezogen. Ich wei� nicht, ob das gut oder schlecht ist.
	};

	if (Kapitel >= 5)
	{
		AI_Output(self, other, "DIA_BAU_16_STANDARD_16_05"); //Die Paladine ins Minental. Was soll das eigentlich?
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_BAU_16(var C_Npc slf)
{
	DIA_BAU_16_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_BAU_16_STANDARD.npc = Hlp_GetInstanceID(slf);
};
