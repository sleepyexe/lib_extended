ESX = {}
Core = {}
ESX.PlayerData = {}
ESX.PlayerLoaded = false
Core.Input = {}
ESX.UI = {}
ESX.UI.Menu = {}
ESX.UI.Menu.RegisteredTypes = {}
ESX.UI.Menu.Opened = {}

ESX.Game = {}
ESX.Game.Utils = {}

ESX.Scaleform = {}
ESX.Scaleform.Utils = {}

ESX.Streaming = {}

function ESX.IsPlayerLoaded()
    return ESX.PlayerLoaded
end

function ESX.GetPlayerData()
    return ESX.PlayerData
end

function ESX.SearchInventory(items, count)
    items = type(items) == "string" and { items } or items

    local data = {}
    for i = 1, #items do
        for c = 1, #ESX.PlayerData.inventory do
            if ESX.PlayerData.inventory[c].name == items[i] then
                data[items[i]] = (count and ESX.PlayerData.inventory[c].count) or ESX.PlayerData.inventory[c]
            end
        end
    end

    return #items == 1 and data[items[1]] or data
end

function ESX.SetPlayerData(key, val)
    local current = ESX.PlayerData[key]
    ESX.PlayerData[key] = val
    if key ~= "inventory" and key ~= "loadout" then
        if type(val) == "table" or val ~= current then
            TriggerEvent("esx:setPlayerData", key, val, current)
        end
    end
end

function ESX.ShowNotification(message, notifyType, length)
    return lib.notify({
        title = 'Notification',
        description = message,
        type = notifyType,
        duration = length
    })
end

function ESX.TextUI(message, ...)
    return lib.showTextUI(message, ...)
end

function ESX.HideUI()
    return lib.hideTextUI()
end

function ESX.ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    if saveToBrief == nil then
        saveToBrief = true
    end
    AddTextEntry("esxAdvancedNotification", msg)
    BeginTextCommandThefeedPost("esxAdvancedNotification")
    if hudColorIndex then
        ThefeedSetNextPostBackgroundColor(hudColorIndex)
    end
    EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
    EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end

function ESX.ShowHelpNotification(msg, thisFrame, beep, duration)
    AddTextEntry("esxHelpNotification", msg)

    if thisFrame then
        DisplayHelpTextThisFrame("esxHelpNotification", false)
    else
        if beep == nil then
            beep = true
        end
        BeginTextCommandDisplayHelp("esxHelpNotification")
        EndTextCommandDisplayHelp(0, false, beep, duration or -1)
    end
end

