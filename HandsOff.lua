ho = {}
ho.enabled = false


function ho:Run()

	--implement readers here
	--ho.read.combatlog()




	-- Macro Toggle ON/OFF
	SLASH_HandsOff1 = "/HandsOff"
	function SlashCmdList.HandsOff(msg, editbox, ...)
	
		if ho.enabled then
			ho.enabled = false
		else
			ho.enabled = true
		end


	end






end