params ["_lastShooter", "_killed"];
playSoundUI ["a3\missions_f_beta\data\sounds\firing_drills\checkpoint_clear.wss", 1, 0.5];

waitUntil { allActiveTitleEffects select 0 != -1 };

titleText ["<t color='#00000000' shadow='0' size='10'>MARGin</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>TEAMKILL</t><br/>", "Plain", 1, true, true];
sleep 3;

titleText [format ["<t color='#00000000' shadow='0' size='10'>MARGin</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>[</t><t font='PuristaSemiBold' color='#00FF00' size='2'>%1</t><t font='PuristaSemiBold' color='#FFFFFF' size='2'>]</t><br/>", name _killed], "Plain", 1, true, true];
sleep 3;
titleFadeOut 1;