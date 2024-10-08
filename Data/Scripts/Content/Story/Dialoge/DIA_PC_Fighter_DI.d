
// ************************************************************
// 	  				   EXIT 
// ************************************************************

INSTANCE DIA_Gorn_DI_KAP5_EXIT(C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 999;
	condition	= DIA_Gorn_DI_KAP5_EXIT_Condition;
	information	= DIA_Gorn_DI_KAP5_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       
FUNC INT DIA_Gorn_DI_KAP5_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Gorn_DI_KAP5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 	  	  Hallo
// ************************************************************

INSTANCE DIA_Gorn_DI_Hallo (C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 2;
	condition	= DIA_Gorn_DI_Hallo_Condition;
	information	= DIA_Gorn_DI_Hallo_Info;
	permanent	 = 	TRUE;

	description = "Everything ship-shape?";
};                       

FUNC INT DIA_Gorn_DI_Hallo_Condition()
{
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Gorn_DI_Hallo_Info()
{	
	AI_Output (other,self ,"DIA_Gorn_DI_Hallo_15_00"); //Everything ship-shape?

	if (ORkSturmDI == FALSE)
		{
			AI_Output (self ,other,"DIA_Gorn_DI_Hallo_12_01"); //Up to now. Remember, I want to see some action.
		}
	else
		{
			AI_Output (self ,other,"DIA_Gorn_DI_Hallo_12_02"); //Are there more orcs up there? Send them to me. I just got warmed up.
		};
};

 
//**************************************
//			Ich will trainieren
//**************************************

INSTANCE DIA_Gorn_DI_Teach(C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 10;
	condition	= DIA_Gorn_DI_Teach_Condition;
	information	= DIA_Gorn_DI_Teach_Info;
	permanent	= TRUE;
	
	description = "I need training.";
};                       

FUNC INT DIA_Gorn_DI_Teach_Condition()
{
	if (Npc_IsDead(UndeadDragon)== FALSE)
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Gorn_DI_Teach_Info()
{	
	AI_Output (other, self , 	"DIA_Gorn_DI_Teach_15_00"); //I need training.
	AI_Output (self, other, 	"DIA_Gorn_DI_Teach_12_01"); //Can't hurt.
	
	Info_ClearChoices 	(DIA_Gorn_DI_Teach);
	Info_AddChoice 		(DIA_Gorn_DI_Teach,	DIALOG_BACK		,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Gorn_DI_Teach_2H_1);
};

FUNC VOID DIA_Gorn_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_1_12_00"); //Well. You used to be better than that.
	};
	Info_ClearChoices 	(DIA_Gorn_DI_Teach);
	Info_AddChoice 		(DIA_Gorn_DI_Teach,	DIALOG_BACK		,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Gorn_DI_Teach_2H_1);
};

FUNC VOID DIA_Gorn_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self,other,"DIA_Gorn_DI_Teach_2H_5_12_00"); //You have to hold your weapon higher. A blind man could get through your guard with his cane.
	};
	Info_ClearChoices 	(DIA_Gorn_DI_Teach);
	Info_AddChoice 		(DIA_Gorn_DI_Teach,	DIALOG_BACK		,DIA_Gorn_DI_Teach_Back);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Gorn_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Gorn_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Gorn_DI_Teach_2H_1);
};

FUNC VOID DIA_Gorn_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Gorn_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Gorn_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	PC_Fighter_DI;
	nr			 = 	2;
	condition	 = 	DIA_Gorn_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Gorn_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"You stayed with the ship?";
};

func int DIA_Gorn_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Gorn_DI_UndeadDragonDead_OneTime;
func void DIA_Gorn_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_00"); //You stayed with the ship?
	AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_01"); //Sure I did. Just imagine what we'd do if it weren't there any more.

	if (DIA_Gorn_DI_UndeadDragonDead_OneTime == FALSE)
		{
			if (hero.guild == GIL_DJG)
			{
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_02"); //Now what happens?
				AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_03"); //Nothing more. I want to go home.
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_04"); //(laughs) Home? Where's that? As far as I know, there's no such thing for you.
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_05"); //Let me make a suggestion. We storm the next tavern and drink ourselves senseless.
				AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_06"); //Mmh. Maybe.
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_07"); //Hey, come off it, man. It's over.
			};
			DIA_Gorn_DI_UndeadDragonDead_OneTime = TRUE;
		};
	
	if (Npc_KnowsInfo(other, DIA_Biff_DI_plunder))
			{
				AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_08"); //Somebody still needs to tell Biff, otherwise he'll rot on this island.

				if (Npc_IsDead(Biff_DI)== FALSE)
					{
						AI_Output			(other ,self, "DIA_Gorn_DI_UndeadDragonDead_15_09"); //He'll be here in time.
					};
			};			
	
	AI_Output			(self ,other, "DIA_Gorn_DI_UndeadDragonDead_12_10"); //There's nothing left here for us. Tell the captain to clear the ship.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Fighter_DI_PICKPOCKET (C_INFO)
{
	npc			= PC_Fighter_DI;
	nr			= 900;
	condition	= DIA_Fighter_DI_PICKPOCKET_Condition;
	information	= DIA_Fighter_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Fighter_DI_PICKPOCKET_Condition()
{
	C_Beklauen (10, 45);
};
 
FUNC VOID DIA_Fighter_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Fighter_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Fighter_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Fighter_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Fighter_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Fighter_DI_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Fighter_DI_PICKPOCKET);
};
	
func void DIA_Fighter_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Fighter_DI_PICKPOCKET);
};


