local succ,ONNV=pcall(require,"ONNV")
if(not succ)then
  print("could not get");
  return;
end

ONNV.setup()
local succ,startupconfig=pcall(ONNV.retrieve,(vim.fn.stdpath("config").."/ONNV/startup.toml"))
if(not succ or not startupconfig)then
  print("could not utilize ONNV startup");
else
  if(startupconfig.requires)then
    for c,v in ipairs(startupconfig.requires)do
      dofile(startupconfig[v]);
    end;
  end;
end

require("oeshennix.cmp");
