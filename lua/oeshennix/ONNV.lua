local succ,ONNV=pcall(require,"ONNV")
if(not succ)then
  print("could not get");
  return;
end

local succ,startupconfig=pcall(ONNV.retrieve,(vim.fn.stdpath("data").."/ONNV/startup.toml"))
if(not succ or not startupconfig)then
  print("could not utilize ONNV startup");
else
  for c,v in ipairs(startupconfig.requires)do
    dofile(startupconfig[v]);
  end;
end

ONNV.setup()
require("oeshennix.cmp");
