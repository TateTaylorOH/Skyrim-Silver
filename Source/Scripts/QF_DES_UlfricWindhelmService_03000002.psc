;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF_DES_UlfricWindhelmService_03000002 Extends Quest Hidden Conditional

;BEGIN ALIAS PROPERTY Malborn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Malborn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Madran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Madran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rolff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rolff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UlfricExchanger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UlfricExchanger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmHostler
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHostler Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindhelmHostlerBackup
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindhelmHostlerBackup Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
DecreeSceneComplete = 1
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

Int Property DecreeSceneComplete Auto Conditional
