Scriptname DES_UlfricCurrencySwapper extends ReferenceAlias

Actor Property PlayerREF Auto
MiscObject Property DES_Ulfric Auto 
Perk Property DES_WindhelmPriceAdjustmentPerk auto

GlobalVariable Property DES_UlfricWorth auto
GlobalVariable Property CWSons auto
GlobalVariable Property CWImperial auto
Location Property WindhelmLocation auto
Location Property SolitudeLocation auto
Keyword Property CWOwner auto

Formlist Property DES_RentRoomLocationExclusions auto
Formlist Property DES_UlfricLocations auto
GlobalVariable Property RoomCost auto
GlobalVariable Property DES_UlfricRoomCost auto
GlobalVariable[] Property CostsToUpdate auto
GlobalVariable Property HorseCost auto
GlobalVariable Property DES_UlfricHorseCost auto
int[] property defaultCosts auto

float goldValue

GlobalVariable Property DES_CurrencyIsReverting auto

Quest Property DES_CurrencyFramework auto
Quest property HousePurchase auto

Import SEA_BarterFunctions 

Event OnInit()
	InitializeThings()
EndEvent

Event OnPlayerGameLoad()
	InitializeThings()
EndEvent

Function InitializeThings()
	IF !DES_RentRoomLocationExclusions.HasForm(WindhelmLocation)
		DES_RentRoomLocationExclusions.AddForm(WindhelmLocation)
	ENDIF
	goldValue = 1/DES_UlfricWorth.GetValue() as float
	DES_Ulfric.SetGoldValue(goldValue as int)
	(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as float
endFunction

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	(DES_CurrencyFramework as DES_CurrencyFramework_Functions).SwapCurrency(DES_UlfricLocations, DES_WindhelmPriceAdjustmentPerk, DES_Ulfric)
	IF WindhelmLocation.GetKeywordData(CWOwner) == CWImperial.GetValue() as int
		DES_UlfricWorth.SetValue(2)
		goldValue = 1/DES_UlfricWorth.GetValue() as float
		DES_Ulfric.SetGoldValue(goldValue as int)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as float
	ELSEIF SolitudeLocation.GetKeywordData(CWOwner) == CWSons.GetValue() as int
		DES_UlfricWorth.SetValue(1.0)
		goldValue = 1/DES_UlfricWorth.GetValue() as float 
		DES_Ulfric.SetGoldValue(goldValue as int)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as float
	ELSE
		DES_UlfricWorth.SetValue(1.25)
		goldValue = 1/DES_UlfricWorth.GetValue() as float
		DES_Ulfric.SetGoldValue(goldValue as int)
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as float
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
ENDEVENT