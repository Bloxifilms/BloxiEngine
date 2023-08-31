function onEvent(eventName, value1, value2)
    if eventName=='HUD Fade' then
        if value1=='1' then
            doTweenAlpha('CamHudAlphaSUS','camHUD',0,0.7,'quadInOut')
        elseif value1=='0' then
            doTweenAlpha('CamHudAlphaSUS','camHUD',1,0.7,'quadInOut')
        end
    end
end