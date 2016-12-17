; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Card Slot
;Desc:TF Card Slot
;Vendor:stavrosatic@gmail.com
;Count:1

pA=15.0 pB=15.0 pH=1.5 pName="TF_SLOT"
_PrepareNewSym(pName)

PadN=_PadSMFillet(1.5 0.7)
PadM1 =_PadSMFillet(1.5 1.5)
PadM2 =_PadSMFillet(2.5 1.5)
PadT = _PadTH_Default(0.1 1.2)  ;Non-Plated

_CreatePin(PadN 8.2:-2.25 1)
_CreatePin(PadN 8.2:-1.15 2)
_CreatePin(PadN 8.2:-0.05 3)
_CreatePin(PadN 8.2:1.05 4)
_CreatePin(PadN 8.2:2.15 5)
_CreatePin(PadN 8.2:3.25 6)
_CreatePin(PadN 8.2:4.35 7)
_CreatePin(PadN 8.2:5.45 8)
_CreatePin(PadN 8.2:6.55 "CD")

_CreatePinMechanical(PadM1 6.9:8.0)
_CreatePinMechanical(PadM1 6.9:-7.2)
_CreatePinMechanical(PadM2 -3.1:8.0)
_CreatePinMechanical(PadM2 -3.1:-8.0)
_CreatePinMechanical(PadT -3.5:4.95)
_CreatePinMechanical(PadT -3.5:-3.05)

_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(pA+1 pB+2 0.5:0) pH) 
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA+1 pB+2 0.5:0) pH pName)

for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Line(list(pA/2:pB/2 pA/2:-pB/2 -pA/2:-pB/2 -pA/2:-3.7 -pA/2+0.7:-1 -pA/2+0.7:pB/2 pA/2:pB/2))
)

_CreateRefValue(pName 0:0 0:0)
_CrossCenter() 
_SaveDesign(pName)
_MakeDevice(pName,2)
