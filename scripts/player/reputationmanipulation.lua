function init()
	clanCurrencies = {nil, nil, "so_occasusrep", "so_hrassrep", "so_chempromrep"}
	


	message.setHandler("reduceRep",function(_, loc, faction, amount)
		
		return player.consumeCurrency(clanCurrencies[faction], amount)
	end)

	message.setHandler("nullRep",function(_, loc, faction)
		
		return player.consumeCurrency(clanCurrencies[faction], player.currency(clanCurrencies[faction]))
	end)

	message.setHandler("increaceRep",function(_, loc, faction, amount)
		
		return player.addCurrency(clanCurrencies[faction], amount)
	end)
end

--function checkForStealing()
--	if containerCallback() then
--		npcsNearby = world.npcQuery(mcontroller.position(), distanceOfRecognition)
--		for _,targetNPC in pairs(npcsNearby) do
--			sb.loginfo("%s", targetNPC.npcFaction)
--		end
--	end
--end


