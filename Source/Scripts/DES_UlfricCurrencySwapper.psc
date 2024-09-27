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

float goldValue

Bool ShouldRevertCurrency
Form LastCurrency

Quest Property DES_UlfricWindhelmServices auto

Import SEA_BarterFunctions 

Event OnInit()
	InitializeThings()
EndEvent

Event OnPlayerGameLoad()
	InitializeThings()
EndEvent

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	int i = DES_UlfricLocations.Find(akNewLoc)
	IF (PlayerRef.IsInLocation(DES_UlfricLocations.GetAt(i) as Location))
	debug.messagebox("We are in Windhelm.")
		IF (PlayerREF.HasPerk(DES_WindhelmPriceAdjustmentPerk))
			PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
		ENDIF
		PlayerREF.AddPerk(DES_WindhelmPriceAdjustmentPerk)
		debug.notification("LastCurrency is " + LastCurrency.GetName())
		IF WindhelmLocation.GetKeywordData(CWOwner) == CWImperial.GetValue() as int
			DES_UlfricWorth.SetValue(2)
			goldValue = 1/DES_UlfricWorth.GetValue() as float
			DES_Ulfric.SetGoldValue(goldValue as int)
			(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as int
		ELSEIF SolitudeLocation.GetKeywordData(CWOwner) == CWSons.GetValue() as int
			DES_UlfricWorth.SetValue(1.0)
			goldValue = 1/DES_UlfricWorth.GetValue() as float 
			DES_Ulfric.SetGoldValue(goldValue as int)
			(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as int
		ELSE
			DES_UlfricWorth.SetValue(1.25)
			goldValue = 1/DES_UlfricWorth.GetValue() as float
			DES_Ulfric.SetGoldValue(goldValue as int)
			(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = goldValue as int
		ENDIF
		ShouldRevertCurrency = False
		IF (!LastCurrency)
			ShouldRevertCurrency = True
		ENDIF
		SetCurrency(DES_Ulfric)
	ELSEIF i == -1
	debug.messagebox("We are not in Windhelm.")
		IF (ShouldRevertCurrency)
			ResetCurrency()
			debug.notification("ResetCurrency")
			LastCurrency = NONE
		ELSE
			SetCurrency(LastCurrency)
			debug.notification("Set Currency to " + LastCurrency.GetName())
		ENDIF
		PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
		LastCurrency = GetCurrency()
	ENDIF
ENDEVENT

Function InitializeThings()
	goldValue = 1/DES_UlfricWorth.GetValue() as float
	DES_Ulfric.SetGoldValue(goldValue as int)
	IF !DES_RentRoomLocationExclusions.HasForm(WindhelmLocation)
		DES_RentRoomLocationExclusions.AddForm(WindhelmLocation)
	ENDIF
endFunction