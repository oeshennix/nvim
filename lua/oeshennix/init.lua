if not pcall(require,'oeshennix.packer')then
  vim.cmd([[packadd packer.nvim]]);
end
--require('oeshennix.ccls');
require('oeshennix.remap');
require('oeshennix.vimconfigs');
