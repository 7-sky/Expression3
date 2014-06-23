if not WireLib then return end

TOOL.Category					= "Chips, Gates"
TOOL.Name						= "Expression 3"
TOOL.Command 					= nil
TOOL.ConfigName 				= nil
TOOL.Tab						= "Wire"
TOOL.ClientConVar.Model 		= "models/beer/wiremod/gate_e2.mdl"
TOOL.ClientConVar.Weldworld 	= 0
TOOL.ClientConVar.Frozen		= 0
cleanup.Register("expression3")

if SERVER then

	CreateConVar( "sbox_maxepxression3", 5)
end

function TOOL:GetModel( )
	local model = self:GetClientInfo("Model")
	if model and model ~= "" then return Model( model ) end
	
	return "models/beer/wiremod/gate_e2.mdl"
end

function TOOL:IsE3Gate(Entity)
	return Entity and Entity:IsValid() and Entity:GetClass() == "expression3"
end

if CLIENT then return end

local function MakeE3(Player, Pos, Ang, Model, InPorts, OutPorts)
	if Player:CheckLimit("Expression 3") then
		local Entity = ents.Create("expression3")
		
		if Entity and Entity:IsValid() then 
			Entity:SetModel(Model)
			Entity:SetAngles(Ang)
			Entity:SetPos(Pos)
			Entity:Spawn()
			
			--Entity:ApplyDupePorts(InPorts, OutPorts)
			
			Entity:SetNWEntity("player", Player)
			Entity:SetPlayer(Player)
			Entity.Player = Player
			
			Entity.PlyID = Player:EntIndex()
			
			Player:AddCount("expression3", Entity)
			
			return Entity
		end
	end
end

duplicator.RegisterEntityClass("expression3", MakeE3, "Pos", "Ang", "Model", "DupeInPorts", "DupeOutPorts")

function TOOL:Reload(Trace)
	return false
end

function TOOL:RightClick(Trace)
	local Entity, Player = Trace.Entity, self:GetOwner()
	
	Player:ChatPrint("[Expression 3] Open Editor")
end

function TOOL:LeftClick(Trace)
	local Entity, Player = Trace.Entity, self:GetOwner()
	
	if self:IsE3Gate(Entity) then		
		Player:ChatPrint("[Expression 3] Upload")
		return true -- Upload there
	end
	
	if Entity and Entity:IsValid() and Entity:IsPlayer() then
		return false
	end
	
	local Model = self:GetModel()
	local Pos = Trace.HitPos
	local Ang = Trace.HitNormal:Angle()
	Ang.pitch = Ang.pitch + 90
	
	Entity = MakeE3(Player, Pos, Ang, Model)
	
	if Entity and Entity:IsValid() then
		Entity:SetPos(Trace.HitPos - Trace.HitNormal * Entity:OBBMins().z)
		
		local WeldTo, Constraint = Trace.Entity
		local AllowWorld = true
		
		if IsValid(WeldTo) or AllowWorld then
			Constraint = constraint.Weld(Entity, WeldTo, 0, Trace.PhysicsBone, 0, 0, AllowWorld) 
		end
		
		undo.Create("expression3")
			undo.AddEntity(Entity)
			undo.SetPlayer(Player)
			undo.AddEntity(Constraint)
		undo.Finish()
		
		Player:AddCleanup("expression3", Entity)
		
		-- Upload there too
		
		Player:ChatPrint("[Expression 3] Spawn")
		
		return true
	end
	
	return false
end

