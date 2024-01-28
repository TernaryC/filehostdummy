function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'release-me-death');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'fleetBlueballed');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'fleetRetry');
end

function onGameOverStart()
    setProperty('camFollow.x', getMidpointX('boyfriend') - 170)
    setProperty('camFollow.y', getMidpointY('boyfriend') - 225)
end