params [];

while { true } do {
	if ! (player inArea zoneRestriction) then {
		private _countdown = 35;

		for "_i" from 1 to _countdown do {
			if (!alive player) exitWith {};

			if (player inArea zoneRestriction) exitWith {
				titleText ["<t color='#00000000' shadow='0' size='10'>MARGIN</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>YOU HAVE RETURNED TO THE COMBAT AREA</t><br/>", "plain", 0, true, true];
			};

			playSoundUI ["a3\3den\data\sound\cfgsound\notificationdefault.wss", 0.3, 0.3];

			_displaySeconds = _countdown - _i + 1;
			if (_displaySeconds < 10) then {
				_displaySeconds = format["0%1", _displaySeconds]
			};

			titleText [format ["<t color='#00000000' shadow='0' size='10'>MARGIN</t><br /><t font='PuristaSemiBold' color='#ef2e33' size='3'>WARNING</t><br/><t font='PuristaSemiBold' color='#ef2e33' size='2'>RETURN TO THE COMBAT AREA</t><br/><t font='LCD14' color='#ef2e33' size='3'>00:%1</t>", _displaySeconds], "plain", 0, true, true];
			titleFadeOut 1;
			sleep 1;
		};

		if (player inArea zoneRestriction || (!alive player)) exitWith {};

		titleFadeOut 0;
		titleText ["<t color='#00000000' shadow='0' size='10'>MARGIN</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>YOU DIDN'T RETURN TO THE COMBAT AREA</t><br/>", "BLACK OUT", 0, true, true];
		sleep 3;
		player setDamage 1;
		
		[format["%1 has been killed for leaving the area.", name player]]remoteExec ["systemChat", 0];
		sleep 1;
		titleFadeOut 0;
	};

	sleep 1;
};