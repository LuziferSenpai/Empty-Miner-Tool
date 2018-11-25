data:extend
{
	{
		type = "selection-tool",
		name = "empty-miner-tool",
		icon = "__Empty_Miner_Tool__/tool.png",
		icon_size = 32,
		flags = { "goes-to-quickbar" },
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