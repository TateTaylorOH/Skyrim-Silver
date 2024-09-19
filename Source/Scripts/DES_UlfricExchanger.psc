Scriptname DES_UlfricExchanger extends ReferenceAlias  

MiscObject Property Gold001 auto
MiscObject Property DES_Ulfric auto
GlobalVariable Property DES_UlfricWorth auto
Formlist Property DES_UlfricLocations auto

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
		IF !aksourceContainer
			if akBaseItem == Gold001
				int count = aiItemCount*(DES_UlfricWorth.GetValue() as float)
				PlayerRef.removeItem(akBaseItem, count, true)
				PlayerRef.addItem(DES_Ulfric, count, true)
			endif
		ENDIF
	ENDIF
EndEvent
