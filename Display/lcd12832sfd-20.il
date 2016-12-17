; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Monochrome LCD Display
;Desc:128x32 Monochrome LCD Display, bare, parallel interface, wire folded
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pA=56.8 pB=25.0 pH=3.2 pName="LCD12832SFD-20" pFold=4.0

_PrepareNewSym(pName) 
PadN = _PadSMFillet(0.4 2.8 t)
PadM = _PadTH_Default(0.1 2.0)
PadM2 = _PadTH_Default(2.0 1.0)
PadLED = _Pad_Slot(4.0 1.6 2.6 0.8)

;pin
for(i 1 20 
    _CreatePin(PadN -(i - 10.5) * 0.8:-pB/2+21.25-2.8/2-pFold i)
)
_CreatePin(PadLED -35.5/2:-pB/2+1.3 "21")
_CreatePin(PadLED  35.5/2:-pB/2+1.3 "22")
_CreatePinMechanical(PadM -54.3/2:pB/2-1.25)
_CreatePinMechanical(PadM  54.3/2:pB/2-1.25)
_CreatePinMechanical(PadM2 -14.8/2:-pB/2+13.65-pFold)
_CreatePinMechanical(PadM2  14.8/2:-pB/2+13.65-pFold)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB) ;A B Center Fillet
;    _Rectangle(10.6 20.6 -pA/2-10.6/2:0)
    _Line(list(-9.0/2:-pB/2 -9.0/2:-pB/2+12-pFold -16.8/2:-pB/2+12-pFold -16.8/2:-pB/2+21.25-pFold))
    _Line(list( 9.0/2:-pB/2  9.0/2:-pB/2+12-pFold  16.8/2:-pB/2+12-pFold  16.8/2:-pB/2+21.25-pFold))
    _Line(list(-16.8/2:-pB/2+21.25-pFold  16.8/2:-pB/2+21.25-pFold))
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)

