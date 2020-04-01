
// ----- HUD_warnings ----- \\

// Dynamic flight-speed alerts based on [prox vs speed] relative to your objective LZ

/*	

// NEEDS LOTS OF WORK/TESTING TO FIND RIGHT BALANCE!
// CONSIDER MAKING THIS CONFIGERABLE BY PLAYER IN DIALOG
// CONSIDER - always have a key indicator, 1.5km 1km 900 800 ... 200 150 100 50 etc, but also have BG colour to refect ideal speed..
// have a new flashing indicator on 500 400 300 200 100 prox
// is there still a target speed for each speed bracket?
// pzDist - THIS IS THE GLOBAL VAR TRIGGER - CHECK HOW THIS WORKS 
// CURRENTLY HAS WARNINGS FOR 500M 300M 200M AND 100M
// have different elements show dynamically - like bring forward ATL when in 'final mode'
// eye-track - the ability to mark targets based on where you are looking.
// can be used by all units not just pilots
// open eyetrack, HUD marker appears, then keypress (VA) a marker type to make it appear on the map for all

*/

/*
key triggers:
warnings only if too fast 

	trigger		text	action
	>=1000m		1000+	black bg white text always
	<=1000		1000	black bg white text always
	<=900m		900		black bg white text // if speed >= 100 then black bg red text
	<=800m		800		black bg white text // if speed >= 90 then black bg red text
	<=700m		700		black bg white text // if speed >= 80 then black bg red text
	<=600m		600		black bg white text // if speed >= 70 then black bg red text
	<=500m		500		black bg white text // if speed >= 60 then black bg red text
	<=400m		400		black bg white text // if speed >= 45 then black bg red text
	<=300m		300		black bg white text // if speed >= 35 then black bg red text
	<=200m		200		black bg white text // if speed >= 20 then black bg red text
	<=100m		100		black bg white text // if speed >= 15 then black bg red text
	<=50m 		land	black bg white text // if speed >= 8 then black bg red text	
*/


disableSerialization;

// ----- SPEED ALERT

// PZ SPEED WARNING
1200 cutRsc ["PZSPEEDWARNING", "PLAIN"];
1300 cutRsc ["LZSPEEDWARNING", "PLAIN"];
//11feb - one of the above can go, i assume 1300
//11feb - uses PZ bool see below - PZAPPROACH

// loading instruction --------------------------------------------------------------------------
waitUntil {!isNull (uiNameSpace getVariable "PZSPEEDWARNING")};


// HUD function ---------------------------------------------------------------------------------

// dynamic speed alert on approach to PZ

[] spawn {

	while {true} do 
	{
		if (PZAPPROACH) then 
		{

			// 500M TRIGGER
			if ((pzDist) <500) then 
			{
				if ((knotts) >60) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 60<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 60 - OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};


			// trigger to create PZ smoke and create units 
			// should this even be in here?maybe house this block in the marker creation script/
			waitUntil 
			{
				//(player distance SF_pickup) <= 750;
				//original code above ^^
				(player distance pzDist) <= 500;
				//does pzDist work here?
			};
			_smoke = createVehicle ["G_40mm_smokeRed", getMarkerPos "SFPZ", [], 0, "none"];
			["SMOKE OUT"] execVM "HUD\HUD_messages.sqf";



			// 300M TRIGGER
			if ((pzDist) <300) then 
			{
				if ((knotts) >40) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 40<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 40 - OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};

			// 200M TRIGGER
			if ((pzDist) <200) then 
			{
				if ((knotts) >30) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 30<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 30 - OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};

			// 100M TRIGGER
			if ((pzDist) <100) then 
			{
				if ((knotts) >20) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 20<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991200;
					_setText ctrlSetStructuredText (parseText format ["TARGET 20 - OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};

// CONSIDER A FLASHING INDICATOR FOR WHEN YOU ARE WITHIN 100M OF CHOSEN LZ
// LAND NOW MSG?

		};

		if (!PZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "PZSPEEDWARNING";
			_setText = _displayOBJUNITS displayCtrl 9991200;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};
// I don't think we need the above?
// or ... maybe I can still use PZAPROACH as the trigger to swtich this mod on/off?
// ie a keybing can toggle this ^^ bool, and act as the main on/off switch?

		sleep 0.5;
	};
};


/*

// I am removing all LZAPPROACH code,as I assume this is the second of the two LZ events, and therefore we do not now need this
		if (LZAPPROACH) then 
		{
			if ((lzDist) <700) then  
			{
				if ((knotts) >60) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["TARGET 60<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};
			
			if ((lzDist) <300) then 
			{
				if ((knotts) >40) then
				{
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["TARGET 40<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [1,0,0,0.5];
				} else {
					_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
					_setText = _displayOBJUNITS displayCtrl 9991300;
					_setText ctrlSetStructuredText (parseText format ["OK<br />%1", knotts]);
					_setText ctrlSetBackgroundColor [0,1,0,0.5];
				};
			};
		};
	
		if (!LZAPPROACH) then 
		{
			_displayOBJUNITS = uiNameSpace getVariable "LZSPEEDWARNING";
			_setText = _displayOBJUNITS displayCtrl 9991300;
			_setText ctrlSetStructuredText (parseText format [""]);
			_setText ctrlSetBackgroundColor [0,0,0,0];
		};

