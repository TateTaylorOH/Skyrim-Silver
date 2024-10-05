Scriptname DES_UlfricCurrencySwapper extends ReferenceAlias

Actor Property PlayerREF Auto
Form Property DES_Ulfric Auto 
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

Quest Property DES_UlfricWindhelmServices auto
Quest property HousePurchase auto

Import SEA_BarterFunctions 

Event OnInit()
	InitializeThings()
EndEvent

Event OnPlayerGameLoad()
	InitializeThings()
EndEvent

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	IF (DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation())) || (DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent()))
		RegisterForSingleUpdate(1)
	ELSE
		;debug.messagebox("We are not in Windhelm.")
		IF GetCurrency() == DES_Ulfric
			DES_CurrencyIsReverting.SetValue(1)
			;debug.notification("UlfricMod: CurrencyIsReverting = " + DES_CurrencyIsReverting.GetValue())
			ResetCurrency()
			;debug.notification("UlfricMod: ResetCurrency")
			PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
			DES_CurrencyIsReverting.SetValue(0)
			;debug.notification("UlfricMod: CurrencyIsReverting = " + DES_CurrencyIsReverting.GetValue())
		ENDIF
	ENDIF
ENDEVENT

event OnUpdate()
	SwapToUlfrics()
endEvent

Function SwapToUlfrics()
	;debug.messagebox("We are in Windhelm.")
	while DES_CurrencyIsReverting.GetValue() == 1
		utility.wait(0.1)
		;debug.notification("UlfricMod: Waiting to swap")
	endwhile
	IF (PlayerREF.HasPerk(DES_WindhelmPriceAdjustmentPerk))
		PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
	ENDIF
	PlayerREF.AddPerk(DES_WindhelmPriceAdjustmentPerk)
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
	DES_UlfricWindhelmServices.UpdateCurrentInstanceGlobal(DES_UlfricRoomCost)
	DES_UlfricHorseCost.SetValue(HorseCost.GetValue()*DES_UlfricWorth.GetValue())
	DES_UlfricWindhelmServices.UpdateCurrentInstanceGlobal(DES_UlfricHorseCost)
	SetCurrency(DES_Ulfric)
	;debug.notification("UlfricMod: Swapped")
EndFunction

Function InitializeThings()
	IF !DES_RentRoomLocationExclusions.HasForm(WindhelmLocation)
		DES_RentRoomLocationExclusions.AddForm(WindhelmLocation)
	ENDIF
	goldValue = 1/DES_UlfricWorth.GetValue() as float
	DES_Ulfric.SetGoldValue(goldValue as int)
	(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as float
endFunction