
include('shared.lua')

function ENT:Draw()
	self:DrawModel()
	local pos = self:GetPos()
	local ang = self:GetAngles()
		cam.Start3D2D(pos + Vector(0, 0, 80), ang + Angle(0, 90, 90), .50)
		draw.SimpleText("Продавец оружия", 'L_WSF1' ,0,0 ,Color(255,255,255) ,1 , 1 ) -- name in 3d 
	cam.End3D2D()
end
--
surface.CreateFont("L_WSF1", {font = "izvestija",size = 30,extended = true,})
surface.CreateFont("L_WSF2", {font = "izvestija",size = 20,extended = true,})

DrawMainMenu = function( ent )
local ply = LocalPlayer()
local PESWCOLOR1 =  Color(0, 0,0,200)
local PESWCOLOR2 =  Color(255,255,255)
local Framenachal= vgui.Create("DFrame")
Framenachal:SetTitle("")
Framenachal:SetSize(ScrW()/1.5, ScrH()/1.5)
Framenachal:SetPos(ScrW()/2,ScrH()/2 )
Framenachal:MakePopup()
Framenachal:Center()
Framenachal:ShowCloseButton(false)
Framenachal.Paint = function( self, w, h )
draw.RoundedBox( 0, 0, 0, w, h, Color(0,0,0,200) )
surface.SetDrawColor(255,255,255)
surface.DrawOutlinedRect(0,0,w,h)
	if ply.SelectedBuyedItemName then
		draw.SimpleText("Выбранный предмет: "..ply.SelectedBuyedItemName,  "L_WSF1",Framenachal:GetWide()*.40,Framenachal:GetTall()*.85,  Color( 255, 255, 255, 255 ),  TEXT_ALIGN_LEFT,  TEXT_ALIGN_TOP) -- selected item
		draw.SimpleText("Цена: "..ply.SelectedBuyedItemCost .. " $ ",  "L_WSF1", Framenachal:GetWide()*.40,Framenachal:GetTall()*.90,  Color( 255, 255, 255, 255 ),  TEXT_ALIGN_LEFT,  TEXT_ALIGN_TOP) -- price of selected item

	else
		draw.SimpleText("Выбранный предмет отсутствует ",  "L_WSF1", Framenachal:GetWide()*.40,Framenachal:GetTall()*.85,  Color( 255, 255, 255, 255 ),  TEXT_ALIGN_LEFT,  TEXT_ALIGN_TOP) -- start selected item
		draw.SimpleText("Цена: ".. "0 $ ",  "L_WSF1", Framenachal:GetWide()*.40,Framenachal:GetTall()*.90,  Color( 255, 255, 255, 255 ),  TEXT_ALIGN_LEFT,  TEXT_ALIGN_TOP) -- start price 

	end	

end
local contaiter = vgui.Create("DBubbleContainer",Framenachal)	
	contaiter:SetPos(Framenachal:GetTall()*.025,Framenachal:GetWide()*.01)
	contaiter:SetSize(Framenachal:GetTall()*1.74,Framenachal:GetWide()/2.15)
	contaiter.Paint = function( self, w, h )
	surface.SetDrawColor(255,255,255)
surface.DrawOutlinedRect(0,0,w,h)
	end

local mainframescroll = vgui.Create( "DScrollPanel", contaiter )
	mainframescroll:Dock( FILL )
	 for a,b in ipairs( PESWCAT ) do
		local categorybutton = vgui.Create( "DButton", mainframescroll )
		categorybutton:SetSize( nil, 35 ) --X is ignored since it's docked to the frame already
		categorybutton:SetText( b.Name )
		categorybutton:SetFont( "Trebuchet24" )
		categorybutton:SetTextColor( PESWCOLOR2)
		categorybutton:Dock( TOP )
		categorybutton:DockMargin( 0, 15, 0, 5 )
		categorybutton.Paint = function( self, w, h )
			
		end
		for k,v in pairs( PESW ) do --Looks over all recipes in the main ZavodTable table
			if v.Category != b.Name then --Puts items into their respective categories
				continue
			end
			local mainbuttons = vgui.Create( "DButton", mainframescroll )
			mainbuttons:SetText( v.Name )
			mainbuttons:SetSize(nil,25)
			mainbuttons:SetFont("L_WSF2")
			mainbuttons:SetTextColor( PESWCOLOR2  )
			mainbuttons:Dock( TOP )
			mainbuttons:DockMargin( 0, 0, 0, 5 )
			mainbuttons.Paint = function( self, w, h )
				surface.SetDrawColor(255,255,255)
