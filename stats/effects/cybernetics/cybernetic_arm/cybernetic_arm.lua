require "/scripts/util.lua"
require "/scripts/vec2.lua"

local lastAngle   -- the angle (in local space) the arm is currently pointing at

function init()
  local armImage = config.getParameter("armImage",
    "/stats/effects/cybernetics/cybernetic_arm/arm.png")
  animator.setPartTag("arm", "image", armImage)
  lastAngle = nil
end

function update(dt)
  local playerPos = mcontroller.position()
  
  -- Only send a new request if we don't already have one in flight
  if not itShouldGiveAimPos then
    itShouldGiveAimPos = world.sendEntityMessage(entity.id(), "getAimPosition")
  end

  -- Collect the async result when it finishes
  if itShouldGiveAimPos and itShouldGiveAimPos:finished() then
    if itShouldGiveAimPos:succeeded() then
      aimPos = itShouldGiveAimPos:result()
      --sb.logInfo("%s", aimPos)
    end
    itShouldGiveAimPos = nil
  end

  -- Nothing to aim at yet — skip this frame
  if not aimPos then
    return
  end

  -- World-space vector from player to target
  local dx = math.abs(aimPos[1] - playerPos[1])
  local dy = aimPos[2] - playerPos[2]

  -- Desired absolute angle in local space
  local angle = math.atan(dy, dx)

  if lastAngle == nil then
    -- First frame: apply the whole angle (group starts at 0)
    animator.rotateTransformationGroup("hand", angle)
    lastAngle = angle
    return
  end

  -- rotateTransformationGroup is additive, so apply the difference
  local delta = angle - lastAngle
  if math.abs(delta) > 0.0001 then
    animator.rotateTransformationGroup("hand", delta)
    lastAngle = angle
  end
  animator.setFlipped(mcontroller.facingDirection() < 0)
end