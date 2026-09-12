package = "Lua-Utils"
version = "2026.09.12-1"
source = {
   url = "git+https://github.com/paulao255/Lua-Utils.git",
	 branch = "main"
}
description = {
   summary = "A Lua utilities library working with Lua 5.1 and LuaJIT.",
   detailed = "A Lua utilities library working with Lua 5.1 and LuaJIT.",
   homepage = "https://github.com/paulao255/Lua-Utils",
   license = "Unlicense"
}
dependencies = {
	 "lua >= 5.1, < 5.2"
}
build = {
   type = "builtin",
   modules = {
      ["Lua-Utils.Lua-Utils"] = "include/Lua-Utils/Lua-Utils.lua"
   }
}
