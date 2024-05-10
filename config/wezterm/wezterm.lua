local wezterm = require("wezterm")


return {


  hide_tab_bar_if_only_one_tab  = true,
  
  -- Font
  font = wezterm.font {
    family = 'Jetbrains Mono',
  },
  hyperlink_rules = {
      -- Matches: a URL in parens: (URL)
      {
         regex = '\\((\\w+://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
         regex = '\\[(\\w+://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
         regex = '\\{(\\w+://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '<(\\w+://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      {
         regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
   },
  
  initial_cols = 80,
  initial_rows = 17,
  -- Font size
  
  font_size = 30.0,

  animation_fps = 30,
  window_background_opacity = 0.9,
  scrollback_lines = 3000,
  enable_scroll_bar = true,
  default_workspace = "main",
  -- Tab Colors
  use_fancy_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  tab_max_width = 30,
  tab_bar_at_bottom = true,
  default_cursor_style = 'BlinkingUnderline',
  text_blink_rate = 100,
  use_cap_height_to_scale_fallback_fonts = false,

  disable_default_key_bindings = true,


  colors = {
    indexed = { [16] = "#ecd3a0", [17] = "#cbced3" },

    scrollbar_thumb = "#020202",
    split = "#151720",


    tab_bar = {
      background = "#020202",
      active_tab = {
        bg_color = "#151720",
        fg_color = "#8baff1"
      },
      inactive_tab = {
        bg_color = "#151720",
        fg_color = "#d0d3d8"
      },
      inactive_tab_hover = {
        bg_color = "#1c1e27",
        fg_color = "#d0d3d8"
      },
      new_tab = {
        bg_color = "#151720",
        fg_color = "#d0d3d8"
      },
      new_tab_hover = {
        bg_color = "#1c1e27",
        fg_color = "#d0d3d8",
        italic = true
      },
    },


    visual_bell = "#1c1e27",

    -- nightbuild only
    compose_cursor = "#ecd3a0",

    -- Theme Colors (Decay)
    foreground = "#b6beca",
    background = "#020202",
    cursor_bg = "#cbced3",
    cursor_border = "#d0d3d8",
    cursor_fg = "#151720",
    selection_bg = "#575268",
    selection_fg = "#D9E0EE",

    ansi = { "#1c252c", "#dd6777", "#90ceaa", "#ecd3a0", "#86aaec", "#c296eb", "#93cee9", "#cbced3" },
    brights = { "#1c1e27", "#e26c7c", "#95d3af", "#f1d8a5", "#8baff1", "#c79bf0", "#89d3ee", "#d0d3d8" },
  },

  keys = {

    {
      key = '-',
      mods = 'CTRL',
      action = wezterm.action.DecreaseFontSize,
    },  
    {
      key = '=',
      mods = 'CTRL',
      action = wezterm.action.IncreaseFontSize,
    },  
    {
      key = 'C',
      mods = 'CTRL',
      action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
    },   
    { 
      key = 'V', 
      mods = 'CTRL', 
      action = wezterm.action.PasteFrom 'Clipboard' 
    },
    {
      key = 'q',
      mods = 'CTRL',
      action = wezterm.action.QuitApplication ,
      -- action = wezterm.action.CloseCurrentPane { confirm = false },

    },
    {
      key = 'd',
      mods = 'CTRL',
      action = wezterm.action.CloseCurrentTab { confirm = false },
    },  
    {
      key = 'n',
      mods = 'CTRL',
      action = wezterm.action.SpawnTab 'DefaultDomain'
    }, 
    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivateTabRelative(-1)
    }, 
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.ActivateTabRelative(1)
    },
  },
  

}

