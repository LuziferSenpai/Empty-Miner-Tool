local de = defines.events

script.on_event( { de.on_player_selected_area, de.on_player_alt_selected_area }, function( event )
	if event.item ~= "empty-miner-tool" then return end

	local p = game.players[event.player_index]
	local f = p.force
	local s = p.surface
	local d = {}
	local c = {}

	for _, e in pairs( event.entities ) do
		if e.valid then
			if e.type == "mining-drill" then
				table.insert( d, e )
			elseif e.type == "container" or e.type == "logistic-container" then
				table.insert( c, e )
			end
		end
	end
	if d[1] ~= nil then
		for _, e in pairs( d ) do
			if not e.mining_target then
				e.order_deconstruction( f, p )
			end
		end
	end
	if c[1] ~= nil then
		local b = {}
		local tl = {}
		local br = {}
		local e1 = {}
		local t = true
		for _, e in pairs( c ) do
			t = true
			b = e.bounding_box
			tl = b.left_top
			br = b.right_bottom
			tl.x = tl.x - 1
			tl.y = tl.y - 1
			br.x = br.x + 1
			br.y = br.y + 1
			e1 = s.find_entities_filtered{ area = { tl, br }, type = "mining-drill" }
			if e1[1] ~= nil then
				for _, e2 in pairs( e1 ) do
					if e2.valid and e2.mining_target then
						t = false
						break
					end
				end
			end
			if t then
				e.order_deconstruction( f, p )
			end
		end
	end
end )