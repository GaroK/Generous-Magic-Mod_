var int Player_Brrr_01;
var int Current_Blessing_Day;


func void RemoveBlessing(){
    if (Current_Blessing_Day != Wld_GetDay())
    {    
        if (Isgaroth_Blessing_Bonus == 1)
        {
          hero.protection [PROT_POINT] -= Isgaroth_Bonus;
		  hero.protection [PROT_EDGE] -= Isgaroth_Bonus;
		  hero.protection [PROT_BLUNT] -= Isgaroth_Bonus;
		  hero.protection [PROT_FLY] -= Isgaroth_Bonus;
		  hero.protection [PROT_MAGIC] -= Isgaroth_Bonus;
		  hero.protection [PROT_FIRE] -= Isgaroth_Bonus;
        };
		
		  if (Pyrokar_Blessing_Bonus == 1)
        {
          hero.protection [PROT_POINT] -= Pyrokar_Bonus;
		  hero.protection [PROT_EDGE] -= Pyrokar_Bonus;
		  hero.protection [PROT_BLUNT] -= Pyrokar_Bonus;
		  hero.protection [PROT_FLY] -= Pyrokar_Bonus;
		  hero.protection [PROT_MAGIC] -= Pyrokar_Bonus;
		  hero.protection [PROT_FIRE] -= Pyrokar_Bonus;
        };
		
		  if (Pyrokar_Blessing_Bonus_Chapter_5 == 1)
        {
          hero.protection [PROT_POINT] -= Pyrokar_Bonus_Chapter_5;
		  hero.protection [PROT_EDGE] -= Pyrokar_Bonus_Chapter_5;
		  hero.protection [PROT_BLUNT] -= Pyrokar_Bonus_Chapter_5;
		  hero.protection [PROT_FLY] -= Pyrokar_Bonus_Chapter_5;
		  hero.protection [PROT_MAGIC] -= Pyrokar_Bonus_Chapter_5;
		  hero.protection [PROT_FIRE] -= Pyrokar_Bonus_Chapter_5;
        };
		
		  if (Vatras_Blessing_Bonus == 1)
        {
          Health_Regen_OFF();
        };
		
       Current_Blessing_Day = Wld_GetDay();
    };
    
};

func event GameLoop()
{
    RemoveBlessing();
    if(Player_Brrr_01 == FALSE)
    {
        if(CurrentLevel == ADDONWORLD_ZEN)
        {
            if(Npc_GetDistToWP(hero,"ADW_PIRATECAMP_SECRETCAVE_02") < 1600)
            {
                B_Say_Overlay(hero,hero,"$COUGH");
                Player_Brrr_01 = TRUE;
            };
        };
    };
};