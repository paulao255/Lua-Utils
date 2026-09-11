---------------------------
-- Library importations: --
---------------------------

local lua_utils = require("./include/Lua-Utils/Lua-Utils");

-----------------------------
-- Global local variables: --
-----------------------------

local application_name = "Lua-Utils";
local application_standards =
{
	"Lua 5.1",
	"LuaJIT"
};
local application_version = "2026-09-11";
local commands =
{
	"help",
	"test"
};

local system = lua_utils.get_os();

----------------
-- Functions: --
----------------

local function help()
	io.write("App name: " .. application_name .. "\n");
	io.write("App version: " .. application_version .. "\n");
	io.write("App standards: " .. table.concat(application_standards, ", ") .. "\n");
	io.write("Commands: " .. table.concat(commands, ", ") .. "\n");
end

local function test()
	io.write("Testing...\n");

	if system == "Windows" then
		os.execute("luajit include\\Lua-Utils\\Lua-Utils.lua");
	else
		os.execute("luajit include/Lua-Utils/Lua-Utils.lua");
	end
end

local function main()
	if #arg == 0 then
		help();
	elseif #arg >= 1 then
		if arg[1] == "help" then
			help();
		elseif arg[1] == "test" then
			test();
		end
	end

	return 0;
end

os.exit(main(), true);
