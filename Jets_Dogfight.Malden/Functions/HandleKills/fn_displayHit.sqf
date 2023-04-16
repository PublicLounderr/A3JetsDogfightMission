[] spawn {
	"hit" cutText ["<t color='#00000000' shadow='0' size='2'>MARGIN</t><br /><t font='PuristaSemibold' color='#ffffffff' size='1.35'>HIT</t>", "plain", 0.01, true, true];
	"hit" cutFadeOut 100; 
	sleep 0.25;
	
	"hit" cutText ["<t color='#00000000' shadow='0' size='2'>MARGIN</t><br /><t font='PuristaSemibold' color='#D0ffffff' size='1.35'>HIT</t>", "plain", 0.01, true, true];
	"hit" cutFadeOut 120; 
};
