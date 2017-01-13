/*
    ArmA.Network
    Author: Rathbone
    Copyright (c) ArmA.Network 2015 - 2016

    The usage of this file is restricted to ArmA.Network
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/
params [
	["_license","",[""]],
    ["_format","",[""]]
];

if (_license isEqualTo "") exitWith {};

private _index = false;

switch _format do 
{
    case "bool": 
    {
        private _indexOne = _license in AN_Licenses;
        _index = _indexOne;
    };
    case "scalar":
    {
        private _indexOne = AN_Licenses find _license;
        if !(_indexOne isEqualTo -1) then 
        {
            _index = _indexOne;
        };
    };
    default {};
};

_index