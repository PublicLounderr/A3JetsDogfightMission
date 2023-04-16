setviewDistance 9500;
setobjectviewDistance [6500, 50];

// Displays score
call BIS_fnc_showMissionStatus;

// Delete respawn point markers
call LDR_fnc_deleteRespawnMarkers;

// Place resupply markers
{
    _marker = createMarker [str _x, _x];
    _marker setMarkertype "loc_rearm";
    _marker setMarkersize [1.6, 1.6];
    _marker setMarkerColor "ColorYellow";    
} forEach [resupply1, resupply2, resupply3, resupply4];

// Scoreboard init
[] execVM "Score_Bar\Score_Bar_Player.sqf";

// Set how many kills to end the game
killLimit = 3;

// Set how long the match will last (seconds) - 1500s
timeLimit = 1500;

//-------------------------------------------------

#include "Score_Bar\Score_Bar.sqf";
