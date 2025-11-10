local nixmanager={};

function nixmanager.GetPathsFromPackages(packages,options)
  local arguments={"nix","build", "--no-link","--print-out-paths"}
  for c,package in ipairs(packages)do
    table.insert(arguments,string.format("nixpkgs#%s",package));
  end
  --local pipe_stdin=vim.uv.new_pipe();
  local entries={};
  for item in string.gmatch(vim.system(arguments,{text=true}):wait().stdout,"[^\n]+") do
    table.insert(entries,item);
  end
  return entries;
end

vim.api.nvim_create_user_command("Nixmanager",function(options)

end,{})

return nixmanager;
