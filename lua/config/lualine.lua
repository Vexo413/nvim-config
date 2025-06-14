local function directory()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

require("lualine").setup({
    options = {
        theme = "tokyonight",
        component_separators = '',
        section_separators = { left = '', right = '' },
        globalstatus = true,
        -- disabled_filetypes = { "neo-tree" }, -- disables it for neo-tree
    },

    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { directory, "filename", "filetype" },
        lualine_c = {
            {
                require("noice").api.status.message.get_hl,
                cond = require("noice").api.status.message.has,
            },
        },
        lualine_x = { "lsp_progress", "diagnostics" },
        lualine_y = { "diff", "branch" },
        lualine_z = {
            "progress",
            { "location", separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
})
