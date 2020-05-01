Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInit", function(loc)

  loc:add_localized_strings({
    menu_sniper_graze_damage_desc = "BASIC: ##4 points##\nSnipers that hit their target deal ##20%## of the damage dealt in a ##1m## radius around the bullet trajectory. \n\nWhen fired in single shot mode, Assault Rifles that hit their target deal ##20%## of the damage dealt in a ##2.75m## radius around the bullet impact.\n\nACE: ##8 points##\nIf a bullet would headshot-kill someone, the graze skill will deal ##100%## of the damage dealt instead of ##20%##."
  })

end)

if RequiredScript == "lib/managers/player/snipergrazedamage" then

	SniperGrazeDamage = SniperGrazeDamage or {}
	
	function SniperGrazeDamage:on_weapon_fired(weapon_unit, result)
		if not weapon_unit:base():is_category("snp", "assault_rifle") or weapon_unit:base():fire_mode() ~= "single" then
			return
		end
		
		local mytable = weapon_unit:base()
		
		if weapon_unit ~= managers.player:equipped_weapon_unit() then
			return
		end

		if not result.hit_enemy then
			return
		end

		local furthest_hit = result.rays[#result.rays]
		local upgrade_value = managers.player:upgrade_value("snp", "graze_damage")
		local enemies_hit = {}
		local best_damage = 0
		local sentry_mask = managers.slot:get_mask("sentry_gun")
		local ally_mask = managers.slot:get_mask("all_criminals")
		local enemy_mask = managers.slot:get_mask("enemies")

		for _, hit in ipairs(result.rays) do
			local is_turret = hit.unit:in_slot(sentry_mask)
			local is_ally = hit.unit:in_slot(ally_mask)

			if not is_turret and not is_ally and hit.damage_result then
				local result = hit.damage_result
				local attack_data = result.attack_data
				local headshot_kill = attack_data.headshot and result.type == "death" or result.type == "healed"
				local damage_mul = headshot_kill and upgrade_value.damage_factor_headshot or upgrade_value.damage_factor
				local damage = attack_data.damage * damage_mul

				if best_damage < damage then
					best_damage = damage
				end
				
				enemies_hit[hit.unit:key()] = {
					unit = hit.unit,
					position = hit.position
				}
			end
		end

		if best_damage == 0 then
			return
		end

		local radius = 100
		
		if weapon_unit:base():is_category("snp") then
			local from = mvector3.copy(furthest_hit.position)
			local stopped_by_geometry = furthest_hit.unit:in_slot(managers.slot:get_mask("world_geometry"))
			local distance = stopped_by_geometry and furthest_hit.distance - radius * 2 or weapon_unit:base():weapon_range() - radius

			mvector3.add_scaled(from, furthest_hit.ray, -furthest_hit.distance)
			mvector3.add_scaled(from, furthest_hit.ray, radius)

			local to = mvector3.copy(from)

			mvector3.add_scaled(to, furthest_hit.ray, distance)

			local hits = World:raycast_all("ray", from, to, "sphere_cast_radius", radius, "disable_inner_ray", "slot_mask", managers.slot:get_mask("enemies"))

			for i, hit in ipairs(hits) do
				local key = hit.unit:key()

				if not enemies_hit[key] then
					hits[key] = hits[key] or hit
				end

				hits[i] = nil
			end

			for _, hit in pairs(hits) do
				hit.unit:character_damage():damage_simple({
					variant = "graze",
					damage = best_damage,
					attacker_unit = managers.player:player_unit(),
					pos = hit.position,
					attack_dir = -hit.normal
				})
			end
		else
			radius = 275
			for i, hit in pairs(enemies_hit) do
				local hits = World:find_units("sphere", hit.position, radius, enemy_mask)
				
				for i, unit in ipairs(hits) do
					if not enemies_hit[unit:key()] then
						local hit_position = Vector3()
						unit:character_damage():damage_simple({
							variant = "graze",
							damage = best_damage,
							attacker_unit = managers.player:player_unit(),
							pos = hit_position,
							attack_dir = hit.position - hit_position
						})
					end
				end
			end
		end
	end
end
