
// RDS PHASE 5 - EXTRACT

// to do !!!

//numberofgroups = floor RGG_objBluCount / 5;


//while {EXTRACT} do {

	_exfil = RGG_objBluUnits;
	_exfilGroups = exfil / 5; // round up??
	hint "groups to exfil:";
	sleep 5;
	hint str _exfilGroups; 

	_units = allUnits inAreaArray "Battlearea";
	{
		_Dir = random 360;
		_Dist = 20; 
		_defend360 = dest getPos [_Dist,_Dir]; 
		_x setUnitPos "MIDDLE";
		_x doMove _defend360;
	} forEach _units;





//	sleep 1;
//};


/*
count all blufor units
group them into groups of 5
count groups of 5
create PZs == number of groups
move units to PZ locations, as per their group
from PZ point, create lines.
ie have a nice neat system

alt
create just one PZ, but still use sub locations for group move orders

or, when land, loop from 1 to 5 units in LZ area.. easier..

