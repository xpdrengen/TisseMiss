/*
	File: fn_gedudrexa.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Makes the target jump.
*/
private["_unit","_vel","_dir","_v1","_v2","_anim"];
_unit = param [0,ObjNull,[ObjNull]];
_run = param [1,true,[false]];
if(isNull _unit) exitWith {}; //Bad data
if(local _unit && !_run) exitWith {}; //Ahh

if(animationState _unit isEqualTo "AovrPercMrunSrasWrflDf") exitWith {};
_velocity = velocity _unit;

if(local _unit) then
{
	_v1 = 3.82;
	_v2 = .4;
	_dir = direction player;
	_vel = velocity _unit;
	_unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
};

_anim = animationState _unit;
_unit switchMove "AovrPercMrunSrasWrflDf";

if(local _unit) then {
	[_unit,_anim] spawn
	{
		_unit = _this select 0;
		_anim = _this select 1;
		setStaminaScheme "FastDrain";

		waitUntil
		{
			player setFatigue (getFatigue player + 0.0008);
			animationState _unit != "AovrPercMrunSrasWrflDf"
		};
		_unit switchMove _anim;
		setStaminaScheme "Default";
	};
};
