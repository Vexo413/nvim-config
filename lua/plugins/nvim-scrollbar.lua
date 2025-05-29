return {
  "petertriho/nvim-scrollbar",
  event = "VeryLazy",
  config = function()
    local colors = require("tokyonight.colors").setup()

    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight, -- scrollbar handle
      },
      marks = {
        Search = { color = colors.orange },
        Error  = { color = colors.error },
        Warn   = { color = colors.warning },
        Info   = { color = colors.info },
        Hint   = { color = colors.hint },
        Misc   = { color = colors.purple },
      },
    })

    -- Enable optional handlers
    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar.handlers.search").setup()
    require("scrollbar.handlers.diagnostic").setup()
  end,
}
