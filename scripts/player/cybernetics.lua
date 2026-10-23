function init()

  message.setHandler("applyCyberneticAttributes", function(_, _, effectCategory, statGroup)
    sb.logInfo("%s", statGroup)
    status.addPersistentEffect(effectCategory, statGroup)
    return true
  end)

  message.setHandler("removeAllCyberneticAttributes", function(_, _, effectCategory)
    sb.logInfo("%s", statGroup)
    status.clearPersistentEffect(effectCategory)
    return true
  end)
end