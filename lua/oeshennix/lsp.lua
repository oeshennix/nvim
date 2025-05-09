local toml=require('toml-lua');
local lspconfig=require('lspconfig');
local module={};

local LSPConfigurationPath=vim.fn.stdpath('data')..'/oeshennix/lspconfig.toml';
local ConfigFileBuffer=io.open(LSPConfigurationPath,"r");
if(not ConfigFileBuffer)then
  print("no LSPConfigurationPath path found");
  vim.uv.fs_mkdir(vim.fn.stdpath('data')..'/oeshennix',tonumber('700',8));
  fd=vim.uv.fs_open(LSPConfigurationPath,"w",tonumber("600",8));

  vim.uv.fs_write(fd,"#lsp");

  vim.uv.fs_close(fd);

else
  ConfigFileBuffer:close();
end

vim.api.nvim_create_user_command('Editlspconfig',function(opts)
  vim.cmd('new '..LSPConfigurationPath);
end,{});
local ConfigFileBuffer=io.open(LSPConfigurationPath,"r");
ConfigFileContents=ConfigFileBuffer:read("a")
local Config=toml.parse(ConfigFileContents);
Config=Config:Lua();

vim.g.ONNV="Settings";
vim.g.ONNVSettings=Config;
module.config=Config;

return module;
