# simple_test
A powerful, minimalist and easy-to-use Lua unit testing framework.

## Installation
To install `simple_test`, simply run:
```sh
$ luarocks install simple_test
```

Or copy the `simple_test.lua` file and paste in your project :)

## Getting started
A minimal test setup:

```lua
local test = require 'simple_test'

test('assert.equal', function(a)
  a.ok(1 == 1, 'passed!')
end)
```

## asserts
* assert.<code>ok(test, [failure_message])</code><br>
Checks if `test` is true.

* assert.<code>not_ok(test, [failure_message])</code><br>
Checks if `test` is false.

* assert.<code>equal(expected, actual, [failure_message])<code><br>
Checks if `expected` is equal `actual`.

* assert.<code>not_equal(expected, actual, [failure_message])<code><br>
Checks if `expected` is not equal `actual`.

* assert.<code>throw(function, params, [raised_message], [failure_message])<code><br>
Checks if a `function` throws an exception and optionally compare the throw error.

* assert.<code>delta(expected_float, actual_float, [delta], [failure_message])<code><br>
Checks if `expected_float` and `actual_float` are equal within optional `detlta` tolerance
