class RscScoreBar
{
	idd = -1;
	duration = 10000000000;
	onLoad = "uiNamespace setVariable ['RscScoreBar', _this select 0];";
	fadein = 0;
	fadeout = 0;
	movingEnable = 0;
	objects[] = {};
	
	class controls
	{
		class scoreBarText
		{
			idc = 55559;
			x = 0 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "EtelkaMonospaceProBold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "EtelkaMonospaceProBold";
			};
		};

		class scoreBarTime
		{
			idc = 55558;
			x = 0 * safezoneW + safezoneX;
			y = 0.02 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "EtelkaMonospaceProBold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "EtelkaMonospaceProBold";
			};
		};
	};
};

class RscKillLimit {
	idd = -1;
	duration = 10;
	onLoad = "uiNamespace setVariable ['RscKillLimit', _this select 0];";
	fadein = 0.5;
	fadeout = 2;
	movingEnable = 0;
	objects[] = {};

	class controls
	{
		class killLimitMessage
		{
			idc = 55560;
			x = 0 * safezoneW + safezoneX;
			y = 0.105 * safezoneH + safezoneY;
			w = 1 * safezoneW;
			h = 1 * safezoneH;
			shadow = 1;
			font = "PuristaBold";
			size = "0.022 * safezoneH";
			type = 13;
			style = 2;
			text = "";
			
			class Attributes
			{
				align="center";
				color = "#ffffff";
				font = "PuristaBold";
			};
		};
	};
}