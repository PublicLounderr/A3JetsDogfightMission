player setVariable ["isObjectiveDisplayed", false];

player addMPEventHandler ["MPRespawn", {
	params ["_unit", "_corpse"];

    // ["RespawnBlackout", false] call BIS_fnc_blackOut; 

	
    if ! (player getVariable "isObjectiveDisplayed") then {
        [player] spawn {
            sleep 1;
            titleText ["<t color='#00000000' shadow='0' size='10'>MARGIN</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>ELIMINATE THE BANDITS</t><br/>", "PLAIN", 0, true, true];
            player setVariable ["isObjectiveDisplayed", true];
        };
    }
}];