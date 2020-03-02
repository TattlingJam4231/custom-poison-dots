-- 	dot variables
--		hurt_animation_chance: chance for animation on proc
--		dot_damage: damage delt per tick
--		dot_length: duration of dot
--		dot_tick_period: time between each damage tick
--		scale_length: time added each hit on a doted enemy(overrides default dot length refresh)
--		scale_damage: damage added each hit on a doted enemy
--		decay_damage: damage lost per decay tick
--		decay_rate: number of damage ticks per decay tick
--		decay_damage variables override both default dot lenght refresh and scale_length

function DOTManager:update(t, dt)
	for index = #self._doted_enemies, 1, -1 do
		local dot_info = self._doted_enemies[index]
		
		local tickrate = dot_info.dot_tick_period or 0.5
		
		dot_info.decay_counter = dot_info.decay_counter or 0
		
		if t > dot_info.dot_damage_received_time and dot_info.dot_counter >= tickrate then
			self:_damage_dot(dot_info)
			
			dot_info.decay_counter = dot_info.decay_counter + 1
			
			if dot_info.decay_damage and dot_info.decay_counter == dot_info.decay_rate then
				dot_info.dot_damage = dot_info.dot_damage - dot_info.decay_damage
				
				dot_info.decay_counter = 0
			end
			
			dot_info.dot_counter = 0
		end

		if t > dot_info.dot_damage_received_time + dot_info.dot_length then
			table.remove(self._doted_enemies, index)
		else
			dot_info.dot_counter = dot_info.dot_counter + dt
		end
	end
end

function DOTManager:add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, dot_can_crit, dot_tick_period, scale_length, scale_damage, decay_damage, decay_rate, hurt_animation, variant, weapon_id)
	local dot_info = self:_add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, dot_can_crit, dot_tick_period, scale_length, scale_damage, decay_damage, decay_rate, hurt_animation, variant, weapon_id)
end

function DOTManager:sync_add_dot_damage(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, dot_can_crit, dot_tick_period, scale_length, scale_damage, decay_damage, decay_rate)
	if enemy_unit then
		local t = TimerManager:game():time()

		self:_add_doted_enemy(enemy_unit, t, weapon_unit, dot_length, dot_damage, dot_can_crit, dot_tick_period, scale_length, scale_damage, decay_damage, decay_rate)
	end
end

function DOTManager:_add_doted_enemy(enemy_unit, dot_damage_received_time, weapon_unit, dot_length, dot_damage, dot_can_crit, dot_tick_period, scale_length, scale_damage, decay_damage, decay_rate, hurt_animation, variant, weapon_id)
	local contains = false

	if self._doted_enemies then
		for _, dot_info in ipairs(self._doted_enemies) do
			if dot_info.enemy_unit == enemy_unit then
				if dot_info.scale_damage then
					dot_info.dot_damage = dot_info.dot_damage + scale_damage
				end
				
				if dot_info.decay_damage and dot_info.decay_rate then
					dot_info.dot_length = ((dot_info.dot_damage / dot_info.decay_damage) * dot_info.decay_rate * dot_info.dot_tick_period) + 0.1
				elseif dot_info.scale_length then
					dot_info.dot_length = dot_info.dot_length + scale_length
				elseif dot_info.dot_damage_received_time + dot_info.dot_length < dot_damage_received_time + dot_length then
					dot_info.dot_damage_received_time = dot_damage_received_time
					dot_info.dot_length = dot_length
				end
				
				dot_info.hurt_animation = dot_info.hurt_animation or hurt_animation
				contains = true
			end
		end

		if not contains then
			local dot_info = {
				dot_counter = 0,
				enemy_unit = enemy_unit,
				dot_damage_received_time = dot_damage_received_time,
				weapon_unit = weapon_unit,
				dot_length = dot_length,
				dot_damage = dot_damage,
				dot_can_crit = dot_can_crit,
				dot_tick_period = dot_tick_period,
				scale_length = scale_length,
				scale_damage = scale_damage,
				decay_damage = decay_damage,
				decay_rate = decay_rate,
				hurt_animation = hurt_animation,
				variant = variant,
				weapon_id = weapon_id
			}
			if dot_info.decay_damage and dot_info.decay_rate then
					dot_info.dot_length = ((dot_info.dot_damage / dot_info.decay_damage) * dot_info.decay_rate * dot_info.dot_tick_period) + 0.1
			end

			table.insert(self._doted_enemies, dot_info)
			self:check_achievemnts(enemy_unit, dot_damage_received_time)
		end
	end
end

function DOTManager:_damage_dot(dot_info)
	local attacker_unit = managers.player:player_unit()
	local col_ray = {
		unit = dot_info.enemy_unit
	}
	local damage = dot_info.dot_damage
	local can_crit = dot_info.dot_can_crit
	local ignite_character = false
	local weapon_unit = dot_info.weapon_unit
	local weapon_id = dot_info.weapon_id

	if dot_info.variant and dot_info.variant == "poison" then
		PoisonBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, damage, can_crit, dot_info.hurt_animation, weapon_id)
	end
end

function DOTManager:create_dot_data(type, custom_data)
	local dot_data = deep_clone(tweak_data:get_dot_type_data(type))

	if custom_data then
		if custom_data.damage then
			dot_data.dot_damage = custom_data.damage/10
		else
			dot_data.dot_damage = custom_data.dot_damage or dot_data.dot_damage
		end
		dot_data.dot_can_crit = custom_data.dot_can_crit or false
		dot_data.dot_length = custom_data.dot_length or dot_data.dot_length
		dot_data.hurt_animation_chance = custom_data.hurt_animation_chance or dot_data.hurt_animation_chance
		dot_data.dot_tick_period = custom_data.dot_tick_period or dot_data.dot_tick_period
		dot_data.scale_length = custom_data.scale_length or nil
		dot_data.scale_damage = custom_data.scale_damage/10 or nil
		dot_data.decay_damage = custom_data.decay_damage/10 or nil
		dot_data.decay_rate = custom_data.decay_rate or nil
	end

	return dot_data
end
