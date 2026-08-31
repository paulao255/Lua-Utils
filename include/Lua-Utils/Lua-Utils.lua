------------------------------------
-- Create Lua Utils table module: --
------------------------------------

local M = {};

--------------------------
-- Lua Utils functions: --
--------------------------

-- Read string input:
function M.read_string_input()
	local input = io.read("*l");

	if not input then
		io.write("Invalid input type!\n");

		return nil;
	end

	return input;
end

-- String to number:
function M.string_to_number(input)
	if type(input) == "string" then
		return tonumber(input);
	end
end

-- Number to string:
function M.number_to_string(input)
	if type(input) == "number" then
		return tostring(input);
	end
end

------------------------------
-- Return the table module: --
------------------------------

return M;
