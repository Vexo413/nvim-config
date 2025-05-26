require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer" },
    automatic_installation = true,
})

-- THEN configure the server
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    diagnostics = {
        enable = true,
    }
})

lspconfig.lua_ls.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    root_dir = function(fname)
        -- fallback to normal detection
        return util.root_pattern("init.lua", ".git")(fname) or util.path.dirname(fname)
    end,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.diagnostic.config({
    virtual_text = {
        prefix = "●",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN]  = "",
            [vim.diagnostic.severity.INFO]  = "",
            [vim.diagnostic.severity.HINT]  = "",
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