surface.DrawOutlinedRect(0,0,w,h)
			end
			mainbuttons.DoClick = function()
				ply.SelectedBuyedItem = tostring( k ) 
				ply.SelectedBuyedItemName = v.Name 
				ply.SelectedBuyedItemCost = v.Cost 
				surface.PlaySound( "buttons/lightswitch2.wav" )
			end
		end
	end	



local closebutton1 = vgui.Create("DButton",Framenachal)
closebutton1:SetText("Закрыть")
closebutton1:SetFont( "L_WSF1" )
closebutton1:SetTextColor(PESWCOLOR2)
closebutton1:SetPos(Framenachal:GetTall()/32,Framenachal:GetWide()/2)
 closebutton1:SetSize(Framenachal:GetTall()*.2,Framenachal:GetWide()*.05)
 closebutton1.Paint = function (self,w,h)
   draw.RoundedBox(2, 0,0, w, h, Color(125,0,0,255))   
       -- draw.DrawText( "123", "S_normal", closebutton1:GetWide() / 8, 40, Color(255,255,255,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
      surface.SetDrawColor(255,255,255)
      surface.DrawOutlinedRect(0,0,w,h) 
 end
 closebutton1.DoClick = function ()
   Framenachal:SetVisible(false)
   surface.PlaySound( "buttons/lightswitch2.wav" )
				ply.SelectedBuyedItem = nil 
				ply.SelectedBuyedItemName = nil 
				ply.SelectedBuyedItemCost = nil 
 end	
 local buybutton1 = vgui.Create("DButton",Framenachal)
buybutton1:SetText("Купить")
buybutton1:SetFont( "L_WSF1" )
buybutton1:SetTextColor(PESWCOLOR2)
buybutton1:SetPos(Framenachal:GetTall()/4,Framenachal:GetWide()/2)
buybutton1:SetSize(Framenachal:GetTall()*.2,Framenachal:GetWide()*.05)
buybutton1.Paint = function (self,w,h)

   draw.RoundedBox(2, 0,0, w, h, Color(0,125,0,255))   
      surface.SetDrawColor(255,255,255)
      surface.DrawOutlinedRect(0,0,w,h)
 end
buybutton1.DoClick = function ()
	if !ply.SelectedBuyedItem  then
			chat.AddText(  Color( 255, 255, 255 ), "Оружие выбрал нах*й ,бл*дь,а потом балакай на нас !" ) 
			surface.PlaySound( GetConVar( "Craft_Config_Fail_Sound" ):GetString() )
			return
		end
		net.Start( "EntGiveBuyedWeapon" )
		net.WriteEntity( ent )
		net.WriteString( ply.SelectedBuyedItem )
		net.WriteString( ply.SelectedBuyedItemName ) 
		net.WriteString( ply.SelectedBuyedItemCost) 
		net.SendToServer() 
	ply.SelectedBuyedItem = nil 
	ply.SelectedBuyedItemName = nil 
	ply.SelectedBuyedItemCost = nil 
 end	

end
net.Receive( "Message_PESW", function( len, ply ) --Have to network the entname into here since the client can't see it serverside
	local validfunction = net.ReadBool()
	local entname = net.ReadString()
	if validfunction then --Checks to make sure the spawn function exists, I might have it go through a default spawn function at some point instead of just erroring
		chat.AddText( Color( 100, 100, 255 ), "[Стол]: ", Color( 255, 255, 255 ), "Вы купили оружие : "..entname.." ." )
	else
		chat.AddText( Color( 100, 100, 255 ), "[Стол]: ", Color( 255, 255, 255 ), "Ошибка. Вы пошли нах*й "..entname.." ("..ent..")" )
	end
end )

net.Receive( "EntSellerTable", function( len, ply )
	local ent = net.ReadEntity()
	DrawMainMenu( ent )
end )
