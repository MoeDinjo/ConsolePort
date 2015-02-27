local _

-- Binding strings (default: PlayStation)
BINDING_HEADER_CP_LEFT 		=	"Arrow pad";
BINDING_NAME_CP_L_UP		=	"Up";
BINDING_NAME_CP_L_DOWN		=	"Down";
BINDING_NAME_CP_L_LEFT		=	"Left";
BINDING_NAME_CP_L_RIGHT		=	"Right";
BINDING_HEADER_CP_RIGHT 	=	"Buttons";
BINDING_NAME_CP_R_UP		=	"Triangle";
BINDING_NAME_CP_X_OPTION	=	"Cross";
BINDING_NAME_CP_R_LEFT		=	"Square";
BINDING_NAME_CP_R_RIGHT		=	"Circle";
BINDING_HEADER_CP_TRIG 		=	"Triggers";
BINDING_NAME_CP_TR1			=	"Trigger 1";
BINDING_NAME_CP_TR2			=	"Trigger 2";
BINDING_HEADER_CP_CENTER 	=	"Center buttons";
BINDING_NAME_CP_L_OPTION	= 	"Left Button";
BINDING_NAME_CP_C_OPTION	=	"Center Button";
BINDING_NAME_CP_R_OPTION	= 	"Right Button";

local _, G = ...;
-- Button name strings (default: PlayStation)
G.NAME_CP_L_UP				=	"Up";
G.NAME_CP_L_DOWN			=	"Down";
G.NAME_CP_L_LEFT			=	"Left";
G.NAME_CP_L_RIGHT			=	"Right";
G.NAME_CP_R_UP				=	"Triangle";
G.NAME_CP_X_OPTION			=	"Cross";
G.NAME_CP_R_LEFT			=	"Square";
G.NAME_CP_R_RIGHT			=	"Circle";
G.NAME_CP_TR1				=	"Trigger 1";
G.NAME_CP_TR2				=	"Trigger 2";
G.NAME_CP_L_OPTION			= 	"Left Button";
G.NAME_CP_C_OPTION			=	"Center Button";
G.NAME_CP_R_OPTION			= 	"Right Button";

