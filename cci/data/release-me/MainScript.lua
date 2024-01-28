function onCreate()
    addCharacterToList("fw clover pov", "boyfriend");
    addCharacterToList("fw clover va", "boyfriend");
end

function onCreatePost()
	makeLuaSprite("blackScreen", nil, -250, -250);
	makeGraphic("blackScreen", 2000, 1500, '000000');
	setScrollFactor("blackScreen", 0, 0);
	setProperty("blackScreen.alpha", 0);
	addLuaSprite("blackScreen", true);
end

function onStepHit()
	if curStep == 494 then
		triggerEvent('Change Character', 0, 'fw clover va');
	end

	if curStep == 496 then
		triggerEvent('Play Animation', "laugh", 'bf');
	end

	if curStep == 512 then
		triggerEvent('Change Character', 0, 'fleetwayclover');
		triggerEvent('Play Animation', "singDOWN", 'bf');
	end

	if curStep == 1656 then
		triggerEvent('Change Character', 0, 'fw clover va');
		triggerEvent('Play Animation', "enough", 'bf');
	end

	if curStep == 1910 then
		triggerEvent('Change Character', 0, 'fw clover va');
		triggerEvent('Play Animation', "growl", 'bf');
	end
end

function onBeatHit()
	if curBeat == 287 then
		doTweenAlpha("dimmer_tween", "dimmer", 0.4, 1, "quadInOut");
	end

	if curBeat == 318 then
		doTweenAlpha("nicky_tween_in", "nicky-rm", 1, 1, "quadInOut");
		doTweenAlpha("anne_tween_in", "anne-rm", 1, 1, "quadInOut");
		doTweenAlpha("dimmer_tween2", "dimmer", 0, 1, "quadInOut");
	end
	
	if curBeat == 608 then	
		setProperty("blackScreen.alpha", 1);
	end
end