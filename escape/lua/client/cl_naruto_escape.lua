local RX = RX or function(x) return x / 1920 * ScrW() end
local RY = RY or function(y) return y / 1080 * ScrH() end

surface.CreateFont("TEXT:MENU",{
    font = "Ninja Naruto",
    size = ScreenScale(15),
    weight = 500
})

surface.CreateFont("TEXT:MENU2",{
    font = "FOT-Reggae Std B",
    size = ScreenScale(9),
    weight = 500
})

local Storm = Storm or {}
Storm.Escape = {}

local frame 
function Storm.Escape:Show()
    if IsValid(frame) then return end 

    frame = vgui.Create("DFrame")
    frame:SetSize(ScrW(),ScrH())
    frame:Center()
    frame:SetTitle("")
    frame:ShowCloseButton(false)
    frame:SetSizable(false)
    frame:SetDraggable(false)
    frame:MakePopup()
    frame.Paint = function(self,w,h)
        Derma_DrawBackgroundBlur(self)

        surface.SetMaterial(Material("ui/escape/tqHCFOc.png"))
        surface.SetDrawColor(color_white)
        surface.DrawTexturedRect(0,0,w,h)
        draw.SimpleText("MENU","TEXT:MENU",RX(915),RY(515),color_black)
    end
    
    local reprendre = vgui.Create("DButton",frame)
    reprendre:SetSize(RX(409),RY(45))
    reprendre:SetPos(RX(753),RY(563))
    reprendre:SetText("")
    reprendre.Paint = function(self,w,h)
        if reprendre:IsHovered() then 
            surface.SetMaterial(Material("ui/escape/jwtrGUc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        else 
            surface.SetMaterial(Material("ui/escape/i2Hcasc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        end
        draw.SimpleText("Reprendre","TEXT:MENU2",RX(152),RY(10),color_black)     
    end
    reprendre.OnCursorEntered = function(self)
        surface.PlaySound("menu/back.wav")
    end
    reprendre.DoClick = function()
        surface.PlaySound("menu/select.wav")
        frame:Remove()
    end    
    
    local discord = vgui.Create("DButton",frame)
    discord:SetSize(RX(409),RY(45))
    discord:SetPos(RX(753),RY(617))
    discord:SetText("")
    discord.Paint = function(self,w,h)
        if discord:IsHovered() then 
            surface.SetMaterial(Material("ui/escape/jwtrGUc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        else 
            surface.SetMaterial(Material("ui/escape/i2Hcasc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        end
        draw.SimpleText("Discord","TEXT:MENU2",RX(165),RY(10),color_black)      
    end
    discord.OnCursorEntered = function(self)
        surface.PlaySound("menu/back.wav")
    end
    discord.DoClick = function()
        surface.PlaySound("menu/select.wav")
        gui.OpenURL("")
    end 
    
    local settings = vgui.Create("DButton",frame)
    settings:SetSize(RX(409),RY(45))
    settings:SetPos(RX(753),RY(670))
    settings:SetText("")
    settings.Paint = function(self,w,h)
        if settings:IsHovered() then 
            surface.SetMaterial(Material("ui/escape/jwtrGUc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        else 
            surface.SetMaterial(Material("ui/escape/i2Hcasc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        end
        draw.SimpleText("Parametres","TEXT:MENU2",RX(148),RY(10),color_black)    
    end
    settings.OnCursorEntered = function(self)
        surface.PlaySound("menu/back.wav")
    end
    settings.DoClick = function()
        surface.PlaySound("menu/select.wav")
        gui.ActivateGameUI()
        RunConsoleCommand("gamemenucommand", "openoptionsdialog")
    end
    
    local disconnect = vgui.Create("DButton",frame)
    disconnect:SetSize(RX(409),RY(45))
    disconnect:SetPos(RX(752),RY(724))
    disconnect:SetText("")
    disconnect.Paint = function(self,w,h)
        if disconnect:IsHovered() then 
            surface.SetMaterial(Material("ui/escape/jwtrGUc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        else 
            surface.SetMaterial(Material("ui/escape/i2Hcasc.png"))
            surface.SetDrawColor(color_white)
            surface.DrawTexturedRect(0,0,w,h)
        end
        draw.SimpleText("Quitter","TEXT:MENU2",RX(170),RY(10),color_black)     
    end
    disconnect.OnCursorEntered = function(self)
        surface.PlaySound("menu/back.wav")
    end
    disconnect.DoClick = function()
        surface.PlaySound("menu/select.wav")
        RunConsoleCommand("disconnect")
    end     
end     

hook.Add("PreRender", "StormEscape", function()
    local F4Key = KEY_F4
	if ( gui.IsGameUIVisible() and input.IsKeyDown( KEY_ESCAPE )) then
        if IsValid(frame) then
            gui.HideGameUI()
            frame:Remove()
        else
            gui.HideGameUI()
            Storm.Escape:Show()
        end
    end
end)