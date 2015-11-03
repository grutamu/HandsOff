function ho:Engine()
	-- Hidden Frame
	if Pulse_Engine == nil then
		Pulse_Engine = CreateFrame("Frame", nil, UIParent)
		Pulse_Engine:SetScript("OnUpdate", HandsOffUpdate)
		Pulse_Engine:Show()
	end
end

-- Chat Overlay: Originally written by Sheuron.
local function onUpdate(self,elapsed)
	if self.time < GetTime() - 2.0 then if self:GetAlpha() == 0 then self:Hide(); else self:SetAlpha(self:GetAlpha() - 0.02); end end
end
chatOverlay = CreateFrame("Frame",nil,ChatFrame1)
chatOverlay:SetSize(ChatFrame1:GetWidth(),50)
chatOverlay:Hide()
chatOverlay:SetScript("OnUpdate",onUpdate)
chatOverlay:SetPoint("TOP",0,0)
chatOverlay.text = chatOverlay:CreateFontString(nil,"OVERLAY","MovieSubtitleFont")
chatOverlay.text:SetAllPoints()
chatOverlay.texture = chatOverlay:CreateTexture()
chatOverlay.texture:SetAllPoints()
chatOverlay.texture:SetTexture(0,0,0,.50)
chatOverlay.time = 0
function ChatOverlay(Message, FadingTime)
	chatOverlay:SetSize(ChatFrame1:GetWidth(),50)
	chatOverlay.text:SetText(Message)
	chatOverlay:SetAlpha(1)
	if FadingTime == nil then
		chatOverlay.time = GetTime()
	else
		chatOverlay.time = GetTime() - 2 + FadingTime
	end
	chatOverlay:Show()
end

function frame:OnEvent(event, arg1)
	if event == "ADDON_LOADED" and arg1 == "HandsOff" then
		ho:Run()
	end
end
frame:SetScript("OnEvent", frame.OnEvent)

--[[This function is refired everytime wow ticks. This frame is located in Core.lua]]
function HandsOffUpdate(self)
	
	--[[Class/Spec Selector]]
	local playerClass = select(3,UnitClass("player"))
	if playerClass == 1 then -- Warrior
		
	elseif playerClass == 2 then -- Paladin
		
	elseif playerClass == 3 then -- Hunter
		
	elseif playerClass == 4 then -- Rogue
		
	elseif playerClass == 5 then -- Priest
		
	elseif playerClass == 7 then -- Shaman
		
	elseif playerClass == 8 then -- Mage

	elseif playerClass == 9 then -- Warlock

	elseif playerClass == 11 then -- Druid

	end
end