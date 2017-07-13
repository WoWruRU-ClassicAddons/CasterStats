---------------------------------------------------
-- Caster Stats v0.9.5.1 by RMS 
---------------------------------------------------

reportThis = 0

local casterStats = {
	stats = {},
	statTypes = {
		'HEAL',			-- healing 
		'DMG',			-- spell damage
		'ARCANEDMG',	-- arcane spell damage
		'FIREDMG',		-- fire spell damage
		'FROSTDMG',		-- frost spell damage
		'HOLYDMG',		-- holy spell damage
		'NATUREDMG',	-- nature spell damage
		'SHADOWDMG',	-- shadow spell damage
		'SPELLCRIT',	-- chance to crit with spells
		'HOLYCRIT',		-- chance to crit with holy spells
		'HEALTHREG',	-- health regeneration per 5 sec.
		'MANAREG',		-- mana regeneration per 5 sec.
		'SPELLTOHIT',	-- spell chance to hit
		'SPELLPEN'		-- spell penetration
	}
}

function CS_OnLoad()
	-- Register the command prompt command
	SLASH_CSTATS1 = "/cstats"	
	SlashCmdList["CSTATS"] = CS_CommandHandler
	
	-- Hook the Bonus Scanner function
	BonusScanner_Update = UpdateCS
end


-- Rescan the inventory
function UpdateCS() 
	local class
	_, class = UnitClass("player")
	
	-- Only update if the Character Frame is visible to the user
	if CharacterFrame:IsVisible() and class ~= "ROGUE" and class ~= "WARRIOR" then
		-- Reacquire the stats information
		for i, type in casterStats.statTypes do
			casterStats.stats[type] = BonusScanner:GetBonus(type)
		end
		
		if ThereAreStats() or 1 then
			SetFrameValues()
		else
			ClearFrameValues()
		end
	end
end


-- Setup and show the tooltip on mouse over
function CSFrame_OnEnter()
	local class
	_, class = UnitClass("player")
	
	if class ~= "ROGUE" and class ~= "WARRIOR" then
		GameTooltip:SetOwner(this, "ANCHOR_RIGHT")
		GameTooltip:SetText("Caster Stats", 1, 1, 1)
		
		-- Loop through all the stats and add the ones that exist to the tooltip
		for i, type in casterStats.statTypes do
			if casterStats.stats[type] ~= 0 then
				if string.find(type, ".+DMG") then
					GameTooltip:AddDoubleLine(CS_STAT_NAMES[type]..":", "(+"..casterStats.stats[type]..") +"..(casterStats.stats[type] + casterStats.stats['DMG']), NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0, 1, 0)
					-- Check for SPELLPEN TYPE.
				elseif string.find(type, "SPELLPEN") then
					GameTooltip:AddDoubleLine(CS_STAT_NAMES[type]..":", "+"..casterStats.stats[type], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0, 1, 0)
					-- Check for REGEN TYPE.
				elseif string.find(type, "REG") then
					GameTooltip:AddDoubleLine(CS_STAT_NAMES[type]..":", casterStats.stats[type].."/5s", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0, 1, 0)
					-- Check for CRIT/HIT TYPE.
				elseif string.find(type, "CRIT") or string.find(type, "HIT") then
					GameTooltip:AddDoubleLine(CS_STAT_NAMES[type]..":", "+"..casterStats.stats[type].."%", NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0, 1, 0)
					-- No special output
				else
					-- Check if it is the healing stat and only display it if it is a healing class
					if string.find(type, "HEAL") then
						if class == "DRUID" or class == "PRIEST" or class == "PALADIN" or class == "SHAMAN" then
							GameTooltip:AddDoubleLine(CS_STAT_NAMES[type]..":", "+"..casterStats.stats[type], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0, 1, 0)
						end
					else
						GameTooltip:AddDoubleLine(CS_STAT_NAMES[type]..":", "+"..casterStats.stats[type], NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b, 0, 1, 0)
					end
				end
			end
		end
		
		GameTooltip:Show()
	end
end


-- Populate the frame
function SetFrameValues()
	local unit = "player"
	local label = getglobal("CSFrameLabel")
	local text = getglobal("CSFrameStatText")
	text:SetTextColor(0, 1, 0, 1)
	
	CharacterAttributesFrame:SetPoint("TOPLEFT", "PaperDollFrame", "TOPLEFT", 67, -279)
	PlayerStatBackgroundMiddle:SetHeight(65)
	
	if reportThis == 1 then
		label:SetText(CS_STAT_NAMES['HEAL']..":")
		text:SetText("+"..casterStats.stats['HEAL'])
	else
		label:SetText(CS_STAT_NAMES['DMG']..":")
		text:SetText("+"..casterStats.stats['DMG'])
	end
end


-- Empty the frame
function ClearFrameValues()
	local label = getglobal("CSFrameLabel")
	local text = getglobal("CSFrameStatText")
	
	label:SetText("")
	text:SetText("")
end


-- Returns true if at least 1 stat has been recorded
function ThereAreStats()
	for i, currentStat in casterStats.stats do
		if currentStat ~= 0 then
			return true
		end
	end
end


-- Handles the command line
function CS_CommandHandler(msg)
	if msg == CS_DMG_TOGGLE then
		reportThis = 0
		UpdateCS()
		DEFAULT_CHAT_FRAME:AddMessage(CS_FEEDBACK_STATCHANGE.." \""..CS_DMG_TOGGLE.."\"")
	elseif msg == CS_HEALING_TOGGLE then
		reportThis = 1
		UpdateCS()
		DEFAULT_CHAT_FRAME:AddMessage(CS_FEEDBACK_STATCHANGE.." \""..CS_HEALING_TOGGLE.."\"")
	else
		if(reportThis == 0) then
			reportThis = 1
		else
			reportThis = 0
		end	
	end
end