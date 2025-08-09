local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('oeshennix.packer');
if(packer_bootstrap)then
  require('packer').sync();
  print("Packer loading complete restart neovim");
end;

require('oeshennix');
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

require('oeshennix.ONNV');
