Scriptname DES_ExchangerTriggerSayOnce extends ObjectReference  

Actor Property PlayerRef auto
Actor Property DES_UlfricExchangerRef auto
Scene Property DES_UlfricExchangerDecreeScene auto
ObjectReference Property xMarkerHeading auto

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == PlayerRef 
		DES_UlfricExchangerDecreeScene.Start()
		xMarkerHeading.Disable()
		xMarkerHeading.Delete()
		Disable()
		Delete()
	endif
ENDEVENT