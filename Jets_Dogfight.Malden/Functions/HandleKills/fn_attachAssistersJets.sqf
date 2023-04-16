params ["_jet", "_source", "_instigator"];

_pilot = driver _jet;

if (!(isNull _source) && driver _source != driver _jet) then {
	// DEBUG START
	// systemChat ("-------------------");
	// systemChat ("Jet EH:::Unit: " + name _jet);
	// systemChat ("Jet EH:::Unit driver: " + name driver _jet);
	// systemChat ("Jet EH:::Source: " + name _source);
	// systemChat ("Jet EH:::Source driver: " + name driver _source);
	// systemChat ("Jet EH:::instigator: " + name _instigator);
	// systemChat ("-------------------");
	// DEBUG END

	// Possibly broke as _instigator can be null in assisters if the _source is not a player
	if (isNull _instigator) then {
		if (isplayer _source) then {
			_instigator = _source;
		}
	};

	// Display hit marker text
	[] remoteExec ["LDR_fnc_displayHit", _instigator];
	
	(_pilot getVariable "assisters") pushBackUnique _instigator;
	_pilot setVariable ["lastShooter", _instigator, true];

	// DEBUG START	
	_i = _pilot getVariable "lastShooter";
	_a = _pilot getVariable "assisters";
	systemChat ("// Jet EH::: " + name _i + " is the instigator.");
	systemChat ("// Jet EH::: " + "Assisters: " + str (_a apply {name _x}));
	// DEBUG END
};