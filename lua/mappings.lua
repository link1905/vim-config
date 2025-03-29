-- Diagnostic keymaps
vim.keymap.set("n", "<leader>l", vim.diagnostic.setloclist, { desc = "Send diagnostics to loclist" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Save
vim.keymap.set('n', '<leader>s', '<cmd>w<CR>', { desc = "Save file" })

-- Remap movement keys
vim.keymap.set({'n', 'v'}, 'a', 'h')
vim.keymap.set({'n', 'v'}, 'd', 'l', { noremap = true, nowait = true })
vim.keymap.set({'n', 'v'}, 'w', 'k')
vim.keymap.set({'n', 'v'}, 's', 'j')

-- Scrolling up/down
vim.keymap.set({'n', 'v'}, '<C-w>', '<C-y>')
vim.keymap.set({'n', 'v'}, 'W', '<C-u>')
vim.keymap.set({'n', 'v'}, '<C-s>', '<C-e>')
vim.keymap.set({'n', 'v'}, 'S', '<C-d>')

-- Switch windows
vim.keymap.set({'n', 'v'}, '<C-a>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set({'n', 'v'}, '<C-d>', '<C-w><C-l>', { desc = 'Move focus to the right window' })


-- Duplicate line in the next line
vim.keymap.set('n', '<C-o>', ':copy .<CR>')

-- Moving lines up and down
-- Move line up with Alt-k
vim.keymap.set('n', '<A-w>', ':m .-2<CR>==')
vim.keymap.set('i', '<A-w>', '<Esc>:m .-2<CR>==gi')
vim.keymap.set('v', '<A-w>', ":m '<-2<CR>gv=gv")

-- Move between words
vim.keymap.set({'n', 'v'}, 'k', 'w')
vim.keymap.set({'n', 'v'}, 'l', 'e')
vim.keymap.set({'n', 'v'}, 'h', '^')
vim.keymap.set({'n', 'v'}, 'H', '$')
vim.keymap.set({'n', 'v'}, 'j', 'b')
vim.keymap.set({'n', 'v'}, ';', '%')

-- Jump cursor
vim.keymap.set({'n', 'v'}, '<C-j>', '<C-i>')
vim.keymap.set({'n', 'v'}, '<C-k>', '<C-o>')


-- Insert modes
vim.keymap.set({'n', 'v'}, 'X', 'd')
vim.keymap.set({'n', 'v'}, 'p', 'r')
vim.keymap.set({'n', 'v'}, 'P', 's')
vim.keymap.set({'n', 'v'}, 'u', 'a')
vim.keymap.set({'n', 'v'}, 'U', 'A')

-- Move line down with Alt-l
vim.keymap.set('n', '<A-s>', ':m .+1<CR>==')
vim.keymap.set('i', '<A-s>', '<Esc>:m .+1<CR>==gi')
vim.keymap.set('v', '<A-s>', ":m '>+1<CR>gv=gv")

-- Disable
vim.keymap.set("n", "<C-q>", "<cmd>close<CR>", { desc = "Close current window" })

-- Disable arrow keys in normal mode
vim.keymap.set({'n', 'v', 'i'}, '<Up>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Down>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Left>', '<Nop>')
vim.keymap.set({'n', 'v', 'i'}, '<Right>', '<Nop>')
vim.keymap.set({'n', 'v'}, '<BS>', '<Nop>')

-- Occurrence of character in line
vim.keymap.set({'n', 'v'}, "m", ';')
vim.keymap.set({'n', 'v'}, 'M', ',')

-- Paste
vim.keymap.set({'n', 'v'}, '<C-c>', 'y')
vim.keymap.set({'n', 'v'}, '<C-c><C-c>', 'yy')
vim.keymap.set({'n', 'v'}, '<C-v>', 'p')
vim.keymap.set({'n', 'v'}, '<C-x>', 'dd')
vim.keymap.set({'n', 'v'}, 'V', 'P')

-- Redo
vim.keymap.set('n', 'Z', '<C-r>')
vim.keymap.set('n', '<C-z>', 'u')

-- Better indent
vim.keymap.set('v', '<', '<<')
vim.keymap.set('v', '>', '>>')
