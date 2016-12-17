; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/OLED Display
;Desc:0.96" OLED Display, i2c interface
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0 pA=27.3 pB=27.8 pH=8.0 pitch=2.54 pName="OLED096_4P"

_PrepareNewSym(pName)

PadN   = _PadTH_Default(1.5 0.9)
PadN1  = _PadTH_Default(1.5 0.9 t)
PadM   = _PadTH_Default(0.1 2.2)

;pin
for(i 1 4
    if(i == 1
        _CreatePin(PadN1 (i-2.5)*2.54:12.4 i)
        _CreatePin(PadN  (i-2.5)*2.54:12.4 i)
    )
)

_CreatePinMechanical(PadM -pA/2+2:-pB/2+2)
_CreatePinMechanical(PadM  pA/2-2:-pB/2+2)
_CreatePinMechanical(PadM -pA/2+2: pB/2-2)
_CreatePinMechanical(PadM  pA/2-2: pB/2-2)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(10 3 0:pB/2-1.5) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(10 3 0:pB/2-1.5) pH pName)

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
