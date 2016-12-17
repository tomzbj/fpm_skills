; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Character LCD Module
;Desc:16 cols x 2 rows LCD Module 
;Vendor:stavrosatic@gmail.com
;Count:1


Courtyard=0.2 pA=80.0 pB=36.0 pH=10.0 pitch=2.54 pName="LCD1602"

_PrepareNewSym(pName) 
PadN   = _PadTH_Default(1.5 0.9)
PadN1  = _PadTH_Default(1.5 0.9 t)
PadM   = _PadTH_Default(0.1 3.0)

;pin
for(i 1 16
    if(i==1 pad=PadN1 pad=PadN)
    _CreatePin(pad (i-1)*2.54-pA/2+8.0:pB/2-2.4 i)
)
_CreatePinMechanical(PadM 37.5:15.5)
_CreatePinMechanical(PadM -37.5:15.5)
_CreatePinMechanical(PadM 37.5:-15.5)
_CreatePinMechanical(PadM -37.5:-15.5)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(16*2.54 2 7.5*2.54-pA/2+8.0:pB/2-2.4) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(16*2.54 2 7.5*2.54-pA/2+8.0:pB/2-2.4) pH pName)

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
