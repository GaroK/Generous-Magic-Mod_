func void B_GiveNpcTalents(var C_Npc slf)
{
	// ------ Magierkreis 6 bei allen NSCs (potentiell wichtig fÃƒÂ¼rs Runen-Equippen) -------
	Npc_SetTalentSkill(slf, NPC_TALENT_MAGE, 6);

	// ------ Kampf-Talente ------
	// werden ÃƒÂ¼ber B_AddFightSkill gesetzt

	// ------ Sonstige Talente ------
	Npc_SetTalentSkill(slf, NPC_TALENT_PICKLOCK, 1); // hÃƒÂ¤ngt ab von DEX (auf Programmebene)
	Npc_SetTalentSkill(slf, NPC_TALENT_SNEAK, 1);
	Npc_SetTalentSkill(slf, NPC_TALENT_ACROBAT, 0);

	Npc_SetTalentSkill(slf, NPC_TALENT_PICKPOCKET, 0); // hÃƒÂ¤ngt ab von DEX (auf Scriptebene)
	Npc_SetTalentSkill(slf, NPC_TALENT_SMITH, 1);
	Npc_SetTalentSkill(slf, NPC_TALENT_RUNES, 1);
	Npc_SetTalentSkill(slf, NPC_TALENT_ALCHEMY, 1);
	Npc_SetTalentSkill(slf, NPC_TALENT_TAKEANIMALTROPHY, 0);
};
