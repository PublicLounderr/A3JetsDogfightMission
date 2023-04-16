params ["_player", "_didJIP"];

// Destroy spawned jet on eject
[_player] call LDR_fnc_destroyOnGetout;

// Create map-visible task
_task = player createSimpleTask ["Eliminate the bandits"];
_task setTaskState "ASSIGNED";

[] spawn LDR_fnc_zoneRestriction;

// Displays the message on initial spawn
[] call LDR_fnc_initialObjectiveDisplay;