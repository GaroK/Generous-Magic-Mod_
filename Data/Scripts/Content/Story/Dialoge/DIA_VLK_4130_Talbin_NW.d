

//#####################################################################
//##
//##
//##				TALBIN_NW
//##
//##
//#####################################################################
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Talbin_NW_EXIT   (C_INFO)
{
	npc         = VLK_4132_Talbin_NW;
	nr          = 999;
	condition   = DIA_Talbin_EXIT_Condition;
	information = DIA_Talbin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

 
///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW		(C_INFO)
{
	npc		 = 	VLK_4132_Talbin_NW;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_NW_Condition;
	information	 = 	DIA_Talbin_NW_Info;

	description	 = 	"The pass wasn't all that bad, was it?";
};

func int DIA_Talbin_NW_Condition ()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_NW_15_00"); //The pass wasn't all that bad, was it?
	AI_Output			(self, other, "DIA_Talbin_NW_07_01"); //Thanks for rescuing me.
	AI_Output			(self, other, "DIA_Talbin_NW_07_02"); //Here. I found this raw stone on the pass. I think it may be of use to you.

	if (hero.guild == GIL_KDF)
	{
	AI_Output			(self, other, "DIA_Talbin_NW_07_03"); //I assume it's a runestone.
	CreateInvItems (self, ItMi_RuneBlank, 1);									
	B_GiveInvItems (self, other, ItMi_RuneBlank, 1);					
	}
	else
	{
	AI_Output			(self, other, "DIA_Talbin_NW_07_04"); //I assume it's a piece of ore.
	CreateInvItems (self, ItMi_Nugget, 1);									
	B_GiveInvItems (self, other, ItMi_Nugget, 1);					
	};
	
	AI_Output			(self, other, "DIA_Talbin_NW_07_05"); //May Innos protect you.

	AI_StopProcessInfos (self);

	Npc_ExchangeRoutine	(self,"Farm"); 
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP (XP_SavedTalbin);
};

 
///////////////////////////////////////////////////////////////////////
//	Info verschwinde
///////////////////////////////////////////////////////////////////////
instance DIA_Talbin_NW_PERM		(C_INFO)
{
	npc		 = 	VLK_4132_Talbin_NW;
	nr		 = 	15;
	condition	 = 	DIA_Talbin_NW_PERM_Condition;
	information	 = 	DIA_Talbin_NW_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Everything all right?";
};

func int DIA_Talbin_NW_PERM_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Talbin_NW))
		{
				return TRUE;
		};
};

func void DIA_Talbin_NW_PERM_Info ()
{
	AI_Output			(other, self, "DIA_Talbin_NW_PERM_15_00"); //Everything all right?
	AI_Output			(self, other, "DIA_Talbin_NW_PERM_07_01"); //Yes, thank you. Just go now. I'll be OK.
	AI_StopProcessInfos (self);
};




