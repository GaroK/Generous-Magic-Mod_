///////////////////////////////////////////////////////////////////////
//	Info EXIT
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADW_EXIT(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 999;
	condition		= DIA_Addon_Cronos_ADW_EXIT_Condition;
	information		= DIA_Addon_Cronos_ADW_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Addon_Cronos_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_ADW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
/*
instance DIA_Addon_Cronos_ADW_PICKPOCKET(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 900;
	condition		= DIA_Addon_Cronos_ADW_PICKPOCKET_Condition;
	information		= DIA_Addon_Cronos_ADW_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= "(Es wÃƒÂ¤re einfach seine Karte zu stehlen)";
};

func int DIA_Addon_Cronos_ADW_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET) == 1)
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET, DIALOG_BACK, DIA_Addon_Cronos_ADW_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Cronos_ADW_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt);
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems(self, other, ItWr_Map_AddonWorld, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		B_Attack(self, other, AR_Theft, 1); // reagiert trotz IGNORE_Theft mit NEWS
	};
};

func void DIA_Addon_Cronos_ADW_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Cronos_ADW_PICKPOCKET);
};

*/
///////////////////////////////////////////////////////////////////////
//	Info ADWHello
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADWHello(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 1;
	condition		= DIA_Addon_Cronos_ADWHello_Condition;
	information		= DIA_Addon_Cronos_ADWHello_Info;
	important		= TRUE;
};

func int DIA_Addon_Cronos_ADWHello_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Addon_Cronos_ADWHello_Info()
{
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_00"); //Nice to see you. We feared the worst.
	AI_Output(other, self, "DIA_Addon_Cronos_ADWHello_15_01"); //It wasn't all that bad. How's it going?
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_02"); //This is a very dangerous region here.
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_03"); //Some of the animals in the area have never been seen by anyone before us.
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_04"); //Close by there is a large swamp that managed to grow for several hundred years without anyone noticing.
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_05"); //Not a day goes by that we aren't attacked by the beasts from the swamp.
	AI_Output(self, other, "DIA_Addon_Cronos_ADWHello_04_06"); //I advise you to be careful if you go for a stroll here.
};

///////////////////////////////////////////////////////////////////////
//	Info WaechterADW
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_WaechterADW(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 5;
	condition		= DIA_Addon_Cronos_WaechterADW_Condition;
	information		= DIA_Addon_Cronos_WaechterADW_Info;
	description		= "Is there anything new about the stone sentinels?";
};

func int DIA_Addon_Cronos_WaechterADW_Condition()
{
	return TRUE;
};

func void DIA_Addon_Cronos_WaechterADW_Info()
{
	AI_Output(other, self, "DIA_Addon_Cronos_WaechterADW_15_00"); //Is there anything new about the stone sentinels?
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_01"); //We have already managed to eliminate some of them.
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_02"); //They stand there, paralyzed like pillars of salt, and don't budge.
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_03"); //But appearances deceive. If you get too close, they'll attack you!
	AI_Output(self, other, "DIA_Addon_Cronos_WaechterADW_04_04"); //There's no doubt that the source of their power can be found here somewhere.
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Cronos_ADW_Trade(C_INFO)
{
	npc				= KDW_14010_Addon_Cronos_ADW;
	nr				= 99;
	condition		= DIA_Addon_Cronos_ADW_Trade_Condition;
	information		= DIA_Addon_Cronos_ADW_Trade_Info;
	permanent		= TRUE;
	trade			= TRUE;
	description		= "Let us trade.";
};

func int DIA_Addon_Cronos_ADW_Trade_Condition()
{
	return TRUE;
};

var int DIA_Addon_Cronos_ADW_Trade_OneTime;

func void DIA_Addon_Cronos_ADW_Trade_Info()
{
	B_GiveTradeInv(self);
	B_Say(other, self, "$TRADE_1");
};
