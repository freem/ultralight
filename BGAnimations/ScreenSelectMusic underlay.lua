local bottomBoxSizeX = SCREEN_CENTER_X*0.625;
local bottomBoxSizeY = SCREEN_CENTER_Y*0.2;

local t = Def.ActorFrame{
	-- top section (below the banner); if anything

	-- vertical seperator
	Def.Quad{
		InitCommand=cmd(x,SCREEN_CENTER_X-8;y,SCREEN_CENTER_Y;zoomto,2,SCREEN_HEIGHT;diffusebottomedge,HSV(192,1,0.8););
		OnCommand=cmd(cropbottom,1;sleep,0.2;bouncebegin,0.2;cropbottom,0);
		OffCommand=cmd(linear,0.5;croptop,1);
	};

	-- bottom section
	-- was xy,(SCREEN_CENTER_X*0.475),SCREEN_CENTER_Y*1.85
	Def.Quad{
		InitCommand=cmd(xy,(SCREEN_CENTER_X*0.475)-(bottomBoxSizeX/4),SCREEN_CENTER_Y*1.8;
			zoomto,(bottomBoxSizeX/2),bottomBoxSizeY;shadowlengthx,2;shadowlengthy,3;
		);
		BeginCommand=cmd(playcommand,"UpdatePlayer");
		OffCommand=cmd(bouncebegin,0.25;addy,SCREEN_CENTER_Y*0.45);
		UpdatePlayerCommand=function(self)
			if GAMESTATE:IsHumanPlayer(PLAYER_1) then
				self:diffuse( PlayerColor(PLAYER_1) );
				self:shadowcolor( Brightness(PlayerColor(PLAYER_1),0.75) );
			else
				self:diffuse( HSV(0,0,0.4) );
				self:shadowcolor( HSV(0,0,0.25) );
			end;
		end;
		PlayerJoinedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				self:playcommand("UpdatePlayer");
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				self:playcommand("UpdatePlayer");
			end;
		end;
	};
	Def.Quad{
		InitCommand=cmd(xy,(SCREEN_CENTER_X*0.475)+(bottomBoxSizeX/4),SCREEN_CENTER_Y*1.8;
			zoomto,(bottomBoxSizeX/2),bottomBoxSizeY;shadowlengthx,2;shadowlengthy,3;
		);
		BeginCommand=cmd(playcommand,"UpdatePlayer");
		OffCommand=cmd(bouncebegin,0.25;addy,SCREEN_CENTER_Y*0.45);
		UpdatePlayerCommand=function(self)
			if GAMESTATE:IsHumanPlayer(PLAYER_2) then
				self:diffuse( PlayerColor(PLAYER_2) );
				self:shadowcolor( Brightness(PlayerColor(PLAYER_2),0.75) );
			else
				self:diffuse( HSV(0,0,0.4) );
				self:shadowcolor( HSV(0,0,0.25) );
			end;
		end;
		PlayerJoinedMessageCommand=function(self,param)
			if param.Player == PLAYER_2 then
				self:playcommand("UpdatePlayer");
			end;
		end;
		PlayerUnjoinedMessageCommand=function(self,param)
			if param.Player == PLAYER_2 then
				self:playcommand("UpdatePlayer");
			end;
		end;
	};

	Def.Quad{
		InitCommand=cmd(xy,(SCREEN_CENTER_X*0.475),(SCREEN_CENTER_Y*1.8)-(bottomBoxSizeY/3);zoomto,bottomBoxSizeX,bottomBoxSizeY*0.35;fadetop,0.25;fadebottom,1;blend,Blend.Add;diffusealpha,0.25);
		OffCommand=cmd(bouncebegin,0.25;addy,SCREEN_CENTER_Y*0.45);
	};
};

return t;