function DOTBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local result = DOTBulletBase.super.on_collision(self, col_ray, weapon_unit, user_unit, damage, blank, self.NO_BULLET_INPACT_SOUND)
	local hit_unit = col_ray.unit

	if hit_unit:character_damage() and hit_unit:character_damage().damage_dot and not hit_unit:character_damage():dead() then
		result = self:start_dot_damage(col_ray, weapon_unit, user_unit, self:_dot_data_by_weapon(weapon_unit))
	end

	return result
end

function DOTBulletBase:_dot_data_by_weapon(weapon_unit)
	if not alive(weapon_unit) then
		return nil
	end

	if weapon_unit:base()._ammo_data and weapon_unit:base()._ammo_data.dot_data then
		local ammo_dot_data = weapon_unit:base()._ammo_data.dot_data
		
		return managers.dot:create_dot_data(ammo_dot_data.type, ammo_dot_data.custom_data)
	elseif weapon_unit.base and weapon_unit:base()._name_id then
		local weapon_name_id = weapon_unit:base()._name_id

		if tweak_data.weapon[weapon_name_id] and tweak_data.weapon[weapon_name_id].dot_data then
			dot_data = tweak_data.weapon[weapon_name_id].dot_data
			
			return managers.dot:create_dot_data(dot_data.type, dot_data.custom_data)
		end
	end

	return nil
end

function DOTBulletBase:start_dot_damage(col_ray, weapon_unit, user_unit, dot_data, weapon_id)
	dot_data = dot_data or self.DOT_DATA
	local hurt_animation = not dot_data.hurt_animation_chance or math.rand(1) < dot_data.hurt_animation_chance
	
	local flammable = nil
	local char_tweak = tweak_data.character[col_ray.unit:base()._tweak_table]
	flammable = char_tweak.flammable == nil and true or char_tweak.flammable
	local distance = 1000
	local hit_loc = col_ray.hit_position

	if hit_loc and user_unit and user_unit.position then
		distance = mvector3.distance(hit_loc, user_unit:position())
	end
	
	local dot_max_distance = dot_data.dot_trigger_max_distance
	local dot_trigger_chance = dot_data.dot_trigger_chance or 100

	local start_dot_damage_roll = math.random(1, 100)
	
	if dot_data.variant == "fire" then
		if not flammable then
			return
		end
	end

	if	start_dot_damage_roll <= dot_trigger_chance then
		if dot_max_distance then
			if dot_max_distance < distance then
				return
			end
		end
		managers.dot:add_doted_enemy(col_ray, col_ray.unit, TimerManager:game():time(), weapon_unit, dot_data, weapon_id)
	end
end

function DOTBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, variant, damage, can_crit, hurt_animation, weapon_id)
	local action_data = {
		variant = variant,
		damage = damage,
		can_crit = can_crit,
		weapon_unit = weapon_unit,
		attacker_unit = attacker_unit,
		col_ray = col_ray,
		hurt_animation = hurt_animation,
		weapon_id = weapon_id
	}
	local defense_data = {}

	if col_ray and col_ray.unit and alive(col_ray.unit) and col_ray.unit:character_damage() then
		defense_data = col_ray.unit:character_damage():damage_dot(action_data)
	end

	return defense_data
end

FireBulletBase = FireBulletBase or class(DOTBulletBase)
FireBulletBase.VARIANT = "fire"

function FireBulletBase:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
end