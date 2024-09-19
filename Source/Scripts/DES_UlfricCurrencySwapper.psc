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
	IF DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation()) || DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent()) 
	;debug.messagebox("We are in Windhelm.")
		IF (PlayerREF.HasPerk(DES_WindhelmPriceAdjustmentPerk))
			PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
		ENDIF
		PlayerREF.AddPerk(DES_WindhelmPriceAdjustmentPerk)
		;debug.notification("LastCurrency is " + LastCurrency.GetName())
		IF WindhelmLocation.GetKeywordData(CWOwner) == CWImperial.GetValue() as int
			DES_UlfricWorth.SetValue(2)
		ELSEIF SolitudeLocation.GetKeywordData(CWOwner) == CWSons.GetValue() as int
			DES_UlfricWorth.SetValue(1.0)
		ELSE
			DES_UlfricWorth.SetValue(1.25)
		ENDIF
		(Quest.GetQuest("DES_CoinHandler") as DES_DefaultCoins).UlfricValue = (DES_UlfricWorth.getValue() as float)
		DES_Ulfric.SetGoldValue(DES_UlfricWorth.getValue() as int)
		ShouldRevertCurrency = False
		IF (!LastCurrency)
			ShouldRevertCurrency = True
		ENDIF
		SetCurrency(DES_Ulfric)
	ELSEIF !DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation()) && !DES_UlfricLocations.HasForm(PlayerRef.GetCurrentLocation().GetParent()) 
	;debug.messagebox("We are not in Windhelm.")
		IF (ShouldRevertCurrency)
			ResetCurrency()
			;debug.notification("ResetCurrency")
		ELSE
			SetCurrency(LastCurrency)
			;debug.notification("Set Currency to " + LastCurrency.GetName())
		ENDIF
		PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
		LastCurrency = GetCurrency()
	ENDIF
ENDEVENT

Function InitializeThings()
	DES_Ulfric.SetGoldValue(DES_UlfricWorth.getValue() as int)
	IF !DES_RentRoomLocationExclusions.HasForm(WindhelmLocation)
		DES_RentRoomLocationExclusions.AddForm(WindhelmLocation)
	ENDIF
endFunction