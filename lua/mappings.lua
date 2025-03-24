-- Diagnostic keymaps
vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, { desc = "Send diagnostics to loclist" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Remap movement keys
-- Map j to left, k to up, l to down, ; to right
vim.keymap.set({'n', 'v'}, 'j', 'h')
vim.keymap.set({'n', 'v'}, 'k', 'k')
vim.keymap.set({'n', 'v'}, 'l', 'j')
vim.keymap.set({'n', 'v'}, ';', 'l')

-- Switch windows
vim.keymap.set({'n', 'v'}, '<A-j>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({'n', 'v'}, '<A-;>', '<C-w><C-l>', { desc = 'Move focus to the right window' })

-- Scrolling up/down
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-y>')
vim.keymap.set({'n', 'v'}, '<C-y>', '<Nop>')

vim.keymap.set({'n', 'v'}, 'K', '<C-u>')
vim.keymap.set({'n', 'v'}, '<C-u>', '<Nop>')

vim.keymap.set({'n', 'v'}, '<C-l>', '<C-e>')
vim.keymap.set({'n', 'v'}, '<C-e>', '<Nop>')

vim.keymap.set({'n', 'v'}, 'L', '<C-d>')

-- Duplicate line in the next line
vim.keymap.set('n', '<C-d>', ':copy .<CR>')

-- Moving lines up and down
-- Move line up with Alt-k
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Move line down with Alt-l
vim.keymap.set('n', '<A-l>', ':m .+1<CR>==')
vim.keymap.set('i', '<A-l>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('v', '<A-l>', ":m '>+1<CR>gv=gv")

-- Disable
vim.keymap.set("n", "<C-q>", "<cmd>close<CR>", { desc = "Close current window" })

-- Disable arrow keys in normal mode
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>')
vim.keymap.set({'n', 'v'}, '<BS>', '<Nop>')

-- Occurrence of character in line
vim.keymap.set({'n', 'v'}, "'", ';')
vim.keymap.set({'n', 'v'}, '"', ',')

-- Paste without overwriting
vim.keymap.set('v', 'p', 'P')

-- Redo
vim.keymap.set('n', 'U', '<C-r>')
vim.keymap.set('n', '<C-r>', '<Nop>')

-- Better indent
vim.keymap.set('v', '<', '<<')
vim.keymap.set('v', '>', '>>')
