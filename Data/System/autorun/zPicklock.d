META
{
	After = zUnionVob.d;
};

namespace zParserExtender
{
	func int C_CanUnlockFocusVob(var C_NPC npc)
	{
		var C_VOB focusVob;
		var string combination;
		if(!Hlp_HasFocusVob(npc))
		{
			return FALSE; //nothing in focus
		};
		focusVob = Hlp_GetFocusVob(npc);
		if(!Mob_IsLocked(focusVob))
		{
			return FALSE; //not locked
		};
		combination = Mob_GetLockCombination(focusVob);
		if(Hlp_StrCmp(combination,""))
		{
			return FALSE; //locked with key
		};
		return TRUE;
	};

	func void B_UnlockFocusVob(var C_NPC npc)
	{
		var C_VOB focusVob;
		focusVob = Hlp_GetFocusVob(npc);
		Mob_SetLocked(focusVob,FALSE);
		Snd_Play("PICKLOCK_UNLOCK");
	};
};
