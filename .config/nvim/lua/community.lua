-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.completion.copilot-cmp" },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     panel = {
  --       keymap = {
  --         jump_prev = "[[",
  --         jump_next = "]]",
  --         accept = "<CR>",
  --         refresh = "gr",
  --         open = "<F6>",
  --       },
  --     },
  --     suggestion = {
  --       auto_trigger = false,
  --       keymap = {
  --         accept_word = false,
  --         accept_line = false,
  --         -- next = "<F9>",
  --         -- prev = "<F7>",
  --         -- dismiss = "<F8>",
  --       },
  --     },
  --   },
  -- },

  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python-ruff" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.terraform" },
  -- { import = "astrocommunity.pack.full-dadbod" },

  { import = "astrocommunity.colorscheme.catppuccin" },

  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.markdown-and-latex.vimtex" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },

  { import = "astrocommunity.scrolling.neoscroll-nvim" },

  -- https://github.com/AstroNvim/AstroNvim/issues/2587
  { import = "astrocommunity.utility.mason-tool-installer-nvim" },
}
