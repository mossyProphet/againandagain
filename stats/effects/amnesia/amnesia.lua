function init()
 
end

function update(dt)
   world.sendEntityMessage(entity.id(), "nullRep", "so_occasusrep")
   world.sendEntityMessage(entity.id(), "nullRep", "so_hrassrep")
   world.sendEntityMessage(entity.id(), "nullRep", "so_chempromrep")
end

function uninit()
end
