CreateThread(function()
    while true do
        local lastVariable = {}
        while IsWaypointActive() and not IsPauseMenuActive() do
            local coord = GetWaypointCoords()
            local ped = PlayerPedId()
            local pcoords = GetEntityCoords(ped)
            local dist = #(pcoords-coord)
            local z = pcoords.z -1.0
            local onScreen, screenX, screenY = GetScreenCoordFromWorldCoord(coord.x, coord.y, z)
            if onScreen then
                lastVariable = {x = screenX, y = screenY}
                SendNUIMessage({
                    action = "showWaypoint",
                })
                SendNUIMessage({
                    action = "updateWaypoint",
                    x = screenX,
                    y = screenY,
                    m = dist
                })
            else
                SendNUIMessage({
                    action = "updateWaypoint",
                    x = lastVariable.x,
                    y = lastVariable.y,
                    m = dist
                })
            end

            Wait(10)
        end
        SendNUIMessage({
            action = "hideWaypoint",
        })
        Wait(3000)
    end
end)