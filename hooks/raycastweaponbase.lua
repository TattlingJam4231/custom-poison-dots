function DOTBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id)
	dot_data = dot_data or self.DOT_DATA
	local hurt_animation = not dot_data.hurt_animation_chance or math.rand(1) < dot_data.hurt_animation_chance

	managers.dot:add_doted_enemy(col_ray.unit, TimerManager:game():time(), weapon_unit, dot_data.dot_length, dot_data.dot_damage, dot_data.dot_tick_period, dot_data.scale_length, dot_data.scale_damage, dot_data.decay_damage, dot_data.decay_rate, hurt_animation, self.VARIANT, weapon_id)
end