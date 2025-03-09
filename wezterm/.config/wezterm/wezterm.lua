local wezterm = require("wezterm")
local keybinds = require("keybinds")
local appearance = require("appearance")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local session_manager = dofile("/home/luis/.config/wezterm/wezterm-session-manager/session-manager.lua")
local colors = dofile("/home/luis/dotfiles/wezterm/colors/kanagawa.lua")

appearance.setup_status()

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
	keys = keybinds.binds,
	key_tables = keybinds.key_tables,
	leader = keybinds.leader,
	disable_default_key_bindings = false,
	unix_domains = {
		{ name = "unix" },
	},
	audible_bell = "Disabled",
	check_for_updates = false,
	window_padding = appearance.window_padding,
	inactive_pane_hsb = appearance.inactive_pane_hsb,
	font = appearance.font,
	font_size = appearance.font_size,
	colors = appearance.theme,
	window_decorations = appearance.window_decorations,
	window_background_opacity = appearance.window_background_opacity,
	tab_bar_at_bottom = appearance.tab_bar_at_bottom,
	use_fancy_tab_bar = appearance.use_fancy_tab_bar,
	animation_fps = appearance.animation_fps,
	max_fps = appearance.max_fps,
	front_end = "WebGpu",
	launch_menu = {},
	set_environment_variables = {
		PATH = "/usr/local/bin:/usr/bin:/bin:/opt/nvim-linux-x86_64/bin:" .. os.getenv("PATH"),
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
