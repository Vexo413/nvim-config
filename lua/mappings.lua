require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>cf", function()
    require("conform").format();
end, { desc = "Format current buffer" })

map({ "n" }, "<C-h>", "<cmd> TmuxNavigateLeft<cr>", { desc = "window left" })
map({ "n" }, "<C-l>", "<cmd> TmuxNavigateRight<cr>", { desc = "window right" })
map({ "n" }, "<C-j>", "<cmd> TmuxNavigateDown<cr>", { desc = "window down" })
map({ "n" }, "<C-k>", "<cmd> TmuxNavigateUp<cr>", { desc = "window up" })
map({ "n" }, "<leader>gd", "<cmd> Nvdash<cr>", { desc = "go to dashboard" })
map({ "x" }, "<leader>cc", "<cmd> CodeSnap<cr>", { desc = "Save selected code snapshot into clipboard" })
map({ "x" }, "<leader>cs", "<cmd> CodeSnapSave<cr>", { desc = "Save selected code snapshot in ~/Pictures" })


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
