; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transistor/Through hole transistor
;Desc:TO225-3pin
;Vendor: stavrosatic@gmail.com
;Count:1

pA=7.6 pB=2.5 pH=11.0 pPad=1.5 pHole=0.8 Courtyard=0.2 Pitch=2.3 pName="TO225"
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole) 
_CreatePin(PadN -Pitch:0 "1")
_CreatePin(PadN 0:0  "2")
_CreatePin(PadN Pitch:0 "3")

;Place²ã
_Layer(lPkgGeoPlaceT) ;ÇÐ»»µ½PlaceTop²ã
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)
_Layer(lPkgGeoDfaT) ;ÇÐ»»µ½PlaceTop²ã
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

for(asm 0 1 ;Ë¿Ó¡ºÍ×°Åä²ã
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB)
)

_CreateRefValue(pName) 
_SaveDesign(pName)
_MakeDevice(pName,2)
