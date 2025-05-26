local map = vim.keymap.set

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

map({ "n", "x" }, "<leader>fm", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "general format file" })

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

--
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })

map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = "List workspace folders" })


-- telescope
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>ff", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
    { desc = "telescope find files" })


-- bufferline

map("n", "<leader>bd", function()
    local cur_buf = vim.api.nvim_get_current_buf()

    -- Try to switch to an alternate buffer first
    local alt = vim.fn.bufnr("#")
    if alt > 0 and vim.api.nvim_buf_is_loaded(alt) then
        vim.cmd("buffer " .. alt)
    else
        -- Otherwise, try to find the next listed buffer
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if buf ~= cur_buf and vim.fn.buflisted(buf) == 1 then
                vim.cmd("buffer " .. buf)
                break
            end
        end
    end

    -- Now delete the old buffer
    vim.cmd("bdelete " .. cur_buf)
end, { desc = "smart close current buffer", silent = true })
map("n", "<leader>bx", "<cmd>bdelete<cr>", { desc = "close current buffer", silent = true })
map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "go to next buffer", silent = true })
map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "go to previous buffer", silent = true })
map("n", "<leader>bc", "<cmd>enew<cr>", { desc = "create empty buffer", silent = true })
map("n", "<leader>bs", "<cmd>w<cr>", { desc = "save current buffer", silent = true })





-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
    vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })
