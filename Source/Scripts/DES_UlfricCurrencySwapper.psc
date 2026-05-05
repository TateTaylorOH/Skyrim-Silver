Scriptname DES_UlfricCurrencySwapper extends ReferenceAlias

DES_CurrencyFramework_Functions Property CurrencyFunctions auto
Actor Property PlayerRef auto
MiscObject Property DES_Ulfric Auto 

;--------------------------------------------------

Formlist Property DES_RentRoomLocationExclusions auto
float goldValue

Function InitializeThings()
	IF !DES_RentRoomLocationExclusions.HasForm(WindhelmLocation)
		DES_RentRoomLocationExclusions.AddForm(WindhelmLocation)
	ENDIF
	goldValue = 1/DES_UlfricWorth.GetValue() as float
	DES_Ulfric.SetGoldValue(goldValue as int)
endFunction

;--------------------------------------------------

Keyword Property CWOwner auto
Location Property WindhelmLocation auto
Location Property SolitudeLocation auto
GlobalVariable Property CWSons auto
GlobalVariable Property CWImperial auto

GlobalVariable Property DES_UlfricWorth auto
GlobalVariable[] Property CostsToUpdate auto
int[] property defaultCosts auto
GlobalVariable Property RoomCost auto
GlobalVariable Property DES_UlfricRoomCost auto
GlobalVariable Property HorseCost auto
GlobalVariable Property DES_UlfricHorseCost auto
Quest property HousePurchase auto

Function UpdateCosts()
	IF WindhelmLocation.GetKeywordData(CWOwner) == CWImperial.GetValue() as int
		DES_UlfricWorth.SetValue(2)
		goldValue = 1/DES_UlfricWorth.GetValue() as float
		DES_Ulfric.SetGoldValue(goldValue as int)
	ELSEIF SolitudeLocation.GetKeywordData(CWOwner) == CWSons.GetValue() as int
		DES_UlfricWorth.SetValue(1.0)
		goldValue = 1/DES_UlfricWorth.GetValue() as float 
		DES_Ulfric.SetGoldValue(goldValue as int)
	ELSE
		DES_UlfricWorth.SetValue(1.25)
		goldValue = 1/DES_UlfricWorth.GetValue() as float
		DES_Ulfric.SetGoldValue(goldValue as int)
	ENDIF
	int i = 0
	while i < CostsToUpdate.Length
		CostsToUpdate[i].SetValue((defaultCosts[i])*(DES_UlfricWorth.GetValue()))
		HousePurchase.UpdateCurrentInstanceGlobal(CostsToUpdate[i])
		i += 1
	endwhile
	DES_UlfricRoomCost.SetValue(RoomCost.GetValue()*DES_UlfricWorth.GetValue())
	GetOwningQuest().UpdateCurrentInstanceGlobal(DES_UlfricRoomCost)
	DES_UlfricHorseCost.SetValue(HorseCost.GetValue()*DES_UlfricWorth.GetValue())
	GetOwningQuest().UpdateCurrentInstanceGlobal(DES_UlfricHorseCost)
endFunction

;--------------------------------------------------

Event OnInit()
	InitializeThings()
EndEvent

;--------------------------------------------------

Event OnPlayerGameLoad()
	InitializeThings()
EndEvent

;--------------------------------------------------

Formlist Property DES_UlfricLocations auto
Perk Property DES_WindhelmPriceAdjustmentPerk auto

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	UpdateCosts()
	CurrencyFunctions.SwapCurrency(DES_UlfricLocations, DES_WindhelmPriceAdjustmentPerk, DES_Ulfric)
ENDEVENT
