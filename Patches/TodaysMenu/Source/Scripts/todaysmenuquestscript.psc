Scriptname TodaysMenuQuestScript extends Quest  

Actor Property PlayerRef  Auto

MiscObject Property Gold001  Auto
MiscObject Property DES_Ulfric  Auto

Spell Property MenuSoldAbility Auto

GlobalVariable Property MenuPriceInns  Auto

LeveledItem Property LItemFoodMenuInnsCommon     Auto
LeveledItem Property LItemFoodMenuInnsWhiterun   Auto
LeveledItem Property LItemFoodMenuInnsRiften     Auto
LeveledItem Property LItemFoodMenuInnsSolitude   Auto
LeveledItem Property LItemFoodMenuInnsMarkarth   Auto
LeveledItem Property LItemFoodMenuInnsSolstheim  Auto

Location Property WhiterunLocation       Auto
Location Property RiftenLocation         Auto
Location Property SolitudeLocation       Auto
Location Property MarkarthLocation       Auto
Location Property DLC2SolstheimLocation  Auto
Location Property WindhelmLocation  Auto

GlobalVariable Property TGHonningbrewActive Auto

Function SellMenu(Actor akSeller)

	Location kmyLocation = akSeller.GetCurrentLocation()
	
	if (PlayerRef.IsInLocation(WindhelmLocation))
		PlayerRef.RemoveItem(DES_Ulfric, GetLocationPrice(kmyLocation))
	else
		PlayerRef.RemoveItem(Gold001, GetLocationPrice(kmyLocation))
	endif
	PlayerRef.AddItem(GetLocationMenu(kmyLocation))

	akSeller.AddSpell(MenuSoldAbility, false)
	
EndFunction

LeveledItem Function GetLocationMenu(Location akLocation)

	If WhiterunLocation.IsChild(akLocation)
		If TGHonningbrewActive.GetValue() == 0
			Return LItemFoodMenuInnsWhiterun
		Else
			Return LItemFoodMenuInnsCommon
		EndIf
	ElseIf RiftenLocation.IsChild(akLocation)
		Return LItemFoodMenuInnsRiften
	ElseIf SolitudeLocation.IsChild(akLocation)
		Return LItemFoodMenuInnsSolitude
	ElseIf MarkarthLocation.IsChild(akLocation)
		Return LItemFoodMenuInnsMarkarth
	ElseIf DLC2SolstheimLocation.IsChild(akLocation)
		Return LItemFoodMenuInnsSolstheim
	Else
		Return LItemFoodMenuInnsCommon
	EndIf

EndFunction

Int Function GetLocationprice(Location akLocation)
	; Not really worth customizing for now.
	Return MenuPriceInns.GetValueInt()
EndFunction
  

  
