[] spawn {
	_respawnMarkers = ["respawn_inf", "respawn_air", "respawn_naval", "respawn_plane", "respawn_para", "respawn_unknown"];
	sleep 0.5;
	{
		if ((getMarkerType _x) in _respawnMarkers) then {
			_x setMarkerAlpha 0;
		};
	} forEach allMapMarkers;
}