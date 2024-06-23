local modName = "__Empty_Miner_Tool__"
local mininingDrillList = {}

data:extend({
    {
        type = "selection-tool",
        name = "empty-miner-tool",
        icon = modName .. "/graphics/tool.png",
        icon_size = 32,
        flags = {"not-stackable", "spawnable"},
        entity_filters = mininingDrillList,
        alt_entity_filters = mininingDrillList,
        subgroup = "tool",
        order = "c[automated-construction]-z[empty-miner-tool]",
        stack_size = 1,
        selection_color = { r = 154, g = 0, b = 48 },
        alt_selection_color = { r = 154, g = 0, b = 48 },
        selection_mode = { "buildable-type" },
        alt_selection_mode = { "buildable-type" },
        selection_cursor_box_type = "copy",
        alt_selection_cursor_box_type = "copy",
        show_in_library = true
    },
    {
        type = "shortcut",
        name = "give-empty-miner-tool",
        order = "b[blueprints]-z[empty-miner-tool]",
        action = "spawn-item",
        item_to_spawn = "empty-miner-tool",
        icon = {
            filename = modName .. "/graphics/tool.png",
            priority = "extra-high-no-scale",
            size = 32,
            scale = 1,
            flags = {"gui-icon"}
        },
        small_icon = {
            filename = modName .. "/graphics/tool.png",
            priority = "extra-high-no-scale",
            size = 32,
            scale = 1,
            flags = {"gui-icon"}
        },
        disabled_small_icon = {
            filename = modName .. "/graphics/tool.png",
            priority = "extra-high-no-scale",
            size = 32,
            scale = 1,
            flags = {"gui-icon"}
        }
    }
})

for _, miningDrill in pairs(data.raw["mining-drill"]) do
    if not miningDrill.output_fluid_box then
        table.insert(mininingDrillList, miningDrill.name)
    end
end