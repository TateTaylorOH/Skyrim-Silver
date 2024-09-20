Scriptname DES_ExchangeSeptimsFunctions extends Quest Conditional

Actor Property PlayerRef auto
GlobalVariable Property DES_UlfricWorth auto
MiscObject Property DES_Ulfric auto

;--------------------------------------------------
;EXCHANGE FUNCTIONS
;--------------------------------------------------

function ExchangeSeptims(MiscObject Gold, int count)

float worth = DES_UlfricWorth.GetValue()
float convertedcount = count*worth
PlayerRef.RemoveItem(Gold, count)
PlayerRef.AddItem(DES_Ulfric, convertedcount as int)

endfunction

function ExchangeSeptimsForRoom(MiscObject Gold, int count)

float worth = DES_UlfricWorth.GetValue()
float convertedcount = count/worth
PlayerRef.RemoveItem(Gold, convertedcount as int)
PlayerRef.AddItem(DES_Ulfric, count)

endfunction

;--------------------------------------------------
;TUTORIAL QUEST
;--------------------------------------------------

import SEA_BarterFunctions

Event OnCustomBarterMenu(Actor a_kSeller)
	If GetCurrency() == DES_Ulfric
		IF !getStageDone(11) && PlayerRef.GetItemCount(DES_Ulfric) == 0
			setstage(5)
		elseif PlayerRef.GetItemCount(DES_Ulfric) > 0
			setstage(11)
		endif
	ENDIF
endEvent

;--------------------------------------------------
;INTS FOR DIALOGUE CHECKS
;--------------------------------------------------

Int Property DecreeSceneComplete Auto Conditional