; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/7 Segment LCD Display
;Desc:4 digits, 7 Segment LCD Display, 34mm x 23.5mm, 13+2pins
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=34.0 pB=23.5 pH=10.0 pitch=2.54 pName="LCD5004"

_PrepareNewSym(pName)

PadN   = _PadTH_Default(1.5 0.9)
PadN1  = _PadTH_Default(1.5 0.9 t)

;pin
for(i 1 10
    if(i == 1
        _CreatePin(PadN1 i*2.54-pA/2+1.76 : pB/2-1.5 i)
        _CreatePin(PadN  i*2.54-pA/2+1.76 : pB/2-1.5 i)
    )
)
_CreatePin(PadN -pA/2+1.76:-pB/2+1.5 11)
_CreatePin(PadN  pA/2-1.76:-pB/2+1.5 12)

_CreatePinMechanical(PadN -pA/2+1.76: pB/2-1.5)
_CreatePinMechanical(PadN  pA/2-1.76: pB/2-1.5) 
_CreatePinMechanical(PadN  pA/2-4.30: pB/2-1.5)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA 3 0:pB/2-1.5) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA 3 0:pB/2-1.5) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
