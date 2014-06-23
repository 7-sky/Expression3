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
	
	self.GateName = "Expression 3"
end

function ENT:Think()
	self.BaseClass.Think(self)
	self:NextThink(CurTime())
	
	return true
end

function ENT:Error(strError)
	Expression3.Error(self:GetPlayer(), strError)
end

function ENT:Warning(strError)
	Expression3.Warning(self:GetPlayer(), strError)
end