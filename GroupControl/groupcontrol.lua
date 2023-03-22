function Initialize()
	local obj = {}
	obj.x = 0
	obj.y = 0
	obj.z = 0
	obj.rx = 0
	obj.ry = 0
	obj.rz = 0
	obj.alpha = 0
	obj.zoom = 0
	obj.aspect = 0
	
	return obj
end

return {
	Initialize = Initialize
}