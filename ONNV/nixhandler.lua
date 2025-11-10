local ONNV=require("ONNV");

local config=ONNV.getConfig();
local nixconfig=ONNV.retrieve(vim.fn.stdpath("config").."/ONNV/nix/config.toml");

local ExecutableMap={}
for c,v in ipairs(nixconfig.executables)do
  ExecutableMap[v]=true;
end

if(config.nix)then
  if(config.nix.executables)then
    for c,v in ipairs(config.nix.executables)do
      ExecutableMap[v]=true;
    end
  end
end
local executables={};
for c,v in pairs(ExecutableMap)do
  table.insert(executables,c);
end

local executablepaths=require("nixmanager").GetPathsFromPackages(executables);
for c,v in ipairs(executablepaths)do
  vim.env.PATH=string.format("%s/bin:%s",v,vim.env.PATH);
end
