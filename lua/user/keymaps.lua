local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Alpha
keymap("n", "<leader>a", "<cmd>Alpha<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Close Buffer
keymap("n", "<C-x>", "<cmd>Bdelete!<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>:Git<CR>", opts)
keymap("n", "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", opts)
keymap("n", "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", opts)
keymap("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<CR>", opts)
keymap("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", opts)
keymap("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", opts)
keymap("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", opts)
keymap("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", opts)
keymap("n", "<leader>go", "<cmd>Telescope git_status<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opts)
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
keymap("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", opts)
keymap("n", "<leader>gt", "<cmd>Gitsigns toggle_deleted<CR>", opts)

--  Splits
keymap("n", "<leader>s", ":sp<CR> <C-w>j<CR>", opts)
keymap("n", "<leader>v", ":vsp<CR> <C-w>l<CR>", opts)

keymap("n", "tt", ":tab split<CR>", opts)
keymap("n", "tr", ":tabc<CR>", opts)
keymap("n", "<leader>o", ":on<CR>", opts)

-- Navbar
keymap("n", "<leader>n", ":NvimTreeToggle <CR>", opts) -- Open Navbar

-- Undo Tree
keymap("n", "<leader>u", ":UndotreeToggle <CR>", opts) -- Open Navbar

-- Telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files hidden=true<CR>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)
keymap(
	"n",
	"<leader>b",
	"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
	opts
)
keymap("n", "<leader>c", "<cmd>Telescope colorscheme<CR>", opts)

-- CMP
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

--LSP
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
keymap("n", "<leader>lw", "<cmd>Telescope diagnostics<CR>", opts)
keymap("n", "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    -- h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    -- v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
-- Terminal
keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", opts)
keymap("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", opts)
keymap("n", "<leader>tv", "<cmd>ToggleTerm size=60 direction=vertical<CR>", opts)
keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", opts)
keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", opts)

-- Null-ls
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)

-- Clear Last Search
-- keymap("n", "<CR>", ":noh<CR>", opts)

-- Navigate buffers
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<S-tab>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
