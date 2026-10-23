require "/scripts/vec2.lua"

function init()
  
end

function activate()

          -- Read all parameters from the item's JSON config
        local category = config.getParameter("cyberneticEffectCategory")
        local stats    = config.getParameter("cyberneticStats")
        local cosmetic = config.getParameter("cyberneticCosmetic")
        for _, effect in ipairs(stats) do
            --sb.logInfo("%s", effect)
            world.sendEntityMessage(player.id(), "applyCyberneticAttributes", category, effect)
        end
        player.makeTechAvailable("cyberneticsbasics")
        player.enableTech("cyberneticsbasics")
        player.equipTech("cyberneticsbasics")
        -- Apply the cosmetic status effect if one is defined
        if cosmetic then
            world.sendEntityMessage(player.id(), "applyCyberneticAttributes", category, cosmetic)
        end

        item.consume(1)

end