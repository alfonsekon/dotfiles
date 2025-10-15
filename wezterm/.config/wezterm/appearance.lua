local wezterm = require("wezterm")
local act = wezterm.action
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local theme2 = dofile("/home/luis/.dotfiles/wezterm/colors/kanagawa.lua")

local appearance = {}

function appearance.setup_status()
	wezterm.on("update-status", function(window)
		local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

		local color_scheme = window:effective_config().resolved_palette
		local bg = color_scheme.background
		local fg = color_scheme.foreground

		-- window:set_right_status(wezterm.format({
		-- 	{ Background = { Color = "#181820" } }, -- kanagawa
		-- 	{ Foreground = { Color = bg } }, -- kanagawa
		-- 	{ Text = SOLID_LEFT_ARROW },
		-- 	{ Background = { Color = bg } },
		-- 	{ Foreground = { Color = fg } },
		-- 	{ Text = " " .. window:active_workspace() .. " " },
		-- 	{ Background = { Color = bg } },
		-- 	{ Foreground = { Color = "#C8C093" } }, -- kanagawa
		-- 	{ Text = SOLID_LEFT_ARROW },
		-- 	{ Background = { Color = "#C8C093" } }, -- kanagawa
		-- 	{ Foreground = { Color = "#292D3E" } }, -- kanagawa
		-- 	{ Text = " " .. wezterm.strftime("%a %b %-d %H:%M") .. " " },
		-- }))

		window:set_right_status(wezterm.format({
			{ Background = { Color = "#E5C07B" } },
			{ Foreground = { Color = "#A0A8B7" } },
			{ Text = "" },
			{ Background = { Color = "#0B0E14" } },
			{ Foreground = { Color = "#A0A8B7" } },
			{ Text = " " .. window:active_workspace() .. " " },
			{ Background = { Color = "#E5C07B" } },
			{ Foreground = { Color = "#A0A8B7" } },
			{ Text = "" },
			{ Background = { Color = "#0B0E14" } },
			{ Foreground = { Color = "#A0A8B7" } },
			{ Text = " " .. wezterm.strftime("%a %b %-d %H:%M") .. " " },
		}))

		-- test
	end)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local index = tab.tab_index + 1
	local title = tab.tab_title

	if title == nil or title == "" then
		title = tab.active_pane.title
	end

	return " " .. index .. ":" .. title .. " "
end)

wezterm.on("update-right-status", function(window, _)
	local color_scheme = window:effective_config().resolved_palette
	local inactive_tab_bg = "#181820"
	local new_tab_bg = "#C8C093"
	local bg = color_scheme.background
	local fg = color_scheme.foreground
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = inactive_tab_bg } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1F3a3) -- fish
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = inactive_tab_bg } }
	end

	window:set_left_status(wezterm.format({
		{ Background = { Color = inactive_tab_bg } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

-- ayu colors
appearance.colors = {
	background = "#0B0F15",
	tab_bar = {
		background = "#0B0E14", -- Tab bar background
		active_tab = {
			bg_color = "#0B0E14", -- Background of the active tab
			fg_color = "#E5C07B", -- Foreground (text) of the active tab
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#0B0E14", -- Background of inactive tabs
			fg_color = "#A0A8B7", -- Foreground (text) of inactive tabs
		},

		inactive_tab_hover = {
			bg_color = "#0B0E14", -- Background of inactive tab on hover
			fg_color = "#E5C07B",
			italic = true,
		},

		new_tab = {
			bg_color = "#0B0E14",
			fg_color = "#A0A8B7",
		},

		new_tab_hover = {
			bg_color = "#3E4452",
			fg_color = "#E5C07B",
			italic = true,
		},
	},
}
appearance.theme = theme2
appearance.window_decorations = "RESIZE"
appearance.enable_tab_bar = true
appearance.tab_bar_at_bottom = true
appearance.use_fancy_tab_bar = false
appearance.window_background_opacity = 1.00
appearance.font_size = 20.0
appearance.animation_fps = 165
appearance.max_fps = 165
appearance.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", weight = "Regular" },
	{ family = "JetBrains Mono", weight = "Bold" },
	-- { family = "FiraCode", weight = "Regular" },
	-- { family = "FiraCode", weight = "Bold" },
	-- { family = "Monocraft" },
})
appearance.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}
appearance.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 1.0,
	brightness = 1.0,
}

return appearance
