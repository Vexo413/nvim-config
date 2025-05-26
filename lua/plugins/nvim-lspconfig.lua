-- plugins/lsp.lua or similar
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" }, -- loads before file is fully opened
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        require("config.nvim-lspconfig")
    end
}
