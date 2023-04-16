params ["_unitsList"];

{
	_vehicle = _x;
	
	["<t color='#00000000' shadow='0' size='10'>MARGIN</t><br /><t font='PuristaSemiBold' color='#ffffff' size='2'>SERVICING VEHICLE</t>", "plain", 0, true, true] remoteExec ["titletext", _x];
	titleFadeOut 1;

	[_vehicle] spawn {
		params ["_vehicle"];

		_vehicle setVehicleAmmo 1;

		_lastDamage = 0;
		for "_i" from 1 to 200 do
		{
			if (_lastDamage <= damage _vehicle) then {
				_vehicle setFuel fuel _vehicle + 0.005;
				_vehicle setDamage (damage _vehicle - 0.005);
				_lastDamage = damage _vehicle;
				sleep 0.1;
			};
		};
	}
} forEach _unitsList;