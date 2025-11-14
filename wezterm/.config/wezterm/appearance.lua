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
			{ Background = { Color = "#1d2021" } }, -- main background
			{ Foreground = { Color = "#ebdbb2" } }, -- main text
			{ Text = "" },
			{ Background = { Color = "#1d2021" } }, -- workspace background
			{ Foreground = { Color = "#458588" } }, -- workspace highlight
			{ Text = " " .. window:active_workspace() .. " " },
			{ Background = { Color = "#1d2021" } }, -- second background accent
			{ Foreground = { Color = "#ebdbb2" } },
			{ Text = "" },
			{ Background = { Color = "#1d2021" } }, -- datetime background
			{ Foreground = { Color = "#fabd2f" } }, -- datetime accent
			{ Text = " " .. wezterm.strftime("%a %b %-d %H:%M") .. " " },
		}))
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
	foreground = "#ebdbb2",
	background = "#1d2021",

	cursor_bg = "#ebdbb2",
	cursor_fg = "#1d2021",
	cursor_border = "#ebdbb2",

	ansi = {
		"#3c3836", -- black
		"#cc241d", -- red
		"#98971a", -- green
		"#d79921", -- yellow
		"#458588", -- blue
		"#b16286", -- magenta
		"#689d6a", -- cyan
		"#a89984", -- white
	},

	brights = {
		"#928374", -- bright black
		"#fb4934", -- bright red
		"#b8bb26", -- bright green
		"#fabd2f", -- bright yellow
		"#83a598", -- bright blue
		"#d3869b", -- bright magenta
		"#8ec07c", -- bright cyan
		"#ebdbb2", -- bright white
	},

	tab_bar = {
		background = "#1d2021",

		active_tab = {
			bg_color = "#3c3836",
			fg_color = "#ebdbb2",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#1d2021",
			fg_color = "#a89984",
		},

		inactive_tab_hover = {
			bg_color = "#3c3836",
			fg_color = "#ebdbb2",
			italic = true,
		},

		new_tab = {
			bg_color = "#1d2021",
			fg_color = "#a89984",
		},

		new_tab_hover = {
			bg_color = "#3c3836",
			fg_color = "#ebdbb2",
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