local f = CreateFrame("FRAME", "ConsolePort");
-- Interaction keys
G.CIRCLE  					= 1;
G.SQUARE 					= 2;
G.TRIANGLE 					= 3;
G.UP						= 4;
G.DOWN						= 5;
G.LEFT						= 6;
G.RIGHT						= 7;
G.PREPARE 					= 8;
G.STATE_UP 					= "up";
G.STATE_DOWN				= "down";
-- Global config variables
G.BIND_TARGET 				= false;
G.CONF_BUTTON 				= nil;
G.CP 						= "CP";
G.CONF 						= "_CONF";
G.CONFBG 					= "_CONF_BG";
G.GUIDE 					= "_GUIDE";
G.NOMOD 					= "_NOMOD";
G.SHIFT 					= "_SHIFT";
G.CTRL 						= "_CTRL";
G.CTRLSH 					= "_CTRLSH";
G.TEXTURE 					= "TEXTURE_";
-- Colors
G.COLOR_TRIANGLE 			= "62BBB2";
G.COLOR_SQUARE 				= "D35280";
G.COLOR_CIRCLE				= "D84E58";
G.COLOR_CROSS 				= "6882A1";
-- Button textures
G.TEXTURE_CIRCLE 			= "Interface\\AddOns\\ConsolePort\\Buttons\\circle.tga";
G.TEXTURE_SQUARE 			= "Interface\\AddOns\\ConsolePort\\Buttons\\square.tga";
G.TEXTURE_TRIANGLE			= "Interface\\AddOns\\ConsolePort\\Buttons\\triangle.tga";
G.TEXTURE_CROSS  			= "Interface\\AddOns\\ConsolePort\\Buttons\\cross.tga";
G.TEXTURE_UP 	   			= "Interface\\AddOns\\ConsolePort\\Buttons\\up.tga";
G.TEXTURE_DOWN   			= "Interface\\AddOns\\ConsolePort\\Buttons\\down.tga";
G.TEXTURE_LEFT   			= "Interface\\AddOns\\ConsolePort\\Buttons\\left.tga";
G.TEXTURE_RIGHT  			= "Interface\\AddOns\\ConsolePort\\Buttons\\right.tga";
G.TEXTURE_LONE   			= "Interface\\AddOns\\ConsolePort\\Buttons\\l1.tga";
G.TEXTURE_LTWO   			= "Interface\\AddOns\\ConsolePort\\Buttons\\l2.tga";
G.TEXTURE_LTHREE   			= "Interface\\AddOns\\ConsolePort\\Buttons\\l3.tga";
G.TEXTURE_RONE   			= "Interface\\AddOns\\ConsolePort\\Buttons\\r1.tga";
G.TEXTURE_RTWO   			= "Interface\\AddOns\\ConsolePort\\Buttons\\r2.tga";
G.TEXTURE_RTHREE			= "Interface\\AddOns\\ConsolePort\\Buttons\\r3.tga";
G.TEXTURE_SELECT			= "Interface\\AddOns\\ConsolePort\\Buttons\\select.tga";
G.TEXTURE_START				= "Interface\\AddOns\\ConsolePort\\Buttons\\start.tga";
G.TEXTURE_PSBTN				= "Interface\\AddOns\\ConsolePort\\Buttons\\ps.tga";
-- Guide strings
local POINTS 			= ":20:20:0:0";
local _CIRCLE 			= "|T"..G.TEXTURE_CIRCLE..POINTS.."|t|cFF"..G.COLOR_CIRCLE;
local _SQUARE 			= "|T"..G.TEXTURE_SQUARE..POINTS.."|t|cFF"..G.COLOR_SQUARE;
local _TRIANGLE			= "|T"..G.TEXTURE_TRIANGLE..POINTS.."|t|cFF"..G.COLOR_TRIANGLE;
G.CLICK_USE 			= _CIRCLE.."Use|r";
G.CLICK_QUEST_TRACKER 	= _CIRCLE.."Set current quest|r";
G.CLICK_USE_NOCOMBAT 	= _CIRCLE.."Use (out of combat)|r";
G.CLICK_SELL 			= _CIRCLE.."Sell|r";
G.CLICK_BUY 			= _CIRCLE.."Buy|r";
G.CLICK_EQUIP			= _CIRCLE.."Equip|r";
G.CLICK_REPLACE			= _CIRCLE.."Replace|r";
G.CLICK_GLYPH_CAST		= _CIRCLE.."Use glyph|r";
G.CLICK_TAKETAXI 		= _CIRCLE.."Fly to location|r";
G.CLICK_PICKUP 			= _SQUARE.."Pick up|r";
G.CLICK_QUEST_DETAILS 	= _SQUARE.."View quest details|r";
G.CLICK_CANCEL 			= _TRIANGLE.."Cancel|r";
-- Small guide button measurements
G.GUIDE_BORDER_S_SMALL 			= 56;
G.GUIDE_BORDER_X_SMALL 			= -4.75;
G.GUIDE_BORDER_Y_SMALL 			= 3.6;
G.GUIDE_BUTTON_S_SMALL 			= 24;
G.GUIDE_BUTTON_LEFT_SMALL_X 	= -16;
G.GUIDE_BUTTON_LEFT_SMALL_Y 	= 0;
G.GUIDE_BUTTON_RIGHT_SMALL_X 	= 16;
G.GUIDE_BUTTON_RIGHT_SMALL_Y 	= 0;
G.GUIDE_BUTTON_CENTER_SMALL_X 	= 0;
G.GUIDE_BUTTON_CENTER_SMALL_Y 	= 0;
G.GUIDE_BUTTON_BOTTOM_SMALL_X 	= 0;
G.GUIDE_BUTTON_BOTTOM_SMALL_Y 	= -20;
-- Large guide button measurements
G.GUIDE_BORDER_S_LARGE 			= 70;
G.GUIDE_BORDER_X_LARGE 			= -5;
G.GUIDE_BORDER_Y_LARGE 			= 3.2;
G.GUIDE_BUTTON_S_LARGE 			= 32;
G.GUIDE_BUTTON_LEFT_LARGE_X 	= -26;
G.GUIDE_BUTTON_LEFT_LARGE_Y 	= 0;
G.GUIDE_BUTTON_RIGHT_LARGE_X 	= 26;
G.GUIDE_BUTTON_RIGHT_LARGE_Y 	= 0;
G.GUIDE_BUTTON_CENTER_LARGE_X 	= 0;
G.GUIDE_BUTTON_CENTER_LARGE_Y 	= 0;
G.GUIDE_BUTTON_BOTTOM_SMALL_X 	= 0;
G.GUIDE_BUTTON_BOTTOM_SMALL_Y 	= -28;
-- Override tutorials
-- local POINTS		= ":20:20:-3:-10";
-- local _CIRCLE 		= "|T"..TEXTURE_CIRCLE..POINTG.."|t|cFF"..COLOR_CIRCLE;
-- local _SQUARE 		= "|T"..TEXTURE_SQUARE..POINTG.."|t|cFF"..COLOR_SQUARE;
-- local _TRIANGLE		= "|T"..TEXTURE_TRIANGLE..POINTG.."|t|cFF"..COLOR_TRIANGLE;
-- local N 			= "\n\n";
-- local T 			= "\n     ";
-- WORLD_MAP_TUTORIAL1 = "Map Navigation Shortcuts"..N;
-- WORLD_MAP_TUTORIAL1 = WORLD_MAP_TUTORIAL1.._SQUARE.."Zoom out of current zone|r"..N;
-- WORLD_MAP_TUTORIAL1 = WORLD_MAP_TUTORIAL1.._CIRCLE.."Enter highlighted zone|r"..N;
-- WORLD_MAP_TUTORIAL1 = WORLD_MAP_TUTORIAL1.._TRIANGLE.."Switch to quest mode|r";
-- WORLD_MAP_TUTORIAL2 = "Your quests will be listed here based on the Current Map."..N;
-- WORLD_MAP_TUTORIAL2 = WORLD_MAP_TUTORIAL2.._CIRCLE.."Click highlighted item|r"..N;
-- WORLD_MAP_TUTORIAL2 = WORLD_MAP_TUTORIAL2.._TRIANGLE.."Switch to map mode|r";
-- WorldMapFrame_HelpPlate[1].ToolTipText 	= WORLD_MAP_TUTORIAL1;
-- WorldMapFrame_HelpPlate[2].ToolTipText 	= WORLD_MAP_TUTORIAL2;
-- SPELLBOOK_HELP_1	= SPELLBOOK_HELP_1..N;
-- SPELLBOOK_HELP_1 	= SPELLBOOK_HELP_1.._CIRCLE.."Use spell directly."..T.."Only non-combat spells"..T.."can be cast directly.|r"..N;
-- SPELLBOOK_HELP_1 	= SPELLBOOK_HELP_1.._SQUARE.."Pick up spell on cursor."..T.."Place it on your action bar.|r";
-- SPELLBOOK_HELP_2 	= SPELLBOOK_HELP_2..N;
-- SPELLBOOK_HELP_2 	= SPELLBOOK_HELP_2.._TRIANGLE.."Switch active tab|r";
-- SpellBookFrame_HelpPlate[1].ToolTipText = SPELLBOOK_HELP_1;
-- SpellBookFrame_HelpPlate[2].ToolTipText = SPELLBOOK_HELP_2;

