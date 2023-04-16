params ["_jet"];
_jet addEventHandler ["Handledamage", {
	params ["_jet", "_selection", "_damage", "_source", "_projectile", "_hitindex", "_instigator", "_hitPoint"];

	[_jet, _source, _instigator] call LDR_fnc_attachAssistersJets;

	_aaMissiles = ["", "ammo_Missile_BIM9X", "ammo_Missile_AMRAAM_C", "ammo_Missile_AMRAAM_D", "ammo_Missile_AA_R73", "ammo_Missile_AA_R77", "ammo_Missile_rim116", "ammo_Missile_rim162", "M_Air_AA", "M_Air_AA_MI02", "M_Air_AA_MI06", "M_Zephyr" ];
	
	if (_projectile in _aaMissiles) then {
		_oldDmg = if (_hitindex < 0) then {
			damage _jet
		} else {
			_jet getHitindex _hitindex
		};

		_deltaDmg = _damage - _oldDmg;
		_oldDmg + _deltaDmg / 4;
	} else {
		_damage
	}
}];