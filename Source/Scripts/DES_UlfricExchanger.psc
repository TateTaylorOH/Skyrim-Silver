Scriptname DES_UlfricExchanger extends ReferenceAlias  

MiscObject Property Gold001 auto
MiscObject Property DES_Ulfric auto
Location Property WindhelmLocation auto

Actor Property PlayerRef auto

Event OnInit()
	AddInventoryEventFilter(Gold001)
endEvent

Event OnPlayerLoadGame()
	RemoveAllInventoryEventFilters()
	AddInventoryEventFilter(Gold001)
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	IF PlayerRef.IsInLocation(WindhelmLocation)
		IF !aksourceContainer
			if akBaseItem == Gold001
				int count = aiItemCount
				PlayerRef.removeItem(akBaseItem, count, true)
				PlayerRef.addItem(DES_Ulfric, count, true)
			endif
		ENDIF
	ENDIF
EndEvent