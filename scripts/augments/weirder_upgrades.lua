
require "/scripts/augments/item.lua"

function apply(input)
  local output = Item.new(input)

  local abilityToMod = config.getParameter("abilityToMod") or "primary"
  local newPropertyToUpgrade = config.getParameter("changes")
  local setInsteadofMultiply = config.getParameter("setInsteadofMultiply") or false


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
  if abilityToMod == "alt" then
	local newAltProp = output:instanceValue("altAbility")

	newAbility = config.getParameter("altAbilityType")
	output:setInstanceValue("altAbilityType", newAbility)
	element = output:instanceValue("elementalType", "physical")

	for parameter, value in pairs (newPropertyToUpgrade) do
	--parameter is inaccuracy, baseDps, etc
	--value is the value of those, so 0.01 for inaccuracy, 11 for baseDps, etc
		if newAltProp[parameter] and (type(newAltProp[parameter]) == "number") and not(setInsteadofMultiply) then
			newAltProp[parameter] = newAltProp[parameter] * value
		else
			newAltProp[parameter] = value
		end
	end
	if newAltProp.baseDps then
	  newAltProp.baseDps = newAltProp.baseDps*1.05
	end

	output:setInstanceValue("altAbility", newAltProp)
  end
  
  
  
  return output:descriptor(), 1
end

