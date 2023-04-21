return function(ensure_installed)
  local mr = require("mason-registry")
  for _, tool in ipairs(ensure_installed) do
    local p = mr.get_package(tool)
    if not p:is_installed() then
      print("Installing " .. tool .. "!")
      p:install()
      print("Done installing ", tool .. "!")
    end
  end
end
