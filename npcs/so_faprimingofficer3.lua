require('/npcs/so_facommon.lua')

oldInit = init
oldUpdate = update

function init()
	oldInit()
	
	setFaction()

	setPeticion()

	local aleatorio = math.floor(((os.time()/60)/60)/24)%6
	aleatorio=aleatorio+1
	local sustituto="so_fa_dailydungeon_"..aleatorio
	npc.setOfferedQuests({"so_fa_firstdungeon",sustituto})
	npc.setTurnInQuests({"so_fa_introactivityscan3","so_fa_firstdungeon",sustituto})	
end

function update(dt)
	oldUpdate(dt)

	checkPeticion()
end	