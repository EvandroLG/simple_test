local test = require 'simple_test'
local utils = require 'utils'

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
  a.delta(0.3, 0.1 + 0.2)
end)

test('assert.deep_equal', function(a)
  local obj1 = {
    favorites = {
      languages = {
        'lua',
        'javascript',
        'c'
      }
    }
  }

  local obj2 = {
    favorites = {
      languages = {
        'lua',
        'javascript',
        'c'
      }
    }
  }

  a.deep_equal(obj1, obj2)
end)

test('utils.is_deep_equal', function(a)
  a.not_ok(is_deep_equal('a', 'b'))
  a.ok(is_deep_equal('a', 'a'))
  a.not_ok(is_deep_equal({ a = { 'b' } }, { a = { 'c' } }))
  a.ok(is_deep_equal({ a = { 'b' } }, { a = { 'b' } }))
  a.ok(is_deep_equal({ 'a', 'b', 'c', 'd' }, { 'a', 'b', 'c', 'd' }))
  a.not_ok(is_deep_equal({ 'a', 'b', 'c', 'd' }, { 'a', 'b', 'c', 'e' }))
end)
