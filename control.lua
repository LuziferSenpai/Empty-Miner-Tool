local de = defines.events

local function droppos( e, s1 )
	local d = e.drop_position
	local e3 = s1.find_entities_filtered{ position = d, type = { "container", "logistic-container" } }
	if next( e3 ) then
		return "E" .. e3[1].unit_number
	end
end

script.on_event( { de.on_player_selected_area, de.on_player_alt_selected_area }, function( event )
	if event.item ~= "empty-miner-tool" then return end

	local p = game.players[event.player_index]
	local f = p.force
	local s = p.surface
	local t = { c = {}, e = {}, w = {} }

	for _, e in pairs( event.entities ) do
		if e.valid then
			local n = e.unit_number
			if e.type == "mining-drill" then
				if e.mining_target then
					t.w["E" .. n] = e
				else
					t.e["E" .. n] = e
				end	
			elseif e.type == "container" or e.type == "logistic-container" then
				t.c["E" .. n] = e
			end
		end
	end
	if not next( t.e ) then return end

	if next( t.c ) then
		local b = {}
		local tl = {}
		local br = {}
		local e1 = {}
		local t1 = true
		local t2 = false
		for i, e in pairs( t.c ) do
			t1 = true
			t2 = false
			b = e.bounding_box
			tl = b.left_top
			br = b.right_bottom
			tl.x = tl.x - 1
			tl.y = tl.y - 1
			br.x = br.x + 1
			br.y = br.y + 1
			e1 = s.find_entities_filtered{ area = { tl, br }, type = "mining-drill" }
			if next( e1 ) then
				for _, e2 in pairs( e1 ) do
					if e2.valid then
						local n = e2.unit_number
						if t.w["E" .. n] and i == droppos(e2, s) then
							t1 = false
						elseif t.e["E" .. n] and i == droppos( e2, s ) then
							t2 = true
						end
					end
				end
			end
			if t1 and t2 then
				e.order_deconstruction( f, p )
			end
		end
	end
	if next( t.e ) then
		for _, e in pairs( t.e ) do
			e.order_deconstruction( f, p )
		end
	end
end )