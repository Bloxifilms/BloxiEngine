function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'die'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'death'); --put in mods/sounds/
end

function opponentNoteHit()
--[[
    health = getProperty('health')
	if health > 0.1 then
		setProperty('health', health- 0.02);
	end
--]]
end

local xx = 320;
local yy = 450;
local xx2 = 320;
local yy2 = 450;
local ofs = 25;
local followchars = true;
local del = 0;
local del2 = 0;

function onStephit()

end


function onUpdate()
if curStep == 160 then
     noteTweenAlpha('NoteALpha0', 0, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha1', 1, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha2', 2, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha3', 3, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha4', 4, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha5', 5, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha6', 6, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha7', 7, 0, 0.3, cubeOut)
    doTweenAlpha('hp', 'healthBar', 0, duration, 'cubeOut')
            doTweenAlpha('icon1', 'iconP1', 0, 0.3, 'cubeOut')
            doTweenAlpha('icon2', 'iconP2', 0, 0.3, 'cubeOut')
            doTweenAlpha('hp', 'healthBar', 0, 0.3, 'cubeOut')
            doTweenAlpha('stuff', 'scoreTxt', 0, 0.3, 'linear')
            doTweenAlpha('broomtxt', 'timeTxt', 0, 0.3, 'cubeOut')
         doTweenAlpha('tb', 'timeBar', 0, 0.3, 'cubeOut')
     doTweenAlpha('bg', 'timeBarBG', 0, 0.3, 'cubeOut')
      end
if curStep == 176 then
     noteTweenAlpha('NoteALpha0', 0, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha1', 1, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha2', 2, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha3', 3, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha4', 4, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha5', 5, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha6', 6, 1, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha7', 7, 1, 0.3, cubeOut)
    doTweenAlpha('hp', 'healthBar', 1, duration, 'cubeOut')
            doTweenAlpha('icon1', 'iconP1', 1, 0.3, 'cubeOut')
            doTweenAlpha('icon2', 'iconP2', 1, 0.3, 'cubeOut')
            doTweenAlpha('hp', 'healthBar', 1, 0.3, 'cubeOut')
            doTweenAlpha('stuff', 'scoreTxt', 1, 0.3, 'linear')
            doTweenAlpha('broomtxt', 'timeTxt', 1, 0.3, 'cubeOut')
         doTweenAlpha('tb', 'timeBar', 1, 0.3, 'cubeOut')
     doTweenAlpha('bg', 'timeBarBG', 1, 0.3, 'cubeOut')
      end

	if curStep == 1483 then
     noteTweenAlpha('NoteALpha0', 0, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha1', 1, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha2', 2, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha3', 3, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha4', 4, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha5', 5, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha6', 6, 0, 0.3, cubeOut)
      noteTweenAlpha('NoteALpha7', 7, 0, 0.3, cubeOut)
    doTweenAlpha('hp', 'healthBar', 0, duration, 'cubeOut')
            doTweenAlpha('icon1', 'iconP1', 0, 0.3, 'cubeOut')
            doTweenAlpha('icon2', 'iconP2', 0, 0.3, 'cubeOut')
            doTweenAlpha('hp', 'healthBar', 0, 0.3, 'cubeOut')
            doTweenAlpha('stuff', 'scoreTxt', 0, 0.3, 'linear')
            doTweenAlpha('broomtxt', 'timeTxt', 0, 0.3, 'cubeOut')
         doTweenAlpha('tb', 'timeBar', 0, 0.3, 'cubeOut')
     doTweenAlpha('bg', 'timeBarBG', 0, 0.3, 'cubeOut')
      end
    if del > 0 then
        del = del - 1
    end
    if del2 > 0 then
        del2 = del2 - 1
    end
    if followchars == true then

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
    else
        triggerEvent('Camera Follow Pos','','')
    end
   
end