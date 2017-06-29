package = 'simple_test'
version = '0.0.4-0'

source = {
  url = 'git://github.com/evandrolg/simple_test.git',
  tag = 'v0.0.4'
}

description = {
  summary = 'A powerful, minimalist and easy-to-use Lua unit testing framework.',
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
