params ["_thisList"]; 
{  
	_player = _x;
	_jet = nearestObject [_x, "Plane"];   
	waitUntil {{alive _x} count crew _jet == 0};
	sleep 0.5;
	_player moveInDriver _jet;
} forEach _thisList; 
