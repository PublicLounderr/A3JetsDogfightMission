enemySide = [];

[] spawn
{
	waitUntil {sleep 1; alive player;};
	disableSerialization;
	_rscLayer = "RscKillLimit" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["RscKillLimit", "PLAIN", 1, false];
	((uiNamespace getVariable "RscKillLimit") displayCtrl 55560) ctrlSetStructuredText parseText format
	["
		<t font='PuristaSemibold' align='center' shadow='1' shadowColor='#000000' color='#ffffff'>First Team To Reach %1 Kills Wins</t>
		</t>",
		killLimit	//1
	];
};

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

[] spawn
{
	while {true} do
	{
		
		sleep 0.1;
		
		_rscLayer = "RscScoreBar" call BIS_fnc_rscLayer;
		_rscLayer cutRsc ["RscScoreBar","PLAIN",1,false];
		
		
		if(isNull ((uiNamespace getVariable "RscScoreBar") displayCtrl 5559)) then
		{
			diag_log "scorebar is null create";
			disableSerialization;
			_rscLayer = "RscScoreBar" call BIS_fnc_rscLayer;
			_rscLayer cutRsc ["RscScoreBar","PLAIN",1,false];
		};
		

		_bluforKills = missionNamespace getVariable "bluforKills";
		_independentKills = missionNamespace getVariable "independentKills";
		_opforKills = missionNamespace getVariable "opforKills";

		_bluforIcon = gettext (configfile >> "cfgfactionclasses" >> "BLU_F" >> "icon");
		_independentIcon = gettext (configfile >> "cfgfactionclasses" >> "IND_F" >> "icon");
		_opforIcon = gettext (configfile >> "cfgfactionclasses" >> "OPF_F" >> "icon");
		
		_font = "EtelkaMonospaceProBold";
		_colour = parseText "#FBFCFE";



		((uiNamespace getVariable "RscScoreBar") displayCtrl 55558) ctrlSetStructuredText parseText format
		[
			"<t size='1.1' font='%2' align='center' shadow='1' shadowColor='#000000' color='%3'>%1</t>
			</t>",

			timeLeft,				//7
			_font,					//8
			_colour					//9
		];

		((uiNamespace getVariable "RscScoreBar") displayCtrl 55559) ctrlSetStructuredText parseText format
		[
			"<t size='1.1' font='%8' shadow='0' color='#00FFFFFF'>0&#160;&#160;</t><img size='1.5' image='%4'/><t size='1.1' font='%8' shadow='1' shadowColor='#000000' color='%9'>&#160;&#160;%1</t>
			<img size='1.5' image='%5'/><t size='1.1' font='%8' shadow='1' shadowColor='#000000' color='%9'>&#160;&#160;%2</t>
			<img size='1.5' image='%6'/><t size='1.1' font='%8' shadow='1' shadowColor='#000000' color='%9'>&#160;&#160;%3</t>
			</t>",
						
			_bluforKills,			//1
			_independentKills,      //2
			_opforKills,			//3

			_bluforIcon,			//4
			_independentIcon,		//5
			_opforIcon,				//6

			timeLeft,				//7
			_font,					//8
			_colour					//9
		];
	};
};




