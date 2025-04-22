local wezterm = require("wezterm")
local BACKGROUND_IMAGE = "28.jpg"
local WSL_HOME = "/home/vladelaina/code/Catime/"

local config = {
	font_size = 20,
	font = wezterm.font("JetBrainsMono Nerd Font"),
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
		{ key = "\\", mods = "CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "-", mods = "CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "q", mods = "CTRL", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
		{ key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("DefaultDomain") },
		{ key = "n", mods = "CTRL", action = wezterm.action.SpawnWindow },
		{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Next") },
		{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Prev") },
	},
}

return config
