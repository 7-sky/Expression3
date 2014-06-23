include("expression3/expression3.lua")

if SERVER then -- I am lazy
	local function IncludeCS(dir)
		local files, folders = file.Find(dir.."*", "LUA")
		
		for k, file_name in pairs(files) do
			AddCSLuaFile(dir..file_name)
		end
		
		for k, dir_name in pairs(folders) do
			IncludeCS(dir_name)
		end
	end
	
	IncludeCS("expression3/")
end