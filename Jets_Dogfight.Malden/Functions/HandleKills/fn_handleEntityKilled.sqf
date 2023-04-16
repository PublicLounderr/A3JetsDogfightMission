// Initial setup
addMissionEventHandler ["EntityCreated", {
    params ["_newEntity", "_oldEntity"];

    if (_newEntity isKindOf "Man" && isnil { _x getVariable "passedThatHandledamage" }) then {
        [_newEntity] call LDR_fnc_attachAssisters;
    };
}];


{
    if (isnil { _x getVariable "passedThatHandledamage" }) then {
        [_x] call LDR_fnc_attachAssisters;
    };
} forEach allunits;

// -----------------------------------------------------

// Handle killed entities
addMissionEventHandler ["EntityKilled",
    {
        params ["_killed", "_killer", "_instigator"];

        // Works only for host
        if (isNil { _killed getVariable "lastShooter" } && _killed isKindOf "CAmanBase" && isPlayer _killed) exitWith {
            _deaths = getPlayerScores _killed select 4;
            if (_killed getVariable "isObjectiveDisplayed") then {
                [format["%1 died in action", name _killed]] remoteExec["systemChat", 0];
            };
        };

        _lastShooter = _killed getVariable "lastShooter";
        _assisters = ((_killed getVariable "assisters") - [_lastShooter]);
        
        // DEBUG START
        systemChat ("HEK Assisters: " + str (_assisters apply {name _x}) + ". LastShooter is " + name _lastShooter);

        if (_killed == _lastShooter) then {
            systemChat ("IMPORTANT IMPORTANT IMPORTANT _killed == _lastShooter");
        };
        // DEBUG END
        
        _isFriendly = [(side group _lastShooter), (side group _killed)] call BIS_fnc_sideIsFriendly;

        if (_killed != _lastShooter) then {
            if !(_isFriendly) then {
                
                [_lastShooter] call LDR_fnc_manageScore;


                // Enemy killed
                if (isplayer _lastShooter) then {
                    [format["%1 killed %2", name _lastShooter, name _killed]] remoteExec["systemChat", 0];
                    [_lastShooter, _killed] remoteExec["LDR_fnc_enemyKilled", _lastShooter];
                };
                
                // Kill assist
                {
                    _assister = _x;
                    if (isplayer _assister) then {
                        [] remoteExec["LDR_fnc_assist", _assister];
                    };
                } forEach _assisters;
            } else {
                // Teamkill
                [format["%1 teamkilled %2", name _lastShooter, name _killed]] remoteExec["systemChat", 0];
                [_lastShooter, _killed] remoteExec["LDR_fnc_teamkill", _lastShooter];
            };
        };
        
        // Destroy jet
        _jet = (objectParent (_killed));
        _jet setDamage 1;
        
        // Clean up
        _killed removeAllEventHandlers "Handledamage";
        _killed setVariable ["assisters", [], true];
        _killed setVariable ["lastShooter", nil, true];
    }];