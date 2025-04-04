//*********************************************************************
//	Info EXIT
//*********************************************************************
instance DIA_Godar_EXIT(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 999;
	condition		= DIA_Godar_EXIT_Condition;
	information		= DIA_Godar_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

//*********************************************************************
//	Info Hello
//*********************************************************************
instance DIA_Godar_Hello(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 4;
	condition		= DIA_Godar_Hello_Condition;
	information		= DIA_Godar_Hello_Info;
	important		= TRUE;
};

func int DIA_Godar_Hello_Condition()
{
	if (Npc_IsInState(self, ZS_TALK))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self, other, "DIA_Godar_Hello_13_00"); //Heh? What?
};

//*********************************************************************
//	Wo kommt ihr ÃƒÂ¼berhaupt her?
//*********************************************************************
instance DIA_Godar_ComeFrom(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 4;
	condition		= DIA_Godar_ComeFrom_Condition;
	information		= DIA_Godar_ComeFrom_Info;
	description		= "Where do you come from?";
};

func int DIA_Godar_ComeFrom_Condition()
{
	return TRUE;
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_15_00"); //Where do you come from?
	AI_Output(self, other, "DIA_Godar_ComeFrom_13_01"); //We come from ... eh, from the city.

	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, "You're bandits!", DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom, "Why have I never seen you in town before?", DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom, "I see. From the city, then.", DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Bandits_15_00"); //You're bandits!
	AI_Output(self, other, "DIA_Godar_ComeFrom_Bandits_13_01"); //Careful! You're biting off more than you can chew!

	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, "Relax. I won't rat you out.", DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom, "You can't scare me.", DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00"); //Relax. I won't rat you out.
	AI_Output(self, other, "DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01"); //I hope so, for your sake. Otherwise you're dead!

	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Bandits_NoFear_15_00"); //You can't scare me.
	AI_Output(self, other, "DIA_Godar_ComeFrom_Bandits_NoFear_13_01"); //We'll see about that.

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_NotCity_15_00"); //I never saw you in town before.
	AI_Output(self, other, "DIA_Godar_ComeFrom_NotCity_13_01"); //I can't stand people who stick their noses into things that don't concern them, understand?

	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, "Nope.", DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom, "I see, you come from the city.", DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_NotCity_Forget_15_00"); //I see, you come from the city.
	AI_Output(self, other, "DIA_Godar_ComeFrom_NotCity_Forget_13_01"); //Exactly.

	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_NotCity_CutThroat_15_00"); //Nope.
	AI_Output(self, other, "DIA_Godar_ComeFrom_NotCity_CutThroat_13_01"); //Then I'll have to beat it into you.

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other, self, "DIA_Godar_ComeFrom_Understand_15_00"); //I see. From the city, then.
	AI_Output(self, other, "DIA_Godar_ComeFrom_Understand_13_01"); //See! You understand!
	AI_Output(self, other, "DIA_Godar_ComeFrom_Understand_13_02"); //Here, have a swig!

	CreateInvItems(self, ItFo_Beer, 1);
	B_GiveInvItems(self, other, ItFo_Beer, 1);
	B_UseItem(other, ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

//*********************************************************************
//	Was macht ihr hier?
//*********************************************************************
instance DIA_Godar_Plan(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Plan_Condition;
	information		= DIA_Godar_Plan_Info;
	description		= "What are you doing here?";
};

func int DIA_Godar_Plan_Condition()
{
	return TRUE;
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other, self, "DIA_Godar_Plan_15_00"); //What are you doing here?
	AI_Output(self, other, "DIA_Godar_Plan_13_01"); //We heard about the dragon hunt. So we packed up our stuff and came here.
	AI_Output(self, other, "DIA_Godar_Plan_13_02"); //But to be honest, I don't give a shit about dragons. I just want a bit of gold.
	AI_Output(self, other, "DIA_Godar_Plan_13_03"); //Dragons have gold, don't they?
	AI_Output(other, self, "DIA_Godar_Plan_15_04"); //Certainly.
};

//*********************************************************************
//	Wisst ihr was ÃƒÂ¼ber die Drachen?
//*********************************************************************
instance DIA_Godar_DragonLore(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_DragonLore_Condition;
	information		= DIA_Godar_DragonLore_Info;
	description		= "What do you know about the dragons?";
};

func int DIA_Godar_DragonLore_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other, self, "DIA_Godar_DragonLore_15_00"); //What do you know about the dragons?
	AI_Output(self, other, "DIA_Godar_DragonLore_13_01"); //I only know the stories they tell the children.
	AI_Output(self, other, "DIA_Godar_DragonLore_13_02"); //You know, virgins, gold, fire breathing, that kind of thing.
};

//*********************************************************************
//	Wo wollt ihr hin?
//*********************************************************************
instance DIA_Godar_Destination(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Destination_Condition;
	information		= DIA_Godar_Destination_Info;
	description		= "Where are you planning to go from here?";
};

