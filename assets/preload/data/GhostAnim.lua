local Anim={'singLEFT','singDOWN','singUP','singRIGHT'}
local LastNoteStrumBf=nil
local LastNoteStrumDad=nil
local Index={dad=nil,bf=nil}
function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        local ActualStrum=GetUnSpawn( i, 'strumTime')
        if GetUnSpawn( i, 'mustPress')  then
            if LastNoteStrumBf==ActualStrum then
                
                if GetUnSpawn( i, 'isSustainNote') and not GetUnSpawn( Index.bf, 'isSustainNote')  then
                    setPropertyFromGroup('unspawnNotes', Index.bf, 'noAnimation',true)
                else
                    setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            end
        else
            if LastNoteStrumDad==ActualStrum then
                setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                if GetUnSpawn(i, 'isSustainNote') and not GetUnSpawn(Index.dad, 'isSustainNote')  then
                    --setPropertyFromGroup('unspawnNotes', Index.dad, 'noAnimation',true)
                else
                    --setPropertyFromGroup('unspawnNotes', i, 'noAnimation',true)
                end
            end
        end
        if GetUnSpawn( i, 'mustPress') then
            LastNoteStrumBf=GetUnSpawn( i, 'strumTime')
            Index.bf=i
        else
            LastNoteStrumDad=GetUnSpawn(i, 'strumTime')
            Index.dad=i
        end
    end
end
function GetUnSpawn(id,var)
    return getPropertyFromGroup('unspawnNotes', id, var)
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if getPropertyFromGroup('notes', membersIndex, 'noAnimation') then
        GhostAnim('boyfriend',Anim[noteData+1])
    end
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if getPropertyFromGroup('notes', membersIndex, 'noAnimation') then
        --GhostAnim('dad',Anim[noteData+1])
    end
end

function GhostAnim(Character,SingAnim)

    local Ghost=getRandomInt(0,9999)
    makeAnimatedLuaSprite('Ghost'..Ghost,getProperty(Character..'.imageFile'),getProperty(Character..'.x'),getProperty(Character..'.y'))
    local AnimStuff=getProperty(Character..'.animationsArray')
    local ArrayPos=FindAnimArray(AnimStuff,SingAnim)
    setGraphicSize('Ghost'..Ghost,getProperty('Ghost'..Ghost..'.width')*getProperty(Character..'.scale.x'),getProperty('Ghost'..Ghost..'.height')*getProperty(Character..'.scale.y'))
    addAnimationByPrefix('Ghost'..Ghost,AnimStuff[ArrayPos]['anim'],AnimStuff[ArrayPos]['name'],AnimStuff[ArrayPos]['fps'],AnimStuff[ArrayPos]['loop'])
    addOffset('Ghost'..Ghost,SingAnim,AnimStuff[ArrayPos]['offsets'][1],AnimStuff[ArrayPos]['offsets'][2])
    addLuaSprite('Ghost'..Ghost)
    local Color=getProperty(Character..'.healthColorArray')
    setProperty('Ghost'..Ghost..'.color',getColorFromRGB(Color[1]+ 50,Color[2]+ 50,Color[3]+ 50,true))
    setProperty('Ghost'..Ghost..'.alpha',0.8)
    if not lowQuality then
        setBlendMode('Ghost'..Ghost,'HARDLIGHT')
    end
    playAnim('Ghost'..Ghost,SingAnim,true)
    doTweenAlpha('Ghost'..Ghost,'Ghost'..Ghost,0,0.75,'linear')
    if curStage=='finale' then
    setProperty('camGame.zoom',getProperty('camGame.zoom')+0.015)
    setProperty('camHUD.zoom',getProperty('camHUD.zoom')+0.015)
    end
end
function onTweenCompleted(tag)
    if stringStartsWith(tag,'Ghost') then
        removeLuaSprite('Ghost'..stringSplit(tag,'Ghost')[2],false)
    end
end
function getColorFromRGB(RR,GG,BB,PassFromHex)
    local FinalColor=''
    local RGBNum={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    if RR>255 then RR="255" end
    if GG>255 then GG="255" end
    if BB>255 then BB="255" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do
        FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1]
    end
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end
function FindAnimArray(array,Anim)
    for i=1,#array do
        if array[i]['anim']==Anim then
            return i
        end
    end
end
