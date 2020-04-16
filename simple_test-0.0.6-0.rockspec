package = 'simple_test'
version = '0.0.6-0'

source = {
  url = 'git://github.com/evandrolg/simple_test.git',
  tag = 'v0.0.6'
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
    ['simple_test'] = "src/simple_test.lua",
    ['simple_test.utils'] = "src/utils.lua",
    ['simple_test.assertions'] = "src/assertions.lua",
    ['simple_test.colors'] = "src/colors.lua"
  }
}
