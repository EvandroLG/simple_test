# simple_test
A powerful, minimalist and easy-to-use Lua unit testing framework.

[![Build
Status](https://travis-ci.org/EvandroLG/simple_test.svg?branch=master)](https://travis-ci.org/EvandroLG/simple_test)

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

* assert.<code>equal(actual, expected, [failure_message])</code><br>
Tests if `actual` is equal `expected`.

* assert.<code>not_equal(actual, expected, [failure_message])</code><br>
Checks if `actual` is not equal `expected`.

* assert.<code>throw(function, params, [raised_message], [failure_message])</code><br>
Checks if a `function` throws an exception and optionally compare the throw error.

* assert.<code>delta(actual_float, expected_float, [delta], [failure_message])</code><br>
Checks if `actual_float` and `expected_float` are equal within optional `delta` tolerance

* assert.<code>deep_equal(actual, expected, [failure_message])</code><br>
Tests for deep equality between the `actual` and `expected` parameters.

## Author
|[![@evandrolg](https://avatars3.githubusercontent.com/u/444054?v=3&amp;s=96)](https://github.com/evandrolg)|
|:---:|
|[@evandrolg](http://www.github.com/evandrolg)|
