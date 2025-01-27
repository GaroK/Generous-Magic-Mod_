// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Dragon_Fire_Island_Exit(C_INFO)
{
	npc				= Dragon_Fire_Island;
	nr				= 999;
	condition		= DIA_Dragon_Fire_Island_Exit_Condition;
	information		= DIA_Dragon_Fire_Island_Exit_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Dragon_Fire_Island_Exit_Condition()
{
	if (DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Exit_Info()
{
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};

// *************************************************************************
// 									Hello
// *************************************************************************
instance DIA_Dragon_Fire_Island_Hello(C_INFO)
{
	npc				= Dragon_Fire_Island;
	nr				= 5;
	condition		= DIA_Dragon_Fire_Island_Hello_Condition;
	information		= DIA_Dragon_Fire_Island_Hello_Info;
	important		= TRUE;
};

func int DIA_Dragon_Fire_Island_Hello_Condition()
{
	if (Npc_HasItems(other, ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Fire_Island_Hello_Info()
{
	AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_00"); //Stay, human. All of my senses tell me that the murderer of my own flesh and blood stands before me.
	AI_Output(other, self, "DIA_Dragon_Fire_Island_Hello_15_01"); //Really? Who are you calling a murderer, you hellspawn?

	if ((hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7))
	{
		AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_02"); //Was it not enough for you that you destroyed almost all of our offspring?
	};

	AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_03"); //You have my brother Feomathar on your conscience, and you will pay for that.

	if ((hero.guild == GIL_DJG)
	&& (DragonEggCounter >= 7))
	{
		AI_Output(other, self, "DIA_Dragon_Fire_Island_Hello_15_04"); //I'll get to the rest of your disgusting brood as well.
		AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_05"); //Arrh. It will be a pleasure for me to burn you alive.
	};

	AI_Output(other, self, "DIA_Dragon_Fire_Island_Hello_15_06"); //Stop making so much noise. Let's get down to business.
	AI_Output(self, other, "DIA_Dragon_Fire_Island_Hello_20_07"); //You have come far, little human, but you will never leave these halls alive.

	Npc_RemoveInvItems(other, ItMi_InnosEye_MIS, 1);
	CreateInvItems(other, ItMi_InnosEye_Discharged_MIS, 1);
	AI_StopProcessInfos(self);

	B_LogEntry(TOPIC_HallenVonIrdorath, TOPIC_HallenVonIrdorath_8);

	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};
