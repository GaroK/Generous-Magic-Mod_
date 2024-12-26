// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_PAL_4_EXIT(C_INFO)
{
	nr				= 999;
	condition		= DIA_PAL_4_EXIT_Condition;
	information		= DIA_PAL_4_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_PAL_4_EXIT_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// *************************************************************************
// 									JOIN
// *************************************************************************
instance DIA_PAL_4_JOIN(C_INFO)
{
	nr				= 4;
	condition		= DIA_PAL_4_JOIN_Condition;
	information		= DIA_PAL_4_JOIN_Info;
	permanent		= TRUE;
	description		= "Wie werde ich Paladin?";
};

func int DIA_PAL_4_JOIN_Condition()
{
	if (other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_JOIN_Info()
{
	AI_Output(other, self, "DIA_PAL_4_JOIN_15_00"); //Wie werde ich Paladin?
	AI_Output(self, other, "DIA_PAL_4_JOIN_04_01"); //Wenn es dir wirklich ernst ist, solltest du dich in den Dienst der Paladine stellen.
	AI_Output(self, other, "DIA_PAL_4_JOIN_04_02"); //Geh zur Kaserne und rede mit Lord Andre. Lass dich in die Miliz aufnehmen.
	AI_Output(self, other, "DIA_PAL_4_JOIN_04_03"); //Vielleicht bekommst du dann eine Chance, dich als w�rdig zu erweisen.
};

// *************************************************************************
// 									PEOPLE
// *************************************************************************
instance DIA_PAL_4_PEOPLE(C_INFO)
{
	nr				= 3;
	condition		= DIA_PAL_4_PEOPLE_Condition;
	information		= DIA_PAL_4_PEOPLE_Info;
	permanent		= TRUE;
	description		= "Wer hat hier das Kommando?";
};

func int DIA_PAL_4_PEOPLE_Condition()
{
	if (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_PEOPLE_Info()
{
	AI_Output(other, self, "DIA_PAL_4_PEOPLE_15_00"); //Wer hat hier das Kommando?
	AI_Output(self, other, "DIA_PAL_4_PEOPLE_04_01"); //Lord Hagen ist der Oberbefehlshaber �ber alle Truppen auf der Insel. Er hat auch - solange wir hier sind - das Amt des Statthalters inne.
	AI_Output(self, other, "DIA_PAL_4_PEOPLE_04_02"); //Aber er ist sehr besch�ftigt. Wenn du etwas zu kl�ren hast, geh zur Kaserne und rede mit Lord Andre.
};

// *************************************************************************
// 									LOCATION
// *************************************************************************
instance DIA_PAL_4_LOCATION(C_INFO)
{
	nr				= 2;
	condition		= DIA_PAL_4_LOCATION_Condition;
	information		= DIA_PAL_4_LOCATION_Info;
	permanent		= TRUE;
	description		= "Was macht ihr Paladine hier in Khorinis?";
};

func int DIA_PAL_4_LOCATION_Condition()
{
	if (Kapitel == 1)
	{
		return TRUE;
	};
};

func void DIA_PAL_4_LOCATION_Info()
{
	AI_Output(other, self, "DIA_PAL_4_LOCATION_15_00"); //Was macht ihr Paladine hier in Khorinis?
	AI_Output(self, other, "DIA_PAL_4_LOCATION_04_01"); //Ich bin nicht befugt, dir das zu sagen.
};

// *************************************************************************
// 									NEWS
// *************************************************************************
instance DIA_PAL_4_STANDARD(C_INFO)
{
	nr				= 1;
	condition		= DIA_PAL_4_STANDARD_Condition;
	information		= DIA_PAL_4_STANDARD_Info;
	permanent		= TRUE;
	description		= "Was gibt's Neues?";
};

func int DIA_PAL_4_STANDARD_Condition()
{
	return TRUE;
};

func void DIA_PAL_4_STANDARD_Info()
{
	AI_Output(other, self, "DIA_PAL_4_STANDARD_15_00"); //Was gibt's Neues?

	if ((other.guild == GIL_PAL)
	|| (other.guild == GIL_KDF))
	{
		if (Kapitel <= 4)
		{
			if (MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self, other, "DIA_PAL_4_STANDARD_04_01"); //Jetzt, da wir wissen, dass wir es mit Drachen zu tun haben, wird unser Kommandant sicherlich bald etwas unternehmen.
			}
			else
			{
				AI_Output(self, other, "DIA_PAL_4_STANDARD_04_02"); //Wir haben noch immer keine Nachricht von unserem Trupp im Minental. Das ist sehr beunruhigend.
			};
		};

		if (Kapitel >= 5)
		{
			AI_Output(self, other, "DIA_PAL_4_STANDARD_04_03"); //Innos sei Dank! Die Bedrohung der Drachen ist abgewendet. Jetzt m�ssen wir uns nur noch um die Orks k�mmern, um an das Erz zu kommen.
		};
	}
	else // KEIN Paladin
	{
		AI_Output(self, other, "DIA_PAL_4_STANDARD_04_04"); //Ich habe keine Zeit, mich mit den Ger�chten, die hier in der Stadt erz�hlt werden, zu befassen.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

func void B_AssignAmbientInfos_PAL_4(var C_Npc slf)
{
	DIA_PAL_4_EXIT.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_JOIN.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_PEOPLE.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_LOCATION.npc = Hlp_GetInstanceID(slf);
	DIA_PAL_4_STANDARD.npc = Hlp_GetInstanceID(slf);
};
