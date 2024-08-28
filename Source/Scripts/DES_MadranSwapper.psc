Scriptname DES_MadranSwapper extends ReferenceAlias

Actor Property PlayerRef auto
MiscObject Property Gold001 auto
Location Property WindhelmLocation auto
Perk Property DES_WindhelmPriceAdjustmentPerk auto

Bool ShouldRevertCurrency
Form LastCurrency

Import SEA_BarterFunctions 

EVENT OnActivate(ObjectReference akActionRef)
	IF PlayerRef.GetCurrentLocation() == WindhelmLocation || PlayerRef.GetCurrentLocation() == WindhelmLocation
		LastCurrency = GetCurrency()
		;debug.notification("(Ma'dran) LastCurrency is " + LastCurrency.GetName())
		IF (ShouldRevertCurrency)
			ResetCurrency()
		ELSE
			SetCurrency(Gold001)
		ENDIF
		PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
	ENDIF
	RegisterForMenu("Dialogue Menu")
ENDEVENT

EVENT OnMenuClose(String MenuName)
	IF MenuName == "Dialogue Menu" && (PlayerRef.GetCurrentLocation()  == WindhelmLocation || PlayerRef.GetCurrentLocation() == WindhelmLocation)
		ShouldRevertCurrency = False
		IF (!LastCurrency)
			ShouldRevertCurrency = True
		ENDIF
		SetCurrency(LastCurrency)
		;debug.notification("(Ma'dran) Currency set to " + LastCurrency.GetName())
		IF (PlayerREF.HasPerk(DES_WindhelmPriceAdjustmentPerk))
			PlayerREF.RemovePerk(DES_WindhelmPriceAdjustmentPerk)
		ENDIF
		PlayerREF.AddPerk(DES_WindhelmPriceAdjustmentPerk)
	ENDIF
	UnregisterForMenu("Dialogue Menu")
ENDEVENT