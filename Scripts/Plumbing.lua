-- here's some stuff I didn't feel like shoving anywhere else
function WideScale(AR4_3, AR16_9) return scale( SCREEN_WIDTH, 640, 854, AR4_3, AR16_9 ) end

function IsPlayerValid(pn)
	local pm = GAMESTATE:GetPlayMode()
	if pm == 'PlayMode_Rave' or pm == 'PlayMode_Battle' then
		-- in rave/battle mode, we may have a computer player.
		return GAMESTATE:IsPlayerEnabled(pn)
	else
		return GAMESTATE:IsHumanPlayer(pn)
	end
	return false
end;

function StageDisplayY()
	local bWidescreen = GetScreenAspectRatio() >= 1.6
	local bSharedLifeMeter = GAMESTATE:GetPlayMode() == 'PlayMode_Rave' or GAMESTATE:GetPlayMode() == 'PlayMode_Battle'
	if not bSharedLifeMeter and bWidescreen then
		return SCREEN_TOP+28
	else
		return SCREEN_TOP+40
	end
end;

function met(section,metricname) return THEME:GetMetric(section,metricname) end

ScreenString = Screen.String
ScreenMetric = Screen.Metric

function GetGameIcon()
	local curGameName = GAMESTATE:GetCurrentGame():GetName()
	local gameToStepsTypeIcon = {
		dance = "_dance-single",
		pump = "_pump-single",
		kb7 = "_kb7",
		-- ez2,
		para = "_para",
		-- ds3ddx
		beat = "_beat7",
		maniax = "_maniax-single",
		techno = "_techno8",
		popn = "_popn9",
		lights = "_lights"
	}
	-- show something in case I didn't cover a base
	return gameToStepsTypeIcon[curGameName] or "_base"
end

function GetScoreKeeper()
	local ScoreKeeper = "ScoreKeeperNormal"
	local game = GAMESTATE:GetCurrentGame():GetName()

	-- two players and shared sides need the Shared ScoreKeeper.
	local styleType = GAMESTATE:GetCurrentStyle():GetStyleType()
	if styleType == 'StyleType_TwoPlayersSharedSides' then
		ScoreKeeper = "ScoreKeeperShared"
	end

	return ScoreKeeper
end

function HeaderString(h) return THEME:GetString("Headers",h) end

-- need this for localized strings:
local function OptionNameString(str) return THEME:GetString('OptionNames',str) end

-- theme preferences
local ultralightPrefs = {
	AutoSetStyle = {
		Default = true,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	ComboUnderField = {
		Default = true,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	GameplayFooter = {
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	ReceptorPosition = {
		Default = false,
		Choices = { OptionNameString('Normal'), OptionNameString('ITG') },
		Values = { false, true }
	},
}
ThemePrefs.InitAll(ultralightPrefs)
