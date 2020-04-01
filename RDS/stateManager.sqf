
// missionStates:

if (DEPLOY) then {
	["MISSION STATUS: DEPLOYMENT<br />MOVE FIRE TEAMS TO STRATEGIC LOCATIONS"] execVM "HUD\HUD_missionState.sqf";
};


if (ATTACK) then {
	["MISSION STATUS: ATTACK<br />FIRE TEAMS NOW MOVING IN TO ATTACK OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
};


if (DEFEND) then {
	["MISSION STATUS: DEFEND<br />FIRE TEAMS ARE NOW DEFENDING THE OBJECTIVE"] execVM "HUD\HUD_missionState.sqf";
};

// 08 OCT - SUPPORT STATE NOT WRITTEN INTO MISSION YET
if (SUPPORT) then {
	["MISSION STATUS: SUPPORT<br />PICK UP AND PLACE ADDITIONAL AT FIRETEAMS AT STRATEGIC LOCATIONS"] execVM "HUD\HUD_missionState.sqf";
};


if (EXTRACT) then {
	["MISSION STATUS: EXTRACT<br />EXFIL ALL REMAINING UNITS ASAP AND TAKE BACK TO BASE"] execVM "HUD\HUD_missionState.sqf";
};

