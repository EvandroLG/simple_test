package = 'simple_test'
version = '0.0.2-0'

source = {
  url = 'git://github.com/evandrolg/simple_test.git',
  tag = 'v0.0.2'
}

description = {
  summary = 'An easy-to-use Lua unit test suite',
  homepage = 'https://github.com/EvandroLG/simple_test',
  maintainer = 'Evandro Leopoldino Gonçalves (@evandrolg) <evandrolgoncalves@gmail.com>',
  license = 'MIT <http://opensource.org/licenses/MIT>'
}

dependencies = {
  "lua >= 5.1"
}

build = {
  type = "builtin",
  modules = {
    ['simple_test'] = "simple_test.lua"
  }
}
