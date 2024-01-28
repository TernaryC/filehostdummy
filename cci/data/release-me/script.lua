function onCreate()
    addCharacterToList("fw clover pov", "boyfriend");
end

function onBeatHit()
	if curBeat == 318 then
		doTweenAlpha("nicky_tween_in", "nicky-rm", 1, 1, "quadInOut");
		doTweenAlpha("anne_tween_in", "anne-rm", 1, 1, "quadInOut");
	end
end