

const string PRINT_1_LP = "+ 1 Learning Point";
const string PRINT_2_LP = "+ 2 Learning Points";
const string PRINT_3_LP = "+ 3 Learning Points";
const string PRINT_4_LP = "+ 4 Learning Points";
const string PRINT_5_LP = "+ 5 Learning Points";



const string Exchange_Rune_Name = "Exchange Runes";
const string Circle_1 = "Circle 1";
const string Circle_2 = "Circle 2";
const string Circle_3 = "Circle 3";
const string Circle_4 = "Circle 4";
const string Circle_5 = "Circle 5";
const string Circle_6 = "Circle 6";


func string B_BuildRuneExhangeString(var string runeName,var int cost)
{
	var string text;
	text = ConcatStrings(runeName," (");
	text = ConcatStrings(text,IntToString(cost));
	text = ConcatStrings(text,"");
	text = ConcatStrings(text,PRINT_LP);
	text = ConcatStrings(text,")");
 
	return text;
};
 






func int Circle_1_Runes()
{
	if ((Npc_HasItems(hero, Itru_Light))
	|| (Npc_HasItems(hero, Itru_FireBolt))
	|| (Npc_HasItems(hero, Itru_Zap))
	|| (Npc_HasItems(hero, Itru_SumGobSkel))
	|| (Npc_HasItems(hero, Itru_Lightheal)))

	// ------------------------------------------------
	{
		return TRUE;
	};

	return FALSE; // DEFAULT
};


func int Circle_2_Runes()
{
	if ((Npc_HasItems(hero, Itru_Windfist)))
	|| ((Npc_HasItems(hero, Itru_Sleep)))
	|| ((Npc_HasItems(hero, Itru_SumWolf)))
	|| ((Npc_HasItems(hero, Itru_Whirlwind)))
	|| ((Npc_HasItems(hero, Itru_IceLance)))
	|| ((Npc_HasItems(hero, Itru_IceBolt)))
	|| ((Npc_HasItems(hero, Itru_InstantFireball)))

	// ------------------------------------------------
	{
		return TRUE;
	};

	return FALSE; // DEFAULT
};

func int Circle_3_Runes()
{
	if ((Npc_HasItems(hero, Itru_ChargeFireball)))
	|| ((Npc_HasItems(hero, Itru_Thunderball)))
	|| ((Npc_HasItems(hero, Itru_MediumHeal)))
	|| ((Npc_HasItems(hero, Itru_SumSkel)))
	|| ((Npc_HasItems(hero, Itru_IceCube)))
	|| ((Npc_HasItems(hero, Itru_FireStorm)))
	|| ((Npc_HasItems(hero, Itru_Fear)))
	|| ((Npc_HasItems(hero, Itru_Geyser)))

	// ------------------------------------------------
	{
		return TRUE;
	};

	return FALSE; // DEFAULT
};

func int Circle_4_Runes()
{
	if ((Npc_HasItems(hero, Itru_ArmyofDarkness)))
	|| ((Npc_HasItems(hero, Itru_Pyrokinesis)))
	|| ((Npc_HasItems(hero, Itru_WaterFist)))
	|| ((Npc_HasItems(hero, Itru_LightningFlash)))
	|| ((Npc_HasItems(hero, Itru_IceWave)))
	|| ((Npc_HasItems(hero, Itru_SumGol)))
	|| ((Npc_HasItems(hero, Itru_Thunderstorm)))
	|| ((Npc_HasItems(hero, Itru_HarmUndead)))


	// ------------------------------------------------
	{
		return TRUE;
	};

	return FALSE; // DEFAULT
};

func int Circle_5_Runes()
{
	if ((Npc_HasItems(hero, Itru_SumDemon)))
	|| ((Npc_HasItems(hero, Itru_FullHeal)))



	// ------------------------------------------------
	{
		return TRUE;
	};

	return FALSE; // DEFAULT
};

func int Circle_6_Runes()
{
	if ((Npc_HasItems(hero, Itru_Shrink)))
	|| ((Npc_HasItems(hero, Itru_FireRain)))
	|| ((Npc_HasItems(hero, Itru_BreathofDeath)))




	// ------------------------------------------------
	{
		return TRUE;
	};

	return FALSE; // DEFAULT
};



