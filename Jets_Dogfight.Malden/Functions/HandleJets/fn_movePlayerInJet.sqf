params ["_jet", "_playerUnit"];

waitUntil { _playerUnit == vehicle _playerUnit };

_playerUnit moveInDriver _jet;

waitUntil { _playerUnit == driver _jet };

_jet setAirplaneThrottle 1;
_jet lock true;

// Lower missile damage on player
player addEventHandler ["Handledamage",
    {
        params ["_jet", "_selection", "_damage", "_source", "_projectile", "_hitindex", "_instigator", "_hitPoint"];
        
        _aaMissiles = ["ammo_Missile_BIM9X", "ammo_Missile_AMRAAM_C", "ammo_Missile_AMRAAM_D", "ammo_Missile_AA_R73", "ammo_Missile_AA_R77", "ammo_Missile_rim116", "ammo_Missile_rim162", "M_Air_AA", "M_Air_AA_MI02", "M_Air_AA_MI06", "M_Zephyr" ];
        
        if (_projectile in _aaMissiles) then {
            0.1
        } else {
            _damage
        };
    }
];