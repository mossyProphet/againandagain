require('/npcs/so_facommon.lua')

oldInit = init
oldUpdate = update

function init()
	oldInit()
	
	setFaction()

	setPeticion()

	self.guiConfig = config.getParameter("guiConfig")
end

function update(dt)
	oldUpdate(dt)
	checkPeticion()
end

function handleInteract(args)
	self.guiConfig.sellItem = config.getParameter("guiConfig.sellItem")
	self.guiConfig.currency = config.getParameter("guiConfig.currency")
	
	return {"ScriptPane", self.guiConfig}	
end
