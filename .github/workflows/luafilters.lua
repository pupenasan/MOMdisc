function Image (el)
	if el.title ~="" then  
		el.attr.attributes = { width = "640px"}
	end
	return el
end

function Table (el)
    cell = el.headers[1][1].content
	for key, val in pairs (cell[1]) do --(cell[1]) do	
		if type(val) == "string" and string.match(val, "README") then		
			return {} -- вернути пустий, тобто видалити
		end	
	end
	return el
end
function HorizontalRule (el)
	return {} -- вернути пустий, тобто видалити
end
--[[
function Blocks (blocks)
	for key, val in pairs(blocks)  do
		if val.t == "HorizontalRule" then
			table.remove (blocks, key) 
		end
	end
    return blocks 
end
]]--

