local ECM = exports["ContextMenu"]

-- Self actions
ECM:Register(function(screenPosition, hitSomething, worldPosition, hitEntity, normalDirection)
    if (not DoesEntityExist(hitEntity) or PlayerPedId() ~= hitEntity) then
        return
    end

    -- Véhicules
    -- Hors véhicule :
        -- Ouvrir le coffre
        -- Entrer dans le coffre
        -- Corde de traction (off pour l'instant)
        -- Gestion des portières (menu)
        -- Mettre de la musique
        -- (si on traine un joueur on peut le mettre dans le véhicule ou dans le coffre)

    -- Dans véhicule :
        -- Allumer / Eteindre le moteur
        -- Ouvrir la boite à gant
        -- Gestion des fenêtres (menu)
        -- Gestion des portières (menu)
        -- Report conducteur (avec menu de raisons)

    -- Outil de debug

    -- local animMenu, animMenuItem = ECM:AddScrollSubmenu(0, "Animations", 10)

    local playerServerId = GetPlayerServerId(PlayerId())


    local itemList1 = {}


    -- local itemList1 = {}
    -- for i = 1, #anims, 1 do
    --     local text     = anims[i][1]
    --     local animDict = anims[i][2]
    --     local anim     = anims[i][3]

    --     table.insert(itemList1, {
    --         animMenu,
    --         text,
    --         function()
    --             local playerPed = PlayerPedId()

    --             LoadAnimDictSync(animDict)

    --             TaskPlayAnim(playerPed, animDict, anim, 8.0, 8.0, 5000, 49, 1.0, false, false, false)
    --             RemoveAnimDict(animDict)
    --         end
    --     })
    -- end
    -- ECM:AddItems(itemList1)

    -- local animMenu, animMenuItem = ECM:AddPageSubmenu(0, "Animations", 5)

    -- local testMenu, testMenuItem = ECM:AddSubmenu(animMenu, "TestMenu")
    -- ECM:AddItem(testMenu, "TestItem1")
    -- ECM:AddItem(testMenu, "TestItem2")
    -- ECM:AddItem(testMenu, "TestItem3")

    -- local itemList2 = {}
    -- for i = 1, #anims, 1 do
    --     local text     = anims[i][1]
    --     local animDict = anims[i][2]
    --     local anim     = anims[i][3]

    --     table.insert(itemList2, {
    --         animMenu,
    --         text,
    --         function()
    --             local playerPed = PlayerPedId()

    --             LoadAnimDictSync(animDict)

    --             TaskPlayAnim(playerPed, animDict, anim, 8.0, 8.0, 5000, 49, 1.0, false, false, false)
    --             RemoveAnimDict(animDict)
    --         end
    --     })
    -- end
    -- ECM:AddItems(itemList2)
end)



function LoadAnimDictSync(animDict)
    if (HasAnimDictLoaded(animDict)) then
        return
    end

    RequestAnimDict(animDict)
    while (not HasAnimDictLoaded(animDict)) do
        Citizen.Wait(0)
    end
end
