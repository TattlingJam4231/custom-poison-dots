function DOTBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id)
	dot_data = dot_data or self.DOT_DATA
	local hurt_animation = not dot_data.hurt_animation_chance or math.rand(1) < dot_data.hurt_animation_chance

	managers.dot:add_doted_enemy(col_ray.unit, TimerManager:game():time(), weapon_unit, dot_data.dot_length, dot_data.dot_damage, dot_data.dot_can_crit, dot_data.dot_tick_period, dot_data.scale_length, dot_data.scale_damage, dot_data.decay_damage, dot_data.decay_rate, hurt_animation, self.VARIANT, weapon_id)
end

function DOTBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, damage, can_crit, hurt_animation, weapon_id)
	local action_data = {
		variant = self.VARIANT,
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