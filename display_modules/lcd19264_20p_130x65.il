; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Monochrome LCD Display
;Desc:192x64 Monochrome LCD Display, 130mm x 65mm, 20pins
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=130.0 pB=65.0 pH=8.0 pitch=2.54 pName="LCD19264_20P_130x65"

_PrepareNewSym(pName)

PadN   = _PadTH_Default(1.5 0.9)
PadN1  = _PadTH_Default(1.5 0.9 t)
PadM   = _PadTH_Default(5.5 3.5)

;pin
for(i 1 20
    if(i == 1
        _CreatePin(PadN1 11.2-i*2.54 : -pB/2+2.5 i)
        _CreatePin(PadN  11.2-i*2.54 : -pB/2+2.5 i)
    )
)

_CreatePinMechanical(PadM -pA/2+4.5:-pB/2+6)
_CreatePinMechanical(PadM  pA/2-4.5:-pB/2+6)
_CreatePinMechanical(PadM -pA/2+4.5: pB/2-6)
_CreatePinMechanical(PadM  pA/2-4.5: pB/2-6)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(51 3 -15.5:-pB/2+2.5) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(51 3 -15.5:-pB/2+2.5) pH pName)

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
