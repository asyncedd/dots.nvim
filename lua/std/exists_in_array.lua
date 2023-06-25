--- Checks if an element exists in an array
---@param array table           -- The array/table to search in.
---@param element any           -- The element to search for.
---@return boolean              -- True if the element exists, false otherwise.return function(array, elementToFind)
return function(array, elementToFind)
  -- Check if the key exists in the hashmap
  local found = false
  for _, value in ipairs(array) do
    if value == elementToFind then
      found = true
      break
    end
  end
  return found
end
