local wezterm = require("wezterm")
local BACKGROUND_IMAGE = "30.jpg"
local WSL_HOME = "/home/vladelaina/code/Catime/"

local config = {
	font_size = 20,
	font = wezterm.font("JetBrains Mono"),
	window_decorations = "RESIZE",
	color_scheme = "Catppuccin Mocha",
	text_background_opacity = 0.8,
	window_background_opacity = 0.8,
	use_fancy_tab_bar = false,
	automatically_reload_config = true,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	adjust_window_size_when_changing_font_size = false,
	default_cursor_style = "BlinkingBar",
	window_close_confirmation = "NeverPrompt",
	window_padding = {
		left = 35,
		right = 30,
		top = 20,
		bottom = 20,
	},
	background = {
		{
			source = {
				File = string.format("C:\\Users\\vladelaina\\.config\\wezterm\\images\\%s", BACKGROUND_IMAGE),
			},
			hsb = {
				hue = 1.0,
				saturation = 1.00,
				brightness = 1,
			},
		},
		{
			source = {
				Color = "#282c35",
			},
			width = "100%",
			height = "100%",
			opacity = 0.55,
		},
	},
	default_prog = { "wsl.exe", "--cd", WSL_HOME },
	initial_rows = 30,
	initial_cols = 115,
	keys = {
		-- Split screen
		{ key = "-", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "=", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

		-- Close pane
		{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

		-- Switch between panes
		{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
		{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
		{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
		{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

		-- Resize panes
		{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
		{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
		{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
		{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

		-- New tab (opens in home directory)
		{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },

		-- Switch between tabs
		{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
		{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

		-- Switch to specific tab by number
		{ key = "1", mods = "CTRL", action = wezterm.action.ActivateTab(0) },
		{ key = "2", mods = "CTRL", action = wezterm.action.ActivateTab(1) },
		{ key = "3", mods = "CTRL", action = wezterm.action.ActivateTab(2) },
		{ key = "4", mods = "CTRL", action = wezterm.action.ActivateTab(3) },
		{ key = "5", mods = "CTRL", action = wezterm.action.ActivateTab(4) },
		{ key = "6", mods = "CTRL", action = wezterm.action.ActivateTab(5) },
		{ key = "7", mods = "CTRL", action = wezterm.action.ActivateTab(6) },
		{ key = "8", mods = "CTRL", action = wezterm.action.ActivateTab(7) },
		{ key = "9", mods = "CTRL", action = wezterm.action.ActivateTab(8) },
	},
}

return config
