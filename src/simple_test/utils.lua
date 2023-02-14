function is_table(obj)
  return type(obj) == 'table'
end

local function is_deep_equal_helper(a, b, table_pairs)
  if is_table(a) and is_table(b) then
    if (#a ~= #b) then return false end

    if table_pairs[a] == b then
      return true
    end

    table_pairs[a] = b

    for k in pairs(a) do
      if not is_deep_equal_helper(a[k], b[k], table_pairs) then return false end
    end

    return true
  end

  return a == b
end

function is_deep_equal(a, b)
  return is_deep_equal_helper(a, b, {})
end

return {
  is_deep_equal = is_deep_equal
}
