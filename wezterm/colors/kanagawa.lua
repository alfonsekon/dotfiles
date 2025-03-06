return {
	foreground = "#BFC7D5",
	background = "#1F1F28",

	cursor_bg = "#BFC7D5",
	cursor_fg = "#292D3E",
	cursor_border = "#BFC7D5",

	selection_fg = "#5F5F68", -- Dark text
	selection_bg = "#989063",

	scrollbar_thumb = "#676E95",
	split = "#676E95",

	ansi = {
		"#292D3E", -- Black (Host)
		"#F07178", -- Red (Syntax string)
		"#62DE84", -- Green (Command)
		"#FFCB6B", -- Yellow (Command second)
		"#75A1FF", -- Blue (Path)
		"#F580FF", -- Magenta (Syntax var)
		"#60BAEC", -- Cyan (Prompt)
		"#ABB2BF", -- White
	},

	brights = {
		"#959DCB", -- Bright Black
		"#F07178", -- Bright Red (Command error)
		"#C3E88D", -- Bright Green (Exec)
		"#FF5572", -- Bright Yellow
		"#82AAFF", -- Bright Blue (Folder)
		"#FFCB6B", -- Bright Magenta
		"#676E95", -- Bright Cyan
		"#FFFEFE", -- Bright White
	},

	tab_bar = {
		background = "#181820",

		active_tab = {
			bg_color = "#363646",
			fg_color = "#8F97A5",
		},

		inactive_tab = {
			bg_color = "#181820",
			fg_color = "#C8C093",
		},

		inactive_tab_hover = {
			bg_color = "#A8A073",
			fg_color = "#292D3E",
			italic = true,
		},

		new_tab = {
			bg_color = "#C8C093",
			fg_color = "#292D3E",
		},

		new_tab_hover = {
			bg_color = "#D8D0A3",
			fg_color = "#292D3E",
			italic = false,
		},
	},
}
