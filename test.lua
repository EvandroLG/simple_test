local test = require 'simple_test'

equal = function(a, b, msg )
      assert(a == b,  msg  or  'a value not equal a b value')
        end

test('assert.equal', function(a)
  a.equal('a', 'b')
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
    assert(a, b, 'invalid!')
  end

  a.throw(method, { 'a', 'b' }, 'invalid!')
end)
