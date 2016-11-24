; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Monochrome LCD Display
;Desc:256x64 Monochrome LCD Display, bare, parallel interface, wire folded
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pA=67.7 pB=29.7 pH=4.35 pName="LCD25664SFD-24" pFold=6.0

_PrepareNewSym(pName) 
PadN = _PadSMFillet(0.4 2.9 t)
PadM = _PadTH_Default(0.1 2.0)
PadM2 = _PadTH_Default(2.0 1.0)
PadLED = _Pad_Slot(4.0 1.6 2.6 0.8)

;pin
for(i 1 24 
    _CreatePin(PadN (i - 12.5) * 0.8:-pB/2+25.2-2.9/2-pFold i)
)
_CreatePin(PadLED -35.5/2:-pB/2+1.3 "25") ; LEDK
_CreatePin(PadLED  35.5/2:-pB/2+1.3 "26") ; LEDA
_CreatePinMechanical(PadM -64.3/2:pB/2-1.7)
_CreatePinMechanical(PadM  64.3/2:pB/2-1.7)
_CreatePinMechanical(PadM2 -17.8/2:-pB/2+17.7-pFold)
_CreatePinMechanical(PadM2  17.8/2:-pB/2+17.7-pFold)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
;    _Rectangle(pA pB) ;A B Center Fillet
    _Line(list(-pA/2:-pB/2 -pA/2:pB/2 pA/2:pB/2 pA/2:-pB/2 pA/2-8:-pB/2 
        pA/2-8:-pB/2+1.1 -pA/2+8:-pB/2+1.1 -pA/2+8:-pB/2 -pA/2:-pB/2))
)
for(i 0 1 
    if(i==1 _Layer(lPkgGeoAsmB) _Layer(lPkgGeoSilkB))
    _Line(list(-10.95/2:-pB/2+1.1 -10.95/2:-pB/2+16.2-pFold -20.8/2:-pB/2+16.2-pFold 
                -20.8/2:-pB/2+25.2-pFold 20.8/2:-pB/2+25.2-pFold 
                20.8/2:-pB/2+16.2-pFold 10.95/2:-pB/2+16.2-pFold 10.95/2:-pB/2+1.1))
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)

