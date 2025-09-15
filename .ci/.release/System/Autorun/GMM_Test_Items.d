const int BookLp_GMM = 999;


func void Use_AppleOfKnowledge()
{

self.lp = 999;
Npc_SetTalentSkill(self, NPC_TALENT_MAGE, 6);

B_RaiseAttribute(self, ATR_MANA_MAX,300);
Npc_ChangeAttribute(self, ATR_MANA, 300);
B_RaiseAttribute(self, ATR_HITPOINTS_MAX, 1500);
Npc_ChangeAttribute(self, ATR_HITPOINTS, 1500);
B_RaiseAttribute(self, ATR_DEXTERITY, 300);
B_RaiseAttribute(self, ATR_STRENGTH, 300);

Print("zPE is gg");
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Health_01);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Health_02);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Health_03);

Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Mana_01);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Mana_02);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Mana_03);


Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Perm_Health);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Perm_Dex);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Perm_Str);
Npc_SetTalentSkill (self, NPC_TALENT_ALCHEMY, POTION_Speed);

};

instance ItFo_AppleOfKnowledge(C_Item)
{
	name						= "Apple of Knowledge";

	mainflag					= ITEM_KAT_FOOD;
	flags						= ITEM_MULTI;

	visual						= "ItFo_Apple.3DS";
	material					= MAT_LEATHER;

	scemeName					= "FOOD";
	on_state[0]					= Use_AppleOfKnowledge;

	value						= Value_Apple;

	description					= name;
	text[0]						= "";											count[0] = 0;
	text[1]						= NAME_Bonus_HP;								count[1] = HP_Apple;
	text[2]						= "";											count[2] = 0;
	text[3]						= "Ein frischer Apfel";							count[3] = 0;
	text[4]						= "knackig und saftig";							count[4] = 0;
	text[5]						= NAME_Value;									count[5] = Value_Apple;

};

instance Spawn_Test_Items(C_Item)
{
	name = "Spawn Test Items";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItRu_TeleportOWDemonTower.3DS";
	material = MAT_STONE;
	on_state[0] = UseGMMSpawn;
	scemeName = "MAP";
	description = name;
	text[0] = "";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};
	

