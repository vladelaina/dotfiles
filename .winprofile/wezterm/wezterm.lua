local wezterm = require("wezterm")
local BACKGROUND_IMAGE = "23.jpg"
local WSL_HOME = "/home/vladelaina/"

-- Greek numerals for tab titles
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local greek_numerals = { "Ⅰ", "Ⅱ", "Ⅲ", "Ⅳ", "Ⅴ", "Ⅵ", "Ⅶ", "Ⅷ", "Ⅸ", "Ⅹ" }
	local title = greek_numerals[tab.tab_index + 1] or tostring(tab.tab_index + 1)
	return {
		{ Text = " " .. title .. " " },
	}
end)

-- Start maximized
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = {
	font_size = 20,
	font = wezterm.font("JetBrains Mono"),
	window_decorations = "RESIZE",
	color_scheme = "Catppuccin Mocha",
	text_background_opacity = 0.8,
	window_background_opacity = 0.8,
	-- Reduce GPU memory usage
	front_end = "WebGpu",
	webgpu_power_preference = "LowPower",
	animation_fps = 1,
	max_fps = 60,
	scrollback_lines = 5000,
	-- Additional optimizations
	enable_kitty_graphics = false,
	enable_wayland = false,
	use_fancy_tab_bar = false,
	automatically_reload_config = true,
	hide_tab_bar_if_only_one_tab = true,
	show_new_tab_button_in_tab_bar = false,
	adjust_window_size_when_changing_font_size = false,
	default_cursor_style = "BlinkingBar",
	window_close_confirmation = "NeverPrompt",
	enable_scroll_bar = true,
	min_scroll_bar_height = "2cell",
	window_padding = {
		left = 35,
		right = 8,
		top = 20,
		bottom = 20,
	},
	background = {
		{
			source = {
				File = string.format("C:\\Users\\vladelaina\\.config\\wezterm\\images\\%s", BACKGROUND_IMAGE),
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
	native_macos_fullscreen_mode = false,
	colors = {
		tab_bar = {
			background = "rgba(0, 0, 0, 0)",
			active_tab = {
				bg_color = "rgba(0, 0, 0, 0)",
				fg_color = "#cdd6f4",
			},
			inactive_tab = {
				bg_color = "rgba(0, 0, 0, 0)",
				fg_color = "#6c7086",
			},
			inactive_tab_hover = {
				bg_color = "rgba(0, 0, 0, 0.1)",
				fg_color = "#cdd6f4",
			},
			new_tab = {
				bg_color = "rgba(0, 0, 0, 0)",
				fg_color = "#6c7086",
			},
			new_tab_hover = {
				bg_color = "rgba(0, 0, 0, 0.1)",
				fg_color = "#cdd6f4",
			},
		},
	},
	keys = {
		-- Paste with Ctrl+V
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "c", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },

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
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = wezterm.action.SpawnCommandInNewTab({
				args = { "wsl.exe", "--cd", "/home/vladelaina/" },
			}),
		},

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