func int DIA_Godar_Destination_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Godar_Plan))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other, self, "DIA_Godar_Destination_15_00"); //Where are you planning to go from here?
	AI_Output(self, other, "DIA_Godar_Destination_13_01"); //No idea. We're still thinking about it.

	if ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other, self, "DIA_Godar_Destination_15_02"); //You could go to the castle.
		AI_Output(self, other, "DIA_Godar_Destination_13_03"); //Wild horses couldn't drag me there. Not to the paladins.
		AI_Output(self, other, "DIA_Godar_Destination_13_04"); //I'm not going back to jail. I was there once and that was enough for me.
	};
};

//*********************************************************************
//	Was ist mit den Orks?
//*********************************************************************
instance DIA_Godar_Orks(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Orks_Condition;
	information		= DIA_Godar_Orks_Info;
	description		= "What about the orcs?";
};

func int DIA_Godar_Orks_Condition()
{
	if (Npc_KnowsInfo(other, DIA_Godar_Destination))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other, self, "DIA_Godar_Orks_15_00"); //What about the orcs?
	AI_Output(self, other, "DIA_Godar_Orks_13_01"); //The whole castle is surrounded. There aren't any gaps.
	AI_Output(self, other, "DIA_Godar_Orks_13_02"); //Trying to sneak through there is insane. If you try to fight, you're a dead man.
	AI_Output(self, other, "DIA_Godar_Orks_13_03"); //Nobody gets through there.
	AI_Output(other, self, "DIA_Godar_Orks_15_04"); //Ah, really.
};

//*********************************************************************
//	Weswegen warst du im Knast?
//*********************************************************************
instance DIA_Godar_Prison(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Prison_Condition;
	information		= DIA_Godar_Prison_Info;
	description		= "What were you in the slammer for?";
};

func int DIA_Godar_Prison_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Godar_Destination))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other, self, "DIA_Godar_Prison_15_00"); //What were you in the slammer for?

	if (hero.guild == GIL_KDF)
	{
		AI_Output(self, other, "DIA_Godar_Prison_13_01"); //Like I'm going to tell you that, huh?
		AI_Output(self, other, "DIA_Godar_Prison_13_02"); //You magicians are in cahoots with the paladins. Nah, my friend. Forget it.
	}
	else
	{
		AI_Output(self, other, "DIA_Godar_Prison_13_03"); //The swine nabbed me for poaching. For two lousy hares!
		AI_Output(self, other, "DIA_Godar_Prison_13_04"); //They slapped me with 10 years for that.
		AI_Output(other, self, "DIA_Godar_Prison_15_05"); //That was all?
		AI_Output(self, other, "DIA_Godar_Prison_13_06"); //Well, okay, of course I defended myself.
		AI_Output(other, self, "DIA_Godar_Prison_15_07"); //And?
		AI_Output(self, other, "DIA_Godar_Prison_13_08"); //I couldn't do anything about it, the guy tripped and broke his neck. Honest!

		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison, "Sounds familiar.", DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison, "You shouldn't have let yourself get caught.", DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other, self, "DIA_Godar_Prison_Court_15_00"); //Sounds familiar.
	AI_Output(self, other, "DIA_Godar_Prison_Court_13_01"); //You know what I mean. The rich bastards don't have any idea how we're treated.
	AI_Output(self, other, "DIA_Godar_Prison_Court_13_02"); //That doesn't worry them in the least.

	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other, self, "DIA_Godar_Prison_Pissoff_15_00"); //You shouldn't have let yourself get caught.
	AI_Output(self, other, "DIA_Godar_Prison_Pissoff_13_01"); //(angry) I bet you've never been in jail, have you?
	AI_Output(self, other, "DIA_Godar_Prison_Pissoff_13_02"); //Then I should teach you a lesson about what all can happen to a body in jail.

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

//*********************************************************************
//	Kannst du mir beibringen wie man jagt?
//*********************************************************************
instance DIA_Godar_Hunting(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Hunting_Condition;
	information		= DIA_Godar_Hunting_Info;
	description		= "Can you teach me how to hunt?";
};

func int DIA_Godar_Hunting_Condition()
{
	if ((Npc_KnowsInfo(other, DIA_Godar_Prison))
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other, self, "DIA_Godar_Hunting_15_00"); //Can you teach me how to hunt?
	if (GodarLikesYou == FALSE)
	{
		AI_Output(self, other, "DIA_Godar_Hunting_13_01"); //You aren't serious, are you? Beat it!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self, other, "DIA_Godar_Hunting_13_03"); //An animal has more than just meat. You can sell the pelts or the claws. That can bring a tidy little sum.
		AI_Output(self, other, "DIA_Godar_Hunting_13_04"); //I can hardly wait to get my hands on a dragon.

		Godar_TeachAnimalTrophy = TRUE;
	};
};

//*********************************************************************
// 	Dragonstuff
//*********************************************************************
instance DIA_Godar_Dragonstuff(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Dragonstuff_Condition;
	information		= DIA_Godar_Dragonstuff_Info;
	permanent		= TRUE;
	description		= "Show me how to gut a dragon.";
};

