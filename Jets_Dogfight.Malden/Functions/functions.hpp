class LDR
{
	tag = "LDR"

	class HandleJets 
	{
		file = "Functions\HandleJets"
		
		class movePlayerInJet {};
		class nerfMissiles {};
		class spawnJet {};
		class serviceVehicle {};
		class templateJetsInit {};
	};

	class HandleKills 
	{
		file = "Functions\HandleKills"
		
		class handleEntityKilled {};
		class attachAssisters {};
		class attachAssistersJets {};
		class displayHit {};
		class assist {};
		class enemyKilled {};
		class teamkill {};
	};

	class HandleMission 
	{
		file = "Functions\HandleMission"
		
		class deleteRespawnMarkers {};
		class manageScore {};
		class zoneRestriction {};
	};

	class HandlePlayer 
	{
		file = "Functions\HandlePlayer"
		
		class destroyOnGetOut {};
		class initialObjectiveDisplay {};
	};
};