function ESX.ShowFloatingHelpNotification(msg, coords)
    AddTextEntry("esxFloatingHelpNotification", msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp("esxFloatingHelpNotification")
    EndTextCommandDisplayHelp(2, false, false, -1)
end

ESX.HashString = function(str)
    local format = string.format
    local upper = string.upper
    local gsub = string.gsub
    local hash = joaat(str)
    local input_map = format("~INPUT_%s~", upper(format("%x", hash)))
    input_map = gsub(input_map, "FFFFFFFF", "")

    return input_map
end


function ESX.OpenContext(...)
    return exports["es_extended"]:Open(...)
end

function ESX.PreviewContext(...)
    return exports["es_extended"]:Preview(...)
end

function ESX.CloseContext(...)
    return exports["es_extended"]:Close(...)
end

function ESX.RefreshContext(...)
    return exports["es_extended"]:Refresh(...)
end

ESX.RegisterInput = function(command_name, label, input_group, key, on_press, on_release)
    RegisterCommand(on_release ~= nil and "+" .. command_name or command_name, on_press)
    Core.Input[command_name] = on_release ~= nil and ESX.HashString("+" .. command_name) or ESX.HashString(command_name)
    if on_release then
        RegisterCommand("-" .. command_name, on_release)
    end
    RegisterKeyMapping(on_release ~= nil and "+" .. command_name or command_name, label, input_group, key)
end

function ESX.UI.Menu.RegisterType(menuType, open, close)
    ESX.UI.Menu.RegisteredTypes[menuType] = {
        open = open,
        close = close,
    }
end

function ESX.UI.Menu.Open(menuType, namespace, name, data, submit, cancel, change, close)
    local menu = {}

    menu.type = menuType
    menu.namespace = namespace
    menu.resourceName = (GetInvokingResource() or "Unknown")
    menu.name = name
    menu.data = data
    menu.submit = submit
    menu.cancel = cancel
    menu.change = change

    menu.close = function()
        ESX.UI.Menu.RegisteredTypes[menuType].close(namespace, name)

        for i = 1, #ESX.UI.Menu.Opened, 1 do
            if ESX.UI.Menu.Opened[i] then
                if ESX.UI.Menu.Opened[i].type == menuType and ESX.UI.Menu.Opened[i].namespace == namespace and ESX.UI.Menu.Opened[i].name == name then
                    ESX.UI.Menu.Opened[i] = nil
                end
            end
        end

        if close then
            close()
        end
    end

    menu.update = function(query, newData)
        for i = 1, #menu.data.elements, 1 do
            local match = true

            for k, v in pairs(query) do
                if menu.data.elements[i][k] ~= v then
                    match = false
                end
            end

            if match then
                for k, v in pairs(newData) do
                    menu.data.elements[i][k] = v
                end
            end
        end
    end

    menu.refresh = function()
        ESX.UI.Menu.RegisteredTypes[menuType].open(namespace, name, menu.data)
    end

    menu.setElement = function(i, key, val)
        menu.data.elements[i][key] = val
    end

    menu.setElements = function(newElements)
        menu.data.elements = newElements
    end

    menu.setTitle = function(val)
        menu.data.title = val
    end

    menu.removeElement = function(query)
        for i = 1, #menu.data.elements, 1 do
            for k, v in pairs(query) do
                if menu.data.elements[i] then
                    if menu.data.elements[i][k] == v then
                        table.remove(menu.data.elements, i)
                        break
                    end
                end
            end
        end
    end

    ESX.UI.Menu.Opened[#ESX.UI.Menu.Opened + 1] = menu
    ESX.UI.Menu.RegisteredTypes[menuType].open(namespace, name, data)

    return menu
end

function ESX.UI.Menu.Close(menuType, namespace, name)
    for i = 1, #ESX.UI.Menu.Opened, 1 do
        if ESX.UI.Menu.Opened[i] then
            if ESX.UI.Menu.Opened[i].type == menuType and ESX.UI.Menu.Opened[i].namespace == namespace and ESX.UI.Menu.Opened[i].name == name then
                ESX.UI.Menu.Opened[i].close()
                ESX.UI.Menu.Opened[i] = nil
            end
        end
    end
end

function ESX.UI.Menu.CloseAll()
    for i = 1, #ESX.UI.Menu.Opened, 1 do
        if ESX.UI.Menu.Opened[i] then
            ESX.UI.Menu.Opened[i].close()
            ESX.UI.Menu.Opened[i] = nil
        end
    end
end

function ESX.UI.Menu.GetOpened(menuType, namespace, name)
    for i = 1, #ESX.UI.Menu.Opened, 1 do
        if ESX.UI.Menu.Opened[i] then
            if ESX.UI.Menu.Opened[i].type == menuType and ESX.UI.Menu.Opened[i].namespace == namespace and ESX.UI.Menu.Opened[i].name == name then
                return ESX.UI.Menu.Opened[i]
            end
        end
    end
end

function ESX.UI.Menu.GetOpenedMenus()
    return ESX.UI.Menu.Opened
end

function ESX.UI.Menu.IsOpen(menuType, namespace, name)
    return ESX.UI.Menu.GetOpened(menuType, namespace, name) ~= nil
end

function ESX.UI.ShowInventoryItemNotification(add, item, count)
    SendNUIMessage({
        action = "inventoryNotification",
        add = add,
        item = item,
        count = count,
    })
end

function ESX.Game.GetPedMugshot(ped, transparent)
    if not DoesEntityExist(ped) then
        return
    end
    local mugshot = transparent and RegisterPedheadshotTransparent(ped) or RegisterPedheadshot(ped)

    while not IsPedheadshotReady(mugshot) do
        Wait(0)
    end

    return mugshot, GetPedheadshotTxdString(mugshot)
end

function ESX.Game.Teleport(entity, coords, cb)
    local vector = type(coords) == "vector4" and coords or type(coords) == "vector3" and vector4(coords, 0.0) or vec(coords.x, coords.y, coords.z, coords.heading or 0.0)

    if DoesEntityExist(entity) then
        RequestCollisionAtCoord(vector.xyz)
        while not HasCollisionLoadedAroundEntity(entity) do
            Wait(0)
        end

        SetEntityCoords(entity, vector.xyz, false, false, false, false)
        SetEntityHeading(entity, vector.w)
    end

    if cb then
        cb()
    end
end

function ESX.Game.SpawnObject(object, coords, cb, networked)
    networked = networked == nil and true or networked

    local model = type(object) == "number" and object or joaat(object)
    local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
    CreateThread(function()
        ESX.Streaming.RequestModel(model)

        local obj = CreateObject(model, vector.xyz, networked, false, true)
        if cb then
            cb(obj)
        end
    end)
end

function ESX.Game.SpawnLocalObject(object, coords, cb)
    ESX.Game.SpawnObject(object, coords, cb, false)
end

function ESX.Game.DeleteVehicle(vehicle)
    SetEntityAsMissionEntity(vehicle, true, true)
    DeleteVehicle(vehicle)
end

function ESX.Game.DeleteObject(object)
    SetEntityAsMissionEntity(object, false, true)
    DeleteObject(object)
end

function ESX.Game.SpawnVehicle(vehicleModel, coords, heading, cb, networked)
    local model = type(vehicleModel) == "number" and vehicleModel or joaat(vehicleModel)
    local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
    networked = networked == nil and true or networked

    local playerCoords = GetEntityCoords(ESX.PlayerData.ped)
    if not vector or not playerCoords then
        return
    end

    local dist = #(playerCoords - vector)
    if dist > 424 then -- Onesync infinity Range (https://docs.fivem.net/docs/scripting-reference/onesync/)
        local executingResource = GetInvokingResource() or "Unknown"
        return print(("[^1ERROR^7] Resource ^5%s^7 Tried to spawn vehicle on the client but the position is too far away (Out of onesync range)."):format(executingResource))
    end

    CreateThread(function()
        ESX.Streaming.RequestModel(model)

        local vehicle = CreateVehicle(model, vector.xyz, heading, networked, true)

        if networked then
            local id = NetworkGetNetworkIdFromEntity(vehicle)
            SetNetworkIdCanMigrate(id, true)
            SetEntityAsMissionEntity(vehicle, true, true)
        end
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetModelAsNoLongerNeeded(model)
        SetVehRadioStation(vehicle, "OFF")

        RequestCollisionAtCoord(vector.xyz)
        while not HasCollisionLoadedAroundEntity(vehicle) do
            Wait(0)
        end

        if cb then
            cb(vehicle)
        end
    end)
end

function ESX.Game.SpawnLocalVehicle(vehicle, coords, heading, cb)
    ESX.Game.SpawnVehicle(vehicle, coords, heading, cb, false)
end

function ESX.Game.IsVehicleEmpty(vehicle)
    local passengers = GetVehicleNumberOfPassengers(vehicle)
    local driverSeatFree = IsVehicleSeatFree(vehicle, -1)

    return passengers == 0 and driverSeatFree
end

function ESX.Game.GetObjects() -- Leave the function for compatibility
    return GetGamePool("CObject")
end

function ESX.Game.GetPeds(onlyOtherPeds)
    local pool = GetGamePool("CPed")

    if onlyOtherPeds then
        local myPed = ESX.PlayerData.ped
        for i = 1, #pool do
            if pool[i] == myPed then
                table.remove(pool, i)
                break
            end
        end
    end

    return pool
end

function ESX.Game.GetVehicles() -- Leave the function for compatibility
    return GetGamePool("CVehicle")
end

function ESX.Game.GetPlayers(onlyOtherPlayers, returnKeyValue, returnPeds)
    local players, myPlayer = {}, PlayerId()
    local active = GetActivePlayers()

    for i = 1, #active do
        local currentPlayer = active[i]
        local ped = GetPlayerPed(currentPlayer)

        if DoesEntityExist(ped) and ((onlyOtherPlayers and currentPlayer ~= myPlayer) or not onlyOtherPlayers) then
            if returnKeyValue then
                players[currentPlayer] = ped
            else
                players[#players + 1] = returnPeds and ped or currentPlayer
            end
        end
    end

    return players
end

function ESX.Game.GetClosestObject(coords, modelFilter)
    return ESX.Game.GetClosestEntity(ESX.Game.GetObjects(), false, coords, modelFilter)
end

function ESX.Game.GetClosestPed(coords, modelFilter)
    return ESX.Game.GetClosestEntity(ESX.Game.GetPeds(true), false, coords, modelFilter)
end

function ESX.Game.GetClosestPlayer(coords)
    return ESX.Game.GetClosestEntity(ESX.Game.GetPlayers(true, true), true, coords, nil)
end

function ESX.Game.GetClosestVehicle(coords, modelFilter)
    return ESX.Game.GetClosestEntity(ESX.Game.GetVehicles(), false, coords, modelFilter)
end

local function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = ESX.PlayerData.ped
        coords = GetEntityCoords(playerPed)
    end

    for k, entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if distance <= maxDistance then
            nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
        end
    end

    return nearbyEntities
end

function ESX.Game.GetPlayersInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(ESX.Game.GetPlayers(true, true), true, coords, maxDistance)
end

function ESX.Game.GetVehiclesInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(ESX.Game.GetVehicles(), false, coords, maxDistance)
end

function ESX.Game.IsSpawnPointClear(coords, maxDistance)
    return #ESX.Game.GetVehiclesInArea(coords, maxDistance) == 0
end

function ESX.Game.GetClosestEntity(entities, isPlayerEntities, coords, modelFilter)
    local closestEntity, closestEntityDistance, filteredEntities = -1, -1, nil

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = ESX.PlayerData.ped
        coords = GetEntityCoords(playerPed)
    end

    if modelFilter then
        filteredEntities = {}

        for _, entity in pairs(entities) do
            if modelFilter[GetEntityModel(entity)] then
                filteredEntities[#filteredEntities + 1] = entity
            end
        end
    end

    for k, entity in pairs(filteredEntities or entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if closestEntityDistance == -1 or distance < closestEntityDistance then
            closestEntity, closestEntityDistance = isPlayerEntities and k or entity, distance
        end
    end

    return closestEntity, closestEntityDistance
end

function ESX.Game.GetVehicleInDirection()
    local playerPed = ESX.PlayerData.ped
    local playerCoords = GetEntityCoords(playerPed)
    local inDirection = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 5.0, 0.0)
    local rayHandle = StartExpensiveSynchronousShapeTestLosProbe(playerCoords, inDirection, 10, playerPed, 0)
    local _, hit, _, _, entityHit = GetShapeTestResult(rayHandle)

    if hit == 1 and GetEntityType(entityHit) == 2 then
        local entityCoords = GetEntityCoords(entityHit)
        return entityHit, entityCoords
    end

    return nil
end

function ESX.Game.GetVehicleProperties(vehicle)
    return lib.getVehicleProperties(vehicle)
end

function ESX.Game.SetVehicleProperties(vehicle, props)
    return lib.setVehicleProperties(vehicle, props, false)
end

function ESX.Game.Utils.DrawText3D(coords, text, size, font)
    local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)

    local camCoords = GetFinalRenderedCamCoord()
    local distance = #(vector - camCoords)

    size = size or 1
    font = font or 0

    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov

    SetTextScale(0.0, 0.55 * scale)
    SetTextFont(font)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText("STRING")
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(vector.xyz, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

---@param account string Account name (money/bank/black_money)
---@return table|nil
function ESX.GetAccount(account)
    for i = 1, #ESX.PlayerData.accounts, 1 do
        if ESX.PlayerData.accounts[i].name == account then
            return ESX.PlayerData.accounts[i]
        end
    end
    return nil
end

function ESX.ShowInventory()
    if not Config.EnableDefaultInventory then
        return
    end

    local playerPed = ESX.PlayerData.ped
    local elements = {
        { unselectable = true, icon = "fas fa-box" },
    }
    local currentWeight = 0

    for i = 1, #ESX.PlayerData.accounts do
        if ESX.PlayerData.accounts[i].money > 0 then
            local formattedMoney = TranslateCap("locale_currency", ESX.Math.GroupDigits(ESX.PlayerData.accounts[i].money))
            local canDrop = ESX.PlayerData.accounts[i].name ~= "bank"

            elements[#elements + 1] = {
                icon = "fas fa-money-bill-wave",
                title = ('%s: <span style="color:green;">%s</span>'):format(ESX.PlayerData.accounts[i].label, formattedMoney),
                count = ESX.PlayerData.accounts[i].money,
                type = "item_account",
                value = ESX.PlayerData.accounts[i].name,
                usable = false,
                rare = false,
                canRemove = canDrop,
            }
        end
    end

    for i = 1, #ESX.PlayerData.inventory do
        local v = ESX.PlayerData.inventory[i]
        if v.count > 0 then
            currentWeight = currentWeight + (v.weight * v.count)

            elements[#elements + 1] = {
                icon = "fas fa-box",
                title = ("%s x%s"):format(v.label, v.count),
                count = v.count,
                type = "item_standard",
                value = v.name,
                usable = v.usable,
                rare = v.rare,
                canRemove = v.canRemove,
            }
        end
    end

    elements[1].title = TranslateCap("inventory", currentWeight, Config.MaxWeight)

    for i = 1, #Config.Weapons do
        local v = Config.Weapons[i]
        local weaponHash = joaat(v.name)

        if HasPedGotWeapon(playerPed, weaponHash, false) then
            local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)

            elements[#elements + 1] = {
                icon = "fas fa-gun",
                title = v.ammo and ("%s - %s %s"):format(v.label, ammo, v.ammo.label) or v.label,
                count = 1,
                type = "item_weapon",
                value = v.name,
                usable = false,
                rare = false,
                ammo = ammo,
                canGiveAmmo = (v.ammo ~= nil),
                canRemove = true,
            }
        end
    end

    ESX.CloseContext()

    ESX.OpenContext("right", elements, function(_, element)
        local player, distance = ESX.Game.GetClosestPlayer()

        local elements2 = {}

        if element.usable then
            elements2[#elements2 + 1] = {
                icon = "fas fa-utensils",
                title = TranslateCap("use"),
                action = "use",
                type = element.type,
                value = element.value,
            }
        end

        if element.canRemove then
            if player ~= -1 and distance <= 3.0 then
                elements2[#elements2 + 1] = {
                    icon = "fas fa-hands",
                    title = TranslateCap("give"),
                    action = "give",
                    type = element.type,
                    value = element.value,
                }
            end

            elements2[#elements2 + 1] = {
                icon = "fas fa-trash",
                title = TranslateCap("remove"),
                action = "remove",
                type = element.type,
                value = element.value,
            }
        end

        if element.type == "item_weapon" and element.canGiveAmmo and element.ammo > 0 and player ~= -1 and distance <= 3.0 then
            elements2[#elements2 + 1] = {
                icon = "fas fa-gun",
                title = TranslateCap("giveammo"),
                action = "give_ammo",
                type = element.type,
                value = element.value,
            }
        end

        elements2[#elements2 + 1] = {
            icon = "fas fa-arrow-left",
            title = TranslateCap("return"),
            action = "return",
        }

        ESX.OpenContext("right", elements2, function(_, element2)
            local item, itemType = element2.value, element2.type

            if element2.action == "give" then
                local playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

                if #playersNearby > 0 then
                    local players = {}
                    local elements3 = {
                        { unselectable = true, icon = "fas fa-users", title = "Nearby Players" },
                    }

                    for _, playerNearby in ipairs(playersNearby) do
                        players[GetPlayerServerId(playerNearby)] = true
                    end

                    ESX.TriggerServerCallback("esx:getPlayerNames", function(returnedPlayers)
                        for playerId, playerName in pairs(returnedPlayers) do
                            elements3[#elements3 + 1] = {
                                icon = "fas fa-user",
                                title = playerName,
                                playerId = playerId,
                            }
                        end

                        ESX.OpenContext("right", elements3, function(_, element3)
                            local selectedPlayer, selectedPlayerId = GetPlayerFromServerId(element3.playerId), element3.playerId
                            playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
                            playersNearby = ESX.Table.Set(playersNearby)

                            if playersNearby[selectedPlayer] then
                                local selectedPlayerPed = GetPlayerPed(selectedPlayer)

                                if IsPedOnFoot(selectedPlayerPed) and not IsPedFalling(selectedPlayerPed) then
                                    if itemType == "item_weapon" then
                                        TriggerServerEvent("esx:giveInventoryItem", selectedPlayerId, itemType, item, nil)
                                        ESX.CloseContext()
                                    else
                                        local elementsG = {
                                            { unselectable = true, icon = "fas fa-trash", title = element.title },
                                            { icon = "fas fa-tally", title = "Amount.", input = true, inputType = "number", inputPlaceholder = "Amount to give..", inputMin = 1, inputMax = 1000 },
                                            { icon = "fas fa-check-double", title = "Confirm", val = "confirm" },
                                        }

                                        ESX.OpenContext("right", elementsG, function(menuG, _)
                                            local quantity = tonumber(menuG.eles[2].inputValue)

                                            if quantity and quantity > 0 and element.count >= quantity then
                                                TriggerServerEvent("esx:giveInventoryItem", selectedPlayerId, itemType, item, quantity)
                                                ESX.CloseContext()
                                            else
                                                ESX.ShowNotification(TranslateCap("amount_invalid"))
                                            end
                                        end)
                                    end
                                else
                                    ESX.ShowNotification(TranslateCap("in_vehicle"))
                                end
                            else
                                ESX.ShowNotification(TranslateCap("players_nearby"))
                                ESX.CloseContext()
                            end
                        end)
                    end, players)
                end
            elseif element2.action == "remove" then
                if IsPedOnFoot(playerPed) and not IsPedFalling(playerPed) then
                    local dict, anim = "weapons@first_person@aim_rng@generic@projectile@sticky_bomb@", "plant_floor"
                    ESX.Streaming.RequestAnimDict(dict)

                    if itemType == "item_weapon" then
                        ESX.CloseContext()
                        TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
                        RemoveAnimDict(dict)
                        Wait(1000)
                        TriggerServerEvent("esx:removeInventoryItem", itemType, item)
                    else
                        local elementsR = {
                            { unselectable = true, icon = "fas fa-trash", title = element.title },
                            { icon = "fas fa-tally", title = "Amount.", input = true, inputType = "number", inputPlaceholder = "Amount to remove..", inputMin = 1, inputMax = 1000 },
                            { icon = "fas fa-check-double", title = "Confirm", val = "confirm" },
                        }

                        ESX.OpenContext("right", elementsR, function(menuR, _)
                            local quantity = tonumber(menuR.eles[2].inputValue)

                            if quantity and quantity > 0 and element.count >= quantity then
                                ESX.CloseContext()
                                TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
                                RemoveAnimDict(dict)
                                Wait(1000)
                                TriggerServerEvent("esx:removeInventoryItem", itemType, item, quantity)
                            else
                                ESX.ShowNotification(TranslateCap("amount_invalid"))
                            end
                        end)
                    end
                end
            elseif element2.action == "use" then
                ESX.CloseContext()
                TriggerServerEvent("esx:useItem", item)
            elseif element2.action == "return" then
                ESX.CloseContext()
                ESX.ShowInventory()
            elseif element2.action == "give_ammo" then
                local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                local closestPed = GetPlayerPed(closestPlayer)
                local pedAmmo = GetAmmoInPedWeapon(playerPed, joaat(item))

                if IsPedOnFoot(closestPed) and not IsPedFalling(closestPed) then
                    if closestPlayer ~= -1 and closestDistance < 3.0 then
                        if pedAmmo > 0 then
                            local elementsGA = {
                                { unselectable = true, icon = "fas fa-trash", title = element.title },
                                { icon = "fas fa-tally", title = "Amount.", input = true, inputType = "number", inputPlaceholder = "Amount to give..", inputMin = 1, inputMax = 1000 },
                                { icon = "fas fa-check-double", title = "Confirm", val = "confirm" },
                            }

                            ESX.OpenContext("right", elementsGA, function(menuGA, _)
                                local quantity = tonumber(menuGA.eles[2].inputValue)

                                if quantity and quantity > 0 then
                                    if pedAmmo >= quantity then
                                        TriggerServerEvent("esx:giveInventoryItem", GetPlayerServerId(closestPlayer), "item_ammo", item, quantity)
                                        ESX.CloseContext()
                                    else
                                        ESX.ShowNotification(TranslateCap("noammo"))
                                    end
                                else
                                    ESX.ShowNotification(TranslateCap("amount_invalid"))
                                end
                            end)
                        else
                            ESX.ShowNotification(TranslateCap("noammo"))
                        end
                    else
                        ESX.ShowNotification(TranslateCap("players_nearby"))
                    end
                else
                    ESX.ShowNotification(TranslateCap("in_vehicle"))
                end
            end
        end)
    end)
end

RegisterNetEvent("esx:showNotification")
AddEventHandler("esx:showNotification", function(msg, notifyType, length)
    ESX.ShowNotification(msg, notifyType, length)
end)

RegisterNetEvent("esx:showAdvancedNotification")
AddEventHandler("esx:showAdvancedNotification", function(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
    ESX.ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
end)

RegisterNetEvent("esx:showHelpNotification")
AddEventHandler("esx:showHelpNotification", function(msg, thisFrame, beep, duration)
    ESX.ShowHelpNotification(msg, thisFrame, beep, duration)
end)

AddEventHandler("onResourceStop", function(resourceName)
    for i = 1, #ESX.UI.Menu.Opened, 1 do
        if ESX.UI.Menu.Opened[i] then
            if ESX.UI.Menu.Opened[i].resourceName == resourceName or ESX.UI.Menu.Opened[i].namespace == resourceName then
                ESX.UI.Menu.Opened[i].close()
                ESX.UI.Menu.Opened[i] = nil
            end
        end
    end
end)
-- Credits to txAdmin for the list.
local mismatchedTypes = {
    [`airtug`] = "automobile", -- trailer
    [`avisa`] = "submarine", -- boat
    [`blimp`] = "heli", -- plane
    [`blimp2`] = "heli", -- plane
    [`blimp3`] = "heli", -- plane
    [`caddy`] = "automobile", -- trailer
    [`caddy2`] = "automobile", -- trailer
    [`caddy3`] = "automobile", -- trailer
    [`chimera`] = "automobile", -- bike
    [`docktug`] = "automobile", -- trailer
    [`forklift`] = "automobile", -- trailer
    [`kosatka`] = "submarine", -- boat
    [`mower`] = "automobile", -- trailer
    [`policeb`] = "bike", -- automobile
    [`ripley`] = "automobile", -- trailer
    [`rrocket`] = "automobile", -- bike
    [`sadler`] = "automobile", -- trailer
    [`sadler2`] = "automobile", -- trailer
    [`scrap`] = "automobile", -- trailer
    [`slamtruck`] = "automobile", -- trailer
    [`Stryder`] = "automobile", -- bike
    [`submersible`] = "submarine", -- boat
    [`submersible2`] = "submarine", -- boat
    [`thruster`] = "heli", -- automobile
    [`towtruck`] = "automobile", -- trailer
    [`towtruck2`] = "automobile", -- trailer
    [`tractor`] = "automobile", -- trailer
    [`tractor2`] = "automobile", -- trailer
    [`tractor3`] = "automobile", -- trailer
    [`trailersmall2`] = "trailer", -- automobile
    [`utillitruck`] = "automobile", -- trailer
    [`utillitruck2`] = "automobile", -- trailer
    [`utillitruck3`] = "automobile", -- trailer
}

---@param model number|string
---@return string
function ESX.GetVehicleType(model)
    model = type(model) == "string" and joaat(model) or model
    if not IsModelInCdimage(model) then
        return
    end
    if mismatchedTypes[model] then
        return mismatchedTypes[model]
    end

    local vehicleType = GetVehicleClassFromName(model)
    local types = {
        [8] = "bike",
        [11] = "trailer",
        [13] = "bike",
        [14] = "boat",
        [15] = "heli",
        [16] = "plane",
        [21] = "train",
    }

    return types[vehicleType] or "automobile"
end
