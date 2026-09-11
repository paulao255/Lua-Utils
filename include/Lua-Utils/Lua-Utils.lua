------------------------------------
-- Create Lua Utils table module: --
------------------------------------

local M = {};

--------------------------
-- Lua Utils variables: --
--------------------------

-- Lua Utils full version.
M.FULL_VERSION = 20260911;

-- Lua Utils major version.
M.MAJOR_VERSION = 2026;

-- Lua Utils minor version.
M.MINOR_VERSION = 9;

-- Lua Utils patch version.
M.PATCH_VERSION = 11;

--------------------------
-- Lua Utils functions: --
--------------------------

-- Function that returns the machine operating system:
function M.get_os()
	if package.config:sub(1, 1) == "\\" then
		return "Windows";
	end

	local handle = io.popen("uname -s 2>/dev/null");

	if not handle then
		return nil;
	end

	local system = handle:read("*l");

	handle:close();

	if not system or system == "" then
		return nil;
	end

	system = system:lower();

	if system:find("linux") then
		if os.getenv("ANDROID_ROOT") or os.getenv("ANDROID_DATA") then
			return "Android";
		end

		return "Linux";
	elseif system:find("darwin") then
		local sdk = os.getenv("SDKNAME") or "";

		if os.getenv("IPHONE_SIMULATOR_ROOT") or os.getenv("IPHONEOS_DEPLOYMENT_TARGET") or sdk:lower():find("iphone") then
			return "iOS";
		end

		return "macOS";
	end

	return nil;
end

-- Function that returns the lua version in string format:
function M.get_lua_version()
	if type(rawget(_G, "jit")) == "table" then
		return "JIT";
	end

	local versions =
	{
		["Lua 5.1"] = "5.1",
		["Lua 5.2"] = "5.2",
		["Lua 5.3"] = "5.3",
		["Lua 5.4"] = "5.4",
		["Lua 5.5"] = "5.5"
	};

	return versions[_VERSION] or nil;
end

-- Function to return the read line string input:
function M.read_string_input()
	local input = io.read("*l");

	if not input then
		io.write("Invalid input type!\n");

		return nil;
	end

	return input;
end

-- Function to return the string (input) to number (caller):
function M.string_to_number(input)
	if type(input) == "string" then
		return tonumber(input);
	end

	return nil;
end

-- Function to return the number (input) to string (caller):
function M.number_to_string(input)
	if type(input) == "number" then
		return tostring(input);
	end

	return nil;
end

------------------------------
-- Return the table module: --
------------------------------

return M;
