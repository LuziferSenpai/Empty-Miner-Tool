data:extend(
{
    {
        type = 'custom-input',
        name = 'get-empty-miner-tool',
        key_sequence = "",
        action = 'create-blueprint-item',
        item_to_create = 'empty-miner-tool',
        consuming = 'none'
    },
    {
        type = 'shortcut',
        name = 'empty-miner-tool',
        action = 'create-blueprint-item',
        item_to_create = 'empty-miner-tool',
        style = 'red',
        icon = {
            filename = "__Empty_Miner_Tool__/tool.png",
            priority = 'extra-high-no-scale',
            size = 32,
            scale = 1,
            flags = {'icon'},
        },
        small_icon = {
            filename = "__Empty_Miner_Tool__/toolx24.png",
            priority = 'extra-high-no-scale',
            size = 24,
            scale = 1,
            flags = {'icon'},
        },
        disabled_small_icon = {
            filename = "__Empty_Miner_Tool__/toolx24grey.png",
            priority = 'extra-high-no-scale',
            size = 24,
            scale = 1,
            flags = {'icon'},
        },
    },
	{
		type = "selection-tool",
		name = "empty-miner-tool",
		icon = "__Empty_Miner_Tool__/tool.png",
		icon_size = 32,
		subgroup = "tool",
		order = "c[automated-construction]-zz[empty-miner-tool]",
		stack_size = 1,
		selection_color = { r = 154, g = 0, b = 48 },
		alt_selection_color = { r = 154, g = 0, b = 48 },
		selection_mode = { "buildable-type" },
    	alt_selection_mode = { "buildable-type" },
    	selection_cursor_box_type = "copy",
    	alt_selection_cursor_box_type = "copy",
    	show_in_library = true
    }
}
)