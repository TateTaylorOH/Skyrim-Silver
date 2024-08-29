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

Bool ShouldRevertCurrency
Form LastCurrency

Import SEA_BarterFunctions 

EVENT OnLocationChange(Location akOldLoc, Location akNewLoc)
	IF akNewLoc == WindhelmLocation || akNewLoc.GetParent() == WindhelmLocation
	;debug.messagebox("We are in Windhelm.")
		IF (PlayerREF.HasPerk(DES_WindhelmPriceAdjustmentPerk))
			PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
		ENDIF
		PlayerREF.AddPerk(DES_WindhelmPriceAdjustmentPerk)
		;debug.notification("LastCurrency is " + LastCurrency.GetName())
		IF WindhelmLocation.GetKeywordData(CWOwner) == CWImperial.GetValue() as int
			DES_UlfricWorth.SetValue(0.5)
		ELSEIF SolitudeLocation.GetKeywordData(CWOwner) == CWSons.GetValue() as int
			DES_UlfricWorth.SetValue(1.0)
		ELSE
			DES_UlfricWorth.SetValue(0.8)
		ENDIF
		ShouldRevertCurrency = False
		IF (!LastCurrency)
			ShouldRevertCurrency = True
		ENDIF
		SetCurrency(DES_Ulfric)
	ELSEIF akNewLoc != WindhelmLocation && akNewLoc.GetParent() != WindhelmLocation
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
