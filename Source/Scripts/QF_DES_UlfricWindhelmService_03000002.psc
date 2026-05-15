;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DES_UlfricWindhelmService_03000002 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Niranye
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Niranye Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NiranyeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NiranyeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UlfricExchanger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UlfricExchanger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rolff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rolff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hillevi
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hillevi Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmHostler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHostler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AvalAtheron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AvalAtheron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AvalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AvalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HilleviMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HilleviMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExchangerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExchangerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Calixto
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Calixto Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmHostlerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHostlerBackup Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Madran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Madran Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
DES_UlfricExchangerDecreeScene.Stop()

Alias_UlfricExchanger.GetActorRef().EvaluatePackage()

Utility.Wait(1.0)

Alias_Hillevi.trytoClear()
Alias_HilleviMarker.trytoDisable()
Alias_HilleviMarker.GetRef().Delete()
Alias_HilleviMarker.trytoClear()

Utility.Wait(0.5)

Alias_Niranye.trytoClear()
Alias_NiranyeMarker.trytoDisable()
Alias_NiranyeMarker.GetRef().Delete()
Alias_NiranyeMarker.trytoClear()

Utility.Wait(0.5)

Alias_AvalAtheron.trytoClear()
Alias_AvalMarker.trytoDisable()
Alias_AvalMarker.GetRef().Delete()
Alias_AvalMarker.trytoClear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
DES_UlfricExchangerDecreeScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DES_UlfricExchangerDecreeScene  Auto  

Quest Property DES_UlfricWindhelmServices  Auto  

MiscObject Property DES_Ulfric  Auto  
