#include "..\..\script_macros.hpp"
/*
    File: fn_insertPlayerInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Upon first join inital player data is sent to the server and added to the database.
    Setup data gets sent to life_server\Functions\MySQL\fn_insertRequest.sqf
*/
if (life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
cutText[localize "STR_Session_QueryFail","BLACK FADED"];
0 cutFadeOut 9999999;
private ["_bank"];

switch (playerSide) do {
    case west: {
        _bank = LIFE_SETTINGS(getNumber,"bank_cop");
    };
    case civilian: {
        _bank = LIFE_SETTINGS(getNumber,"bank_civ");
    };
    case independent: {
        _bank = LIFE_SETTINGS(getNumber,"bank_med");
    };
};
