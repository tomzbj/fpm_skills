; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Crystal/Through hole crystal
;Desc:Cylinder type crystal 3x8
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.1 pA=8.0 pB=3.0 pH=2.0 pPad=1.1 pHole=0.4 pName="HC38"
_PrepareNewSym(pName)

;pin
PadN=_PadTH_Default(pPad pHole)
PadS = _PadSMFillet(2.0 2.0)

_CreatePin(PadN -pA/2-1.5:0.8 "1")
_CreatePin(PadN -pA/2-1.5:-0.8 "2")
_CreatePinMechanical(PadS pA/2:0)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB 0:0 0.1) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
