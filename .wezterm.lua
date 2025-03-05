local wezterm = require("wezterm")
local act = wezterm.action
local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main

local function file_exists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

local config = {
	audible_bell = "Disabled",
	check_for_updates = false,
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	-- font = wezterm.font("FiraCode"),
	font = wezterm.font_with_fallback({
		{ family = "FiraCode", weight = "Regular" },
		{ family = "FiraCode", weight = "Bold" },
	}),
	font_size = 22.0,
	launch_menu = {},
	-- leader = { key="a", mods="CTRL" },
	window_decorations = "RESIZE",
	window_background_opacity = 0.95,
	disable_default_key_bindings = false,
	-- color_scheme = "rose-pine",
	colors = theme.colors(), -- rose-pine
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	set_environment_variables = {},
	animation_fps = 120,
	max_fps = 120,
	front_end = "WebGpu",
	key_tables = {
		copy_mode = {
			{ key = "/", mods = "NONE", action = act.Search("CurrentSelectionOrEmptyString") },
		},
	},
	keys = {
		{ key = "1", mods = "CTRL", action = act.ActivateTab(0) },
		{ key = "2", mods = "CTRL", action = act.ActivateTab(1) },
		{ key = "3", mods = "CTRL", action = act.ActivateTab(2) },
		{ key = "4", mods = "CTRL", action = act.ActivateTab(3) },
		{ key = "5", mods = "CTRL", action = act.ActivateTab(4) },
		{ key = "6", mods = "CTRL", action = act.ActivateTab(5) },
		{ key = "7", mods = "CTRL", action = act.ActivateTab(6) },
		{ key = "8", mods = "CTRL", action = act.ActivateTab(7) },
		{ key = "9", mods = "CTRL", action = act.ActivateTab(8) },
		{ key = "0", mods = "CTRL", action = act.ActivateTab(9) },
		{
			key = "Backspace",
			mods = "CTRL",
			action = act.CopyMode("ClearPattern"),
		},
		{
			key = "t",
			mods = "CTRL",
			action = act.SendString("source ~/scripts/wezterm_sessionizer_ide.sh\n"),
		},
		{
			key = "m",
			mods = "CTRL",
			action = act.SendString("bash ~/scripts/wezterm_sessionizer_vim.sh\n"),
		},
		{
			key = "i",
			mods = "CTRL",
			action = act.SendString("wezterm cli set-tab-title $(basename $(pwd))\n"),
		},
		{
			key = ".",
			mods = "CTRL",
			action = act.ActivateCopyMode,
		},
		{
			key = ",",
			mods = "CTRL",
			action = act.Search("CurrentSelectionOrEmptyString"),
		},
	},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- config.front_end = "Software" -- OpenGL doesn't work quite well with RDP.
	-- config.term = "" -- Set to empty so FZF works on windows
	table.insert(config.launch_menu, { label = "PowerShell", args = { "powershell.exe", "-NoLogo" } })

	-- Find installed visual studio version(s) and add their compilation
	-- environment command prompts to the menu
	for _, vsvers in ipairs(wezterm.glob("Microsoft Visual Studio/20*", "C:/Program Files (x86)")) do
		local year = vsvers:gsub("Microsoft Visual Studio/", "")
		table.insert(config.launch_menu, {
			label = "x64 Native Tools VS " .. year,
			args = {
				"cmd.exe",
				"/k",
				"C:/Program Files (x86)/" .. vsvers .. "/BuildTools/VC/Auxiliary/Build/vcvars64.bat",
			},
		})
	end
else
	local fish_bin_path = "/bin/fish"
	if file_exists("/opt/homebrew/bin/fish") then
		fish_bin_path = "/opt/homebrew/bin/fish"
		config.default_prog = { "/opt/homebrew/bin/fish", "-l" }
	else
		config.default_prog = { "/bin/bash", "-l" }
	end
	table.insert(config.launch_menu, { label = "fish", args = { fish_bin_path, "-l" } })
	table.insert(config.launch_menu, { label = "bash", args = { "bash", "-l" } })
end

return config
