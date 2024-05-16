-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "rosepine",
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },

  telescope = { style = "borderless" }, -- borderless / bordered

  ------------------------------- nvchad_ui modules -----------------------------
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
    order = nil,
    modules = {
      file = function()
        local config = require("nvconfig").ui.statusline
        local sep_style = config.separator_style

        sep_style = (sep_style ~= "round" and sep_style ~= "block") and "block" or sep_style

        local default_sep_icons = {
          round = { left = "", right = "" },
          block = { left = "█", right = "█" },
        }

        local separators = (type(sep_style) == "table" and sep_style) or default_sep_icons[sep_style]

        local sep_l = separators["left"]
        local sep_r = "%#St_sep_r#" .. separators["right"] .. " %#ST_EmptySpace#"

        local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
          return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_r
        end

        local stbufnr = function()
          return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        end

        local icon = "󰈚"
        local path = vim.api.nvim_buf_get_name(stbufnr())
        local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"

        if vim.bo.modified then
          name = "*" .. name
        end

        if name ~= "Empty " then
          local devicons_present, devicons = pcall(require, "nvim-web-devicons")

          if devicons_present then
            local ft_icon = devicons.get_icon(name)
            icon = (ft_icon ~= nil and ft_icon) or icon
          end
        end

        return gen_block(icon, name, "%#St_file_sep#", "%#St_file_bg#", "%#St_file_txt#")
      end,
    },
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = false,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },

  nvdash = {
    load_on_startup = false,

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = { theme = "grid" }, -- simple/grid

  lsp = { signature = true },

  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.3, vsp = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },
}

return M
