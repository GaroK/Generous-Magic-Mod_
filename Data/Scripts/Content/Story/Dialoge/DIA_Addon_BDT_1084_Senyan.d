// ----------------------------------------------------------------------
//	Info EXIT
// ----------------------------------------------------------------------
instance DIA_Addon_Senyan_EXIT(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 999;
	condition		= DIA_Addon_Senyan_EXIT_Condition;
	information		= DIA_Addon_Senyan_EXIT_Info;
	permanent		= TRUE;
	description		= "See you... (END)";
};

func int DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Erpressung == LOG_RUNNING)
	{
		AI_Output(self, other, "DIA_Addon_Senyan_EXIT_12_00"); //You know what you have to do...
	};

	AI_StopProcessInfos(self);
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************
instance DIA_Addon_Senyan_PICKPOCKET(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 900;
	condition		= DIA_Addon_Senyan_PICKPOCKET_Condition;
	information		= DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent		= TRUE;
	description		= Pickpocket_40;
};

func int DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	C_Beklauen(45, 88);
};

func void DIA_Addon_Senyan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET, DIALOG_BACK, DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Senyan_PICKPOCKET, DIALOG_PICKPOCKET, DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Senyan_PICKPOCKET);
};

// ----------------------------------------------------------------------
func void B_Senyan_Attack()
{
	AI_Output(self, other, "DIA_Addon_Senyan_Attack_12_00"); //(sneering) Then what do I still need you for, you bum?
	AI_Output(self, other, "DIA_Addon_Senyan_Attack_12_01"); //(calls) Hey, people, look who we have here!

	Senyan_Called = TRUE;
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();

	AI_StopProcessInfos(self);
	B_Attack(self, other, AR_NONE, 1);
};

// ----------------------------------------------------------------------
func void B_Senyan_Erpressung()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Erpressung_15_00"); //How much do you want?
	AI_Output(self, other, "DIA_Addon_Senyan_Erpressung_12_01"); //(playing hurt) Oh, no, please. I don't want to extort gold from you. I wouldn't dream of it.
	AI_Output(other, self, "DIA_Addon_Senyan_Erpressung_15_02"); //Then what do you want?
	AI_Output(self, other, "DIA_Addon_Senyan_Erpressung_12_03"); //Recently somebody tried to get Esteban out of the way. But he ran into the bodyguards.
	AI_Output(self, other, "DIA_Addon_Senyan_Erpressung_12_04"); //Go to Esteban and talk to him. Afterwards we'll talk again.

	AI_StopProcessInfos(self);
	Log_CreateTopic(Topic_Addon_Senyan, LOG_MISSION);
	Log_SetTopicStatus(Topic_Addon_Senyan, LOG_RUNNING);
	B_LogEntry(Topic_Addon_Senyan, Topic_Addon_Senyan_1);
};

// ----------------------------------------------------------------------
//	Info Hi
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1084_Senyan_Hi(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 1;
	condition		= DIA_Addon_Senyan_Hi_Condition;
	information		= DIA_Addon_Senyan_Hi_Info;
	important		= TRUE;
};

func int DIA_Addon_Senyan_Hi_Condition()
{
	return TRUE;
};

// --------------------
var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;
// --------------------
func void DIA_Addon_Senyan_Hi_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_00"); //Ah! Who have we here then?
	B_UseFakeScroll();
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_01"); //Looky, looky. There you are. I've got good news and bad news for you.

	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "I want to hear the good news first.", DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "First tell me the bad news.", DIA_Addon_BDT_1084_Senyan_Hi_bad);
};

func void DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_00"); //I want to hear the good news first.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_01"); //And what's the good news?
	};

	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_02"); //Well, I don't really know why, but you've made yourself a couple of powerful enemies.
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_03"); //You can count yourself lucky that I recognized you and no one else.
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_04"); //Because I am understanding and sociable.

	Senyan_Good = TRUE;

	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);

	if (Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "First tell me the bad news.", DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};

