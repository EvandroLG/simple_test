local assertions = require 'simple_test.assertions'
local colors = require 'simple_test.colors'
local format = string.format

local function test(name, callback, expect_to_fail)
  xpcall(function()
    callback(assertions)
    if not expect_to_fail then
      print(format('%s[pass]%s %s', colors.green[1], colors.green[2], name))
    else
      print(format('%s[passed unsuccessfully...]%s %s',
            colors.red[1], colors.red[2], name))
    end
  end, function(err)
    if not expect_to_fail then
      print(format('%s[fail]%s %s : %s', colors.red[1], colors.red[2], name, err))
      os.exit(1)
    else
      print(format('%s[failed successfully!]%s %s : %s',
            colors.green[1], colors.green[2], name, err))
    end
  end)
end

return test
