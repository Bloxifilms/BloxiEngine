function onEvent(eventName, value1, value2)
    if eventName=='Finale Flashback Change' then
        setProperty('Flashback.alpha',0.5)
        if stringEndsWith(value1,'oog') then
            playAnim('Flashback',value1)
        end
        if value1=='flash' then
            cameraFade('game','FFFFFF',1.2,false)
            runTimer("FlashbackFade",1.2)
        end
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag=='FlashbackFade' then
        runHaxeCode([[
            game.camGame.fade(]]..getColorFromHex('FF0000')..[[, 0.6, true);
        ]])
        setProperty('Flashback.alpha',0)
    end
end
function onCreate()
    makeAnimatedLuaSprite('Flashback','finaleFlashback',-850, -160)
    addAnimationByPrefix('Flashback','moog','finaleFlashback moog',24,true)
    addAnimationByPrefix('Flashback','toog','finaleFlashback toog',24,true)
    addAnimationByPrefix('Flashback','doog','finaleFlashback doog',24,true)
    scaleObject('Flashback',1.8,1.8)
    addLuaSprite('Flashback',true)
    setProperty('Flashback.alpha',0)
end