function onCreate()

    makeLuaSprite('text', 'Screenshot_3', -40, 150);
	scaleObject('text',1.3,1.3);

	
	makeLuaSprite('whiteTint','',-600,-200);
	makeGraphic('whiteTint',4000,4000,'ffffff');
	scaleObject('whiteTint',1.5,1.5);
	setScrollFactor('whiteTint', 0.1, 0.1);
    
	addLuaSprite('whiteTint',false);
	addLuaSprite('text', false);
end

function onCreatePost()
	--body
end

function onBeatHit( ... )--for every beat
    --body
end

function onStepHit( ... )-- for every step
    -- body
end