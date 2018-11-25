local de = defines.events

script.on_event( { de.on_player_selected_area, de.on_player_alt_selected_area }, function( event )
	if event.item ~= "empty-miner-tool" then return end

	local p = game.players[event.player_index]
	local f = p.force
	local s = p.surface

	for _, e in pairs( event.entities ) do
		if e.valid then
		 	if e.type == "mining-drill" and not e.mining_target then
				e.order_deconstruction( f, p )
			elseif ( e.type == "container" or e.type == "logistic-container" ) then
				local n = e.name
				local b = e.bounding_box
				local tl = b.left_top
				local br = b.right_bottom
				local target = true

				tl.x = tl.x - 1
				tl.y = tl.y - 1
				br.x = br.x + 1
				br.y = br.y + 1
				
				local e1 = s.find_entities_filtered{ area = { tl, br }, type = "mining-drill" }

				if #e1 > 0 then
					for _, e2 in pairs( e1 ) do
						if s.find_entity( n, e2.drop_position ) and e2.mining_target then
							target = false
						end
					end
				end
				if target then
					e.order_deconstruction( f, p )
				end
			end
		end
	end
end )