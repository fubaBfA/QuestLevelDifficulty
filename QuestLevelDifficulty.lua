local addonName = ...

local isClassicWow = select(4,GetBuildInfo()) < 20000

hooksecurefunc('QuestLog_UpdateQuestDetails', function()
	local questSelected = GetQuestLogSelection();
	local questTitle, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isBounty, isStory, isHidden, isScaling = GetQuestLogTitle(questSelected);
	if not isHeader and tonumber(level) > 0 then
		local color_impossible = GetRelativeDifficultyColor(level-5, level)
		local color_verydifficult = GetRelativeDifficultyColor(level-4, level)
		local color_difficult = GetRelativeDifficultyColor(level-2, level)
		local color_standard = GetRelativeDifficultyColor(level+3, level)
		local color_trivial = GetRelativeDifficultyColor(level+GetQuestGreenRange()+1, level)

		--local text_impossible = format("\124cff%.2x%.2x%.2x[<%d]\124r", color_impossible.r*255, color_impossible.g*255, color_impossible.b*255, (level-4))
		local text_verydifficult = format("\124cff%.2x%.2x%.2x[%d]\124r", color_verydifficult.r*255, color_verydifficult.g*255, color_verydifficult.b*255, (level-4))
		local text_difficult = format("\124cff%.2x%.2x%.2x[%d]\124r", color_difficult.r*255, color_difficult.g*255, color_difficult.b*255, (level-2))
		local text_standard = format("\124cff%.2x%.2x%.2x[%d]\124r", color_standard.r*255, color_standard.g*255, color_standard.b*255, (level+3))
		local text_trivial = format("\124cff%.2x%.2x%.2x[%d]\124r", color_trivial.r*255, color_trivial.g*255, color_trivial.b*255, (level+GetQuestGreenRange()+1))

		local questDescription, questObjectives = GetQuestLogQuestText();
		if ( questDescription ) then
			--QuestLogQuestDescription:SetText(text_impossible.." "..text_verydifficult.." "..text_difficult.." "..text_standard.." "..text_trivial.."\n\n"..questDescription);
			QuestLogQuestDescription:SetText(text_verydifficult.." "..text_difficult.." "..text_standard.." "..text_trivial.."\n\n"..questDescription);
			QuestFrame_SetAsLastShown(QuestLogQuestDescription);
		end
	end
end)