instance Dia_Exchange_Rune(C_INFO)
{
	nr				= 3;
	condition		= Dia_Exchange_Rune_Condition;
	information		= Dia_Exchange_Rune_Info;
	permanent		= TRUE;
	description		= Exchange_Rune_Name;
};

func int Dia_Exchange_Rune_Condition()
{
		if (other.guild == GIL_KDF)
		{
			return TRUE;
		};
		
};

func void Dia_Exchange_Rune_Info()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
	
	if Circle_1_Runes()
	{
	Info_AddChoice(Dia_Exchange_Rune, Circle_1, Circle_1_Exchange);
	};
	if Circle_2_Runes()
	{
	Info_AddChoice(Dia_Exchange_Rune, Circle_2, Circle_2_Exchange);
	};
	if Circle_3_Runes()
	{	
	Info_AddChoice(Dia_Exchange_Rune, Circle_3, Circle_3_Exchange);	
	};				
	if Circle_4_Runes()
	{
	Info_AddChoice(Dia_Exchange_Rune, Circle_4, Circle_4_Exchange);
	};
	if Circle_5_Runes()
	{
	Info_AddChoice(Dia_Exchange_Rune, Circle_5, Circle_5_Exchange);
	};
	if Circle_6_Runes()
	{
	Info_AddChoice(Dia_Exchange_Rune, Circle_6, Circle_6_Exchange);
	};
};




func void Circle_1_Exchange()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
			if Npc_HasItems(hero, Itru_FireBolt) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_FireBolt,2), Dia_Exchange_Rune_Fire_Bolt_Info);
    };
	
		    if Npc_HasItems(hero, Itru_Light) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Light,1), Dia_Exchange_Rune_Light_Info);
    };
		    if Npc_HasItems(hero, ItRu_LightHeal ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Lightheal,1), Dia_Exchange_Rune_LightHeal_Info);
    };
		    if Npc_HasItems(hero, ItRu_Zap ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Zap,1), Dia_Exchange_Rune_Zap_Info);
    };
		    if Npc_HasItems(hero, ItRu_SumGobSkel ) >= 1
			{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_SummonGoblinSkeleton,1), Dia_Exchange_Rune_SumGobSkel_Info);
    };	
		
};


func void Circle_2_Exchange()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
		    if Npc_HasItems(hero, Itru_IceBolt) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_IceBolt,2), Dia_Exchange_Rune_IceBolt_Info);
    };
		    if Npc_HasItems(hero, ItRu_Sleep) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Sleep,2), Dia_Exchange_Rune_Sleep_Info);
    };
		    if Npc_HasItems(hero, ItRu_SumWolf) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_SummonWolf,2), Dia_Exchange_Rune_SumWolf_Info);
    };
		    if Npc_HasItems(hero, ItRu_WindFist) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Windfist,2), Dia_Exchange_Rune_Windfist_Info);
    };
			if Npc_HasItems(hero, Itru_InstantFireball) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_InstantFireball,3), Dia_Exchange_Rune_InstantFireball_Info);
    };
		    if Npc_HasItems(hero, ItRu_Icelance ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_IceLance,2), Dia_Exchange_Rune_Icelance_Info);
    };
		    if Npc_HasItems(hero, itru_whirlwind ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Whirlwind,2), Dia_Exchange_Rune_whirlwind_Info);
    };

};

