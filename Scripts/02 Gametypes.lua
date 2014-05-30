-- gametype-specific code goes here

--[[ scoring ]]
-- I thought this shit got removed?
function InitScoring()
	if GetUserPref("UserPrefScoringMode") == nil then
		SetUserPref("UserPrefScoringMode", 'DDR Extreme');
	end;
end;
InitScoring()

function UserPrefScoringMode()
	local baseChoices = { 'DDR 1stMIX', 'DDR 4thMIX', 'DDR Extreme', 'DDR SuperNOVA', 'DDR SuperNOVA 2', 'MIGS', 'HYBRID' }; --'[SSC] Radar Master'
	local t = {
		Name = "UserPrefScoringMode";
		LayoutType = "ShowAllInRow";
		SelectType = "SelectOne";
		OneChoiceForAllPlayers = true;
		ExportOnChange = false;
		Choices = baseChoices;
		LoadSelections = function(self, list, pn)
			if ReadPrefFromFile("UserPrefScoringMode") ~= nil then
				local theValue = ReadPrefFromFile("UserPrefScoringMode");
				local success = false;
				for k,v in ipairs(baseChoices) do
					if v == theValue then
						list[k] = true
						success = true
						break
					end
				end;
				if success == false then list[1] = true end;
			else
				WritePrefToFile("UserPrefScoringMode", 'DDR Extreme');
				list[1] = true;
			end;
		end;
		SaveSelections = function(self, list, pn)
			for k,v in ipairs(list) do if v then WritePrefToFile("UserPrefScoringMode", baseChoices[k]) break end end;
		end;
	};
	setmetatable( t, t );
	return t;
end