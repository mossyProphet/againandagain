--require "/scripts/augments/item.lua"
--
--function apply(input)
--  local output = Item.new(input)
--  local newPropertyToUpgrade = config.getParameter("statToChange", "inaccuracy")
--  --local level = output:instanceValue("level", 1)
--  local newPrimaryProp = output:instanceValue("primaryAbility")
--  --local newDps = output:instanceValue("primaryAbility").baseDps
--  --local newDps = output.baseDps:instanceValue("primaryAbility")
--  --if newPropertyToUpgrade == "inaccuracy" then
--  --  local newInaccuracy = output:instanceValue("primaryAbility").inaccuracy
--  --  newPrimaryProp.inaccuracy = newInaccuracy * 0.5
--  --end
--  --newPrimaryProp.baseDps = newDps * 1.05
--  newPrimaryProp.baseDps = 100
--  return output:descriptor(), 1
--  output:setInstanceValue("primaryAbility", newPrimaryProp)
--end

require "/scripts/augments/item.lua"

function apply(input)
  local output = Item.new(input)
  local abilityToMod = config.getParameter("abilityToMod") or "primary"
  local newPropertyToUpgrade = config.getParameter("changes")
  if abilityToMod == "primary" then
	local newPrimaryProp = output:instanceValue("primaryAbility")


	for parameter, value in pairs (newPropertyToUpgrade) do
	--parameter is inaccuracy, baseDps, etc
	--value is the value of those, so 0.01 for inaccuracy, 11 for baseDps, etc
		if newPrimaryProp[parameter] then
			newPrimaryProp[parameter] = newPrimaryProp[parameter] * value
		else
			newPrimaryProp[parameter] = value
		end
	end
	if newPrimaryProp.baseDps then
	  newPrimaryProp.baseDps = newPrimaryProp.baseDps*1.05
	end

	output:setInstanceValue("primaryAbility", newPrimaryProp)
  end
  
  return output:descriptor(), 1
end