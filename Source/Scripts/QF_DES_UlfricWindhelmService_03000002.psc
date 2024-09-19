;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DES_UlfricWindhelmService_03000002 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WindhelmHostler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHostler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmHostlerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHostlerBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UlfricExchanger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UlfricExchanger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
DES_UlfricExchangerDecreeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(DES_UlfricWindhelmServices as DES_ExchangeSeptimsFunctions).DecreeSceneComplete = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(Alias_Player as DES_UlfricTutorialTracker).GoToState("Waiting")
Alias_Player.RemoveAllInventoryEventFilters()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveDisplayed(5)
(Alias_Player as DES_UlfricTutorialTracker).GoToState("WaitingOnUlfrics")
Alias_Player.AddInventoryEventFilter(DES_Ulfric)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(5)
Alias_Player.RemoveAllInventoryEventFilters()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DES_UlfricExchangerDecreeScene  Auto  

Quest Property DES_UlfricWindhelmServices  Auto  

MiscObject Property DES_Ulfric  Auto  

