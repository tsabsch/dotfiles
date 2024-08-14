-- Import the wezterm module
local wezterm = require("wezterm")
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)

-- Pick a colour scheme. WezTerm ships with more than 1,000!
-- Find them here: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = "catppuccin-mocha"

-- Choose your favourite font, make sure it's installed on your machine
config.font = wezterm.font({ family = "Fira Code" })
config.font_size = 12

-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
-- Sets the font for the window frame (tab bar)
config.window_frame = {
	-- Berkeley Mono for me again, though an idea could be to try a
	-- serif font here instead of monospace for a nicer look?
	font = wezterm.font({ family = "Fira Code", weight = "Bold" }),
	font_size = 12,
}

-- wezterm.on("update-status", function(window)
-- 	-- Grab the utf8 character for the "powerline" left facing
-- 	-- solid arrow.
-- 	local SOLID_LEFT_ARROW = utf8.char(0xe0b2)
--
-- 	-- Grab the current window's configuration, and from it the
-- 	-- palette (this is the combination of your chosen colour scheme
-- 	-- including any overrides).
-- 	local color_scheme = window:effective_config().resolved_palette
-- 	local bg = color_scheme.background
-- 	local fg = color_scheme.foreground
--
-- 	window:set_right_status(wezterm.format({
-- 		-- First, we draw the arrow...
-- 		{ Background = { Color = "none" } },
-- 		{ Foreground = { Color = bg } },
-- 		{ Text = SOLID_LEFT_ARROW },
-- 		-- Then we draw our text
-- 		{ Background = { Color = bg } },
-- 		{ Foreground = { Color = fg } },
-- 		{ Text = " " .. wezterm.hostname() .. " " },
-- 	}))
-- end)

local function move_pane(key, direction)
	return {
		key = key,
		mods = "CTRL",
		action = wezterm.action.ActivatePaneDirection(direction),
	}
end

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
-- Table mapping keypresses to actions
config.keys = {
	move_pane("j", "Down"),
	move_pane("k", "Up"),
	move_pane("h", "Left"),
	move_pane("l", "Right"),

	-- Sends ESC + b and ESC + f sequence, which is used
	-- for telling your shell to jump back/forward.
	{ mods = "OPT", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) },

	-- split panes
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	-- show the pane selection mode, but have it swap the active and selected panes
	{
		mods = "LEADER",
		key = "0",
		action = wezterm.action.PaneSelect({
			mode = "SwapWithActive",
		}),
	},
}

-- smart-splits.nvim integration
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
smart_splits.apply_to_config(config)

-- Returns our config to be evaluated. We must always do this at the bottom of this file
return config
