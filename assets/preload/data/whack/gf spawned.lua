function onCreate()
    makeAnimatedLuaSprite('g', 'characters/gff', -120, 300)
    addAnimationByPrefix('g','gff','GF Dancing Beat',24,true)
    objectPlayAnimation('g','gff',false)
    setScrollFactor('g', 1, 1)
    scaleObject('g', 0.7, 0.7) 

    addCharactertoList('girl')
    addCharactertoList('gff')
    addCharactertoList('man')
    addCharactertoList('bff')
    addCharactertoList('angrygirl')
    addCharactertoList('angryman')
    addCharactertoList('who')
end
function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('g', 'gff');
    end
end
function onStepHit()
	if curStep == 1039 then

        addLuaSprite('g', false)
    end
end