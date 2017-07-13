if GetLocale() == "enUS" then

	--Feedback information
	CS_STAT = "caster stat"
	CS_DMG_TOGGLE = "damage"
	CS_HEALING_TOGGLE = "healing"
	CS_FEEDBACK_STATCHANGE = "CS - Primary stat set to"

	--Stat names
	CS_STAT_NAMES = {
		HEAL = "Healing",
		DMG = "Spell Dmg",
		ARCANEDMG = "Arcane Damage",
		FIREDMG = "Fire Damage",
		FROSTDMG = "Frost Damage",
		HOLYDMG = "Holy Damage",
		NATUREDMG = "Nature Damage",
		SHADOWDMG = "Shadow Damage",
		SPELLCRIT = "Spell Critical",
		HOLYCRIT = "Holy Critical",
		SPELLTOHIT = "Chance to Hit with Spells",
		HEALTHREG = "Health Regen",
		MANAREG = "Mana Regen",
		SPELLPEN = "Spell Penetration"
	}

elseif GetLocale() == "ruRU" then

	--Feedback information
	CS_STAT = "параметры заклинателя"
	CS_DMG_TOGGLE = "урон"
	CS_HEALING_TOGGLE = "исцеление"
	CS_FEEDBACK_STATCHANGE = "CS - Основной параметр установлен на "

	--Stat names
	CS_STAT_NAMES = {
		HEAL = "Исцеление",
		DMG = "Урон от закл",
		ARCANEDMG = "Урон от тайной магии",
		FIREDMG = "Урон от магии огня",
		FROSTDMG = "Урон от магии льда",
		HOLYDMG = "Урон от магии Света",
		NATUREDMG = "Урон от природы",
		SHADOWDMG = "Урон от темной магии",
		SPELLCRIT = "Критический удар заклинанием",
		HOLYCRIT = "Крит. светом",
		SPELLTOHIT = "Шанс попадания заклинаниями",
		HEALTHREG = "Восстановление здоровья",
		MANAREG = "Восполнение маны",
		SPELLPEN = "Проникновение заклинаний"
	}

	elseif GetLocale() == "deDE" then
	--Thx to all who worked on this
	--German by Ani, corrected by Natu, corrected and 1.9 modified by Kilworth, corrected by DeviL, corrected by herzausgold, reformatted by RMS

	--Ausgabe
	CS_STAT = "caster stat"
	CS_DMG_TOGGLE = "schaden"
	CS_HEALING_TOGGLE = "heilung"
	CS_FEEDBACK_STATCHANGE = "CS - Neue einstellung: "

	--Stat names
	CS_STAT_NAMES = {
		HEAL = "Heilung",
		DMG = "Zauberschaden ",
		ARCANEDMG = "Arkanzauberschaden",
		FIREDMG = "Feuerzauberschaden",
		FROSTDMG = "Frostzauberschaden",
		HOLYDMG = "Heiligzauberschaden",
		NATUREDMG = "Naturzauberschaden",
		SHADOWDMG = "Schattenzauberschaden",
		SPELLCRIT = "Zauber Krit.",
		HOLYCRIT = "Heilig Krit.",
		SPELLTOHIT = "Chance mit Zaubern zu treffen",
		HEALTHREG = "Gesundheitsregenaration",
		MANAREG = "Mana Regeneration",	
		SPELLPEN = "Zauberdurchschlag"
	}

elseif GetLocale() == "frFR" then
	--Thx nuru. I hope this is still good.

	--Feedback information
	CS_STAT = "Caster stat"
	CS_DMG_TOGGLE = "Degats"
	CS_HEALING_TOGGLE = "Soins"
	CS_FEEDBACK_STATCHANGE = "CS - Primary stat set to"


	--Stat names
	CS_STAT_NAMES = {
		HEAL = "Soin",
		DMG = "D\195\169g\195\162ts des sorts",	
		ARCANEDMG = "D\195\169g\195\162ts d'Arcanes",
		FIREDMG = "D\195\169g\195\162ts de Feu",
		FROSTDMG = "D\195\169g\195\162ts de Froid",
		HOLYDMG = "D\195\169g\195\162ts Sacr\195\169s",
		NATUREDMG = "D\195\169g\195\162ts de Nature",
		SHADOWDMG = "D\195\169g\195\162ts des Ombres",
		SPELLCRIT = "Critiques ",
		HOLYCRIT = "Critiques Sacr\195\169s",
		SPELLTOHIT = "Chances de toucher avec les sorts",
		HEALTHGEN = "R\195\169generation Vie",
		MANAGEN = "R\195\169generation Mana",
		SPELLPEN = "Pénétration de sorts"
	}

end