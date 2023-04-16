params ["_lastShooter", "_killed"];

playSoundUI ["a3\missions_f_beta\data\sounds\firing_drills\timer.wss", 1, 1];

_lastShooter addplayerscores [1, 0, 0, 1, 0];

// Resupply
vehicle _lastShooter setvehicleAmmo 1;

waitUntil { allActiveTitleEffects select 0 != -1 };

titleText ["<t color='#00000000' shadow='0' size='10'>MARGin</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>ENEMY KILLED</t><br/>", "Plain", 1, true, true];
sleep 3;

titleText [format ["<t color='#00000000' shadow='0' size='10'>MARGin</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>[</t><t font='PuristaSemiBold' color='#ed623b' size='2'>%1</t><t font='PuristaSemiBold' color='#FFFFFF' size='2'>]</t><br/>", name _killed], "Plain", 1, true, true];
sleep 3;
titleFadeOut 1;