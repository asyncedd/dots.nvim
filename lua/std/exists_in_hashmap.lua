--- Checks if an element exists in an array.
---@param array table           -- The array/table to search in.
---@param element any           -- The element to search for.
---@return boolean              -- True if the element exists, false otherwise.
return function(hashmap, keyToFind)
  -- Check if the element exists in the array
  local found = false
  for key, _ in pairs(hashmap) do
    if key == keyToFind then
      found = true
      break
    end
  end
  return found
end
