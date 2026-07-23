function init()
	message.setHandler("reduceRep",function(_, loc, faction, amount)
		if not loc then return end
		return player.consumeCurrency(faction, amount)
	end)

	message.setHandler("nullRep",function(_, loc, faction)
		if not loc then return end
		return player.consumeCurrency(faction, player.currency(faction))
	end)

	message.setHandler("increaceRep",function(_, loc, faction, amount)
		if not loc then return end
		return player.addCurrency(faction, amount)
	end)
end