func void DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00"); //First tell me the bad news.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01"); //And what's the bad news?
	};

	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02"); //Raven is looking for you. So are his guards. Actually, all the bandits are looking for you...
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03"); //And if they find you, they'll kill you.
	AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04"); //A lot of people have already tried that.
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05"); //Then your combat skills are as good as your craftiness. Coming into the camp with some of our armor is like...
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06"); //...the sheep coming to the wolves. Your life is hanging by a thin thread, son of danger.

	Senyan_Bad = TRUE;

	Info_ClearChoices(DIA_Addon_BDT_1084_Senyan_Hi);

	if (Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else
	{
		Info_AddChoice(DIA_Addon_BDT_1084_Senyan_Hi, "I want to hear the good news first.", DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};

// ---------------------------------------------------------------------
//	Info unterwegs
// ---------------------------------------------------------------------
instance DIA_Addon_Senyan_unterwegs(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 99;
	condition		= DIA_Addon_Senyan_unterwegs_Condition;
	information		= DIA_Addon_Senyan_unterwegs_Info;
	permanent		= TRUE;
	description		= "About Esteban...";
};

func int DIA_Addon_Senyan_unterwegs_Condition()
{
	if ((MIS_Judas != LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output(other, self, "DIA_Addon_Senyan_unterwegs_15_00"); //About Esteban...
	AI_Output(self, other, "DIA_Addon_Senyan_unterwegs_12_01"); //Have you already talked to him?
	AI_Output(other, self, "DIA_Addon_Senyan_unterwegs_15_02"); //Not yet.
	AI_Output(self, other, "DIA_Addon_Senyan_unterwegs_12_03"); //Well, you should do that soon.
};

// ---------------------------------------------------------------------
//	Info Attentat
// ---------------------------------------------------------------------
instance DIA_Addon_Senyan_Attentat(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 2;
	condition		= DIA_Addon_Senyan_Attentat_Condition;
	information		= DIA_Addon_Senyan_Attentat_Info;
	description		= "I've talked to Esteban.";
};

func int DIA_Addon_Senyan_Attentat_Condition()
{
	if ((MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo(other, DIA_Addon_BDT_1084_Senyan_Hi))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_15_00"); //I've talked to Esteban.
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_01"); //And did he tell you about the attack?
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_15_02"); //He ordered me to find out who sent the assassin. Do you know anything about that?
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_03"); //No more than you do. I'm also on the hunt for the guy behind it. And now we come to the interesting part.
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_15_04"); //Let's hear it.
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_05"); //I want you to do your job well. I want you to find the traitor.
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_06"); //(coldly) And when you have found him - I want you to kill him for me.
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_07"); //Then I will pocket the reward.
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_12_08"); //I have your wanted poster - don't forget that. Do your job and do it well. You can figure out will happen otherwise.

	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
	Info_AddChoice(DIA_Addon_Senyan_Attentat, "I guess I've got no choice...", DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice(DIA_Addon_Senyan_Attentat, "Forget it!", DIA_Addon_Senyan_Attentat_NO);
};

func void DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_NO_15_00"); //Forget it!

	B_Senyan_Attack();
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);
};

func void DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output(other, self, "DIA_Addon_Senyan_Attentat_JA_15_00"); //I don't really have a choice...
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_JA_12_01"); //I knew we would come to an agreement.
	AI_Output(self, other, "DIA_Addon_Senyan_Attentat_JA_12_02"); //(curtly) When you find out who the guy is - we'll kill the tick together. And now beat it!

	Senyan_Erpressung = LOG_RUNNING;
	Info_ClearChoices(DIA_Addon_Senyan_Attentat);

	B_LogEntry(Topic_Addon_Senyan, Topic_Addon_Senyan_2);
};

// ----------------------------------------------------------------------
//	Anders ÃƒÅ“berlegt
// ----------------------------------------------------------------------
instance DIA_Addon_Senyan_ChangePlan(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 3;
	condition		= DIA_Addon_Senyan_ChangePlan_Condition;
	information		= DIA_Addon_Senyan_ChangePlan_Info;
	description		= "I've changed my mind. We aren't working together any more!";
};

func int DIA_Addon_Senyan_ChangePlan_Condition()
{
	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (Snaf_Tip_Senyan == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_ChangePlan_Info()
{
	AI_Output(other, self, "DIA_Addon_Senyan_ChangePlan_15_00"); //I've changed my mind. We aren't working together any more!
	B_Senyan_Attack();

	AI_StopProcessInfos(self);
};

// ----------------------------------------------------------------------
//	Erpressung Found Fisk
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1084_Senyan_Found(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 3;
	condition		= DIA_Addon_Senyan_Found_Condition;
	information		= DIA_Addon_Senyan_Found_Info;
	description		= "I found the traitor. It's Fisk.";
};

func int DIA_Addon_Senyan_Found_Condition()
{
	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_Found_Info()
{
	AI_Output(other, self, "DIA_Addon_BDT_1084_Senyan_Found_15_00"); //I found the traitor. It's Fisk.
	B_Senyan_Attack();
};

// ----------------------------------------------------------------------
//	Erpressung derbe
// ----------------------------------------------------------------------
instance DIA_Addon_BDT_1084_Senyan_derbe(C_INFO)
{
	npc				= BDT_1084_Addon_Senyan;
	nr				= 1;
	condition		= DIA_Addon_Senyan_derbe_Condition;
	information		= DIA_Addon_Senyan_derbe_Info;
	important		= TRUE;
};

func int DIA_Addon_Senyan_derbe_Condition()
{
	if ((Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	&& (Npc_IsDead(Fisk)
	|| Npc_IsDead(Esteban)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Senyan_derbe_Info()
{
	AI_Output(self, other, "DIA_Addon_BDT_1084_Senyan_derbe_12_00"); //(furious) You haven't kept our agreement.

	B_Senyan_Attack();
};
