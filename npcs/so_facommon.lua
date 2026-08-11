function factionSetup()
	npc.setDamageTeam({type = "enemy",team=factionNumber})
	clanCurrencies = {nil, nil, "so_occasusrep", "so_hrassrep", "so_chempromrep"}
	factionNumber = config.getParameter("npcFaction")
	distanceOfRecognition = config.getParameter("distanceOfRecognition", 250)
	
end


function detectTheirKin()
	nearbyPlayers = world.playerQuery(mcontroller.position(), distanceOfRecognition)
	for _,targetPlayer in pairs(nearbyPlayers) do

		currentLoyalty = world.entityCurrency(targetPlayer,clanCurrencies[factionNumber])

		if currentLoyalty >= 150 then
			--sb.logInfo("%s", currentLoyalty)
			npc.setDamageTeam({type = "friendly",team=factionNumber})
		elseif currentLoyalty < 150 then
			--sb.logInfo("%s", -currentLoyalty)
			npc.setDamageTeam({type = "enemy",team=factionNumber})
		end
    end
end


function checkForBetrayal()
	npc.setDamageTeam({type = "enemy",team=factionNumber})
end


