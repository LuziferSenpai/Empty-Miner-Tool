local de = defines.events

script.on_event( { de.on_player_selected_area, de.on_player_alt_selected_area }, function( event )
	if event.item ~= "empty-miner-tool" then return end

	local p = game.players[event.player_index]
	local f = p.force
	local s = p.surface

	for _, e in pairs( event.entities ) do
		if e.valid then
		 	if e.type == "mining-drill" and not e.mining_target then
		 		local d = e.drop_position
		 		local e1 = s.find_entities_filtered{ area = { { d.x + 0.1, d.y + 0.1 }, d }, type = { "container", "logistic-container" } }
		 		if e1[1] ~= nil then
		 			local e1 = e1[1]
		 			local b = e1.bounding_box
		 			local tl = b.left_top
		 			local br = b.right_bottom
		 			local t = true
		 			tl.x = tl.x - 1
		 			tl.y = tl.y - 1
		 			br.x = br.x + 1
		 			br.y = br.y + 1
		 			local e2 = s.find_entities_filtered{ area = { tl, br }, type = "mining-drill" }
		 			if e2[1] ~= nil then
		 				for _, e3 in pairs( e2 ) do
		 					if e3.mining_target then
		 						local d1 = e3.drop_position
		 						local e4 = s.find_entities_filtered{ area = { { d.x + 0.1, d.y + 0.1 }, d }, type = { "container", "logistic-container" } }
		 						if e4[1] ~= nil and e4[1] == e1 then
		 							t = false
		 							break
		 						end
		 					end
		 				end
		 			end
		 			if t then
		 				e1[1].order_deconstruction( f, p )
		 			end
		 		end
				e.order_deconstruction( f, p )
			end
		end
	end
end )