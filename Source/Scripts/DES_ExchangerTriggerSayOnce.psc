Scriptname DES_ExchangerTriggerSayOnce extends ObjectReference  

Actor Property PlayerRef auto
Actor Property DES_UlfricExchangerRef auto
Scene Property DES_UlfricExchangerDecreeScene auto

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == PlayerRef && PlayerRef.GetParentCell() == DES_UlfricExchangerRef.GetParentCell()
		DES_UlfricExchangerDecreeScene.Start()
		Disable()
		Delete()
	ENDIF
ENDEVENT