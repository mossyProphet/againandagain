function init()
  message.setHandler("getAimPosition", function(_, senderId)
    return tech.aimPosition()
  end)
end