func void Circle_3_Exchange()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
		    if Npc_HasItems(hero, ItRu_MediumHeal) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_MediumHeal,2), Dia_Exchange_Rune_MediumHeal_Info);
    };
		    if Npc_HasItems(hero, ItRu_Fear ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Fear,2), Dia_Exchange_Rune_Fear_Info);
    };
		    if Npc_HasItems(hero, itru_Thunderball  ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_ChargeZap,2), Dia_Exchange_Rune_Thunderball_Info);
    };
		    if Npc_HasItems(hero, ItRu_SumSkel ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_SummonSkeleton,3), Dia_Exchange_Rune_SummonsKeleton_Info);
    };
		    if Npc_HasItems(hero, ItRu_Firestorm ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_FireStorm,3), Dia_Exchange_Rune_Firestorm_Info);
    };
		    if Npc_HasItems(hero, itru_Geyser) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Geyser,3), Dia_Exchange_Rune_Geyser_Info);
    };
		    if Npc_HasItems(hero, itru_ChargeFireball) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_ChargeFireball,3), Dia_Exchange_Rune_ChargeFireball_Info);
    };
		    if Npc_HasItems(hero, itru_IceCube) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_IceCube,3), Dia_Exchange_Rune_ChargeFireball_Info);
    };
	

};

func void Circle_4_Exchange()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
		if Npc_HasItems(hero, ItRu_HarmUndead ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_DestroyUndead,4), Dia_Exchange_Rune_DestroyUndead_Info);
    };
		  if Npc_HasItems(hero, ItRu_LightningFlash ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_LightningFlash,4), Dia_Exchange_Rune_LightningFlash_Info);
    };
		  if Npc_HasItems(hero, ItRu_SumGol ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_SummonGolem,4), Dia_Exchange_Rune_SummonGolem_Info);
    };
		  if Npc_HasItems(hero, ItRu_Waterfist ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_WaterFist,4), Dia_Exchange_Rune_Waterfist_Info);
    };
		  if Npc_HasItems(hero, ItRu_ArmyofDarkness) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_ArmyofDarkness,4), Dia_Exchange_Rune_ArmyofDarkness_Info);
    };
		  if Npc_HasItems(hero, itru_IceWave) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_IceWave,4), Dia_Exchange_Rune_IceWave_Info);
    };
		  if Npc_HasItems(hero, itru_Pyrokinesis) >= 1
 	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Pyrokinesis,4), Dia_Exchange_Rune_Pyrokinesis_Info);
    };
		  if Npc_HasItems(hero, itru_thunderstorm ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Thunderstorm,4), Dia_Exchange_Rune_Thunderstorm_Info);
    };

};

func void Circle_5_Exchange()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
		  if Npc_HasItems(hero, itru_fullheal ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_FullHeal,4), Dia_Exchange_Rune_FullHeal_Info);
    };
		  if Npc_HasItems(hero, ItRu_SumDemon) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_SummonDemon,4), Dia_Exchange_Rune_SummonDemon_Info);
    };

};

func void Circle_6_Exchange()
{
	Info_ClearChoices(Dia_Exchange_Rune);

	Info_AddChoice(Dia_Exchange_Rune, DIALOG_BACK, Dia_Exchange_Rune_BACK);
		  if Npc_HasItems(hero, ItRu_FireRain ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_FireRain,4), Dia_Exchange_Rune_FireRain_Info);
    };
		  if Npc_HasItems(hero, ItRu_BreathOfDeath) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_BreathOfDeath,4), Dia_Exchange_Rune_BreathOfDeath_Info);
    };
		  if Npc_HasItems(hero, ItRu_Shrink ) >= 1
	{
        Info_AddChoice( Dia_Exchange_Rune, B_BuildRuneExhangeString(NAME_SPL_Shrink,4), Dia_Exchange_Rune_Shrink_Info);
    };

};

func void Dia_Exchange_Rune_Fire_Bolt_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_FireBolt))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_FireBolt, 1);

	};
};

func void Dia_Exchange_Rune_Light_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Light))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 1);
	PrintScreen(PRINT_1_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Light, 1);

	};
};
func void Dia_Exchange_Rune_LightHeal_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_LightHeal))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 1);
	PrintScreen(PRINT_1_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_LightHeal, 1);

	};
};
func void Dia_Exchange_Rune_Zap_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Zap))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 1);
	PrintScreen(PRINT_1_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Zap, 1);

	};
};
func void Dia_Exchange_Rune_SumGobSkel_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_SumGobSkel))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 1);
	PrintScreen(PRINT_1_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_SumGobSkel, 1);

	};
};


// Circle 2

func void Dia_Exchange_Rune_IceBolt_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_IceBolt))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Icebolt, 1);

	};
};

