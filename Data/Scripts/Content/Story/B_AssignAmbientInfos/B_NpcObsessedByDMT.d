// ***************************************************
//  	B_NpcObsessedByDMT (Kurzzeitige Bessenheit eines NSCs durch einen Dementor)
// ***************************************************

var int NpcObsessedByDMT;

////////////////////////
// Alle Besessenen NPCs
////////////////////////

// Alle
var int NpcObsessedByDMT_Brutus; // Joly: hat sein Buch Anfang 5. Kapitel

// Nur KDF
var int NpcObsessedByDMT_Engrom; // Joly: hat sein Buch Anfang 4. Kapitel
var int NpcObsessedByDMT_Vino; // Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Malak; // Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Fernando; // Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Bromor; // Joly: hat sein Buch Anfang 3. Kapitel
var int NpcObsessedByDMT_Sekob; // Joly: hat sein Buch Anfang 5. Kapitel
var int NpcObsessedByDMT_Randolph; // Joly: hat sein Buch Anfang 4. Kapitel

func void B_DMTWurm()
{
	AI_Output(self, other, "DIA_NoName_ObsessedByDMT_19_00"); //We see you, worm. You cannot escape us.
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// B_NpcClearObsessionByDMT steht bei allen NSCs statt der AI_StopProcessInfos(self);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func void B_NpcClearObsessionByDMT(var C_Npc medium) // Joly: WARUNG: B_NpcClearObsessionByDMT muÃƒÅ¸ in eine Exit Info, die ganz sicher kommt, nachdem B_NpcObsessedByDMT abgefeuert wurde!!!!!!!!!!!!!!
{
	AI_StopProcessInfos(medium);

	if (NpcObsessedByDMT == TRUE)
	{
		Npc_RemoveInvItems(medium, ITAR_Dementor, 1);
		AI_EquipBestArmor(medium);
		NpcObsessedByDMT = FALSE;
		medium.flags = 0;
		B_Attack(medium, other, AR_NONE, 1);
		Wld_StopEffect("DEMENTOR_FX");
		Snd_Play("MFX_FEAR_CAST");
		B_SCIsObsessed(medium);

		/////////////////////////////////
		// Story SituationsKonsequenzen
		/////////////////////////////////

		if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
		{
			Npc_SetTarget(BAU_962_Bauer, other); AI_StartState(BAU_962_Bauer, ZS_Flee, 0, "");
			Npc_SetTarget(BAU_964_Bauer, other); AI_StartState(BAU_964_Bauer, ZS_Flee, 0, "");
			Npc_SetTarget(BAU_965_Bauer, other); AI_StartState(BAU_965_Bauer, ZS_Flee, 0, "");
			Npc_SetTarget(BAU_966_Bauer, other); AI_StartState(BAU_966_Bauer, ZS_Flee, 0, "");
			Npc_SetTarget(BAU_967_Bauer, other); AI_StartState(BAU_967_Bauer, ZS_Flee, 0, "");
			Npc_SetTarget(BAU_968_Bauer, other); AI_StartState(BAU_968_Bauer, ZS_Flee, 0, "");
			Npc_SetTarget(BAU_969_Bauer, other); AI_StartState(BAU_969_Bauer, ZS_Flee, 0, "");
		};
	};
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// B_NpcObsessedByDMT
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

func void B_NpcObsessedByDMT(var C_Npc medium)
{
	if (NpcObsessedByDMT == FALSE)
	{
		Wld_PlayEffect("DEMENTOR_FX", hero, hero, 0, 0, 0, FALSE);
		CreateInvItems(medium, ITAR_Dementor, 1);
		AI_UnequipArmor(medium);
		AI_EquipArmor(medium, ITAR_Dementor);
		AI_PlayAni(medium, "T_PRACTICEMAGIC5");
		Wld_PlayEffect("spellFX_Fear", medium, medium, 0, 0, 0, FALSE);

		NpcObsessedByDMT = TRUE;

		if (Npc_HasItems(medium, ITWR_DementorObsessionBook_MIS) == FALSE)
		{
			CreateInvItems(medium, ITWR_DementorObsessionBook_MIS, 1);
		};

		///////////////////////////////////////////////////////////////////////
		//			Brutus
		///////////////////////////////////////////////////////////////////////
		if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Brutus))
		{
			if (MIS_OCGateOpen == TRUE)
			{
				AI_Output(self, other, "DIA_Brutus_ObsessedByDMT_19_00"); //Opening the gate was a great service for our Master, puny mortal. We shall erect a shrine in his honor on your grave.
			}
			else
			{
				B_DMTWurm();
			};

			NpcObsessedByDMT_Brutus = TRUE;
		}

		///////////////////////////////////////////////////////////////////////
		//			Engrom
		///////////////////////////////////////////////////////////////////////
		else if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Engrom))
		{
			AI_Output(self, other, "DIA_Engrom_ObsessedByDMT_19_00"); //Turn back. Before it is too late for you.
			NpcObsessedByDMT_Engrom = TRUE;
		}

		///////////////////////////////////////////////////////////////////////
		//			Vino
		///////////////////////////////////////////////////////////////////////
		else if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Vino))
		{
			AI_Output(self, other, "DIA_Vino_ObsessedByDMT_19_00"); //Soon we shall command them all. You and your pathetic magic skills are no danger to us.
			NpcObsessedByDMT_Vino = TRUE;
		}

		///////////////////////////////////////////////////////////////////////
		//			Malak
		///////////////////////////////////////////////////////////////////////
		else if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Malak))
		{
			AI_Output(self, other, "DIA_Malak_ObsessedByDMT_19_00"); //You will not be able to save this soul, magician. He will never return to his own.
			NpcObsessedByDMT_Malak = TRUE;
		}

		///////////////////////////////////////////////////////////////////////
		//			Sekob
		///////////////////////////////////////////////////////////////////////
		else if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Sekob))
		{
			AI_Output(self, other, "DIA_Sekob_ObsessedByDMT_19_00"); //Give up, magician. You cannot win.
			NpcObsessedByDMT_Sekob = TRUE;
		}

		///////////////////////////////////////////////////////////////////////
		//			Randolph
		///////////////////////////////////////////////////////////////////////
		else if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Randolph))
		{
			AI_Output(self, other, "DIA_Randolph_ObsessedByDMT_19_00"); //Do not concern yourself with the weak. We shall enslave them all.
			NpcObsessedByDMT_Randolph = TRUE;
		}

		else // Joly: fÃƒÂ¼r alle anderen
		{
			B_DMTWurm();
			if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Bromor))
			{
				NpcObsessedByDMT_Bromor = TRUE;
			};

			if (Hlp_GetInstanceID(medium) == Hlp_GetInstanceID(Fernando))
			{
				NpcObsessedByDMT_Fernando = TRUE;
			};
		};

		B_GivePlayerXP(XP_SCFoundObsessedNpc);
	}
	else
	{
		B_NpcClearObsessionByDMT(medium);
	};
};
