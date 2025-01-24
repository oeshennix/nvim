local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fz', builtin.find_files, {})
vim.keymap.set('n', '<leader>fw', function()
  builtin.grep_string({ search = vim.fn.input("Grep > "), grep_open_files=false})
end);
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
