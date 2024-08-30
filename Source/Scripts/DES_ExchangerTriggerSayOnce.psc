Scriptname DES_ExchangerTriggerSayOnce extends ObjectReference  

Actor Property PlayerRef auto
Actor Property DES_UlfricExchangerRef auto
Topic Property DES_UlfricExchangerIdle auto

EVENT onTriggerEnter(objectReference triggerRef)
	if triggerRef == PlayerRef && PlayerRef.GetParentCell() == DES_UlfricExchangerRef.GetParentCell()
		DES_UlfricExchangerRef.Say(DES_UlfricExchangerIdle)
		Disable()
		Delete()
	ENDIF
ENDEVENT