function DOTManager:_init_function_tables()
	self.update_table = {}
	self._add_doted_enemy_table = {}
	self._add_new_doted_enemy_table = {}
	self.create_dot_data_table = {}
end

function DOTManager:sort_table_by_weight(tbl)
	local temp = deep_clone(tbl)
	tbl = {}
	local min = 1
	local mid = 1
	local max = 0
	
	for i, func in ipairs(temp) do
		if max == 0 then
			table.insert(tbl, func)
			max = table.getn(tbl)
		else
			while true do
				mid = math.ceil((min + max) / 2)
				if tbl[mid]("weight") == func("weight") then
					table.insert(tbl, mid, func)
					break
				end
				if min == max then
					if func("weight") > tbl[max]("weight") then
						table.insert(tbl, max + 1, func)
						break
					end
					if func("weight") < tbl[min]("weight") then
						table.insert(tbl, min - 1, func)
						break
					end
					table.insert(tbl, mid, func)
					break
				end
				if func("weight") > tbl[mid]("weight") then
					min = mid + 1
				else
					max = mid - 1
				end
			end
		end
	end
end

function DOTManager:init()
	self._doted_enemies = {}
	self._dot_grace_period = 0.25
	self:_init_function_tables()
	self:sort_table_by_weight(self.update_table)
	self:sort_table_by_weight(self._add_doted_enemy_table)
	self:sort_table_by_weight(self._add_new_doted_enemy_table)
	self:sort_table_by_weight(self.create_dot_data_table)
end

function DOTManager:update(t, dt)
	for index = #self._doted_enemies, 1, -1 do
		local dot_info = self._doted_enemies[index]
		
		if dot_info.dot_counter >= dot_info.dot_tick_period then
			self:_damage_dot(dot_info)
			dot_info.dot_counter = 0
		end
		
		--insert functions here
		for i, f in ipairs(self.update_table) do
			f(self, {t = t, dt = dt, dot_info = dot_info})
		end
		
		if t > dot_info.dot_damage_received_time + dot_info.dot_length then
			if dot_info.variant == "fire" then
				self:_remove_flame_effects_from_doted_unit(dot_info.enemy_unit)
				self:_stop_burn_body_sound(dot_info.sound_source)
			end
			table.remove(self._doted_enemies, index)
		-- elseif dot_info.enemy_unit:dead() then
			-- table.remove(self._doted_enemies, index)
		else
			dot_info.dot_counter = dot_info.dot_counter + dt
		end
	end
end

function DOTManager:add_doted_enemy(col_ray, enemy_unit, dot_damage_received_time, weapon_unit, dot_data, weapon_id)
	local dot_info = self:_add_doted_enemy(col_ray, enemy_unit, dot_damage_received_time, weapon_unit, dot_data, weapon_id)
end

function DOTManager:sync_add_dot_damage(col_ray, enemy_unit, dot_damage_received_time, weapon_unit, dot_data)
	if enemy_unit then
		local t = TimerManager:game():time()

		self:_add_doted_enemy(col_ray, enemy_unit, t, weapon_unit, dot_data)
	end
end

function DOTManager:_add_doted_enemy(col_ray, enemy_unit, dot_damage_received_time, weapon_unit, dot_data, weapon_id)
	local contains = false

	if self._doted_enemies then
		for _, dot_info in ipairs(self._doted_enemies) do
				
			if dot_info.enemy_unit == enemy_unit and dot_info.variant == dot_data.variant then
				if not dot_info.reset_dot_length and dot_info.dot_damage_received_time + dot_info.dot_length < dot_damage_received_time + dot_length then
					dot_info.dot_damage_received_time = dot_damage_received_time
					dot_info.dot_length = dot_length
				end
				
				--insert functions here
				for i, f in ipairs(self._add_doted_enemy_table) do
					f(self, {dot_info = dot_info, dot_data = dot_data, col_ray = col_ray, enemy_unit = enemy_unit, dot_damage_received_time = dot_damage_received_time, weapon_unit = weapon_unit, weapon_id = weapon_id})
				end
				
				dot_info.hurt_animation = dot_info.hurt_animation or dot_data.hurt_animation
				contains = true
			end
		end

		if not contains then
			local dot_info = deep_clone(dot_data)
			
			dot_info.col_ray = col_ray
			dot_info.dot_counter = 0
			dot_info.enemy_unit = enemy_unit
			dot_info.dot_damage_received_time = dot_damage_received_time
			dot_info.weapon_unit = weapon_unit
			dot_info.weapon_id = weapon_id
			
			--insert functions here
			for i, f in ipairs(self._add_new_doted_enemy_table) do
				f(self, {dot_info = dot_info, dot_data = dot_data, col_ray = col_ray, enemy_unit = enemy_unit, dot_damage_received_time = dot_damage_received_time, weapon_unit = weapon_unit, weapon_id = weapon_id})
			end
			
			table.insert(self._doted_enemies, dot_info)
			
			if dot_data.variant == "fire" then
				self:_start_enemy_fire_effect(dot_info)
				self:start_burn_body_sound(dot_info)
			end
			
			self:check_achievemnts(enemy_unit, dot_damage_received_time)
		end
	end
