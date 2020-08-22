local original_init = HUDHitConfirm.init
function HUDHitConfirm:init(hud)
	original_init(self, hud)
	
	if self._hud_panel:child("dot_confirm") then
		self._hud_panel:remove(self._hud_panel:child("dot_confirm"))
	end
	
	self._dot_confirm = self._hud_panel:bitmap({
		texture = "guis/textures/pd2/hitconfirm",
		name = "dot_confirm",
		halign = "center",
		visible = false,
		layer = 0,
		blend_mode = "add",
		valign = "center",
		color = Color.green
	})

	self._dot_confirm:set_center(self._hud_panel:w() / 2, self._hud_panel:h() / 2)

	
end

function HUDHitConfirm:on_dot_confirmed()
	self._dot_confirm:stop()
	self._dot_confirm:animate(callback(self, self, "_animate_show"), callback(self, self, "show_done"), 0.25)
end