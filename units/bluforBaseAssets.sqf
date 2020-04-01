
// will create medical and other Blu-FOB assets

//B_Truck_01_medical_F truck
//B_UGV_01_rcws_F stomper
//B_LSV_01_armed_black_F armed buggy
//B_T_Soldier_unarmed_F soldier
//Land_Medevac_HQ_V1_F building
//Land_IRMaskingCover_02_F tent

for "_i" from 1 to 4 do 
{
	bluGroup = createGroup west;
	_unit = bluGroup createUnit ["B_T_Soldier_unarmed_F", getMarkerPos "BASE", [], 0.1, "none"]; 
};

_vUnit1 = createVehicle ["B_Truck_01_medical_F", getMarkerPos "BASE", [], 30, "none"]; 
_vUnit2 = createVehicle ["B_LSV_01_armed_black_F", getMarkerPos "BASE", [], 30, "none"]; 

_baseBuilding1 = createVehicle ["Land_Medevac_HQ_V1_F", getMarkerPos "BASE", [], 30, "none"]; 
_baseBuilding1 = createVehicle ["Land_IRMaskingCover_02_F", getMarkerPos "BASE", [], 30, "none"]; 

