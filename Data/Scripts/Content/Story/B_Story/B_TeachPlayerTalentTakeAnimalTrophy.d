// ***********************************
// B_TeachPlayerTalentTakeAnimalTrophy
// ***********************************

func int B_TeachPlayerTalentTakeAnimalTrophy(var C_Npc slf, var C_Npc oth, var int trophy)
{
	// ------ Kosten festlegen ------
	var int kosten;
	kosten = B_GetLearnCostTalent(oth, NPC_TALENT_TAKEANIMALTROPHY, trophy);

	// EXIT if...

	// ------ Player hat zu wenig Lernpunkte ------
	if (oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints, -1, -1, FONT_ScreenSmall, 2);
		B_Say(slf, oth, "$NOLEARNNOPOINTS");

		return FALSE;
	};

	// FUNC

	// ------ Lernpunkte abziehen ------
	oth.lp = oth.lp - kosten;

	Log_CreateTopic(TOPIC_TalentAnimalTrophy, LOG_NOTE);
	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_1);

	// ------ KÃƒÂ¶rperteil nehmen lernen ------

	if (trophy == TROPHY_Teeth) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_2); };
	if (trophy == TROPHY_Claws) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_3); };
	if (trophy == TROPHY_Fur) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_4); };
	if (trophy == TROPHY_ReptileSkin) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_5); }; // ADDON
	if (trophy == TROPHY_Heart) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Heart] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_6); };
	if (trophy == TROPHY_ShadowHorn) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ShadowHorn] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_7); };
	if (trophy == TROPHY_FireTongue) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FireTongue] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_8); };
	if (trophy == TROPHY_BFWing) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_9); };
	if (trophy == TROPHY_BFSting) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_10); };
	if (trophy == TROPHY_Mandibles) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Mandibles] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_11); };
	if (trophy == TROPHY_CrawlerPlate) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CrawlerPlate] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_12); };
	if (trophy == TROPHY_DrgSnapperHorn) { PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DrgSnapperHorn] = TRUE;

	B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_13); };
	if (trophy == TROPHY_DragonScale)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] = TRUE;
		CreateInvItems(Swampdragon, ItAt_DragonScale, 12);
		CreateInvItems(Rockdragon, ItAt_DragonScale, 12);
		CreateInvItems(Firedragon, ItAt_DragonScale, 12);
		CreateInvItems(Icedragon, ItAt_DragonScale, 12);

		B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_14);
	};

	if (trophy == TROPHY_DragonBlood)
	{
		PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] = TRUE;
		CreateInvItems(Swampdragon, ItAt_DragonBlood, 2);
		CreateInvItems(Rockdragon, ItAt_DragonBlood, 2);
		CreateInvItems(Firedragon, ItAt_DragonBlood, 2);
		CreateInvItems(Icedragon, ItAt_DragonBlood, 2);

		B_LogEntry(TOPIC_TalentAnimalTrophy, TOPIC_TalentAnimalTrophy_15);
	};

	PrintScreen(PRINT_LearnTakeAnimalTrophy, -1, -1, FONT_Screen, 2);

	// ------ bei jedem KÃƒÂ¶rperteil: TakeAnimalTrophy-Talent lernen (programmvariable, wird nur zur Ausgabe in StatusScreen benutzt) ------
	Npc_SetTalentSkill(oth, NPC_TALENT_TAKEANIMALTROPHY, 1);
	return TRUE;
};
