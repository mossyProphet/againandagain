require "/scripts/util.lua"
require "/scripts/vec2.lua"

-- Pivot point of rotation, in the arm sprite's local coordinates.
local ARM_PIVOT = {-0.34, -0.12}

local DEBUG_PIVOT = true

function init()
end

function update(dt)
  
  local playerPos = mcontroller.position()

  -- Only send a new request if we don't already have one in flight
  if not itShouldGiveAimPos then
    itShouldGiveAimPos = world.sendEntityMessage(entity.id(), "getAimPosition")
  end

  if itShouldGiveAimPos and itShouldGiveAimPos:finished() then
    if itShouldGiveAimPos:succeeded() then
      aimPos = itShouldGiveAimPos:result()
    end
    itShouldGiveAimPos = nil
  end

  if DEBUG_PIVOT then
    local pivot = { ARM_PIVOT[1] * mcontroller.facingDirection(), ARM_PIVOT[2] }
    world.debugPoint(vec2.add(playerPos, pivot), {255, 0, 0})
  end

  

  -- IMPORTANT: rebuild the "hand" transform from scratch every frame.
  -- This is what makes the arm immune to status-effect re-init on
  -- teleport / respawn, and to floating-point drift.
  animator.resetTransformationGroup("hand")

  if aimPos then
    local dx = math.abs(aimPos[1] - playerPos[1])
    local dy = aimPos[2] - playerPos[2]
    local angle = math.atan(dy, dx)   -- absolute, local space
    animator.rotateTransformationGroup("hand", angle, ARM_PIVOT)
  end

  animator.setFlipped(mcontroller.facingDirection() < 0)
end