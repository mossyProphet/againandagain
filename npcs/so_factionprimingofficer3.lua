require('/npcs/so_facommon.lua')

oldInit = init
oldUpdate = update

function init()
	oldInit()
	
	setFaction()

	setPeticion()

	faccion=config.getParameter("faccion")	
	local aleatorio = math.floor(((os.time()/60)/60)/24)%6
	aleatorio=aleatorio+1
	local sustituto="so_"..faccion.."_dailydungeon_"..aleatorio
	npc.setOfferedQuests({"so_"..faccion.."_firstdungeon",sustituto})
	npc.setTurnInQuests({"so_"..faccion.."_introactivityscan3","so_"..faccion.."_firstdungeon",sustituto})	
end

function update(dt)
	oldUpdate(dt)
	
	checkPeticion()
end	