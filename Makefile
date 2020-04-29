.SILENT:

test:
	LUA_PATH="./src/?.lua;./src/?/init.lua;./src/simple_test/?.lua" lua test.lua