func void UseGMMSpawn()
{
Print(GMM_Version_Check);

			// Staffs
	CreateInvItems(self,ItMW_GMM_Stab_01_Mana_V0,1);
	CreateInvItems(self,ItMW_GMM_Stab_02_Regen_V0,1);
	CreateInvItems(self,ItMW_GMM_Stab_03_Eff_V0,1);
	CreateInvItems(self,ItMW_GMM_Stab_04_Summon_V0,1);
	
	CreateInvItems(self,ItMW_GMM_Stab_01_Mana_V1,1);
	CreateInvItems(self,ItMW_GMM_Stab_02_Regen_V1,1);
	CreateInvItems(self,ItMW_GMM_Stab_03_Eff_V1,1);
	CreateInvItems(self,ItMW_GMM_Stab_04_Summon_V1,1);
	
	CreateInvItems(self,ItMW_GMM_Stab_01_Mana_V2,1);
	CreateInvItems(self,ItMW_GMM_Stab_02_Regen_V2,1);
	CreateInvItems(self,ItMW_GMM_Stab_03_Eff_V2,1);
	CreateInvItems(self,ItMW_GMM_Stab_04_Summon_V2,1);
	
	CreateInvItems(self,ItMW_GMM_Stab_01_Mana_V3,1);
	CreateInvItems(self,ItMW_GMM_Stab_02_Regen_V3,1);
	CreateInvItems(self,ItMW_GMM_Stab_03_Eff_V3,1);
	CreateInvItems(self,ItMW_GMM_Stab_04_Summon_V3,1);
	CreateInvItems(self,ItFo_AppleOfKnowledge,999);
	


			// Runes	
		CreateInvItems(self,ItAr_KdF_L,1);
		CreateInvItems(self,ItAr_Kdf_H,1);
		CreateInvItems(self,ItAr_Dementor,1);
		CreateInvItems(self,ItRu_Whirlwind,1);
		CreateInvItems(self,ItRu_Geyser,1);
		CreateInvItems(self,ItRu_Waterfist,1);
		CreateInvItems(self,ItRu_SuckEnergy,1);
		CreateInvItems(self,ItRu_GreenTentacle,1);
		CreateInvItems(self,ItRu_Swarm,1);
		CreateInvItems(self,ItRu_Zap,1);
		CreateInvItems(self,ItRu_LightningFlash,1);
		CreateInvItems(self,ItRu_ChargeFireball,1);
		CreateInvItems(self,ItRu_Fear,1);
		CreateInvItems(self,ItRu_ThunderBall,1);
		CreateInvItems(self,ItRu_Pyrokinesis,1);
		CreateInvItems(self,ItRu_IceWave,1);
		CreateInvItems(self,ITRU_ARMYOFDARKNESS,1);
		CreateInvItems(self,Itsc_Whirlwind,100);
		CreateInvItems(self,Itsc_Geyser,100);
		CreateInvItems(self,Itsc_Waterfist,100);
		CreateInvItems(self,Itsc_Zap,100);
		CreateInvItems(self,Itsc_LightningFlash,100);
		CreateInvItems(self,Itsc_ChargeFireball,100);
		CreateInvItems(self,Itsc_Fear,100);
		CreateInvItems(self,Itsc_ThunderBall,100);
		CreateInvItems(self,Itsc_Pyrokinesis,100);
		CreateInvItems(self,Itsc_IceWave,100);
		CreateInvItems(self,ItMi_RuneBlank,100);
	

				// Alchemy
			CreateInvItems(self,ItMi_Flask,100);
			CreateInvItems(self,ItPl_Beet,100);
			CreateInvItems(self,ItPl_Blueplant,100);
			CreateInvItems(self,ItPl_Dex_Herb_01,100);
			CreateInvItems(self,ItPl_Health_Herb_01,100);
			CreateInvItems(self,ItPl_Health_Herb_02,100);
			CreateInvItems(self,ItPl_Health_Herb_03,100);
			CreateInvItems(self,ItPl_Mana_Herb_01,100);
			CreateInvItems(self,ItPl_Mana_Herb_02,100);
			CreateInvItems(self,ItPl_Mana_Herb_03,100);
			CreateInvItems(self,ItPl_Perm_Herb,100);
			CreateInvItems(self,ItPl_Speed_Herb_01,100);
			CreateInvItems(self,ItPl_Strength_Herb_01,100);
			CreateInvItems(self,ItPl_Temp_Herb,100);
		
				//Runemaking
				CreateInvItems(self,Itmi_Aquamarine,100);
				CreateInvItems(self,ItPl_SwampHerb,100);
				CreateInvItems(self,ItMi_DarkPearl,100);
				CreateInvItems(self,ItAt_WaranFireTongue,100);
				CreateInvItems(self,ItAt_TrollTooth,100);
				CreateInvItems(self,Itpl_Health_Herb_03,100);
				CreateInvItems(self,Itat_GoblinBone,100);
				CreateInvItems(self,ItAt_SkeletonBone,100);
				CreateInvItems(self,Itmi_Quartz,100);
				CreateInvItems(self,ItAt_DemonHeart,100);
				CreateInvItems(self,Itat_StoneGolemHeart,100);
				CreateInvItems(self,ItMi_Sulfur,100);
				CreateInvItems(self,ItMi_RockCrystal,100);
				CreateInvItems(self,ItAt_WolfFur,100);
				CreateInvItems(self,ItMi_Pitch,100);
				CreateInvItems(self,Itmi_Coal,100);
				CreateInvItems(self,Itmi_HolyWater,100);
				CreateInvItems(self,ItMi_Pliers,100);
				
			
};



