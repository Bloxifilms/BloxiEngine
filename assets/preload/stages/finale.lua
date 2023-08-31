function onCreate()
	addLuaScript('data/CameraMove.lua')
    setGlobalFromScript('data/CameraMove','CamNoteMove',20)
    setGlobalFromScript('data/CameraMove','CharcterMove',{dad=80,bf=0})
    setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,600},bf={700,700}})
    setGlobalFromScript('data/CameraMove','CharacterForce',true)
    addLuaScript('data/GhostAnim.lua')

    addCharacterToList('blackparasite','dad')


    makeLuaSprite('Overlay','iluminao omaga',-550, 250)
    addLuaSprite('Overlay',true)

    makeLuaSprite('Bars','bars',0,0)
    setObjectCamera('Bars','hud')
    addLuaSprite('Bars')

    if not lowQuality then
        setBlendMode('Overlay','add')
    end
    
	makeLuaSprite('bgg', 'bgg', -900, -400);
	setScrollFactor('bgg', 0.8, 0.8);
	makeLuaSprite('dead', 'dead', 500, -270);
	setScrollFactor('dead', 0.8, 0.8);
	makeLuaSprite('bg', 'bg', -1090, -530);
	setScrollFactor('bg', 1, 1);
	makeLuaSprite('splat', 'splat', 70, 1200);
	makeLuaSprite('fore', 'fore', -1050, 160);
    setScrollFactor('fore', 1.1, 1.1);
  
	makeLuaSprite('dark', 'dark', -1020, -350);
	setScrollFactor('dark', 1.05, 1.05);

	makeLuaSprite('lamp', 'lamp', 990, -380);

	makeAnimatedLuaSprite('light', 'light', -530, -100);
	setScrollFactor('light', 1.05, 1.05);
  addAnimationByPrefix('light','light','light',24,true);
  if not lowQuality then
	setBlendMode('light','add')
	setBlendMode('dark','multiply')
  end



	scaleObject('bgg', 1.1, 1.1)
	scaleObject('dead', 1.1, 1.1)
	scaleObject('bg', 1.1, 1.1)
	scaleObject('lamp', 1.1, 1.1)
	scaleObject('fore', 1.1, 1.1)
    scaleObject('splat', 1.1, 1.1)
    scaleObject('dark', 1.1, 1.1)
	scaleObject('light', 1.1, 1.1)
    if downscroll then
        makeLuaSprite('HealthBarBG','healthBarFinaleBlue',0,-47)
        setProperty('HealthBarBG.flipY',true)
    else
        makeLuaSprite('HealthBarBG','healthBarFinaleBlue',0,530)
    end
    
    setObjectCamera('HealthBarBG','hud')
    scaleObject('HealthBarBG',0.6,0.6)
    screenCenter('HealthBarBG','x')
    addLuaSprite('HealthBarBG')
    makeLuaSprite('HealthBarRed',nil,0,getProperty('HealthBarBG.y'))
    screenCenter('HealthBarRed','x')
    setObjectCamera('HealthBarRed','hud')
    scaleObject('HealthBarRed',0.6,0.6)
    screenCenter('HealthBarRed','x')
    addLuaSprite('HealthBarRed')
    setProperty('HealthBarRed.flipY',getProperty('HealthBarBG.flipY'))
    if downscroll then
    makeAnimatedLuaSprite('iconP3','icons/icon-blackFinale',getProperty('HealthBarBG.x')-200,getProperty('HealthBarBG.y')-100)
    else
        makeAnimatedLuaSprite('iconP3','icons/icon-blackFinale',getProperty('HealthBarBG.x')-200,getProperty('HealthBarBG.y')-150)
    end
    addAnimationByPrefix('iconP3','1','black icon mad',24,true)
    addAnimationByPrefix('iconP3','0','black icon calm',24,true)
    addOffset('iconP3','1',0,0)
    addOffset('iconP3','0',0,-20)

    setObjectCamera('iconP3','hud')
    addLuaSprite('iconP3')
    setProperty('HealthBarBG.visible',false)
    setProperty('camHUD.alpha',0)

    makeLuaSprite('CreditsBG',nil,-282,200)
    makeGraphic('CreditsBG',392,150,'FFFFFF')
    setProperty('CreditsBG.alpha',0.4)
    setObjectCamera('CreditsBG','other')
    addLuaSprite('CreditsBG')
    Text=getTextFromFile('data/'..songPath..'/info.txt')
    makeLuaText('CreditsTxt',Text,0,getProperty('CreditsBG.x')+12,getProperty('CreditsBG.y')+12)
    setTextAlignment('CreditsTxt','left')
    setTextSize('CreditsTxt',24)
    setObjectCamera('CreditsTxt','other')
    addLuaText('CreditsTxt')
