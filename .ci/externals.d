// #if __gothic_dat__ { // This is new dacode version directive
#if _gothic_dat {
    func instance AI_StartTriggerScript(var string f, var int delay) {};
    func void AI_CallScript(var string funcName, var C_NPC slf, var C_NPC oth) {};
    func void Hlp_PrintConsole(var string message) {};
    func string Str_Format( var string format, ... ) {};
}
