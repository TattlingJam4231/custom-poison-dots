# custom-poison-dots

Mod for Payday 2 that adds more options for poison dot behaviors. Intended to be used as a dependency for other mods.

Vanilla dot variables:
  
  - hurt_animation_chance: percent chance for hurt animation to play for affected enemy. (value between 0-100)
  - dot_damage: damage dealt per tick. (divide desired damage value by ten; for 105 damage, set the variable to 10.5)
  - dot_length: length of dot in seconds.

Added dot variables:
  
  - damage: damage delt per tick. (overrides dot_damage, value does not need to be divided by ten)
  - dot_can_crit: if set to true, allows the dot to crit. (defaults to false if not used)
  - dot_tick_period: time(seconds) between damage ticks.
  - dot_trigger_max_distance: maximum distance at which the dot will trigger. 
  - dot_trigger_chance: percent chance that the dot will trigger. (value between 0-100)
  - scale_length: time(seconds) added to length of dot on consecutive hits. (overrides default timer reset)
  - diminish_scale_length: adds diminishing returns to scale_length based on how much duration is left on the dot. (value between 0-1; formula used: scale_length * (diminish_scale_length ^ durationleft) )
  - scale_damage: damage added to dot on consecutive hits.
  - decay_damage: damage removed from dot per decay tick.
  - decay_rate: number of damage ticks per decay tick. (a value of 2 causes a decay tick on every 2nd damage tick)
      (decay_damage and decay_rate won't function without the other)
