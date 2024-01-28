function onCreatePost()
	makeLuaSprite("vignette", "ui/vignette", 0, 0);
	setObjectCamera("vignette", "camHud");
	setProperty("vignette.alpha", 0);
	addLuaSprite("vignette", false);
end

local specialShake = 0;
function onUpdate(elapsed)
	specialShake = math.abs(getProperty("camGame.zoom") - getProperty("defaultCamZoom"));
	
	setProperty("vignette.alpha", specialShake * 2);

	cameraShake('cam', specialShake / 55, elapsed * 1.5);
end