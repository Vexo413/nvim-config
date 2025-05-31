local map = vim.keymap.set

-- file explorer
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "neotree focus window" })

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
map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
map("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })


-- telescope
map("n", "<leader>fs", function() Snacks.picker.smart() end, { desc = "smart find" })
map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "file find" })
map("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "grep find" })
map("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "buffer find" })
map("n", "<leader>fm", function() Snacks.picker.marks() end, { desc = "mark find" })


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

-- Save session (default name)
map("n", "<leader>ss", function()
  require("mini.sessions").write()
end, { desc = "Session: Save current session" })

-- Load last session
map("n", "<leader>sl", function()
  require("mini.sessions").read()
end, { desc = "Session: Load last session" })

-- Delete current session
map("n", "<leader>sd", function()
  require("mini.sessions").delete()
end, { desc = "Session: Delete current session" })

-- List saved sessions
map("n", "<leader>si", function()
  local sessions = require("mini.sessions").list()
  vim.notify("Sessions:\n" .. table.concat(sessions, "\n"))
end, { desc = "Session: List saved sessions" })

-- Save session with prompt for name
map("n", "<leader>sp", function()
  vim.ui.input({ prompt = "Session name: " }, function(input)
    if input and #input > 0 then
      require("mini.sessions").write(input)
      vim.notify("Saved session: " .. input)
    else
      vim.notify("Session save cancelled", vim.log.levels.WARN)
    end
  end)
end, { desc = "Session: Save session with prompt" })