func void Dia_Exchange_Rune_IceLance_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_IceLance))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_IceLance, 1);

	};
};
func void Dia_Exchange_Rune_SumWolf_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_SumWolf))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_SumWolf, 1);

	};
};
func void Dia_Exchange_Rune_WindFist_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_WindFist))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_WindFist, 1);

	};
};
func void Dia_Exchange_Rune_Whirlwind_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Whirlwind))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Whirlwind, 1);

	};
	
};
func void Dia_Exchange_Rune_InstantFireball_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_InstantFireball))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 3);
	PrintScreen(PRINT_3_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_InstantFireball, 1);

	};
};
	
 func void Dia_Exchange_Rune_Sleep_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Sleep))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Sleep, 1);

	};
};
	
//Circle 3




func void Dia_Exchange_Rune_FireStorm_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_FireStorm))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 3);
	PrintScreen(PRINT_3_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_FireStorm, 1);

	};
};
func void Dia_Exchange_Rune_MediumHeal_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_MediumHeal))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_MediumHeal, 1);

	};
};
func void Dia_Exchange_Rune_Fear_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Fear))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Fear, 1);

	};
};
func void Dia_Exchange_Rune_ChargeFireball_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_ChargeFireball))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 3);
	PrintScreen(PRINT_3_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_ChargeFireball, 1);

	};
};
func void Dia_Exchange_Rune_Geyser_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Geyser))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 3);
	PrintScreen(PRINT_3_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Geyser, 1);

	};
};
func void Dia_Exchange_Rune_Thunderball_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Thunderball))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 2);
	PrintScreen(PRINT_2_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Thunderball, 1);

	};
};

func void Dia_Exchange_Rune_SummonSkeleton_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_SumSkel))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 3);
	PrintScreen(PRINT_3_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_SumSkel, 1);

	};
};

func void Dia_Exchange_Rune_IceCube_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_IceCube))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 3);
	PrintScreen(PRINT_3_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_IceCube, 1);

	};
};




// Circle 4

func void Dia_Exchange_Rune_ThunderStorm_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_ThunderStorm))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_ThunderStorm, 1);

	};
};

func void Dia_Exchange_Rune_IceWave_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_IceWave))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_IceWave, 1);

	};
};
func void Dia_Exchange_Rune_ArmyofDarkness_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_ArmyofDarkness))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_ArmyofDarkness, 1);

	};
};
func void Dia_Exchange_Rune_SummonGolem_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_SumGol))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_SumGol, 1);

	};
};
func void Dia_Exchange_Rune_Pyrokinesis_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Pyrokinesis))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Pyrokinesis, 1);

	};
};
func void Dia_Exchange_Rune_WaterFist_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_WaterFist))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_WaterFist, 1);

	};
};
func void Dia_Exchange_Rune_DestroyUndead_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_HarmUndead))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_HarmUndead, 1);

	};
};
func void Dia_Exchange_Rune_LightningFlash_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_LightningFlash))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_LightningFlash, 1);

	};
};

// Circle 5

func void Dia_Exchange_Rune_SummonDemon_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_SumDemon))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_SumDemon, 1);

	};
};

func void Dia_Exchange_Rune_FullHeal_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_FullHeal))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_FullHeal, 1);

	};
};

// Circle 6

func void Dia_Exchange_Rune_FireRain_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_FireRain))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_FireRain, 1);

	};
};
func void Dia_Exchange_Rune_BreathofDeath_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_BreathofDeath))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_BreathofDeath, 1);

	};
};

func void Dia_Exchange_Rune_Shrink_Info (var int constanze)
{

	if(Npc_HasItems(hero,Itru_Shrink))
	{
	Info_ClearChoices(Dia_Exchange_Rune);

	hero.LP = (hero.LP + 4);
	PrintScreen(PRINT_4_LP, -1, -1, FONT_Screen, 3);
	Snd_Play("LEVELUP");
	B_GiveInvItems(other, self, Itru_Shrink, 1);

	};
};


func void  Dia_Exchange_Rune_BACK()
{
	Info_ClearChoices(Dia_Exchange_Rune);
};





