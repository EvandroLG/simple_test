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

  ok = function(a)
    assert(a)
  end

  not_ok = function(a)
    assert(not a)
  end

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
    print(format('%s[pass]%s %s', '\27[32m', '\27[0m', name))
  end, function(err)
    print(format('%s[fail]%s %s : %s','\27[31m', '\27[0m', name, err))
    os.exit(1)
  end)
end

return test
