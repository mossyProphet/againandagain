oldInit = init
oldUpdate = update
oldInteract = interact

function init()
	oldInit()
end

function update(dt)
	oldUpdate(dt)
end

function interact(args)
	oldInteract(args)
	world.sendEntityMessage(args.sourceId,config.getParameter("tipomensaje"),config.getParameter("uniqueId"))
	npc.say(config.getParameter("interactmensaje"))
end