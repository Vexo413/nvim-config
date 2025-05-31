return {
  "echasnovski/mini.nvim",
  config = function()
    require('mini.icons').setup()
    require('mini.sessions').setup()
    require('mini.pairs').setup()
    -- no other modules enabled
  end,
}
