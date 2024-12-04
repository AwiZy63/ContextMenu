local ECM = exports["ContextMenu"]

-- Self actions
ECM:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
    if (not DoesEntityExist(hitEntity) or PlayerPedId() ~= hitEntity) then
        return
    end
    
    local playerServerId = GetPlayerServerId(PlayerId())
    
    local playerServerIdItem = ECM:AddItem(0, "ID: " .. '~p~' .. playerServerId)
    ECM:OnActivate(playerServerIdItem, function()
        lib.setClipboard(tostring(playerServerId))
        lib.notify({ title = "Succès", description = "Vous venez de copier votre ID", type = "success" })
    end)
    ECM:CloseOnActivate(playerServerIdItem, true)
    
    local refreshClothingItem = ECM:AddItem(0, "Nettoyer les vêtements")
    ECM:OnActivate(refreshClothingItem, function()
        TriggerServerEvent('core_inventory:server:loadClothingToPed')
        lib.notify({ title = "Succès", description = "Vous venez de nettoyer vos vêtements", type = "success" })
    end)

    local debugOptionsMenu, debugOptionsItem = ECM:AddSubmenu(0, "Débug")
    ECM:AddItem(debugOptionsMenu, "Position: " .. '~p~' .. tostring(GetEntityCoords(PlayerPedId())), function()
        lib.notify({ title = "Succès", description = "Vous venez de copier la position", type = "success" })
        lib.setClipboard(tostring(GetEntityCoords(PlayerPedId())))
    end)

    ECM:AddItem(debugOptionsMenu, "Modèle: " .. '~p~' .. tostring(GetEntityArchetypeName(PlayerPedId())), function()
        lib.notify({ title = "Succès", description = "Vous venez de copier le modèle", type = "success" })
        lib.setClipboard(tostring(GetEntityArchetypeName(PlayerPedId())))
    end)
end)

-- Target actions
ECM:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
    if (not DoesEntityExist(hitEntity) or PlayerPedId() == hitEntity) then
        return
    end

    -- Joueur
    -- Fouiller
    -- Porter (menu) (sur le dos, sur l'épaule, à l'avant, trainer, en otage)
    -- Plaquer au sol
    -- Animations (emotes partagés)
    -- Report (menu des raisons)
end)
