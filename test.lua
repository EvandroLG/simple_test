local test = require 'simple_test'

test('assert.equal', function(a)
  a.equal('a', 'a')
end)

test('assert.not_equal', function(a)
  a.not_equal('a', 'b')
end)

test('assert.ok', function(a)
  a.ok(true)
  a.ok('lua')
end)

test('assert.not_ok', function(a)
  a.not_ok(false)
  a.not_ok(nil)
end)

test('assert.throw', function(a)
  local method = function(a, b)
    assert(a == b, 'invalid!')
  end

  a.throw(method, { 'a', 'b' }, 'invalid!')
end)

test('assert.delta', function(a)
  a.delta(0.3, 0.1+0.2)
end)
