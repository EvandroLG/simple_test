function is_table(obj)
  return type(obj) == 'table'
end

function is_deep_equal(a, b)
  if is_table(a) and is_table(b) then
    if (#a ~= #b) then return false end

    for k in pairs(a) do
      if not is_deep_equal(a[k], b[k]) then return false end
    end

    return true
  end

  return a == b
end

return {
  is_deep_equal = is_deep_equal
}
