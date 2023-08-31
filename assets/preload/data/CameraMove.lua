function onCreate()
--Final camera pos ref
makeLuaSprite('CameraFollowPos',nil,0,0)
--makeGraphic('CameraFollowPos',10,10,"FF0000")
--addLuaSprite('CameraFollowPos',true)
--Config with setGlobalFromScript('Path/CameraMove','CharcterMove',var)
CamMove=true
FirstPerson=false
BFZoom=0
DADZoom=0
CamNoteMove=15
CharcterMove={dad=0,bf=0}
cameraCentred=false

ForceCamPos=false
ManualPos={0,0}
ManualCharacterPos={dad={0,0},bf={0,0}}
CharacterForce=false
CameraFollow={0,0}
Pos={0,0}
OffsetCam={0,0}
CamDisplaceX=0
CamDisplaceY=0
CanBooping=true
ActualZoom=0

end
function onCreatePost()

end
function onMoveCamera(character)
   Character=character
end
function GetCameraPos(character)
    if character=='dad' and not FirstPerson and not ForceCamPos and not cameraCentred then
        Pos={getMidpointX('dad')+ 150,getMidpointY('dad')- 100}
        CameraFollow[1]=Pos[1]+getProperty('dad.cameraPosition[0]')+getProperty('opponentCameraOffset[0]')
        CameraFollow[2]=Pos[2]+getProperty('dad.cameraPosition[1]')+getProperty('opponentCameraOffset[1]')
        if ManualCharacterPos['dad']~={0,0} and CharacterForce then
            CameraFollow[1]=ManualCharacterPos['dad'][1]
            CameraFollow[2]=ManualCharacterPos['dad'][2]
        end
        ActualZoom=DADZoom
    elseif character=='boyfriend' and not FirstPerson and not ForceCamPos and not cameraCentred then
        Pos={getMidpointX('boyfriend')- 100,getMidpointY('boyfriend')- 100}
        CameraFollow[1]=Pos[1]-getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]')
        CameraFollow[2]=Pos[2]+getProperty('boyfriend.cameraPosition[1]')+getProperty('boyfriendCameraOffset[1]')
        if ManualCharacterPos['bf']~={0,0} and CharacterForce then
            CameraFollow[1]=ManualCharacterPos['bf'][1]
            CameraFollow[2]=ManualCharacterPos['bf'][2]
        end
        ActualZoom=BFZoom
    elseif ForceCamPos then
        CameraFollow[1]=ManualPos[1]
        CameraFollow[2]=ManualPos[2]
    elseif cameraCentred then
        CameraFollow=getPositionArrayCenter()
    end
end
function onUpdate(elapsed)
    GetCameraPos(Character)
    if ForceCamPos then
        CameraFollow[1]=ManualPos[1]
        CameraFollow[2]=ManualPos[2]
        setProperty('camFollow.x',CameraFollow[1]+OffsetCam[1]+CamDisplaceX)
        setProperty('camFollow.y',CameraFollow[2]+OffsetCam[2]+CamDisplaceY)
    elseif curBeat>=0 then
        setProperty('camFollow.x',CameraFollow[1]+OffsetCam[1]+CamDisplaceX)
        setProperty('camFollow.y',CameraFollow[2]+OffsetCam[2]+CamDisplaceY)
    end

end
function onUpdatePost(elapsed)
    if getPropertyFromClass('PlayState','SONG.notes['..curSection..'].sectionNotes[0][0]')~=nil then
        camDisplaceX = 0;
        camDisplaceY = 0;
    end
    if not isRunning('custom_events/Camera Bop Speed.lua') and CanBooping then
        easeLerp = 1 - (elapsed * 3.125)
        setProperty('camGame.zoom',Lerp(getProperty('defaultCamZoom')+ActualZoom,getProperty('camGame.zoom'),easeLerp))
    end
end
function Lerp(Min,Max,Ratio)
    return Min + Ratio * (Max - Min);
end
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if (mustHitSection and CamMove) or (FirstPerson) then
    CamDisplaceY=0
    if noteData == 1 then
        CamDisplaceY=CamNoteMove+CharcterMove['bf']
    end
    if noteData == 2 then
        CamDisplaceY=-CamNoteMove-CharcterMove['bf']
    end
    CamDisplaceX=0
    if noteData == 0 then
        CamDisplaceX=-CamNoteMove-CharcterMove['bf']
    end
    if noteData == 3 then
        CamDisplaceX=CamNoteMove+CharcterMove['bf']
    end
    end
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not mustHitSection and CamMove and not FirstPerson then
        CamDisplaceY=0
        if noteData == 1 then
            CamDisplaceY=CamNoteMove+CharcterMove['dad']
        end
        if noteData == 2 then
            CamDisplaceY=-CamNoteMove-CharcterMove['dad']
        end
        CamDisplaceX=0
        if noteData == 0 then
            CamDisplaceX=-CamNoteMove-CharcterMove['dad']
        end
        if noteData == 3 then
            CamDisplaceX=CamNoteMove+CharcterMove['dad']
        end
        
    end
end
function onSectionHit()
    if curSection ~= lastSection then
        if mustHitSection ~= lastMustHit then
    
            camDisplaceX = 0;
            camDisplaceY = 0;
        end
    end
   local lastSection = curSection;	
   local lastMustHit = mustHitSection;
end
function getPositionArrayCenter() 
    leftPosX = (getMidpointX('dad') + 100) + getProperty('dad.cameraPosition[0]')+getProperty('opponentCameraOffset[0]')
    rightPosX = (getMidpointX('boyfriend') - 100) - getProperty('boyfriend.cameraPosition[0]')-getProperty('boyfriendCameraOffset[0]');
    leftPosY = (getMidpointY('dad') - 100) + getProperty('dad.cameraPosition[1]')+getProperty('opponentCameraOffset[1]')
    rightPosY = (getMidpointY('boyfriend') - 100) + getProperty('boyfriend.cameraPosition[1]')+getProperty('boyfriendCameraOffset[1]');
    return {(leftPosX + rightPosX) / 2, ((leftPosY + rightPosY) / 2) + 50}
end


