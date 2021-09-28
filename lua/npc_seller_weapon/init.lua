
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')



function ENT:SpawnFunction( ply, tr )
	if !tr.Hit then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 2
	local ent = ents.Create( "npc_seller_weapon" )
	ent:SetPos( SpawnPos )
	ent:Spawn()
	ent:Activate()
	return ent
end
function ENT:Initialize()
 
	self:SetModel("models/Barney.mdl");
	self:SetHullType(HULL_HUMAN);
	self:SetHullSizeNormal();
	self:SetNPCState(NPC_STATE_SCRIPT);
	self:SetSolid(SOLID_BBOX);
	self:SetUseType(SIMPLE_USE);
	self:SetBloodColor(BLOOD_COLOR_RED);
	self:SetNWInt("distance", FS_DrawDistance);

	
    local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
	end
end
util.AddNetworkString( "EntSellerTable" )
util.AddNetworkString( "EntGiveBuyedWeapon" )
function ENT:Use( activator, caller )
	if !caller:IsPlayer() then return end
	net.Start( "EntSellerTable" )
	net.WriteEntity( self )
	net.Send( caller )
end
net.Receive( "EntGiveBuyedWeapon", function( len, ply )
local self = net.ReadEntity()
	local ent = net.ReadString()
	local entname = net.ReadString()
	local PESPCONT2 = PESW[ent].Cost
	local PESPNAME2 = PESW[ent].Name
	local PESWITEM = PESW[ent].SpawnFunction


if PESPCONT2 then
			
				local money = ply:getDarkRPVar("money") 	
			if money < PESPCONT2 then
					chat.AddText(Color( 255, 255, 255 ), "Денег нет,но вы держитесь!(Д.А.Медведев)" ) 
					surface.PlaySound( "buttons/button2.wav" )
				return
			end
			local validfunction = true
			self:EmitSound( "ambient/machines/catapult_throw.wav" )
			net.WriteBool( validfunction )
			net.WriteString( entname )
			net.Send( ply )
		if PESWITEM then
			local validfunction = true
			PESWITEM( ply, self )
			self:EmitSound( "ambient/machines/catapult_throw.wav" )
			net.WriteBool( validfunction )
			net.WriteString( entname )
			net.Send( ply )
		else
			local validfunction = false
			net.WriteBool( validfunction )
			net.WriteString( entname )
			net.Send( ply )
			return
		end
		DarkRP.notify(ply, 0, 4, "Вы купили ".. PESPNAME2.." за " .. PESPCONT2 .. " $ ")
			ply:addMoney(-PESPCONT2)
		

	
end
end )