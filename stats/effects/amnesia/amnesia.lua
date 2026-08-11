function init()
 
end

function update(dt)
   world.sendEntityMessage(entity.id(), "nullRep", 3)
   world.sendEntityMessage(entity.id(), "nullRep", 4)
   world.sendEntityMessage(entity.id(), "nullRep", 5)
end

function uninit()
end
