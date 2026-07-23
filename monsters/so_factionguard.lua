require('/monsters/so_facommon.lua')

oldInit = init
oldUpdate = update

function init()
	oldInit()

	factionSetup()	
end

function update(dt)
	oldUpdate(dt)

	detectTheirKin()
end	