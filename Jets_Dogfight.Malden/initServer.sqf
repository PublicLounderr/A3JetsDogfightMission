[] call LDR_fnc_handleEntityKilled;

[] execVM "GameSettings.sqf";

missionNamespace setVariable ["bluforKills", 0, true];
missionNamespace setVariable ["opforKills", 0, true];
missionNamespace setVariable ["independentKills", 0, true];
