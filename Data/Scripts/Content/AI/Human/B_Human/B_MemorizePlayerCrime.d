// ***********************************************************************
// B_MemorizePlayerCrime
// ---------------------
// Neue Tat ÃƒÂ¼berschreibt alte Tat, wenn sie schwerer oder gleichschwer ist
// Tag wird gemerkt
// CrimeAbsolutionLevel wird gemerkt
// ---------------------------------
// Ausserdem wird gepetzt, wenn NSC Mitglied einet Petz-Gruppe ist
// ***********************************************************************

func void B_MemorizePlayerCrime(var C_Npc slf, var C_Npc taeter, var int crime)
{
	// EXIT if...

	// ------ Sicherheitsabfrage ------
	if (!Npc_IsPlayer(taeter))
	{
		return;
	};

	// ------ Gilden, die nicht auf Crimes reagieren ------
	if (slf.guild == GIL_DMT)
	// || (slf.guild == GIL_BDT) Addon Banditen reagieren auf Crimes, allerdings nur die im Lager
	{
		return;
	};

	// FUNC

	// ------ PETZCRIME fÃƒÂ¼r HomeLocation ÃƒÂ¼berschreiben, wenn schwerer als vorherige ------
	if (crime > B_GetPlayerCrime(slf))
	{
		B_DeletePetzCrime(slf);

		B_AddPetzCrime(slf, crime);
	};

	// ------ neue Straftat ÃƒÂ¼berschreibt alte, wenn sie schwerer (oder gleichschwer) ist ------
	if (crime >= B_GetPlayerCrime(slf))
	{
		slf.aivar[AIV_NpcSawPlayerCommit] = crime;
		slf.aivar[AIV_NpcSawPlayerCommitDay] = Wld_GetDay();
		slf.aivar[AIV_CrimeAbsolutionLevel] = B_GetCurrentAbsolutionLevel(slf); // bleibt fÃƒÂ¼r NSCs, die NICHT zu City/Monastery/Farm gehÃƒÂ¶ren, immer 0
	};
};
