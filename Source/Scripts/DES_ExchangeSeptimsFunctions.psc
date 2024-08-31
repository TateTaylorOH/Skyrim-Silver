Scriptname DES_ExchangeSeptimsFunctions extends Quest  

Actor Property PlayerRef auto
GlobalVariable Property DES_UlfricWorth auto
MiscObject Property DES_Ulfric auto

function ExchangeSeptims(MiscObject Gold, int count)

float worth = DES_UlfricWorth.GetValue()
float convertedcount = count/worth
PlayerRef.RemoveItem(Gold, count)
PlayerRef.AddItem(DES_Ulfric, convertedcount as int)

endfunction

function ExchangeSeptimsForRoom(MiscObject Gold, int count)

float worth = DES_UlfricWorth.GetValue()
float convertedcount = count*worth
PlayerRef.RemoveItem(Gold, convertedcount as int)
PlayerRef.AddItem(DES_Ulfric, count)

endfunction