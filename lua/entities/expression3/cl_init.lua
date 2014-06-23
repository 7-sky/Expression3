if not WireLib then return end

include('shared.lua')

ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:Draw()
	self.BaseClass.Draw(self)
end
