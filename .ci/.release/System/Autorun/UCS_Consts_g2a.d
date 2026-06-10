
// Damage Types (You can add custom damage types here) /////
const int DT_BARRIER = 0;
const int DT_BLUNT = 1;
const int DT_EDGE = 2;
const int DT_FIRE = 3;
const int DT_FLY = 4;
const int DT_MAGIC = 5;
const int DT_POINT = 6;
const int DT_FALL = 7;
/* const int DT_POISON = 8; */ // CUSTOM DAMAGE TYPE


// FX Prototypes (You can add your FX prototypes here) /////

/* const int LightningFXP = 0; */ // FX PROTOTYPE
/* const int SomeFXP = 1; */
/* const int AnotherFXP = 2; */


/* func void vf(){}; */ // void exit condition

/* func int isWeak(var int fxID) // exit condition
{
	// fxID - fx instance
	// self - damage receiver
	// other - damage sender
	
	if(self.attribute[ATR_HITPOINTS] < self.attribute[ATR_HITPOINTS_MAX] / 5)
	{
		return true;
	};
	
	return false;
}; */

func void UCS_Init()
{
	// FX PROTOTYPES MUST BE REGISTERED
	
	/* UCS_CreateFXProto(LightningFXP, 10, DT_MAGIC, SPL_LightningFlash, "SPELLFX_LIGHTNINGFLASH_TARGET_CLOUD", 0, 1500, 10, isWeak); */
	/* UCS_CreateFXProto(SomeFXP, 2, DT_BLUNT, -1, "", 1, 100, 75, vf); */
	/* UCS_CreateFXProto(AnotherFXP, 300, DT_FLY, -1, "", 0, 8000, 3, vf); */
};


// SWITCHERS /////

func int SwitchByDT(var int damageType, var int barrier, var int blunt, var int edge, var int fire, var int fly, var int magic, var int point, var int fall, var int poison)
{
	/* if(damageType == DT_BARRIER){ return barrier; };
	if(damageType == DT_BLUNT){ return blunt; };
	if(damageType == DT_EDGE){ return edge; };
	if(damageType == DT_FIRE){ return fire; };
	if(damageType == DT_FLY){ return fly; };
	if(damageType == DT_MAGIC){ return magic; };
	if(damageType == DT_POINT){ return point; };
	if(damageType == DT_FALL){ return fall; };
	if(damageType == DT_POISON){ return poison; }; */
	
	return -1;
};

func int SwitchBySpellID(var int spellID, var int geyser, var int icebolt, var int icecube, var int icelance, 
var int thunderstorm, var int waterfist, var int whirlwind, var int breathofdeath, var int chargezap, 
var int deathball, var int deathbolt, var int lightningflash, var int massdeath, var int suckenergy,
var int zap, var int chargefireball, var int destroyundead, var int firebolt,
var int firerain, var int firestorm, var int instantfireball, var int pyrokinesis)
{
	/* if(spellID == SPL_Geyser) { return geyser; };
	if(spellID == SPL_Icebolt) { return icebolt; };
	if(spellID == SPL_IceCube) { return icecube; };
	if(spellID == SPL_IceLance) { return icelance; };
	if(spellID == SPL_Thunderstorm) { return thunderstorm; };
	if(spellID == SPL_WaterFist) { return waterfist; };
	if(spellID == SPL_Whirlwind) { return whirlwind; };
	if(spellID == SPL_BreathOfDeath) { return breathofdeath; };
	if(spellID == SPL_ChargeZap) { return chargezap; };
	if(spellID == SPL_Deathball) { return deathball; };
	if(spellID == SPL_Deathbolt) { return deathbolt; };
	if(spellID == SPL_LightningFlash) { return lightningflash; };
	if(spellID == SPL_MassDeath) { return massdeath; };
	if(spellID == SPL_SuckEnergy) { return suckenergy; };
	if(spellID == SPL_Zap) { return zap; };
	if(spellID == SPL_ChargeFireball) { return chargefireball; };
	if(spellID == SPL_DestroyUndead) { return destroyundead; };
	if(spellID == SPL_Firebolt) { return firebolt; };
	if(spellID == SPL_Firerain) { return firerain; };
	if(spellID == SPL_Firestorm) { return firestorm; };
	if(spellID == SPL_InstantFireball) { return instantfireball; };
	if(spellID == SPL_Pyrokinesis) { return pyrokinesis; }; */
	
	return -1;
};

func int isFireSpell(var int spellID)
{
	if(spellID == SPL_Firebolt){ return true; };
	if(spellID == SPL_InstantFireball){ return true; };
	if(spellID == SPL_ChargeFireball){ return true; };
	if(spellID == SPL_Firestorm){ return true; };
	if(spellID == SPL_Deathbolt){ return true; };
	if(spellID == SPL_Deathball){ return true; };
	if(spellID == SPL_Pyrokinesis){ return true; };
	if(spellID == SPL_Firerain){ return true; };
	
	return false;
};
func int SwitchByFireSpell
(
	var int spellID,
	var int firebolt, var int instantFireball, var int chargeFireball, var int firestorm,
	var int deathball, var int deathbolt, var int pyrokinesis, var int firerain
)
{
	if(spellID == SPL_Firebolt){ return firebolt; };
	if(spellID == SPL_InstantFireball){ return instantFireball; };
	if(spellID == SPL_ChargeFireball){ return chargeFireball; };
	if(spellID == SPL_Firestorm){ return firestorm; };
	if(spellID == SPL_Deathbolt){ return deathball; };
	if(spellID == SPL_Deathball){ return deathbolt; };
	if(spellID == SPL_Pyrokinesis){ return pyrokinesis; };
	if(spellID == SPL_Firerain){ return firerain; };
	
	return false;
};