local utils = require('./utils')
local colors = require('./colors')
local format = string.format

local assertions = {
  equal = function(a, b, msg)
    local message = msg or format('%s%s%s expected but was %s%s%s',
          colors.green[1], tostring(a), colors.green[2],
          colors.red[1], tostring(b), colors.red[2])

    assert(a == b, message)
  end,

  not_equal = function(a, b, msg)
    local message = msg or format('%s expected to be different from %s', a, b)
    assert(a ~= b, message)
  end,

  ok = function(a, msg)
    local message = msg or format('%s is not true', tostring(a))
    assert(a, message)
  end,

  not_ok = function(a, msg)
    local message = msg or format('%s is not false', tostring(a))
    assert(not a, message)
  end,

  throw = function(method, params, raised_message, msg)
    local raised_error = false

    xpcall(function()
      method(table.unpack(params))
    end, function(err)
      raised_error = true
      assert(string.find(err, raised_message))
    end)

    if not raised_error then error(msg or 'should throw error') end
  end,

  delta = function(a, b, delta, msg)
    local diff = math.abs(a - b)
    delta = delta or 0.00001
    local message = msg or format('%s%s%s expected but was %s%s%s',
          colors.green[1], a, colors.green[2], colors.red[1], b, colors.red[2])

    if a == b then
      return true
    elseif a == 0 or b == 0 then
      assert(diff < delta, message)
    else
      local abs_a = math.abs(a)
      local abs_b = math.abs(b)

      assert((diff / (abs_a + abs_b)) < delta, message)
    end
  end,

  deep_equal = function(a, b, msg)
    local message = msg
    assert(utils.is_deep_equal(a, b), message)
  end
}

return assertions
