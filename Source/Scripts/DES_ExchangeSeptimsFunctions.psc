Scriptname DES_ExchangeSeptimsFunctions extends Quest  

Actor Property PlayerRef auto
GlobalVariable Property DES_UlfricWorth auto
MiscObject Property DES_Ulfric auto

function ExchangeSeptims(MiscObject Gold, int count)

PlayerRef.RemoveItem(Gold, count)
float worth = DES_UlfricWorth.GetValue()
float convertedcount = count/worth
PlayerRef.AddItem(DES_Ulfric, convertedcount as int)

endfunction