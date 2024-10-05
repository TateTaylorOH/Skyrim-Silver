;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname MAG_QF_CandlehearthUlfrics_DynamicP Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MAG_RoomCostWindhelm.SetValue(MAG_RoomCostCapital.GetValue()*DES_UlfricWorth.GetValue())
MAG_RoomCostWindhelmWeekly.SetValue(MAG_RoomCostCapitalWeekly.GetValue()*DES_UlfricWorth.GetValue())
MAG_RoomCostWindhelmMonthly.SetValue(MAG_RoomCostCapitalMonthly.GetValue()*DES_UlfricWorth.GetValue())
MAG_CandlehearthWindhelmControllerQuest.UpdateCurrentInstanceGlobal(MAG_RoomCostWindhelm)
MAG_CandlehearthWindhelmControllerQuest.UpdateCurrentInstanceGlobal(MAG_RoomCostWindhelmWeekly)
MAG_CandlehearthWindhelmControllerQuest.UpdateCurrentInstanceGlobal(MAG_RoomCostWindhelmMonthly)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DES_UlfricWorth Auto
GlobalVariable Property MAG_RoomCostWindhelm Auto
GlobalVariable Property MAG_RoomCostWindhelmWeekly Auto
GlobalVariable Property MAG_RoomCostWindhelmMonthly Auto
GlobalVariable Property MAG_RoomCostCapital Auto
GlobalVariable Property MAG_RoomCostCapitalWeekly Auto
GlobalVariable Property MAG_RoomCostCapitalMonthly Auto

Quest Property MAG_CandlehearthWindhelmControllerQuest Auto  
