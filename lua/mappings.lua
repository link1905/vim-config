local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove highlight on search
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Black hole register
keymap('n', '\\', '"_')

-- Paste without overwriting
keymap('x', 'p', '"_dP')
-- History commands
keymap('c', '<C-j>', '<Down>')
keymap('c', '<C-k>', '<Up>')

-- Editor actions
keymap("n", "U", "<C-r>", opts)
-- Jump to problems
keymap("n", "[e", "<cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>", opts)
keymap("n", "]e", "<cmd>lua require('vscode').action('editor.action.marker.nextInFiles)<CR>", opts)
keymap({"n", "v"}, "J", "<cmd>lua require('vscode').action('editor.action.copyLinesDownAction')<CR>", opts)

-- Bookmarks
keymap({"n", "v"}, "m", "<cmd>lua require('vscode').action('bookmarks.toggle')<CR>", opts)
keymap({"n", "v"}, "M", "<cmd>lua require('vscode').action('bookmarks.toggleLabeled')<CR>", opts)
keymap({"n", "v"}, "[m", "<cmd>lua require('vscode').action('bookmarks.jumpToPrevious')<CR>", opts)
keymap({"n", "v"}, "]m", "<cmd>lua require('vscode').action('bookmarks.jumpToNext')<CR>", opts)
keymap({"n", "v"}, "dm", "<cmd>lua require('vscode').action('bookmarks.clear')<CR>", opts)
keymap({"n", "v"}, "dM", "<cmd>lua require('vscode').action('bookmarks.clearFromAllFiles')<CR>", opts)

-- Breakpoint
keymap("n", "<C-b>", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>", opts)
keymap("n", "dB", "<cmd>lua require('vscode').action('workbench.debug.viewlet.action.removeAllBreakpoints')<CR>", opts)
keymap("n", "db", "<cmd>lua require('vscode').action('workbench.debug.viewlet.action.disableAllBreakpoints')<CR>", opts)
keymap("n", "[b", "<cmd>lua require('vscode').action('editor.debug.action.goToPreviousBreakpoint')<CR>", opts)
keymap("n", "]b", "<cmd>lua require('vscode').action('editor.debug.action.goToNextBreakpoint')<CR>", opts)

-- Goto
keymap("n", "gd", "<cmd>lua require('vscode').action('editor.action.revealDefinition')<CR>", opts)
keymap("n", "gpd", "<cmd>lua require('vscode').action('editor.action.peekDefinition')<CR>", opts)
keymap("n", "gt", "<cmd>lua require('vscode').action('editor.action.goToTypeDefinition')<CR>", opts)
keymap("n", "gpt", "<cmd>lua require('vscode').action('editor.action.peekTypeDefinition')<CR>", opts)
keymap("n", "gi", "<cmd>lua require('vscode').action('editor.action.goToImplementation')<CR>", opts)
keymap("n", "gpi", "<cmd>lua require('vscode').action('editor.action.peekImplementation')<CR>", opts)
keymap("n", "gr", "<cmd>lua require('vscode').action('editor.action.goToReferences')<CR>", opts)
keymap("n", "gpr", "<cmd>lua require('vscode').action('editor.action.referenceSearch.trigger')<CR>", opts)
keymap("n", "gs", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>", opts)
keymap("n", "gb", "<cmd>lua require('vscode').action('breadcrumbs.focusAndSelect')<CR>", opts)
keymap("n", "go", "<cmd>lua require('vscode').action('editor.gotoParentFold')<CR>", opts)


-- Close editor
keymap("n", "qq", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opts)
keymap("n", "qo", "<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<CR>", opts)
keymap("n", "qQ", "<cmd>lua require('vscode').action('workbench.action.closeEditorsInGroup')<CR>", opts)
keymap("n", "qO", "<cmd>lua require('vscode').action('workbench.action.closeEditorsInOtherGroups')<CR>", opts)

-- Add spaces
keymap('n', 'd[', 'kdd', opts)
keymap('n', 'd]', 'jddk', opts)
keymap('n', '<Space>[', 'mzO<Esc>`z', opts)
keymap('n', '<Space>]', 'mzo<Esc>`z', opts)


-- Navigation in file
keymap("n", "[f", "<cmd>lua require('vscode').action('workbench.action.openPreviousRecentlyUsedEditor')<CR>", opts)
keymap("n", "]f", "<cmd>lua require('vscode').action('workbench.action.openNextRecentlyUsedEditor')<CR>", opts)

-- Navigation in class
keymap({"v", "n"}, "K", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>", opts)
keymap({"v", "n"}, "<C-k>", "<cmd>lua require('vscode').action('gotoNextPreviousMember.previousMember')<CR>", opts)
keymap({"v", "n"}, "<C-j>", "<cmd>lua require('vscode').action('gotoNextPreviousMember.nextMember')<CR>", opts)
keymap('n', "'", 'v', opts)
keymap("v", "'", "<cmd>lua require('vscode').action('editor.action.smartSelect.expand')<CR>", opts)
keymap("v", '"', "<cmd>lua require('vscode').action('editor.action.smartSelect.shrink')<CR>", opts)

-- Quick indent
keymap("v", ">", "<cmd>lua require('vscode').action('editor.action.indentLines')<CR>", opts)
keymap("v", "<", "<cmd>lua require('vscode').action('editor.action.outdentLines')<CR>", opts)