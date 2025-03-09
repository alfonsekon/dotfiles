local wezterm = require("wezterm")
local act = wezterm.action
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local session_manager = dofile("/home/luis/.config/wezterm/wezterm-session-manager/session-manager.lua")
-- local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")
-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local theme2 = dofile("/home/luis/dotfiles/wezterm/colors/kanagawa.lua")

wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

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
	leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseonds = 2000,
	},
	unix_domains = {
		{ name = "unix" },
	},
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
	-- color_scheme = "Kanagawa (Gogh)",
	-- colors = theme.colors(), -- rose-pine
	colors = theme2,
	enable_tab_bar = true,
	tab_bar_at_bottom = true,
	use_fancy_tab_bar = false,
	set_environment_variables = {},
	animation_fps = 120,
	max_fps = 120,
	front_end = "WebGpu",
	-- key_tables = {
	-- 	copy_mode = {
	-- 		{ key = "/", mods = "NONE", action = act.Search("CurrentSelectionOrEmptyString") },
	-- 	},
	-- },
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

		-- scripts
		{ key = "t", mods = "CTRL", action = act.SendString("source ~/scripts/wezterm_sessionizer_ide.sh\n") },
		{ key = "m", mods = "CTRL", action = act.SendString("bash ~/scripts/wezterm_sessionizer_vim.sh\n") },
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SendString("source ~/dotfiles/wezterm/scripts/open_editor.sh\nclear\n"),
		},
		{
			key = "m",
			mods = "CTRL|SHIFT",
			action = act.SendString("source ~/dotfiles/wezterm/scripts/open_vim.sh\nclear\n"),
		},
		{ key = "i", mods = "CTRL", action = act.SendString("wezterm cli set-tab-title $(basename $(pwd))\n") },
		-- tab navigation/creation
		{ key = "p", mods = "CTRL|ALT", action = act.ActivateTabRelativeNoWrap(-1) },
		{ key = "n", mods = "CTRL|ALT", action = act.ActivateTabRelativeNoWrap(1) },
		{ key = "b", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
		-- copy mode
		{ key = ".", mods = "CTRL", action = act.ActivateCopyMode },
		{ key = ",", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
		{ key = "Backspace", mods = "CTRL", action = act.CopyMode("ClearPattern") },
		-- workspaces
		{ key = ";", mods = "CTRL", action = workspace_switcher.switch_to_prev_workspace() },
		{ key = ":", mods = "CTRL|SHIFT", action = workspace_switcher.switch_workspace() },
		{ key = "e", mods = "CTRL|SHIFT", action = act({ EmitEvent = "save_session" }) },
		{ key = "r", mods = "CTRL|SHIFT", action = act({ EmitEvent = "restore_session" }) },
		{
			key = "[",
			mods = "CTRL",
			action = act.PromptInputLine({
				description = wezterm.format({
					{ Attribute = { Intensity = "Bold" } },
					{ Foreground = { AnsiColor = "Fuchsia" } },
					{ Text = "Enter name for new workspace" },
				}),
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:perform_action(
							act.SwitchToWorkspace({
								name = line,
							}),
							pane
						)
					end
				end),
			}),
		},
		-- testing plugins right now
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

workspace_switcher.apply_to_config(config)

return config
