

/* var int lightningFX; */ // FX INSTANCE
/* var int someFX; */
/* var int anotherFX; */

/* var int thisFX; */
var int afterburnFX;

//apply X damage every Y milliseconds Z times with W delay;
var int afterburnDamage; //X (defining on the spot)
const float afterburnInterval = 1000; //Y
const int afterburnIters = 5; //Z
const float afterburnDelay = 1000; //W

func int isAfterburnOver(var int fxID)
{
	if(C_BodyStateContains(self,BS_SWIM))
	{
		return true;
	};
	if(C_BodyStateContains(self,BS_DIVE))
	{
		return true;
	};
	
	return false;
};


// ACTIONS /////

func void OnPreDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
};
func void OnPostDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int spellID)
{
    if(damageType == DT_MAGIC && isFireSpell(spellID))
    {
        if(!Npc_IsPlayer(damageReceiver))
        {
            afterburnDamage = 
            SwitchByFireSpell
            (
                spellID,
                2, 3, 5, 5,
                5, 5, 10, 10
            ); //X
            
            if(spellID == SPL_Firebolt)
            {
                UCS_RestartFXEX(afterburnFX, damageSender, damageReceiver, afterburnDamage, DT_FALL, -1, "", 0, afterburnInterval, afterburnIters, afterburnDelay, isAfterburnOver);
            }
            else if(spellID == SPL_Pyrokinesis)
            {
                UCS_RestartFXEX(afterburnFX, damageSender, damageReceiver, afterburnDamage, DT_FALL, -1, "", 0, afterburnInterval, afterburnIters, afterburnDelay, isAfterburnOver);
            };
        };
    };
};




// CALCULATIONS /////

func int CalcMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialMinimalDamage, var int spellID)
{
	var int i; i = initialMinimalDamage; // i - initial minimal damage
	
	var int resultDamage; resultDamage = i;
	
	
	resultDamage = SwitchByDT(damageType, i, i, i, 0, i, i, i, i, i);
	
	return resultDamage;
};

func int CalcPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int spellID)
{
	var int i; i = initialPureDamage; // i - initial pure damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultInt(i, 1.10), i, i, i, i, i, i, 0);
	}; */
	
	return resultDamage;
};

func int CalcTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialTotalDamage, var int spellID)
{
	var int i; i = initialTotalDamage; // i - initial total damage
	
	var int resultDamage; resultDamage = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultDamage = SwitchByDT(damageType, i, Hlp_MultInt(i, 1.50), i, i, i, i, i, i, 0);
	}; */
	
	return resultDamage;
};

func int GetProtectionOfEquipment(var C_NPC damageReceiver, var int damageType, var int spellID)
{
	var int resultProtection; resultProtection = 0;
	
	
	/* if(Hlp_IsItemEquipped(ItAm_PROT_POISON_01, damageReceiver))
	{
		resultProtection += SwitchByDT(damageType, 0, 0, 0, 0, 0, 0, 0, 0, 30);
	}; */
	
	return resultProtection;
};

func int CalcProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID)
{
	var int i; i = initialProtection; // i - initial protection
	
	if(i != -1) // -1 - immunity
	{
		i += GetProtectionOfEquipment(damageReceiver, damageType, spellID);
	};
	
	var int resultProtection; resultProtection = i;
	
	
	/* if(damageReceiver.aivar[AIV_MM_REAL_ID] == ID_STONEGOLEM)
	{
		resultProtection = SwitchByDT(damageType, i, 0, -1, i, i, i, i, i, i);
	}; */
	
	/* if(damageType == DT_POISON)
	{
		if(Npc_IsPlayer(damageReceiver))
		{
			resultProtection = damageReceiver.aivar[ATR_HITPOINTS_MAX] / 2;
		};
	}; */
	
	if(damageType == DT_FIRE)
	{
		if(UCS_IsRunning(afterburnFX, damageSender, damageReceiver))
		{
			resultProtection = 0;
		};
	};
	
	return resultProtection;
};


