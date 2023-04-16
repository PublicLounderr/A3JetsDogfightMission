countdown = -1;

missionTime = {
	countdown = _this select 0;

	while {countdown > 0} do
	{
		if (countdown isEqualTo 1) then {
			if (bluforKills > opforKills && bluforKills > IndependentKills) exitWith {
				[ ["WINTIME", true, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
				[ ["LOSETIME", false, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;
				[ ["LOSETIME", false, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;

				{
					_x allowDamage false;
				} forEach allUnits;			
			};

			if (opforKills > bluforKills && opforKills > IndependentKills) exitWith {
				[ ["WINTIME", true, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;
				[ ["LOSETIME", false, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
				[ ["LOSETIME", false, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;

				{
					_x allowDamage false;
				} forEach allUnits;			
			};
			
			if (IndependentKills > opforKills && IndependentKills > bluforKills) exitWith {
				[ ["WINTIME", true, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;
				[ ["LOSETIME", false, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
				[ ["LOSETIME", false, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;

				{
					_x allowDamage false;
				} forEach allUnits;			
			};

			[ ["TIETIME", true, true, false, false], "BIS_fnc_endMission", independent, false] call BIS_fnc_MP;
			[ ["TIETIME", false, true, false, false], "BIS_fnc_endMission", west, false] call BIS_fnc_MP;
			[ ["TIETIME", false, true, false, false], "BIS_fnc_endMission", east, false] call BIS_fnc_MP;
		};
		
		countdown = countdown - 1;  
		timeLeft = format ["%1", [countdown,"MM:SS"] call BIS_fnc_secondsToString];
		publicVariable "timeLeft";
		sleep 1;
	};
};

timeScript = [timeLimit] spawn missionTime;