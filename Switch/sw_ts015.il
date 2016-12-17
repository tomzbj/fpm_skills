; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Push
;Desc:SMD Pushbutton TS015 (Small Tortoise) 
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=3.5 pB=2.9 pH=1.2 pPadA=1.5 pPadB=1.1 pName="SW_TS015"
_PrepareNewSym(pName)

;pin
PadM = _PadTH_Default(0.1 0.8)
PadN = _PadSMFillet(pPadA pPadB)

_CreatePin(PadN -1.7:0.8 "1")
_CreatePin(PadN -1.7:-0.8 "2")
_CreatePinMechanical(PadN 1.7:0.8)
_CreatePinMechanical(PadN 1.7:-0.8)
_CreatePinMechanical(PadM 0: 0.9)
_CreatePinMechanical(PadM 0:-0.9)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB 0:0) ;A B Center Fillet
    _Line(list(-0.85:-pB/2 -0.85:-pB/2-0.65 0.85:-pB/2-0.65 0.85:-pB/2))
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
