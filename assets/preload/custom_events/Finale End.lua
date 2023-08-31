function onEvent(eventName, value1, value2)
    if eventName=='Finale End' then
        cameraFlash('other','FF1266',5,false)
        setProperty('camHUD.visible',false)
        setProperty('camGame.visible',false)
    end
end