var int Godar_TeachDragonStuff;
func int DIA_Godar_Dragonstuff_Condition()
{
	if ((Godar_TeachAnimalTrophy == TRUE)
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE))
	&& (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other, self, "DIA_Godar_Dragonstuff_15_00"); //Show me how to gut a dragon.

	AI_Output(self, other, "DIA_Godar_Dragonstuff_13_01"); //So you can rake in all the dough yourself, huh?

	AI_Output(self, other, "DIA_Godar_Dragonstuff_13_02"); //Well, all right, but that'll cost you 1000 gold coins.

	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff, "It's not worth that much to me.", DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff, "That's fair.", DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other, self, "DIA_Godar_Dragonstuff_fair_15_00"); //That's fair.

	if (B_GiveInvItems(other, self, ItMi_Gold, 1000))
	{
		Godar_TeachDragonStuff = TRUE;
	}
	else
	{
		AI_Output(self, other, "DIA_Godar_Dragonstuff_fair_13_01"); //Without money it's not. First get the cash.
	};

	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other, self, "DIA_Godar_Dragonstuff_nein_15_00"); //It's not worth that much to me.
	AI_Output(self, other, "DIA_Godar_Dragonstuff_nein_13_01"); //Suit yourself.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

//*********************************************************************
//	Zeig mir wie man jagd.
//*********************************************************************
instance DIA_Godar_Teach(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_Teach_Condition;
	information		= DIA_Godar_Teach_Info;
	permanent		= TRUE;
	description		= "Show me how to hunt.";
};

func int DIA_Godar_Teach_Condition()
{
	if ((Godar_TeachAnimalTrophy == TRUE)
	&& ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other, self, "DIA_Godar_Teach_15_00"); //Show me how to hunt.
	if (
	(Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
	)
	{
		Info_AddChoice(DIA_Godar_Teach, Dialog_Back, DIA_Godar_Teach_Back);

		if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == FALSE)
		{
//#if zpe
//			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(TXT_TALENTS[NPC_TALENT_SNEAK], B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)), DIA_Godar_Teach_Thief_Sneak);
//#else
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_TALENT_SNEAK, B_GetLearnCostTalent(other, NPC_TALENT_SNEAK, 1)), DIA_Godar_Teach_Thief_Sneak);
//#endif
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_TEETH, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)), DIA_Godar_Teach_TROPHYS_Teeth);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_BLOODFLY_STING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFSting)), DIA_Godar_Teach_TROPHYS_BFSting);
		};

		if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_BLOODFLY_WING, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_BFWing)), DIA_Godar_Teach_TROPHYS_BFWing);
		};

		if (Godar_TeachDragonStuff == TRUE)
		{
			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_DRAGON_SCALES, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonScale)), DIA_Godar_Teach_TROPHYS_DragonScale);
			};

			if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach, B_BuildLearnString(NAME_LEARN_DRAGON_BLOOD, B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY, TROPHY_DragonBlood)), DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self, other, "$NOLEARNYOUREBETTER"); // Ich kann dir nichts mehr beibringen. Du bist schon zu gut...
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_Teeth))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_Teeth_13_00"); //The best way to remove the teeth is with a sturdy knife.
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFSting))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_BFSting_13_00"); //The fastest way to remove a bloodfly's stinger is to squeeze it out before you cut it off.
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_BFWing))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_BFWing_13_00"); //A bloodfly's wings are very sensitive. So be careful when you cut them off.
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if (B_TeachThiefTalent(self, other, NPC_TALENT_SNEAK))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_Sneak_13_00"); //Use soft footwear when you're sneaking. A stiff sole can be very noisy.
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DragonScale))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_DragonScale_13_00"); //You need a lot of strength to get the scales off a dragon. But you can handle that.
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if (B_TeachPlayerTalentTakeAnimalTrophy(self, other, TROPHY_DragonBlood))
	{
		AI_Output(self, other, "DIA_Godar_TEACHHUNTING_DragonBlood_13_00"); //Look for a soft spot on the dragon's belly. That's where it's easiest to get dragon blood.
	};

	Info_ClearChoices(DIA_Godar_Teach);
};

//*********************************************************************
//	AllDragonsDead
//*********************************************************************
instance DIA_Godar_AllDragonsDead(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 5;
	condition		= DIA_Godar_AllDragonsDead_Condition;
	information		= DIA_Godar_AllDragonsDead_Info;
	description		= "I've killed all the dragons.";
};

func int DIA_Godar_AllDragonsDead_Condition()
{
	if (MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other, self, "DIA_Godar_AllDragonsDead_15_00"); //I've killed all the dragons.
	AI_Output(self, other, "DIA_Godar_AllDragonsDead_13_01"); //Well, so what. Here in the valley there's still enough for us to get.
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Godar_PICKPOCKET(C_INFO)
{
	npc				= DJG_711_Godar;
	nr				= 900;
	condition		= DIA_Godar_PICKPOCKET_Condition;
	information		= DIA_Godar_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_20;
};

func int DIA_Godar_PICKPOCKET_Condition()
{
	C_Beklauen(16, 160);
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET, DIALOG_BACK, DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};
