# custom-poison-dots

Mod for Payday 2 that adds more options for poison dot behaviors. Intended to be used as a dependency for other mods.

Vanilla poison dot variables:
  
  - hurt_animation_chance: percent chance for hurt animation to play for affected enemy. (value between 0-100)
  - dot_damage: damage dealt per tick.
  - dot_length: length of dot in seconds.

Added poison dot variables:
  
  - dot_can_crit: if set to true, allows the dot to crit. (defaults to false if not used)
  - dot_tick_period: time(seconds) between damage ticks.
  - scale_length: time(seconds) added to length of dot on consecutive hits. (overrides default timer reset)
  - scale_damage: damage added to dot on consecutive hits.
  - decay_damage: damage removed from dot per decay tick.
  - decay_rate: number of damage ticks per decay tick. (a value of 2 causes a decay tick on every 2nd damage tick)
      (decay_damage and decay_rate won't function without the other)
