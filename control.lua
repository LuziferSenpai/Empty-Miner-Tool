local entityContainerTypes = {
    ["container"] = true,
    ["logistic-container"] = true,
    ["infinity-container"] = true,
    ["linked-container"] = true
}

script.on_event(defines.events.on_player_selected_area, function(eventData)
    if eventData.item ~= "empty-miner-tool" then return end
    if not next(eventData.entities) then return end

    local player = game.players[eventData.player_index]
    local playerForce = player.force
    local deconstructEntities = {}

    for _, entity in pairs(eventData.entities) do
        if entity.valid then
            local miningTarget = entity.mining_target
            local dropTarget = entity.drop_target

            if not miningTarget then
                deconstructEntities[tostring(entity.unit_number)] = entity
            end

            if dropTarget and dropTarget.valid and entityContainerTypes[dropTarget.type] then
                if miningTarget then
                    deconstructEntities[tostring(dropTarget.unit_number)] = nil
                else
                    deconstructEntities[tostring(dropTarget.unit_number)] = dropTarget
                end
            end
        end
    end

    for _, entity in pairs(deconstructEntities) do
        entity.order_deconstruction(playerForce, player)
    end
end
)

script.on_event(defines.events.on_player_alt_selected_area, function(eventData)
    if eventData.item ~= "empty-miner-tool" then return end
    if not next(eventData.entities) then return end

    local player = game.players[eventData.player_index]
    local playerForce = player.force
    local cancelDeconstructEntities = {}

    for _, entity in pairs(eventData.entities) do
        if entity.valid and entity.to_be_deconstructed() then
            local miningTarget = entity.mining_target
            local dropTarget = entity.drop_target

            if not miningTarget then
                cancelDeconstructEntities[tostring(entity.unit_number)] = entity
            end

            if dropTarget and dropTarget.valid and entityContainerTypes[dropTarget.type] and dropTarget.to_be_deconstructed() then
                cancelDeconstructEntities[tostring(dropTarget.unit_number)] = dropTarget
            end
        end
    end

    for _, entity in pairs(cancelDeconstructEntities) do
        entity.cancel_deconstruction(playerForce, player)
    end
end)
