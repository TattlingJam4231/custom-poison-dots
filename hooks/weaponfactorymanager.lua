function WeaponFactoryManager:_get_forbidden_parts(factory_id, blueprint)
	local factory = tweak_data.weapon.factory
	local forbidden = {}
	local override = self:_get_override_parts(factory_id, blueprint)

	for _, part_id in ipairs(blueprint) do
		local part = self:_part_data(part_id, factory_id, override)

		if part.depends_on then
			local part_forbidden = true

			for _, other_part_id in ipairs(blueprint) do
				local other_part = self:_part_data(other_part_id, factory_id, override)

				if part.depends_on == other_part.type then
					part_forbidden = false

					break
				end
				if part.depends_on == other_part.name_id then
					part_forbidden = false

					break
				end
			end

			if part_forbidden then
				forbidden[part_id] = part.depends_on
			end
		end

		if part.forbids then
			for _, forbidden_id in ipairs(part.forbids) do
				forbidden[forbidden_id] = part_id
			end
		end

		if part.adds then
			local add_forbidden = self:_get_forbidden_parts(factory_id, part.adds)

			for forbidden_id, part_id in pairs(add_forbidden) do
				forbidden[forbidden_id] = part_id
			end
		end
	end

	return forbidden
end