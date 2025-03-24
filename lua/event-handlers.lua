-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    if vim.bo[args.buf].modified then
      print("Warning: Buffer has unsaved changes!")
    end
  end
})
