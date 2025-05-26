local function directory()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

require("lualine").setup({
    options = {
        theme = "tokyonight",
        section_separators = { left = "", right = "" }, -- rounded block edges
        component_separators = { left = "", right = "" }, -- thinner round edges
    },
    sections = {
        lualine_a = { "mode" },           -- left: mode
        lualine_b = { directory },        -- left: directory
        lualine_c = { "branch", "diff" }, -- left: git
        lualine_x = { "location" },       -- right: diagnostics
        lualine_y = { "diagnostics" },    -- right: location
        lualine_z = {},
    },
})
