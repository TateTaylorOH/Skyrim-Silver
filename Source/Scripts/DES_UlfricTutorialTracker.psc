Scriptname DES_UlfricTutorialTracker   extends ReferenceAlias

miscobject property DES_ulfric auto

auto state Waiting
endState

state WaitingOnUlfrics

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if !getOwningQuest().IsStageDone(11) && getOwningQuest().IsStageDone(5) && akBaseItem == DES_ulfric
		getOwningQuest().SetStage(10)
	endif
endevent

endState
