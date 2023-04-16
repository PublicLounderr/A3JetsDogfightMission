params ["_killer"];

_bluforKills = missionNamespace getVariable "bluforKills";
_independentKills = missionNamespace getVariable "independentKills";
_opforKills = missionNamespace getVariable "opforKills";

switch (side _killer) do {
	case west: { missionNamespace setVariable ["bluforKills", (_bluforKills) + 1]; };
	case east: { missionNamespace setVariable ["opforKills", (_opforKills) + 1]; };
	case independent: { missionNamespace setVariable ["independentKills", (_independentKills) + 1]; };
	default { };
};

// Blufor wins
if (_bluforKills + 1 == killLimit) exitWith {
	// [] remoteExec ["LDR_fnc_winBlufor"];
	[ ["WIN", true, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
	[ ["LOSE", false, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;
	[ ["LOSE", false, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;

	{
		_x allowDamage false;
	} forEach allUnits;
};

// Independent wins
if (_independentKills + 1 == killLimit) exitWith {
	[ ["WIN", true, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;
	[ ["LOSE", false, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
	[ ["LOSE", false, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;

	{
		_x allowDamage false;
	} forEach allUnits;
};

// Opfor wins
if (_opforKills + 1 == killLimit) exitWith {
	[ ["WIN", true, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;
	[ ["LOSE", false, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
	[ ["LOSE", false, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;

	{
		_x allowDamage false;
	} forEach allUnits;
};