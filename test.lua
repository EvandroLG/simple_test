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

test('assert.throw (no pattern)', function(a)
  local method = function(first, last)
    assert(first == last, 'invalid!')
  end

  a.throw(method, { 'a', 'b' })
end)

test('assert.throw (with pattern)', function(a)
  local method = function(first, last)
    assert(first == last, 'invalid!')
  end

  a.throw(method, { 'a', 'b' }, 'invalid!')
end)

test('assert.throw (pattern not matched)', function(a)
  local method = function(first, last)
    assert(first == last, 'invalid!')
  end

  a.throw(method, { 'a', 'b' }, 'foo')
end, true)

test('assert.throw (does not throw)', function(a)
  local method = function(_, _) end

  a.throw(method, { 'a', 'b' })
end, true)

test('assert.throw (does not throw but still has pattern arg)', function(a)
  local method = function(_, _) end

  a.throw(method, { 'a', 'b' }, "foo")
end, true)

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

test('utils.is_deep_equal (reference cycles, different graph shape)', function(a)
  -- structurally equivalent but nested table t is referenced twice in obj1,
  -- but copied in obj2
  local t = { d = "foo" }

  local obj1 = {
    a = { c = t },
    b = t
  }

  local obj2 = {
    a = { c = { d = "foo" } },
    b = { d = "foo" }
  }

  a.ok(is_deep_equal(obj1, obj2))
end)

test("utils.is_deep_equal (reference cycles, same graph shape)", function(a)
  -- tables both contain a self reference to the starting table. they are completely
  -- separated graphs
  local table_a1 = {}
  local table_b1 = {}
  table_a1.b = table_b1
  table_b1.a = table_a1

  local table_a2 = {}
  local table_b2 = {}
  table_a2.b = table_b2
  table_b2.a = table_a2

  a.ok(is_deep_equal(table_a1, table_a2))
end)

test("utils.is_deep_equal (reference cycles, connected graphs)", function(a)
  -- tables form a simple reference cycle and are part of the same connected
  -- graph. because it is a symmetrical graph, they are still structurally
  -- equivalent
  local table_a = {}
  local table_b = {}
  table_a.ref = table_b
  table_b.ref = table_a

  a.ok(is_deep_equal(table_a, table_b))
end)
