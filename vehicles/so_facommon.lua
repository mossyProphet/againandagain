function factionSetup()
	npc.setDamageTeam({type = "enemy",team=factionNumber})
	clanCurrencies = {nil, nil, "so_occasusrep", "so_chempromrep", "so_hrassrep"}
	factionNumber = config.getParameter("npcFaction")
	currencyOfTheFaction = clanCurrencies[factionNumber]
	distanceOfRecognition = config.getParameter("distanceOfRecognition", 250)
end


function detectTheirKin()
	nearbyPlayers = world.playerQuery(mcontroller.position(), distanceOfRecognition)
	for _,targetPlayer in pairs(nearbyPlayers) do
		currentLoyalty = world.entityCurrency(targetPlayer, currencyOfTheFaction)
		if currentLoyalty >= 150 then
			--sb.logInfo("%s", currentLoyalty)
			npc.setDamageTeam({type = "friendly",team=factionNumber})
		else if currentLoyalty < 150 then
			--sb.logInfo("%s", -currentLoyalty)
			npc.setDamageTeam({type = "enemy",team=factionNumber})
		end
    end
end
end

function checkForBetrayal()
	npc.setDamageTeam({type = "enemy",team=factionNumber})
end


