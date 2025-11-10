local nixmanager=require("nixmanager");
local languageconfiguration={};
languageconfiguration.setup={};
function languageconfiguration.setup.clangd(settings)
  local options={};
  options.cmd={"clangd", "--compile-commands-dir=/home/oeshennix/.local/share/nvim/nixmanager"}
  options.cmd={"clangd"};
  local installednixlibraries=nixmanager.GetPathsFromPackages(settings.nixlibraries)

  for c,v in ipairs(installednixlibraries)do
    --table.insert(options.cmd,"-I");
    --table.insert(options.cmd,string.format("%s/include",v));
  end
  return options;
end
function languageconfiguration.setup.ts_ls(settings)
  return {
    cmd={"typescript-language-server", "--stdio"},
    filetypes={ "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
  }
end

return languageconfiguration
