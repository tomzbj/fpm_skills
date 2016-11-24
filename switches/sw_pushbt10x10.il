; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Button
;Desc:Pushbutton 10x10
;Vendor:Kurapica@Foretech Studio
;Count:1

Courtyard=0.5 Pitch=7.50 pL=10.50 pA=10.00 pB=10.00 pH=10.00 pPad=1.85 pHole=1.1 pName="PUSHBT10X10"
_PrepareNewSym(pName)

;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN=_PadTH_Default(pPad pHole)
_CreatePin(PadN1 -Pitch/2:-pL/2 "1")
_CreatePin(PadN Pitch/2:-pL/2 "2")
_CreatePinMechanical(PadN -Pitch/2:pL/2)
_CreatePinMechanical(PadN Pitch/2:pL/2)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB) pH "PUSHBT10x10")

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB 0:0 1) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
