Scriptname aaa_InnBathScript extends Quest  

Actor Property PlayerRef  Auto  
MiscObject Property Gold001  Auto  

Function Bathe()
	Spell Blood1 = Game.GetFormFromFile(0x01000809, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Blood2 = Game.GetFormFromFile(0x0100080a, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Blood3 = Game.GetFormFromFile(0x0100080b, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Blood4 = Game.GetFormFromFile(0x01000839, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Dirt1 = Game.GetFormFromFile(0x01000806, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Dirt2 = Game.GetFormFromFile(0x01000807, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Dirt3 = Game.GetFormFromFile(0x01000808, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Dirt4 = Game.GetFormFromFile(0x01000838, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	Spell Clean = Game.GetFormFromFile(0x0100080c, "Dirt and Blood - Dynamic Visuals.esp") as Spell
	If PlayerRef.IsInLocation(WindhelmLocation)
		PlayerRef.Removeitem(DES_Ulfric,25)
	else
		PlayerRef.Removeitem(Gold001, 25)
	endif
	Game.FadeOutGame(false, true, 2.0, 1.0)
	PlayerRef.RemoveSpell(Blood1)
	PlayerRef.RemoveSpell(Blood2)
	PlayerRef.RemoveSpell(Blood3)
	PlayerRef.RemoveSpell(Blood4)
	PlayerRef.RemoveSpell(Dirt1)
	PlayerRef.RemoveSpell(Dirt2)
	PlayerRef.RemoveSpell(Dirt3)
	PlayerRef.RemoveSpell(Dirt4)
	PlayerRef.AddSpell(Clean, false)
EndFunction

MiscObject Property DES_Ulfric  Auto  

Location Property WindhelmLocation  Auto  
