function onEvent(eventName, value1, value2)
    if eventName=='Finale Drop' then
        setProperty('HealthBarBG.visible',true)
        setHealth(0.1)
        setProperty('Overlay.visible',false)
        addLuaSprite('bgg', false);
        addLuaSprite('dead', false);
        addLuaSprite('bg', false)
        addLuaSprite('splat', true)
        addLuaSprite('lamp', false);
        addLuaSprite('fore', true);
        addLuaSprite('dark', true);
        addLuaSprite('light', true)
        setTextColor('scoreTxt','FF1266')
        setTextSize('scoreTxt',20)
        setTextColor('botplayTxt','FF1266')
        setTextSize('botplayTxt',32)
        cameraFlash('game','FF1266', 0.75,false)
    end
end