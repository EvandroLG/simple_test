local asserts = {
  equal = function(a, b)
    assert(a == b)
  end
}

local format = string.format

local function test(name, func)
  xpcall(function()
    func(asserts)
      print(format('[pass] %s', name))
    end, function(err)
      print(format('[fail] %s : %s', name, err))
    end)
end

return test
