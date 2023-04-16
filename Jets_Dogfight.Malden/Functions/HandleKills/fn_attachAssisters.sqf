params ["_newEntity"];

_newEntity setVariable ["assisters", []];

_newEntity addEventHandler ["Handledamage", {
    params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitindex", "_instigator", "_hitPoint"];
    
    // systemChat ("-------------------");
    // systemChat ("player EH:::Source: " + name _source);
    // systemChat ("player EH:::Source driver: " + name driver _source);
    // systemChat ("player EH:::instigator: " + name _instigator);
    // systemChat ("-------------------");
    
    // Causes problems for turrets as other EH is not added to any vehicles except jets.
    if (vehicle _unit == _unit) then {
        if (isNull _instigator) then {
            _instigator = driver _source;
        };
        
        _unit setVariable ["lastShooter", _instigator, true];
        (_unit getVariable "assisters") pushBackUnique _instigator;
        
        _assisters = _unit getVariable "assisters";
        _lastShooter = _unit getVariable "lastShooter";
    };
    
    _damage
}];
    
_newEntity setVariable ["passedThatHandledamage", true, true];