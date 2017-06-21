-- simple_test
-- author: Evandro Leopoldino Gonçalves <evandrolgoncalves@gmail.com>
-- https://github.com/evandrolg
-- License: MIT

local assertions = {
  equal = function(a, b)
    assert(a == b)
  end,

  not_equal = function(a, b)
    assert(a ~= b)
  end,

  throw = function(message, method, params)
    local raised_error = false

    xpcall(function()
      method(table.unpack(params))
    end, function(err)
      raised_error = true
      assert(string.find(err, message))
    end)

    if not raised_error then error('should throw error') end
  end,

  delta = function(a, b, delta)
    local diff = math.abs(a - b)
    delta = delta or 0.00001

    if a == b then
      return true
    elseif a == 0 or b == 0 then
      assert(diff < delta)
    else
      local abs_a = math.abs(a)
      local abs_b = math.abs(b)

      assert((diff / (abs_a + abs_b)) < delta)
    end
  end
}

local format = string.format

local function test(name, callback)
  xpcall(function()
    callback(assertions)
    print(format('[pass] %s', name))
  end, function(err)
    print(format('[fail] %s : %s', name, err))
  end)
end

return test
