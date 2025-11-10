
require('oeshennix');
require('oeshennix.pckr');

vim.cmd([[
inoremap <S-Tab> <C-V><Tab>
]])

vim.filetype.add({
  extension = {
    luau = "luau"
  },
  filename = {
    ['.luau'] = 'luau',
  }
})

