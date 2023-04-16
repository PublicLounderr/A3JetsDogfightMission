private ["_side","_sideVar","_faction"];
_side = _this param [0,sideunknown,[sideunknown]];
_sideVar = _fnc_scriptname + str _side;
_faction = missionnamespace getvariable _sideVar;
if (isnil "_faction") then {
	_faction = "";
	{
		if ((_x call bis_fnc_objectside) == _side) exitwith {
			_faction = faction _x;
			missionnamespace setvariable [_sideVar,_faction];
		};
	} foreach allUnits;
};
_faction
