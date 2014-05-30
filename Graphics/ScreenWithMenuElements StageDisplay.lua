local ScreenName = Var "LoadingScreen";

local stages = Def.ActorFrame {
	LoadFont("Common normal") .. {
		InitCommand=cmd(shadowlength,1;zoom,0.5;NoStroke;visible,true);
		BeginCommand=cmd(playcommand,"Set";);
		CurrentSongChangedMessageCommand=cmd(finishtweening;playcommand,"Set";);

		SetCommand=function(self, params)
			local curStage = GAMESTATE:GetCurrentStage()
			if GAMESTATE:IsCourseMode() then
				-- stuff
			elseif GAMESTATE:IsDemonstration() then
				self:visible(false)
			elseif GAMESTATE:IsEventMode() then
				local curStageIndex = GAMESTATE:GetCurrentStageIndex();
				if ScreenName == "ScreenGameplay" then
					curStageIndex = curStageIndex + 1
				end
				if curStageIndex == 6 then
					self:settext("I am not a number,\nI am a free man.")
				else
					self:settextf("#%i",curStageIndex)
				end
			else
				self:settext( StageToLocalizedString(curStage) );
				self:diffuse( StageToColor(s) );
			end
		end;
	};
};

return stages;
