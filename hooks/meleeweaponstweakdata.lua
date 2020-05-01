local original_init = BlackMarketTweakData._init_melee_weapons

function BlackMarketTweakData:_init_melee_weapons(tweak_data)
	original_init(self, tweak_data)

	self.melee_weapons.fight.stats.min_damage = 7
	self.melee_weapons.fight.stats.max_damage = 45
	self.melee_weapons.fight.stats.min_damage_effect = 1
	self.melee_weapons.fight.stats.max_damage_effect = 1
	self.melee_weapons.fight.stats.charge_time = 2
	self.melee_weapons.fight.stats.range = 250
	self.melee_weapons.fight.expire_t = 0.6
	self.melee_weapons.fight.repeat_expire_t = 0.8
end