end
function onCreatePost()
    if not hideHud or not hideTime then
    makeLuaSprite('TimeBarBG','timeBar',42+(screenWidth/2)- 585,getProperty('timeBar.y'))
    setObjectCamera('TimeBarBG','hud')
    addLuaSprite('TimeBarBG')
    makeLuaSprite('TimeBar',nil,getProperty('TimeBarBG.x')+3.5,getProperty('TimeBarBG.y')+4)
    makeGraphic('TimeBar',getProperty('TimeBarBG.width')-8,getProperty('TimeBarBG.height')-8,'44d844')
    setObjectCamera('TimeBar','hud')
    addLuaSprite('TimeBar')
    setProperty('TimeBar.visible',false)
    setProperty('timeTxt.visible',false)
    makeLuaText('TimeTxt',string.upper(songName),0,getProperty('TimeBarBG.x')+12,getProperty('TimeBarBG.y')+2)
    setTextBorder('TimeTxt',1,'000000')
    setTextSize('TimeTxt',12)
    addLuaText('TimeTxt')
    end
end
function onBeatHit()
    if curBeat % 4 == 0 then
	playAnim('light','light',true)
	end
end
function onUpdate(elapsed)
    if getSongPosition() >= 0 and getSongPosition() < 9600 then
        setProperty('camGame.zoom',Lerp(getProperty('camGame.zoom'), 1,boundTo(elapsed * 0.01, 0, 1)))
    end
end
function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
 end
local Credits=false
function onUpdatePost()
    setProperty('healthBar.alpha',0)
    setProperty('iconP2.visible',false)
    setProperty('iconP1.x',getProperty('HealthBarBG.x')+637)
    if downscroll then
        setProperty('iconP1.y',getProperty('HealthBarBG.y')+65)
    else
        setProperty('iconP1.y',getProperty('HealthBarBG.y')+35)
    end
    for i=0,3 do
        setPropertyFromGroup('strumLineNotes',i,'alpha',0)
    end
    playAnim('iconP3',getProperty('iconP2.animation.curAnim.curFrame'))
    setProperty('iconP3.visible',getProperty('HealthBarBG.visible'))
    setProperty('iconP1.visible',getProperty('HealthBarBG.visible'))

    if getProperty('HealthBarBG.visible') then
        loadGraphic('HealthBarRed','healthBarFinaleRed',1407*(1-(getHealth()/2)),437)
        setProperty('HealthBarRed.x',getProperty('HealthBarBG.x'))
        setProperty('HealthBarRed.y',getProperty('HealthBarBG.y'))
        setProperty('HealthBarRed.offset.x',280)
        setProperty('HealthBarRed.offset.y',87)
        setProperty('HealthBarRed.origin.x',getProperty('HealthBarBG.origin.x'))
        setProperty('HealthBarRed.origin.y',getProperty('HealthBarBG.origin.y'))
       
        if getHealth()>=2 then
            setProperty('HealthBarRed.visible',false)
        else
            setProperty('HealthBarRed.visible',true)
        end
    else
        setProperty('HealthBarRed.visible',false)
    end

    if curBeat == 32 then
        setProperty('defaultCamZoom',0.8)
    end

    if curBeat < 32 then --start
        setGlobalFromScript('data/CameraMove','ManualPos',{ 750, 800})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    end

    if curBeat >= 32 and curBeat < 48 then
        setGlobalFromScript('data/CameraMove','ManualPos',{450, 1000})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    end
    if curBeat >= 48 and curBeat < 64 then --to bf
        setGlobalFromScript('data/CameraMove','ManualPos',{1250, 1000})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
    end
    if curBeat >= 64 and curBeat < 68 then --bf zoom in
        triggerEvent('Camera Follow Pos', 1400, 1050)
        setGlobalFromScript('data/CameraMove','ManualPos',{1400, 1050})
        setGlobalFromScript('data/CameraMove','ForceCamPos',true)
        setProperty('defaultCamZoom',1.2)
    end
    if curBeat == 67 then
        setProperty('defaultCamZoom',2.4)
    end
    if mustHitSection and curBeat >= 68 then
        setProperty('defaultCamZoom',0.5)
        setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,600},bf={700,700}})
        setGlobalFromScript('data/CameraMove','CharacterForce',true)
        setGlobalFromScript('data/CameraMove','ForceCamPos',false)
    elseif curBeat >= 68 then
        setProperty('defaultCamZoom',0.4)
        setGlobalFromScript('data/CameraMove','ManualCharacterPos',{dad={500,600},bf={700,700}})
        setGlobalFromScript('data/CameraMove','CharacterForce',true)
        setGlobalFromScript('data/CameraMove','ForceCamPos',false)
    end
    if curBeat == 492 then
        doTweenZoom('defeated', 'camGame', 2.4, 1.2, 'circIn')
    end
    if not Credits and startedCountdown then
        setProperty('CreditsTxt.x',Lerp(getProperty('CreditsTxt.x'),12,0.1))
        setProperty('CreditsBG.x',Lerp(getProperty('CreditsBG.x'),0,0.1))
    else
        setProperty('CreditsTxt.x',Lerp(getProperty('CreditsTxt.x'),-392+12,0.1))
        setProperty('CreditsBG.x',Lerp(getProperty('CreditsBG.x'),-392,0.1))
    end
    if curBeat >= 5 then
        if getProperty('CreditsBG.x')>-0.9 then
            Credits=true
        end
    end
    setProperty('timeBar.alpha',0)
    if getProperty('timeBar.percent')>0 and  (not hideHud or not hideTime) then
        setProperty('TimeBar.visible',true)
    setGraphicSize('TimeBar',(getProperty('TimeBarBG.width')-8)*(getProperty('timeBar.percent')/100),getProperty('TimeBarBG.height')-8)
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end