local wezterm = require("wezterm")
local act = wezterm.action
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local theme2 = dofile("/home/luis/dotfiles/wezterm/colors/kanagawa.lua")

local appearance = {}

appearance.theme = theme2
appearance.window_decorations = "RESIZE"
appearance.enable_tab_bar = true
appearance.tab_bar_at_bottom = true
appearance.use_fancy_tab_bar = false
appearance.window_background_opacity = 0.95
appearance.font_size = 22.0
appearance.animation_fps = 120
appearance.max_fps = 120
appearance.font = wezterm.font_with_fallback({
	{ family = "FiraCode", weight = "Regular" },
	{ family = "FiraCode", weight = "Bold" },
})
appearance.window_padding = {
	left = 20,
	right = 20,
	top = 20,
	bottom = 20,
}
appearance.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.0,
}

function setup_appearance()
	return appearance
end

return appearance
