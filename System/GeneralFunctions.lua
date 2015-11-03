if not FuncLoaded then
	FuncLoaded = true

	function DebugPrint(s)
		if debug then
		end
	end

	function chatPrint(...)
		if ( DEFAULT_CHAT_FRAME ) then
			local msg = ""
			for i=1, table.getn(arg) do
				if i==1 then msg = arg[i]
				else msg = msg.." "..arg[i]
				end
			end
			DEFAULT_CHAT_FRAME:AddMessage(msg, 1.0, 0.35, 0.15)
		end
	end
	
	function CalculateHP(t)
		local ActualWithIncoming = 100 * UnitHealth(t) / UnitHealthMax(t)
		if ActualWithIncoming then
			return ActualWithIncoming
		else
			return 100
		end
	end
		
	function CanHeal(t)
		if not UnitIsCharmed(t) 
		and not UnitIsDeadOrGhost(t) then
			return true 
		end 
	end

	--New Healing Engine
	function SheuronEngine(MO, TARGETHEAL, LOWHP, HEALPET)
		local MouseoverCheck = MO or false
		local LowHPTarget = LOWHP or 80
		local TargetHealCheck = TARGETHEAL or false
		local HEALPET = HEALPET or true
		lowhpmembers = 0
		
		playerHP = CalculateHP("player")
			
		members = { { 	
			Unit = "player", 
			HP = playerHP, 
			GUID = UnitGUID("player"), 
			IsPlayer = true, 
			} } 
			
		--Adding player to low hp table
		if playerHP < LowHPTarget then
			lowhpmembers = lowhpmembers + 1
		end	
			
			
		local group = "party"
		local groupmembers = GetNumPartyMembers()

		if GetNumRaidMembers() > 0 then
			group = "raid"
			groupmembers = GetNumRaidMembers()
		end
			
			
		for i = 1, groupmembers do 
			local member, memberhp, uidmember = group..i, CalculateHP(group..i), UnitGUID(group..i)	
			-- Checking all Party/Raid Members for Range/Health
			if ((UnitExists(member) and CanHeal(member)) or UnitIsUnit("player",member))
			and member ~= nil and memberhp ~= nil and uidmember ~= nil then 	
				table.insert( members,{ Unit = member, HP = memberhp, GUID = uidmember, IsPlayer = true } ) 
					
				-- Setting Low HP Members variable for AoE Healing
				if memberhp < LowHPTarget then
					lowhpmembers = lowhpmembers + 1
				end	
			end 
				
			-- Checking Pets in the group
			if HEALPET and lowhpmembers == 0 and UnitExists(group..i.."pet") and CanHeal(group..i.."pet") then
				local memberpet, memberpethp,  uidmemberpet = nil, nil, nil
				memberpet = group..i.."pet" 
				memberpethp = CalculateHP(memberpet)		
				uidmemberpet = UnitGUID(memberpet)
						
				if memberpet ~= nil and memberpethp ~= nil and uidmemberpet ~= nil then
					table.insert(members, { Unit = memberpet, HP = memberpethp, GUID = uidmemberpet, IsPlayer = false } )
				end			
			end
		end 
		-- Checking Priority Targeting
		if TargetHealCheck and CanHeal("target") then
			table.sort(members, function(x) return UnitIsUnit("target",x.Unit) end)
		elseif MouseoverCheck and CanHeal("mouseover") and GetMouseFocus() ~= WorldFrame then
			table.sort(members, function(x) return UnitIsUnit("mouseover",x.Unit) end)
		end
	end


	--CastSpell--
	function _castSpell(spellid,tar)
		if UnitCastingInfo("player") == nil
		and UnitChannelInfo("player") == nil
		--and IsPlayerSpell(spellid) == true
		and cdRemains(spellid) == 0
		then
			if tar ~= nil
			and rangeCheck(spellid,tar) == nil
				then
				return false
			elseif tar ~= nil
			and rangeCheck(spellid,tar) == true
				then
				CastSpellByID(spellid, tar)
				return true
			elseif tar == nil
				then
				CastSpellByID(spellid)
				return true
			else
		return false
		end
	end
	end
	
	
	--Combat Check--
	function inCombat()
	if UnitAffectingCombat("player") ~= nil
		then
			return true
		end
	end
	
	--Get HP simple--
	function getHp(unit)
	if UnitExists(unit) ~= nil
		then
			return 100 * UnitHealth(unit) / UnitHealthMax(unit)
		end
	end
	
	--Range Check Simple--
	function rangeCheck(spellid,unit)
	if IsSpellInRange(GetSpellInfo(spellid),unit) == 1
	then
		return true
	end
	end
	
	
	--Amount of Cooldown that remains--
	function cdRemains(spellid)
		if select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime()) > 0
			then return select(2,GetSpellCooldown(spellid)) + (select(1,GetSpellCooldown(spellid)) - GetTime())
		else return 0
		end
	end


	


--End for FuncLoad
end