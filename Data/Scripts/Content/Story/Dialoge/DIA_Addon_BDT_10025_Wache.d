// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10025_Wache_EXIT(C_INFO)
{
	npc				= BDT_10025_Addon_Wache;
	nr				= 999;
	condition		= DIA_Addon_10025_Wache_EXIT_Condition;
	information		= DIA_Addon_10025_Wache_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_10025_Wache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_10025_Wache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_10025_Wache_Hi(C_INFO)
{
	npc				= BDT_10025_Addon_Wache;
	nr				= 2;
	condition		= DIA_Addon_10025_Wache_Hi_Condition;
	information		= DIA_Addon_10025_Wache_Hi_Info;
	permanent		= TRUE;
	description		= "Wie sieht's aus?";
};

func int DIA_Addon_10025_Wache_Hi_Condition()
{
	return TRUE;
};

func void DIA_Addon_10025_Wache_Hi_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_10025_Wache_Hi_15_00"); //Wie sieht's aus?
	AI_Output(self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_01"); //Ich koche hier leckeren Eintopf f�r die Buddler und die Wachen.

	if (Sklaven_Flucht == FALSE)
	{
		AI_Output(self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_02"); //Aber die Sklaven - die kriegen nichts. H�chstens mal etwas schales Wasser und altes Brot.
		AI_Output(self, other, "DIA_Addon_BDT_10025_Wache_Hi_07_03"); //Das kann diesen Typen aus der Stadt nicht schaden.
	};
};
