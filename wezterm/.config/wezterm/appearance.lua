local wezterm = require("wezterm")
local act = wezterm.action
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local theme2 = dofile("/home/luis/dotfiles/wezterm/colors/kanagawa.lua")

local appearance = {}

function appearance.setup_status()
	wezterm.on("update-status", function(window)
		local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

		local color_scheme = window:effective_config().resolved_palette
		local bg = color_scheme.background
		local fg = color_scheme.foreground

		window:set_right_status(wezterm.format({
			{ Background = { Color = "#181820" } },
			{ Foreground = { Color = bg } },
			{ Text = SOLID_LEFT_ARROW },
			{ Background = { Color = bg } },
			{ Foreground = { Color = fg } },
			{ Text = " " .. window:active_workspace() .. " " },
			{ Background = { Color = "#181820" } },
			{ Foreground = { Color = "#C8C093" } },
			{ Text = SOLID_LEFT_ARROW },
			{ Background = { Color = "#C8C093" } },
			{ Foreground = { Color = "#292D3E" } },
			{ Text = " " .. wezterm.strftime("%a %b %-d %H:%M") .. " " },
		}))
	end)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local index = tab.tab_index + 1
	local pane = tab.active_pane
	local title = pane.title
	return " " .. index .. ":" .. title .. " "
end)

appearance.theme = theme2
appearance.window_decorations = "RESIZE"
appearance.enable_tab_bar = true
appearance.tab_bar_at_bottom = true
appearance.use_fancy_tab_bar = false
appearance.window_background_opacity = 0.95
appearance.font_size = 20.0
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

return appearance
