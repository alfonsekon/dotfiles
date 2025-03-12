local wezterm = require("wezterm")
local act = wezterm.action
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local keys = {}

keys.disable_default_key_bindings = false

-- keys.key_tables = {
-- 	copy_mode = {},
-- }

keys.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 2000,
}

keys.binds = {
	-- shortcuts (NO LEADER KEY BINDS)
	{
		key = "w",
		mods = "SUPER",
		action = act.SpawnCommandInNewTab({
			cwd = wezterm.config_file,
			args = { "nvim", wezterm.config_file },
		}),
	},
	{
		key = "b",
		mods = "SUPER",
		action = act.SpawnCommandInNewTab({
			cwd = wezterm.home_dir .. "/.bashrc",
			args = { "nvim", wezterm.home_dir .. "/.bashrc" },
		}),
	},
	{
		key = "i",
		mods = "SUPER",
		action = act.SpawnCommandInNewTab({
			cwd = wezterm.home_dir .. "/.config/i3/config",
			args = { "nvim", wezterm.home_dir .. "/.config/i3/config" },
		}),
	},
	-- scripts
	{ key = "t", mods = "CTRL", action = act.SendString("source ~/scripts/wezterm_sessionizer_ide.sh\n") },
	{ key = "m", mods = "CTRL", action = act.SendString("bash ~/scripts/wezterm_sessionizer_vim.sh\n") },
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = act.SendString("source ~/dotfiles/wezterm/scripts/open_editor.sh\n"),
	},
	{
		key = "m",
		mods = "CTRL|SHIFT",
		action = act.SendString("source ~/dotfiles/wezterm/scripts/open_vim.sh\n"),
	},
	{
		key = "i",
		mods = "CTRL",
		action = act.Multiple({
			act.SendString("wezterm cli set-tab-title $(basename $(pwd))\n"),
			act.SendKey({ key = "l", mods = "CTRL" }),
		}),
	},
	-- copy mode
	{ key = ".", mods = "CTRL", action = act.ActivateCopyMode },
	{ key = ",", mods = "CTRL", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "Backspace", mods = "CTRL", action = act.CopyMode("ClearPattern") },
	-- workspaces
	{ key = ";", mods = "CTRL", action = workspace_switcher.switch_to_prev_workspace() },
	{ key = ":", mods = "CTRL|SHIFT", action = workspace_switcher.switch_workspace() },
	-- { key = "e", mods = "CTRL|SHIFT", action = act({ EmitEvent = "save_session" }) },
	-- { key = "r", mods = "CTRL|SHIFT", action = act({ EmitEvent = "restore_session" }) },
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
	-- tab navigation/creation
	{ key = "p", mods = "CTRL|ALT", action = act.ActivateTabRelativeNoWrap(-1) },
	{ key = "n", mods = "CTRL|ALT", action = act.ActivateTabRelativeNoWrap(1) },
	{ key = "b", mods = "CTRL|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
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

	--STUFF WITH LEADER
	{ key = "a", mods = "LEADER|CTRL", action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "b", mods = "LEADER", action = act.ActivateTabRelativeNoWrap(-1) },
	{ key = "n", mods = "LEADER", action = act.ActivateTabRelativeNoWrap(1) },
	{ key = "1", mods = "LEADER", action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER", action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER", action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER", action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER", action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER", action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER", action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER", action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER", action = act.ActivateTab(8) },
	{ key = "0", mods = "LEADER", action = act.ActivateTab(9) },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	-- scripts
	{ key = "t", mods = "LEADER", action = act.SendString("source ~/scripts/wezterm_sessionizer_ide.sh\n") },
	{ key = "m", mods = "LEADER", action = act.SendString("bash ~/scripts/wezterm_sessionizer_vim.sh\n") },
	{
		key = "t",
		mods = "LEADER|CTRL",
		action = act.SendString("source ~/dotfiles/wezterm/scripts/open_editor.sh\n"),
	},
	{
		key = "m",
		mods = "LEADER|CTRL",
		action = act.SendString("source ~/dotfiles/wezterm/scripts/open_vim.sh\n"),
	},
	-- copy mode
	{ key = ".", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = ",", mods = "LEADER", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "Backspace", mods = "LEADER", action = act.CopyMode("ClearPattern") },
	-- workspaces
	{ key = "w", mods = "LEADER", action = workspace_switcher.switch_to_prev_workspace() },
	{ key = "w", mods = "LEADER|CTRL", action = workspace_switcher.switch_workspace() },
	-- { key = "e", mods = "LEADER|CTRL", action = act({ EmitEvent = "save_session" }) },
	-- { key = "r", mods = "LEADER|CTRL", action = act({ EmitEvent = "restore_session" }) },
	{
		key = "[",
		mods = "LEADER",
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
}

return keys
