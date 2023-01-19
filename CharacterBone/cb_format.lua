local newobj = function ()
	local cb = {}
	cb.bones = {}
	cb.w = 1000
	cb.h = 1000
	cb.defbase = ""
	
	function cb:AddBone(id, parent, ox, oy, cx, cy)
		local b = {}
		b.id = id
		b.parent = parent
		b.ox = ox
		b.oy = oy
		b.cx = cx
		b.cy = cy
		b.shake_y = 0
		b.deffile = ""
		table.insert(cb.bones, b)
	end
	
	return cb
end

local objtostr = function(obj)
	local istr = ""
	local function addw(k, v)
		istr = istr .. k .. "=" .. v .. "\n"
	end
	addw("w", obj.w)
	addw("h", obj.h)
	addw("defbase", obj.defbase)
	
	for k,v in pairs(obj.bones) do
		istr = istr .. "{" .. "\n"
		addw("id", v.id)
		addw("parent", v.parent)
		addw("ox", v.ox)
		addw("oy", v.oy)
		addw("cx", v.cx)
		addw("cy", v.cy)
		addw("deffile", v.deffile)
		istr = istr .. "}" .. "\n"
	end
	
	return istr
	
end

local perse = function(file)
	local cb = newobj()
	local fh = io.open(file)
	local str = fh:read("*a")
	
	
	local istr = ""
	local istr2 = ""
	local inbone = false
	local currentbone = 0
	
	for i=0,#str do
		local char = string.sub(str, i, i)
		--debug_print(char)
		if (char == "=") then
			istr2 = istr
			istr = ""
		elseif (char == "\n") then
			--debug_print("===== " .. istr2 .. ": " .. istr)
			if (istr2 == "") then
			else
				if (inbone) then
					--debug_print("|_=== " .. currentbone)
					if (tonumber(istr)) then
						cb.bones[currentbone][istr2] = tonumber(istr)
					else
						cb.bones[currentbone][istr2] = istr
					end
				else
					if (tonumber(istr)) then
						cb[istr2] = tonumber(istr)
					else
						cb[istr2] = istr
					end
					--debug_print("|_=== " .. cb[istr2])
				end
			end
			istr = ""
			istr2 = ""
		elseif (char == "{") then
			currentbone = currentbone + 1
			table.insert(cb.bones, currentbone, {})
			
			--debug_print("[==][==] " .. currentbone)
			inbone = true
		elseif (char == "}") then
			inbone = false
		else
			istr = istr .. char
		end
	end
	
	return cb
end

return {
	CreateNewCB = newobj,
	CBToString = objtostr,
	Perse = perse
}