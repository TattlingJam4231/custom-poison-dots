local original_init = WeaponFactoryTweakData.init

function WeaponFactoryTweakData:init()
	original_init(self)
	
	--SHOTGUN OVERRIDES--------------------------------------------------------------------------------------------------------------

		local slug = {
			t5 = {
				stats = {
					value = 5,
					damage = 74,
					spread = 10,
					moving_spread = 10
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					damage_near_mul = 2,
					damage_far_mul = 1.5,
					armor_piercing_add = 1,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
					can_shoot_through_enemy = true,
					rays = 1
				}
			},
			t4 = {
				stats = {
					value = 5,
					damage = 61,
					spread = 10,
					moving_spread = 10
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					damage_near_mul = 2,
					damage_far_mul = 1.5,
					armor_piercing_add = 1,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
					can_shoot_through_enemy = true,
					rays = 1
				}
			},
			t3 = {
				stats = {
					value = 5,
					damage = 32,
					spread = 10,
					moving_spread = 10
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					damage_near_mul = 2,
					damage_far_mul = 1.5,
					armor_piercing_add = 1,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
					can_shoot_through_enemy = true,
					rays = 1
				}
			},
			t2 = {
				stats = {
					value = 5,
					damage = 30,
					spread = 10,
					moving_spread = 10
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					damage_near_mul = 2,
					damage_far_mul = 1.5,
					armor_piercing_add = 1,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
					can_shoot_through_enemy = true,
					rays = 1
				}
			},
			t1 = {
				stats = {
					value = 5,
					damage = 20,
					spread = 10,
					moving_spread = 10
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					damage_near_mul = 2,
					damage_far_mul = 1.5,
					armor_piercing_add = 1,
					can_shoot_through_shield = true,
					can_shoot_through_wall = true,
					can_shoot_through_enemy = true,
					rays = 1
				}
			}
		}
		
		local buckshot = {
			t5 = {
				stats = {
					value = 5,
					total_ammo_mod = 2,
					damage = 48,
					spread = nil,
					moving_spread = nil
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					can_shoot_through_enemy = true,
					rays = 9
				}
			},
			t4 = {
				stats = {
					value = 5,
					total_ammo_mod = 2,
					damage = 30,
					spread = nil,
					moving_spread = nil
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					can_shoot_through_enemy = true,
					rays = 9
				}
			},
			t3 = {
				stats = {
					value = 5,
					total_ammo_mod = 2,
					damage = 20,
					spread = nil,
					moving_spread = nil
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					can_shoot_through_enemy = true,
					rays = 9
				}
			},
			t2 = {
				stats = {
					value = 5,
					total_ammo_mod = 2,
					damage = 17,
					spread = nil,
					moving_spread = nil
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					can_shoot_through_enemy = true,
					rays = 9
				}
			},
			t1 = {
				stats = {
					value = 5,
					total_ammo_mod = 2,
					damage = 13,
					spread = nil,
					moving_spread = nil
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					can_shoot_through_enemy = true,
					rays = 9
				}
			}
		}
		
		local he = {
			t5 = {
				stats = {
					value = 5, 
					total_ammo_mod = -5,
					damage = 9,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = 0.4,
					ignore_statistic = true,
					damage_far_mul = 2.5,
					damage_near_mul = 2,
					rays = 3, 
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			t4 = {
				stats = {
					value = 5, 
					total_ammo_mod = -5,
					damage = nil,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.8,
					ammo_pickup_max_mul = 0.4,
					ignore_statistic = true,
					damage_far_mul = 2.5,
					damage_near_mul = 2,
					rays = 3, 
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			t3 = {
				stats = {
					value = 5, 
					total_ammo_mod = -5,
					damage = nil,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.3022,
					ammo_pickup_max_mul = 0.3733,
					ignore_statistic = true,
					damage_far_mul = 2.5,
					damage_near_mul = 2,
					rays = 3, 
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			t2 = {
				stats = {
					value = 5, 
					total_ammo_mod = -5,
					damage = nil,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.4681,
					ammo_pickup_max_mul = 0.3563,
					ignore_statistic = true,
					damage_far_mul = 2.5,
					damage_near_mul = 2,
					rays = 3, 
					bullet_class = "InstantExplosiveBulletBase"
				}
			},
			t1 = {
				stats = {
					value = 5, 
					total_ammo_mod = -5,
					damage = nil,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.5,
					ammo_pickup_max_mul = 0.5474,
					ignore_statistic = true,
					damage_far_mul = 2.5,
					damage_near_mul = 2,
					rays = 3, 
					bullet_class = "InstantExplosiveBulletBase"
				}
			}
		}
		
		local flechette = {
			t5 = {
				stats = {
					value = 5,
					damage = -103,
					spread = -1,
					moving_spread = -1
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					dot_data = {
						type = "poison",
						custom_data = {
							damage = 105,
							dot_tick_period = 0.4,
							scale_damage = 105,
							decay_damage = 15,
							decay_rate = 2
						}
					},
					armor_piercing_add = 1, 
					rays = 16,
					bullet_class = "DOTBulletBase"
				}
			},
			t4 = {
				stats = {
					value = 5,
					damage = -60,
					spread = -1,
					moving_spread = -1
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					dot_data = {
						type = "poison",
						custom_data = {
							damage = 60,
							dot_tick_period = 0.4,
							scale_damage = 45,
							decay_damage = 5,
							decay_rate = 1
						}
					},
					armor_piercing_add = 1, 
					rays = 16,
					bullet_class = "DOTBulletBase"
				}
			},
			t3 = {
				stats = {
					value = 5,
					damage = -37,
					spread = -1,
					moving_spread = -1
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					dot_data = {
						type = "poison",
						custom_data = {
							damage = 60,
							dot_tick_period = 0.4,
							scale_damage = 30,
							decay_damage = 5,
							decay_rate = 1
						}
					},
					armor_piercing_add = 1, 
					rays = 16,
					bullet_class = "DOTBulletBase"
				}
			},
			t2 = {
				stats = {
					value = 5,
					damage = -28,
					spread = -1,
					moving_spread = -1
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					dot_data = {
						type = "poison",
						custom_data = {
							damage = 60,
							dot_tick_period = 0.4,
							scale_damage = 20,
							decay_damage = 5,
							decay_rate = 1
						}
					},
					armor_piercing_add = 1, 
					rays = 16,
					bullet_class = "DOTBulletBase"
				}
			},
			t1 = {
				stats = {
					value = 5,
					damage = -12,
					spread = -1,
					moving_spread = -1
				},
				custom_stats = {
					ammo_pickup_min_mul = nil,
					ammo_pickup_max_mul = nil,
					dot_data = {
						type = "poison",
						custom_data = {
							damage = 30,
							dot_tick_period = 0.4,
							scale_damage = 15,
							decay_damage = 5,
							decay_rate = 1
						}
					},
					armor_piercing_add = 1, 
					rays = 16,
					bullet_class = "DOTBulletBase"
				}
			}
		}
		
		local db = {
			t5 = {
				stats = {
					value = 5, 
					total_ammo_mod = 0, 
					damage = -60,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.4,
					ammo_pickup_max_mul = nil,
					disallow_headshot_damage = 1,
					dot_data = {
						type = "fire",
						custom_data = {
							damage = 25,
							dot_length = 5.1,
							dot_trigger_max_distance = 3000,
							dot_tick_period = 0.5,
							scale_length = 3.75,
							diminish_scale_length = 0.95,
							dot_can_crit = true
							
						}
					},
					armor_piercing_add = 1, 
					ignore_statistic = true,  
					muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath", 
					damage_far_mul = 0.7,
					can_shoot_through_shield = true, 
					bullet_class = "FireBulletBase",
					rays = 24
				}
			},
			t4 = {
				stats = {
					value = 5, 
					total_ammo_mod = 0, 
					damage = -30,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.4,
					ammo_pickup_max_mul = nil,
					disallow_headshot_damage = 1,
					dot_data = {
						type = "fire",
						custom_data = {
							damage = 25,
							dot_length = 5.1,
							dot_trigger_max_distance = 3000,
							dot_tick_period = 0.5,
							scale_length = 3,
							diminish_scale_length = 0.9,
							dot_can_crit = true
							
						}
					},
					armor_piercing_add = 1, 
					ignore_statistic = true,  
					muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath", 
					damage_far_mul = 0.7,
					can_shoot_through_shield = true, 
					bullet_class = "FireBulletBase",
					rays = 24
				}
			},
			t3 = {
				stats = {
					value = 5, 
					total_ammo_mod = 0, 
					damage = -20,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.4,
					ammo_pickup_max_mul = nil,
					disallow_headshot_damage = 1,
					dot_data = {
						type = "fire",
						custom_data = {
							damage = 20,
							dot_length = 4.1,
							dot_trigger_max_distance = 3000,
							dot_tick_period = 0.5,
							scale_length = 3,
							diminish_scale_length = 0.9,
							dot_can_crit = true
							
						}
					},
					armor_piercing_add = 1, 
					ignore_statistic = true,  
					muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath", 
					damage_far_mul = 0.7,
					can_shoot_through_shield = true, 
					bullet_class = "FireBulletBase",
					rays = 24
				}
			},
			t2 = {
				stats = {
					value = 5, 
					total_ammo_mod = 0, 
					damage = -15,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.4,
					ammo_pickup_max_mul = nil,
					disallow_headshot_damage = 1,
					dot_data = {
						type = "fire",
						custom_data = {
							damage = 20, 
							dot_length = 4.1,
							dot_trigger_max_distance = 3000,
							dot_tick_period = 0.5,
							scale_length = 2.25,
							diminish_scale_length = 0.9,
							dot_can_crit = true
							
						}
					},
					armor_piercing_add = 1, 
					ignore_statistic = true,  
					muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath", 
					damage_far_mul = 0.7,
					can_shoot_through_shield = true, 
					bullet_class = "FireBulletBase",
					rays = 24
				}
			},
			t1 = {
				stats = {
					value = 5, 
					total_ammo_mod = 0, 
					damage = -6,
					spread = -3,
					moving_spread = -3
				},
				custom_stats = {
					ammo_pickup_min_mul = 0.4,
					ammo_pickup_max_mul = nil,
					disallow_headshot_damage = 1,
					dot_data = {
						type = "fire",
						custom_data = {
							damage = 15,
							dot_length = 3.1,
							dot_trigger_max_distance = 3000,
							dot_tick_period = 0.5,
							scale_length = 2,
							diminish_scale_length = 0.9,
							dot_can_crit = true
							
						}
					},
					armor_piercing_add = 1, 
					ignore_statistic = true,  
					muzzleflash = "effects/payday2/particles/weapons/shotgun/sho_muzzleflash_dragons_breath", 
					damage_far_mul = 0.7,
					can_shoot_through_shield = true, 
					bullet_class = "FireBulletBase",
					rays = 24
				}
			}
		}
		
		--155 damage shotguns-----------------------------------------------------------
		
			--mosconi
			self.wpn_fps_shot_huntsman.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5)
			}
			self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_slug.stats.reload = 3
			self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_custom.stats.reload = 3
			self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_custom_free.stats.reload = 3
			self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_explosive.stats.reload = 3
			self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_piercing.stats.reload = 3
			self.wpn_fps_shot_huntsman.override.wpn_fps_upg_a_dragons_breath.stats.reload = 3
		
			--joceline
			self.wpn_fps_shot_b682.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5)
			}
			self.wpn_fps_shot_b682.override.wpn_fps_upg_a_slug.stats.reload = 3
			self.wpn_fps_shot_b682.override.wpn_fps_upg_a_custom.stats.reload = 3
			self.wpn_fps_shot_b682.override.wpn_fps_upg_a_custom_free.stats.reload = 3
			self.wpn_fps_shot_b682.override.wpn_fps_upg_a_explosive.stats.reload = 3
			self.wpn_fps_shot_b682.override.wpn_fps_upg_a_piercing.stats.reload = 3
			self.wpn_fps_shot_b682.override.wpn_fps_upg_a_dragons_breath.stats.reload = 3
			
			--breaker
			self.wpn_fps_sho_boot.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5)
			}
			
			--akimbo judge
			self.wpn_fps_pis_x_judge.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5),
				wpn_fps_upg_ns_shot_shark = {parent = "slide"},
				wpn_fps_upg_ns_shot_thick = {parent = "slide"},
				wpn_fps_upg_shot_ns_king = {parent = "slide"},
				wpn_fps_upg_ns_sho_salvo_large = {parent = "slide"},
				wpn_fps_upg_ns_duck = {parent = "slide"},
				wpn_fps_pis_judge_body_standard = {animations = {}},
				wpn_fps_pis_judge_body_modern = {animations = {}}
			}
			
			--judge
			self.wpn_fps_pis_judge.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5),
				wpn_fps_upg_ns_shot_shark = {parent = "slide"},
				wpn_fps_upg_ns_shot_thick = {parent = "slide"},
				wpn_fps_upg_shot_ns_king = {parent = "slide"},
				wpn_fps_upg_ns_sho_salvo_large = {parent = "slide"},
				wpn_fps_upg_ns_duck = {parent = "slide"}
			}
			
			--gsps
			self.wpn_fps_shot_m37.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5)
			}
			self.wpn_fps_shot_m37.override.wpn_fps_upg_a_slug.stats.reload = 4
			self.wpn_fps_shot_m37.override.wpn_fps_upg_a_custom.stats.reload = 4
			self.wpn_fps_shot_m37.override.wpn_fps_upg_a_custom_free.stats.reload = 4
			self.wpn_fps_shot_m37.override.wpn_fps_upg_a_explosive.stats.reload = 4
			self.wpn_fps_shot_m37.override.wpn_fps_upg_a_piercing.stats.reload = 4
			self.wpn_fps_shot_m37.override.wpn_fps_upg_a_dragons_breath.stats.reload = 4
			
			--claire
			self.wpn_fps_sho_coach.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t5),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t5),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t5),
				wpn_fps_upg_a_explosive = deep_clone(he.t5),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t5),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t5)
			}
			self.wpn_fps_sho_coach.override.wpn_fps_upg_a_slug.stats.reload = 2
			self.wpn_fps_sho_coach.override.wpn_fps_upg_a_custom.stats.reload = 2
			self.wpn_fps_sho_coach.override.wpn_fps_upg_a_custom_free.stats.reload = 2
			self.wpn_fps_sho_coach.override.wpn_fps_upg_a_explosive.stats.reload = 2
			self.wpn_fps_sho_coach.override.wpn_fps_upg_a_piercing.stats.reload = 2
			self.wpn_fps_sho_coach.override.wpn_fps_upg_a_dragons_breath.stats.reload = 2
		
		--90 damage shotguns------------------------------------------------------------
		
			--raven
			self.wpn_fps_sho_ksg.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t4),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t4),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t4),
				wpn_fps_upg_a_explosive = deep_clone(he.t4),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t4),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t4)
			}
			self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_slug.stats.reload = 4
			self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_custom.stats.reload = 4
			self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_custom_free.stats.reload = 4
			self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_explosive.stats.reload = 4
			self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_piercing.stats.reload = 4
			self.wpn_fps_sho_ksg.override.wpn_fps_upg_a_dragons_breath.stats.reload = 4

			--reinfeld
			self.wpn_fps_shot_r870.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t4),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t4),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t4),
				wpn_fps_upg_a_explosive = deep_clone(he.t4),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t4),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t4)
			}
			self.wpn_fps_shot_r870.override.wpn_fps_upg_a_slug.stats.reload = 4
			self.wpn_fps_shot_r870.override.wpn_fps_upg_a_custom.stats.reload = 4
			self.wpn_fps_shot_r870.override.wpn_fps_upg_a_custom_free.stats.reload = 4
			self.wpn_fps_shot_r870.override.wpn_fps_upg_a_explosive.stats.reload = 4
			self.wpn_fps_shot_r870.override.wpn_fps_upg_a_piercing.stats.reload = 4
			self.wpn_fps_shot_r870.override.wpn_fps_upg_a_dragons_breath.stats.reload = 4
			
			--locomotive
			self.wpn_fps_shot_serbu.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t4),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t4),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t4),
				wpn_fps_upg_a_explosive = deep_clone(he.t4),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t4),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t4)
			}
			self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_slug.stats.reload = 4
			self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_custom.stats.reload = 4
			self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_custom_free.stats.reload = 4
			self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_explosive.stats.reload = 4
			self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_piercing.stats.reload = 4
			self.wpn_fps_shot_serbu.override.wpn_fps_upg_a_dragons_breath.stats.reload = 4

		--55 damage shotguns-----------------------------------------------------------
		
			--predator
			self.wpn_fps_sho_spas12.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t3),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t3),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t3),
				wpn_fps_upg_a_explosive = deep_clone(he.t3),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t3),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t3)
			}
			self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_slug.stats.reload = 4
			self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_custom.stats.reload = 4
			self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_custom_free.stats.reload = 4
			self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_explosive.stats.reload = 4
			self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_piercing.stats.reload = 4
			self.wpn_fps_sho_spas12.override.wpn_fps_upg_a_dragons_breath.stats.reload = 4
			
			--m1014
			self.wpn_fps_sho_ben.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t3),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t3),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t3),
				wpn_fps_upg_a_explosive = deep_clone(he.t3),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t3),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t3)
			}
			self.wpn_fps_sho_ben.override.wpn_fps_upg_a_slug.stats.reload = 4
			self.wpn_fps_sho_ben.override.wpn_fps_upg_a_custom.stats.reload = 4
			self.wpn_fps_sho_ben.override.wpn_fps_upg_a_custom_free.stats.reload = 4
			self.wpn_fps_sho_ben.override.wpn_fps_upg_a_explosive.stats.reload = 4
			self.wpn_fps_sho_ben.override.wpn_fps_upg_a_piercing.stats.reload = 4
			self.wpn_fps_sho_ben.override.wpn_fps_upg_a_dragons_breath.stats.reload = 4
			
			--street sweeper
			self.wpn_fps_sho_striker.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t3),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t3),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t3),
				wpn_fps_upg_a_explosive = deep_clone(he.t3),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t3),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t3)
			}
			self.wpn_fps_sho_striker.override.wpn_fps_upg_a_slug.stats.reload = 2
			self.wpn_fps_sho_striker.override.wpn_fps_upg_a_custom.stats.reload = 2
			self.wpn_fps_sho_striker.override.wpn_fps_upg_a_custom_free.stats.reload = 2
			self.wpn_fps_sho_striker.override.wpn_fps_upg_a_explosive.stats.reload = 2
			self.wpn_fps_sho_striker.override.wpn_fps_upg_a_piercing.stats.reload = 2
			self.wpn_fps_sho_striker.override.wpn_fps_upg_a_dragons_breath.stats.reload = 2

		--42 damage shotguns-----------------------------------------------------------

			--izhma
			self.wpn_fps_shot_saiga.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t2),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t2),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t2),
				wpn_fps_upg_a_explosive = deep_clone(he.t2),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t2),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t2)
			}
			
			--steakout
			self.wpn_fps_sho_aa12.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t2),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t2),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t2),
				wpn_fps_upg_a_explosive = deep_clone(he.t2),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t2),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t2)
			}
			
			--akimbo goliath
			self.wpn_fps_sho_x_rota.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t2),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t2),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t2),
				wpn_fps_upg_a_explosive = deep_clone(he.t2),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t2),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t2)
			}
			
			--goliath
			self.wpn_fps_sho_rota.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t2),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t2),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t2),
				wpn_fps_upg_a_explosive = deep_clone(he.t2),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t2),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t2)
			}
		
		--18 damage shotguns-----------------------------------------------------------
		
			--brothers grimm
			self.wpn_fps_sho_x_basset.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t1),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t1),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t1),
				wpn_fps_upg_a_explosive = deep_clone(he.t1),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t1),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t1)
			}
			
			--grimm
			self.wpn_fps_sho_basset.override = {
				wpn_fps_upg_a_slug = deep_clone(slug.t1),
				wpn_fps_upg_a_custom = deep_clone(buckshot.t1),
				wpn_fps_upg_a_custom_free = deep_clone(buckshot.t1),
				wpn_fps_upg_a_explosive = deep_clone(he.t1),
				wpn_fps_upg_a_piercing = deep_clone(flechette.t1),
				wpn_fps_upg_a_dragons_breath = deep_clone(db.t1)
			}

	--ATTACHMENTS/AMMO---------------------------------------------------------------------------------------------------------------

		--Attachments
		
			--king's crown
			self.parts.wpn_fps_upg_shot_ns_king.stats.damage = 2
			
			-- --gecko cqb foregrip
			-- self.parts.wpn_fps_ass_galil_fg_mar.stats.concealment = 1
			
			--gecko sniper foregrip
			self.parts.wpn_fps_ass_galil_fg_sniper.stats.damage = 1
			
			--gecko fabulous foregrip
			self.parts.wpn_fps_ass_galil_fg_fab.stats.damage = 1
			
			-- -- queen's wrath diminutive barrel
			-- self.parts.wpn_fps_ass_l85a2_b_short.stats.concealment = 2
			
			-- --ak5 cqb barrel
			-- self.parts.wpn_fps_ass_ak5_b_short.stats.concealment = 0
			
			-- --car 4 short barrel
			-- self.parts.wpn_fps_m4_uupg_b_short.stats.concealment = 0
			
			-- --car 4 stealth barrel
			-- self.parts.wpn_fps_m4_uupg_b_sd.stats.concealment = 0
			
			-- --straight grip
			-- self.parts.wpn_fps_upg_m4_g_mgrip.stats.concealment = 1
			
			-- --car folding stock
			-- self.parts.wpn_fps_m4_uupg_s_fold.stats.concealment = 2
			
			-- --ak modern barrel
			-- self.parts.wpn_fps_upg_ak_b_draco.stats.concealment = 0
			
			-- --ak modern barrel
			-- self.parts.wpn_fps_upg_ak_b_ak105.stats.concealment = 0
			
			-- --ak battleproven handguard
			-- self.parts.wpn_fps_upg_ak_fg_tapco.stats.concealment = 1
			
			-- --ak crabs rail
			-- self.parts.wpn_fps_upg_ak_fg_krebs.stats.concealment = 1
			
			-- --ak rubber grip
			-- self.parts.wpn_fps_upg_ak_g_hgrip.stats.concealment = 1
			
			-- --ak low drag mag
			-- self.parts.wpn_fps_upg_ak_m_uspalm.stats.concealment = 0
			
			-- --ak speed pull mag
			-- self.parts.wpn_fps_upg_ak_m_quick.stats.concealment = -1
			
			-- --ak skeletal stock
			-- self.parts.wpn_upg_ak_s_skfoldable.stats.concealment = 1
			
			-- --eagle short barrel
			-- self.parts.wpn_fps_ass_scar_b_short.stats.concealment = 2
			
			-- --gewehr plastic foregrip
			-- self.parts.wpn_fps_ass_g3_fg_retro_plastic.stats.concealment = 3
			
			-- --falcon cqb foregrip
			-- self.parts.wpn_fps_ass_fal_fg_01.stats.concealment = 2
			
			-- --falcon tactical grip
			-- self.parts.wpn_fps_ass_fal_g_01.stats.concealment = 0
			
			-- --falcon cqb foregrip
			-- self.parts.wpn_fps_ass_fal_s_01.stats.concealment = 1
			
			
			--conversion kits-----------------------------------------------------------------------------
			
				--CAR dmr kit
				self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_min_mul = 0.25
				self.parts.wpn_fps_upg_ass_m4_b_beowulf.custom_stats.ammo_pickup_max_mul = 0.3333
				
				--AK dmr kit
				self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.4167
				self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.4167
				
				--overrides------------------------------------------------------------------------
					
					--amr
					self.wpn_fps_ass_m16.override = {
						wpn_fps_upg_ass_m4_b_beowulf = {
							stats = {
								spread = 4,
								total_ammo_mod = -8,
								damage = 66,
								concealment = -4,
								value = 1,
								recoil = -4
							},
							custom_stats = {
								ammo_pickup_max_mul = 0.4167,
								ammo_pickup_min_mul = 0.4167
							}
						}
					}
					--ak
					self.wpn_fps_ass_74.override = {
						wpn_fps_upg_ass_ak_b_zastava = {
							stats = {
								spread = 3,
								total_ammo_mod = -12,
								damage = 104,
								concealment = -4,
								value = 1,
								recoil = -9
							},
							custom_stats = {
								ammo_pickup_min_mul = 0.25,
								ammo_pickup_max_mul = 0.3333
							}
						}
					}
					
					--gewehr
					self.wpn_fps_ass_g3.override = {
						wpn_fps_ass_g3_b_sniper = {
							stats = {
								extra_ammo = -5,
								total_ammo_mod = -10,
								damage = 61,
								value = 2,
								concealment = -2,
								recoil = -1,
								spread = 2
							},
							custom_stats = {
								ammo_pickup_min_mul = 0.4167,
								ammo_pickup_max_mul = 0.4167
							},
							adds = {}
						},
						wpn_fps_ass_g3_b_short = {
							stats = {
								spread = -4,
								total_ammo_mod = 10,
								damage = -40,
								value = 2,
								concealment = 1,
								recoil = 5
							},
							custom_stats = {
								ammo_pickup_min_mul = 1.6667,
								ammo_pickup_max_mul = 1.25
							},
							adds = {}
						}
					}
			--LMG attachment overrides--------------------------------------------------------------------
				
				self.wpn_fps_lmg_hk21.override = {
					wpn_fps_upg_ns_ass_smg_large = {
						stats = {
							alert_size = 12,
							spread_moving = 2,
							damage = -1,
							suppression = 0,
							value = 5,
							recoil = 1,
							spread = 0,
							concealment = -3
						}
					},
					wpn_fps_upg_ns_ass_smg_medium = {
						stats = {
							alert_size = 12,
							spread_moving = -2,
							damage = -3,
							suppression = 0,
							value = 2,
							recoil = 1,
							concealment = -2
						}
					},
					wpn_fps_upg_ns_ass_smg_small = {
						stats = {
							alert_size = 12,
							spread_moving = -1,
							damage = -5,
							suppression = 0,
							value = 3,
							recoil = 0,
							concealment = 0
						}
					}
				}
				
				self.wpn_fps_lmg_mg42.override = {
					wpn_fps_upg_ns_ass_smg_large = {
						stats = {
							alert_size = 12,
							spread_moving = 2,
							damage = -1,
							suppression = 0,
							value = 5,
							recoil = 1,
							spread = 0,
							concealment = -3
						}
					},
					wpn_fps_upg_ns_ass_smg_medium = {
						stats = {
							alert_size = 12,
							spread_moving = -2,
							damage = -3,
							suppression = 0,
							value = 2,
							recoil = 1,
							concealment = -2
						}
					},
					wpn_fps_upg_ns_ass_smg_small = {
						stats = {
							alert_size = 12,
							spread_moving = -1,
							damage = -5,
							suppression = 0,
							value = 3,
							recoil = 0,
							concealment = 0
						}
					}
				}
				
				self.wpn_fps_lmg_m249.override = {
					wpn_fps_upg_ns_ass_smg_large = {
						stats = {
							alert_size = 12,
							spread_moving = 2,
							damage = -1,
							suppression = 0,
							value = 5,
							recoil = 1,
							spread = 0,
							concealment = -3
						}
					},
					wpn_fps_upg_ns_ass_smg_medium = {
						stats = {
							alert_size = 12,
							spread_moving = -2,
							damage = -3,
							suppression = 0,
							value = 2,
							recoil = 1,
							concealment = -2
						}
					},
					wpn_fps_upg_ns_ass_smg_small = {
						stats = {
							alert_size = 12,
							spread_moving = -1,
							damage = -5,
							suppression = 0,
							value = 3,
							recoil = 0,
							concealment = 0
						}
					}
				}
				
				self.wpn_fps_lmg_par.override = {
					wpn_fps_upg_ns_ass_smg_large = {
						stats = {
							alert_size = 12,
							spread_moving = 2,
							damage = -1,
							suppression = 0,
							value = 5,
							recoil = 1,
							spread = 0,
							concealment = -3
						}
					},
					wpn_fps_upg_ns_ass_smg_medium = {
						stats = {
							alert_size = 12,
							spread_moving = -2,
							damage = -3,
							suppression = 0,
							value = 2,
							recoil = 1,
							concealment = -2
						}	
					},
					wpn_fps_upg_ns_ass_smg_small = {
						stats = {
							alert_size = 12,
							spread_moving = -1,
							damage = -5,
							suppression = 0,
							value = 3,
							recoil = 0,
							concealment = 0
						}
					}
				}
				
				self.wpn_fps_lmg_rpk.override = {
						wpn_fps_upg_ns_ass_smg_large = {
							stats = {
								alert_size = 12,
								spread_moving = 2,
								damage = -1,
								suppression = 0,
								value = 5,
								recoil = 1,
								spread = 0,
								concealment = -3
							}
					},
					wpn_fps_upg_ns_ass_smg_medium = {
						stats = {
							alert_size = 12,
							spread_moving = -2,
							damage = -3,
							suppression = 0,
							value = 2,
							recoil = 1,
							concealment = -2
						}
					},
					wpn_fps_upg_ns_ass_smg_small = {
						stats = {
							alert_size = 12,
							spread_moving = -1,
							damage = -5,
							suppression = 0,
							value = 3,
							recoil = 0,
							concealment = 0
						}
					}
				}
end
