Scriptname DES_UlfricExchanger extends ReferenceAlias  

Actor Property PlayerRef auto
MiscObject Property Gold001 auto
MiscObject Property DES_Ulfric auto
Location Property WindhelmLocation auto
Actor ref

Event OnInit()
	ref = getReference() as Actor
	AddInventoryEventFilter(Gold001)
endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	IF PlayerRef.GetCurrentLocation() == WindhelmLocation || PlayerRef.GetCurrentLocation() == WindhelmLocation
		if akBaseItem == Gold001
			int count = ref.getItemCount(akBaseItem)
			ref.removeItem(akBaseItem, count, true)
			ref.addItem(DES_Ulfric, count)
		endif
	ENDIF
EndEvent