func int GetMultiplier(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int isCrit)
{
	var int resultMultiplier; resultMultiplier = -1;
	
	
	/* if(!isCrit)
	{
		if(damageType == DT_POISON)
		{
			resultMultiplier = 900; // 0.9x
		};
	};
	if(isCrit)
	{
		if(damageType == DT_POISON)
		{
			resultMultiplier = 1000; // 1.0x
		};
	}; */
	
	return resultMultiplier;
};
func int GetMinimalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialMinimalDamage, var int spellID)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcMinimalDamage(damageSender, damageReceiver, damageType, initialMinimalDamage, spellID);
	
	return resultDamage;
};
func int GetPureDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int spellID)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID);
	
	return resultDamage;
};
func int GetTotalDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialTotalDamage, var int spellID)
{
	var int resultDamage; resultDamage = -1;
	
	resultDamage = CalcTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID);
	
	return resultDamage;
};
func int GetProtection(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialProtection, var int spellID)
{
	var int resultProtection; resultProtection = -2;
	
	resultProtection = CalcProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
	
	return resultProtection;
};
func int GetCustomDamageType(var C_NPC damageSender, var C_NPC damageReceiver, var int itemInstance_ID)
{
	var int resultDamageType; resultDamageType = -1;
	
	/* if(damageSender.aivar[AIV_MM_REAL_ID] == ID_WARAN || damageSender.aivar[AIV_MM_REAL_ID] == ID_BLOODFLY)
	{
		resultDamageType = DT_POISON;
	}; */
	
	return resultDamageType;
};
func int GetCustomDamage(var C_NPC damageSender, var C_NPC damageReceiver, var int damageType, var int initialPureDamage, var int isCrit, var int spellID)
{
	var int pureDamage; pureDamage = GetPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID);
	var int protection; protection = GetProtection(damageSender, damageReceiver, damageType, 0, spellID);
	var int minimalDamage; minimalDamage = GetMinimalDamage(damageSender, damageReceiver, damageType, 0, spellID);
	var float multiplier; multiplier = Hlp_MultInt_F(GetMultiplier(damageSender, damageReceiver, damageType, isCrit), 0.001);
	
	if(protection == -1)
	{
		return 0;
	};
	
	var int totalDamage; totalDamage = 0;
	
	/* if(damageType == DT_POISON)
	{
		var int initialTotalDamage; initialTotalDamage = pureDamage + ((damageReceiver.attribute[ATR_HITPOINTS_MAX] - protection) / 10);
		
		totalDamage = GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID);
	}; */
	
	totalDamage = Hlp_MultInt(totalDamage, multiplier);
	
	if((minimalDamage >= 0) && (totalDamage < minimalDamage))
	{
		totalDamage = minimalDamage;
	};
	
	return totalDamage;
};


// ENGINE FUNCTIONS /////
// FUNCTIONS BELOW ARE CALLED BY THE ENGINE, BE CAREFUL WHEN CHANGING THEM! /////

func void PullPreDamage(var int damageType, var int spellID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	OnPreDamage(damageSender, damageReceiver, damageType, spellID);
};
func void PullPostDamage(var int damageType, var int spellID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	OnPostDamage(damageSender, damageReceiver, damageType, spellID);
};
func int PullCustomDamageType(var int itemInstance_ID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetCustomDamageType(damageSender, damageReceiver, itemInstance_ID);
};
func int PullCustomDamage(var int damageType, var int initialPureDamage, var int isCrit, var int spellID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetCustomDamage(damageSender, damageReceiver, damageType, initialPureDamage, isCrit, spellID);
};
func int PullMultiplier(var int damageType, var int isCrit)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetMultiplier(damageSender, damageReceiver, damageType, isCrit);
};
func int PullMinimalDamage(var int damageType, var int initialMinimalDamage, var int spellID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetMinimalDamage(damageSender, damageReceiver, damageType, initialMinimalDamage, spellID);
};
func int PullPureDamage(var int damageType, var int initialPureDamage, var int spellID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetPureDamage(damageSender, damageReceiver, damageType, initialPureDamage, spellID);
};
func int PullTotalDamage(var int damageType, var int initialTotalDamage, var int spellID) 
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetTotalDamage(damageSender, damageReceiver, damageType, initialTotalDamage, spellID);
};
func int PullProtection(var int damageType, var int initialProtection, var int spellID)
{
	var C_NPC damageSender; damageSender = UCS_GetDamageSender();
	var C_NPC damageReceiver; damageReceiver = UCS_GetDamageReceiver();
	
	return GetProtection(damageSender, damageReceiver, damageType, initialProtection, spellID);
};
