if WireLib then
	include( "shared.lua" )
	AddCSLuaFile( "shared.lua" )
	AddCSLuaFile( "cl_init.lua" )
end

function ENT:Initialize()
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	self:SetUseType(SIMPLE_USE)
	
	self:SetModel("models/beer/wiremod/gate_e2.mdl")
	
	self.Inputs = WireLib.CreateInputs(self, { })
	self.Outputs = WireLib.CreateOutputs(self, { })
	
	self.GateName = "LemonGate"
end

function ENT:Think()
	self.BaseClass.Think(self)
	self:NextThink(CurTime())
	
	return true
end