

function Draw(obj, tbl, lights)
	obj.copybuffer("cache:avi3d_image", "obj")
	for k,v in pairs(tbl) do
		--obj.load("figure", "éläpå`", 0xffffff, 1)
		obj.copybuffer("obj", "cache:avi3d_image")
		
		if (lights) then obj.effect("êFí≤ï‚ê≥", "ñæÇÈÇ≥", v[5]) end
		
		local p1 = v[1]
		local p2 = v[2]
		local p3 = v[3]
		local p4 = v[4]
		obj.drawpoly(p1.x, p1.y, p1.z, p2.x, p2.y, p2.z, p3.x, p3.y, p3.z, p4.x, p4.y, p4.z)
	end
	
end


return {
	Draw = Draw
}