end

function DOTManager:_damage_dot(dot_info)
	local action_data = dot_info
	action_data.attacker_unit = managers.player:player_unit()
	action_data.damage = dot_info.dot_damage

	if dot_info.variant then
		DOTBulletBase:give_damage_dot(action_data)
	end
end

function DOTManager:create_dot_data(dot_info)
	local dot_types = {
		poison = {
			damage_class = "PoisonBulletBase",
			dot_damage = 25,
			dot_length = 6,
			hurt_animation_chance = 1
		},
		fire = {
			damage_class = "FlameBulletBase",
			dot_damage = 10,
			dot_length = 3.1
		}
	}
	
	local dot_data = dot_types[dot_info.type]

	if dot_info.custom_data then
		local custom_data = dot_info.custom_data
		
		dot_data.variant = dot_info.type
		dot_data.dot_trigger_chance = custom_data.dot_trigger_chance or 100
		dot_data.hurt_animation_chance = custom_data.hurt_animation_chance or 0
		dot_data.dot_trigger_max_distance = custom_data.dot_trigger_max_distance
		dot_data.dot_can_crit = custom_data.dot_can_crit or false
		if custom_data.damage then
			dot_data.dot_damage = custom_data.damage/10
		else
			dot_data.dot_damage = custom_data.dot_damage or dot_data.dot_damage
		end
		dot_data.dot_length = custom_data.dot_length or dot_data.dot_length
		if custom_data.reset_dot_length == nil then
			dot_data.reset_dot_length = true
		end
		dot_data.dot_tick_period = custom_data.dot_tick_period or dot_data.dot_tick_period
		
		--insert functions here
		for i, f in ipairs(self.create_dot_data_table) do
			f(self, {dot_info = dot_info, dot_data = dot_data})
		end
	end
	
	return dot_data
end

-- from firemanager -------------------------

function DOTManager:_remove_flame_effects_from_doted_unit(enemy_unit)
	if self._doted_enemies then
		for _, dot_info in ipairs(self._doted_enemies) do
			if dot_info.fire_effects and dot_info.enemy_unit == enemy_unit then
				for __, fire_effect_id in ipairs(dot_info.fire_effects) do
					World:effect_manager():fade_kill(fire_effect_id)
				end
			end
		end
	end
end

function DOTManager:start_burn_body_sound(dot_info, delay)
	local sound_loop_burn_body = SoundDevice:create_source("FireBurnBody")

	sound_loop_burn_body:set_position(dot_info.enemy_unit:position())
	sound_loop_burn_body:post_event("burn_loop_body")

	dot_info.sound_source = sound_loop_burn_body

	if delay then
		managers.enemy:add_delayed_clbk("FireBurnBody", callback(self, self, "_stop_burn_body_sound", sound_loop_burn_body), TimerManager:game():time() + delay - 0.5)
	end
end

function DOTManager:_stop_burn_body_sound(sound_source)
	sound_source:post_event("burn_loop_body_stop")
	managers.enemy:add_delayed_clbk("FireBurnBodyFade", callback(self, self, "_release_sound_source", {
		sound_source = sound_source
	}), TimerManager:game():time() + 0.5)
end

function DOTManager:_release_sound_source(...)
end

local tmp_used_flame_objects = nil
function DOTManager:_start_enemy_fire_effect(dot_info)
	local num_objects = #tweak_data.fire.fire_bones
	local num_effects = math.random(3, num_objects)

	if not tmp_used_flame_objects then
		tmp_used_flame_objects = {}

		for _, effect in ipairs(tweak_data.fire.fire_bones) do
			table.insert(tmp_used_flame_objects, false)
		end
	end

	local idx = 1
	local effect_id = nil
	local effects_table = {}

	for i = 1, num_effects, 1 do
		while tmp_used_flame_objects[idx] do
			idx = math.random(1, num_objects)
		end

		local effect = tweak_data.fire.effects.endless[tweak_data.fire.effects_cost[i]]
		local bone = dot_info.enemy_unit:get_object(Idstring(tweak_data.fire.fire_bones[idx]))

		if bone then
			effect_id = World:effect_manager():spawn({
				effect = Idstring(effect),
				parent = bone
			})

			table.insert(effects_table, effect_id)
		end

		tmp_used_flame_objects[idx] = true
	end

	dot_info.fire_effects = effects_table

	for idx, _ in ipairs(tmp_used_flame_objects) do
		tmp_used_flame_objects[idx] = false
	end
end


