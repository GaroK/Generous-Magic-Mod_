// ************************************************************
// 	  				   EXIT KAP3
// ************************************************************

instance DIA_FirstDementor_EXIT(C_INFO)
{
	npc				= DMT_1212_FirstDementor;
	nr				= 999;
	condition		= DIA_FirstDementor_EXIT_Condition;
	information		= DIA_FirstDementor_EXIT_Info;
	permanent		= TRUE;
	description		= DIALOG_ENDE;
};

func int DIA_FirstDementor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_FirstDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	B_SCIsObsessed(self);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self, 30);
	B_Attack(self, other, AR_SuddenEnemyInferno, 1);
	Snd_Play("MFX_FEAR_CAST");
};

instance DIA_FirstDementor(C_INFO)
{
	npc				= DMT_1212_FirstDementor;
	nr				= 1;
	condition		= DIA_FirstDementor_Condition;
	information		= DIA_FirstDementor_Info;
	permanent		= TRUE;
	important		= TRUE;
};

func int DIA_FirstDementor_Condition()
{
	if (Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};


func void DIA_FirstDementor_Info()
{
	Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
	Wld_PlayEffect("spellFX_Fear", self, self, 0, 0, 0, FALSE);
	AI_PlayAni(self, "T_PRACTICEMAGIC5");
	
	var int randy_firstdmt;
	randy_firstdmt = Hlp_Random(4);

	if (randy_firstdmt == 0)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_07"); //Weak little mageling, you will never be able to match the power of the Master.
		};

		if (randy_firstdmt == 1)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_08"); //You chose the path of magic to conquer us. A clever move. But even that will do you no good.
		};

		if (randy_firstdmt == 2)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_09"); //Even as a magician you cannot stop us.
		};

		if (randy_firstdmt == 3)
		{
			AI_Output(self, other, "DIA_AmbientDementor_19_10"); //My Master shall destroy you. Your pathetic parlor magic cannot save you.
		};

	Npc_SetRefuseTalk(self, 30);
};

