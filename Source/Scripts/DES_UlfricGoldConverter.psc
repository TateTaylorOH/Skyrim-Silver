Scriptname DES_UlfricGoldConverter extends ReferenceAlias  

Quest Property DES_CurrencyFramework auto
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
	(DES_CurrencyFramework as DES_CurrencyFramework_Functions).ConvertCoins(DES_UlfricLocations, akSourceContainer, akBaseItem, Gold001, aiItemCount, DES_UlfricWorth, DES_Ulfric)
EndEvent

