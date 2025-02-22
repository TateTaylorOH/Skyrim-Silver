Scriptname DES_UlfricExchanger extends ReferenceAlias  

MiscObject Property Gold001 auto
MiscObject Property DES_Ulfric auto
GlobalVariable Property DES_UlfricWorth auto
Formlist Property DES_UlfricLocations auto
GlobalVariable Property DES_ConvertCoins auto

Actor Property PlayerRef auto

Event OnInit()
	AddInventoryEventFilter(Gold001)
endEvent

Event OnPlayerLoadGame()
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(Gold001)
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	IF DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation()) || DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent())
		IF !aksourceContainer && DES_ConvertCoins.GetValue() > 0
			if akBaseItem == Gold001
				float count = aiItemCount*DES_UlfricWorth.GetValue()
				PlayerRef.removeItem(akBaseItem, aiItemCount as int, true)
				PlayerRef.addItem(DES_Ulfric, count as int, true)
			endif
		ENDIF
	ENDIF
EndEvent
