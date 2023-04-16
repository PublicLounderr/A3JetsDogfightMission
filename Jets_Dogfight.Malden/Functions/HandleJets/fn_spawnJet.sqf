params ["_respawnTemplateJet"];

if (isServer) then {
    _respawnTemplateJet addEventHandler ["Getin", {
        params ["_respawnTemplateJet", "", "_playerUnit"];
        
        // DEBUG START
        ["Jet spawned"] remoteExec ["systemChat", 0];
        (format ["Jet spawned on machine %1", clientowner]) remoteExec ["systemChat", 0];
        (format ["PUID %1", getplayerUID _playerUnit]) remoteExec ["systemChat", 0];
        // DEBUG END

        // Add black screen while teleporting to jet
        [] remoteExec ["LDR_fnc_blackScreenRespawn", _playerUnit];
        
        moveOut _playerUnit;
        
        _spawnMarker = selectRandom (["sp1", "sp2", "sp3", "sp4", "sp5", "sp6", "sp7", "sp8", "sp9", "sp10", "sp11", "sp12", "sp13", "sp14", "sp15", "sp16"] - [missionnamespace getVariable "lastspawn"]);
        
        missionnamespace setVariable ["lastspawn", _spawnMarker];

        private _jet = createvehicle[(typeOf(_respawnTemplateJet)), getmarkerPos _spawnMarker, [], 100, "FLY"];
        
        // Copy template plane loadout
        {
            _jet removeWeapon _x;
        } forEach weapons _jet;
        
        {
            _jet addWeapon _x;
        } forEach weapons _respawnTemplateJet;
        
        {
            _jet removeMagazines _x;
        } forEach magazines _jet;
        
        for "_i" from 1 to count getPylonmagazines _respawnTemplateJet do {
            _jet setPylonLoadout [_i, (getPylonmagazines _respawnTemplateJet) select _i - 1, true];
        };
        
        {
            if ! (_x in getPylonmagazines _jet) then {
                _jet addMagazine _x;
            };
        } forEach magazines _respawnTemplateJet;


        // Directions and positioning
        _jet setDir (_jet getRelDir worldCenter); // direction
        _jet setPos [(getPos _jet) select 0, (getPos _jet) select 1, 850]; // height
        _maxspeed = getNumber (configFile >> "Cfgvehicles" >> (typeOf _jet) >> "maxspeed");
        _jet setvelocity [_maxspeed / 3 * (sin (getDir _jet)), _maxspeed / 3 * (cos (getDir _jet)), 0]; // velocity
        
        // Move player inside spawned jet
        [_jet, _playerUnit] remoteExec ["LDR_fnc_moveplayerinJet", _playerUnit];
                
        // Add objects to Zeus
        {
            _x addcuratorEditableObjects [[_jet], true];
            _x addcuratorEditableObjects [[_jet], true];
        } forEach allCurators;
        
        // This variable is used in destroyOnGetOut
        _jet setVariable["isJet", true, true];

        // Nerf missiles and attach assisters
        [_jet] remoteExec ["LDR_fnc_nerfMissiles", 0];

        // // Temporary fix
        // [_jet] spawn {
        //     params ["_jet"];
        //     sleep 0.5;

        //     if (count crew _jet == 0) then {
        //         _jet = nil;
        //     };
        // }


        // [_playerUnit] spawn {
        //     params["_playerUnit"];

        //     sleep 0.5;
        //     ["RespawnBlackout", true] remoteExec ["BIS_fnc_blackIn", _playerUnit]

        // }
    }]; 
};