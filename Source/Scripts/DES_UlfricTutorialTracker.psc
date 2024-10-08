Scriptname DES_UlfricTutorialTracker   extends ReferenceAlias

miscobject property DES_ulfric auto

import SEA_BarterFunctions

Event OnInit()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())
endevent

Event OnPlayerGameLoad()
	SEA_BarterFunctions.RegisterFormForAllEvents(getowningquest())
endevent

auto state Waiting
endState

state WaitingOnUlfrics

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if !getOwningQuest().IsStageDone(11) && getOwningQuest().IsStageDone(5) && akBaseItem == DES_ulfric
		getOwningQuest().SetStage(10)
	endif
endevent

endState
