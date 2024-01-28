local lTextID = "LuaLyrics-Holder";
local lIconID = "LuaLyrics-Icon";
local textSize = 32;

local lfadeTween = "LyricsFade-Out";
local ifadeTween = "IconFade-Out";

local currentLyricsIcon = "test";
local iconPath = "lyricIcons/";

function onCreatePost()
	makeLuaSprite(lIconID, iconPath..currentLyricsIcon, 565, 400);
	setProperty(lIconID..".alpha", 0);
	setObjectCamera(lIconID, 'hud');
	addLuaSprite(lIconID, true);

	makeLuaText(lTextID, "null", 1280, 0, 525);
	setTextAlignment(lTextID, 'center');
	setTextSize(lTextID, textSize);
	setProperty(lTextID..".alpha", 0);
	setObjectCamera(lTextID, 'hud');
	addLuaText(lTextID, true);
end

local lyricActive = false;
local lyricEndTime = -1;
local lyricFadeOut = false;


function mysplit(str, sep)
    local result = {}
    local regex = ("([^%s]+)"):format(sep)

    for each in str:gmatch(regex) do
       table.insert(result, each)
    end

    return result
end

function onEvent(n, v1, v2)
	if n == "Change Lyric Icon" then
		loadGraphic(lIconID, iconPath..v1);
		currentLyricsIcon = v1;
	end

	if n == "Lyric" then
		local params = mysplit(v2, ":");
		
		lyricFadeOut = false;
		if tonumber(params[1]) == 1 then
			lyricFadeOut = true;
		end

		lyricEndTime = curStep + tonumber(params[2]) + 1;
		
		lyricActive = true;

		setTextString(lTextID, v1);

		cancelTween(lfadeTween);
		cancelTween(ifadeTween);
		setProperty(lTextID..".alpha", 1);
		setProperty(lIconID..".alpha", 1);
	end
end

function onStepHit()
	if lyricActive then
		if curStep == lyricEndTime then
			lyricActive = false;
			if lyricFadeOut then
				cancelTween(lfadeTween);
				cancelTween(ifadeTween);
				doTweenAlpha(lfadeTween, lTextID, 0, 1, "easeInOut");
				doTweenAlpha(ifadeTween, lIconID, 0, 1, "easeInOut");
			else
				cancelTween(lfadeTween);
				cancelTween(ifadeTween);
				setProperty(lTextID..".alpha", 0);
				setProperty(lIconID..".alpha", 0);
			end
		end
	end
end