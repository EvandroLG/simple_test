-- simple_test
-- author: Evandro Leopoldino Gonçalves <evandrolgoncalves@gmail.com>
-- https://github.com/evandrolg
-- License: MIT

local assertions = require('./assertions')
local colors = require('./colors')
local format = string.format

local function test(name, callback)
  xpcall(function()
    callback(assertions)
    print(format('%s[pass]%s %s', colors.green[1], colors.green[2], name))
  end, function(err)
    print(format('%s[fail]%s %s : %s', colors.red[1], colors.red[2], name, err))
    os.exit(1)
  end)
end

return test
