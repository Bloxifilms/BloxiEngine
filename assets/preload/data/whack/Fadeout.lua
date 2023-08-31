-- fade out
function onCreatePost()
	-- end of "create"
	
	makeLuaSprite('fade', 'Black', -1000, -400)
	   scaleObject('fade', 3, 3)
	addLuaSprite('fade', true)
end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenAlpha('fadeout', 'fade', 0, 3, 'linear')
end

