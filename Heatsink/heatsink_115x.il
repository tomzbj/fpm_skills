; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Heatsink/Heatsink for CPU
;Desc:Heatsink for LGA115x CPUs 
;Vendor:stavrosatic@gmail.com
;Count:1

pA=95 pB=95 pH=80 pPad=6.0 pHole=4.0 Courtyard=0.5 pName="HEATSINK_115X"
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
_CreatePin(PadN -37.5:-37.5 1)
_CreatePin(PadN  37.5:-37.5 2)
_CreatePin(PadN -37.5:37.5 3)
_CreatePin(PadN  37.5:37.5 4)

for(asm 0 1
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;≤„«–ªª 
    _Rectangle(pA pB)
    _Circle(15)
)

_CreateRefValue(pName)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
