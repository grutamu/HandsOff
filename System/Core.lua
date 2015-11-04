function ho:Engine()
	-- Hidden Frame

	if Pulse_Engine == nil then
		Pulse_Engine = CreateFrame("Frame", nil, UIParent)
		Pulse_Engine:SetScript("OnUpdate", HandsOffUpdate)
		Pulse_Engine:Show()
	end
end

-- Chat Overlay: Originally written by Sheuron.
-- local function onUpdate(self,elapsed)
-- 	if self.time < GetTime() - 2.0 then if self:GetAlpha() == 0 then self:Hide(); else self:SetAlpha(self:GetAlpha() - 0.02); end end
-- end
-- chatOverlay = CreateFrame("Frame",nil,ChatFrame1)
-- chatOverlay:SetSize(ChatFrame1:GetWidth(),50)
-- chatOverlay:Hide()
-- chatOverlay:SetScript("OnUpdate",onUpdate)
-- chatOverlay:SetPoint("TOP",0,0)
-- chatOverlay.text = chatOverlay:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
-- chatOverlay.text:SetAllPoints()
-- chatOverlay.texture = chatOverlay:CreateTexture()
-- chatOverlay.texture:SetAllPoints()
-- chatOverlay.texture:SetTexture(0,0,0,.50)
-- chatOverlay.time = 0
-- function ChatOverlay(Message, FadingTime)
-- 	chatOverlay:SetSize(ChatFrame1:GetWidth(),50)
-- 	chatOverlay.text:SetText(Message)
-- 	chatOverlay:SetAlpha(1)
-- 	if FadingTime == nil then
-- 		chatOverlay.time = GetTime()
-- 	else
-- 		chatOverlay.time = GetTime() - 2 + FadingTime
-- 	end
-- 	chatOverlay:Show()
-- end

--[[This function is refired everytime wow ticks. This frame is located in Core.lua]]
function HandsOffUpdate(self)
	
	--[[Class/Spec Selector]]
	local playerClass = UnitClass("player")
	if playerClass == "Warrior" then -- Warrior
		
	elseif playerClass == "Paladin" then -- Paladin
		
	elseif playerClass == "Hunter" then -- Hunter
		
	elseif playerClass == "Rogue" then -- Rogue
		RogueRotation()
	elseif playerClass == "Priest" then -- Priest
		
	elseif playerClass == "Shaman" then -- Shaman
		
	elseif playerClass == "Mage" then -- Mage

	elseif playerClass == "Warlock" then -- Warlock

	elseif playerClass == "Druid" then -- Druid

	end
end


if IsAddOnLoaded("HandsOff") then
	ho:Run()
end

