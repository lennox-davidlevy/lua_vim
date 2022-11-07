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

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Close Buffer
keymap("n", "<C-x>", "<cmd>Bdelete!<CR>", opts)

-- Git
keymap("n", "<C-g>", "<cmd>:Git<CR>", opts)

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
keymap(
	"n",
	"<C-p>",
	-- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
	-- "<cmd>lua require('telescope.builtin').git_files(require('telescope.themes'))<CR>",
	-- "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes'))<CR>",
  "<cmd>Telescope find_files hidden=true<CR>",
	opts
)
-- keymap("n", "<C-f>", "<cmd>Telescope live_grep theme=ivy<cr>", opts)
keymap("n", "<C-f>", "<cmd>Telescope live_grep<CR>", opts)

-- Null-ls
keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", opts)

-- Clear Last Search
keymap("n", "<CR>", ":noh<CR>", opts)

-- Navigate buffers
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "<S-tab>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
