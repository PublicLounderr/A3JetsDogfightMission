params ["_player"];

_player addEventHandler ["GetoutMan", {
    params ["_unit", "_role", "_vehicle"];
        
    [_unit, _vehicle] spawn {
        params ["_unit", "_vehicle"];
                
        if (!isnil {_vehicle getVariable "isJet"}) then {
            waitUntil { _vehicle != vehicle _unit };
            
            moveOut _unit;
            
            waitUntil { _unit == vehicle _unit };
            
            _vehicle setDamage 1;
            _unit setDamage 1;
        };
    }
}];