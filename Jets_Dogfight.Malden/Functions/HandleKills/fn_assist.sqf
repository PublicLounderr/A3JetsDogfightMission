playSoundUI ["a3\missions_f_beta\data\sounds\firing_drills\checkpoint_clear.wss", 0.2, 1];

waitUntil { allActiveTitleEffects select 0 != -1 };

titleText ["<t color='#00000000' shadow='0' size='10'>MARGin</t><br/><t font='PuristaSemiBold' color='#FFFFFF' size='2'>KILL ASSIST</t><br/>", "PLAin", 1, true, true];
sleep 3;
titleFadeOut 1;