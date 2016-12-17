; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Kink
;Desc:SMD Kink switch
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=6.7 pB=2.8 pH=1.5 pPadA1=1.4 pPadB1=1.0 pPadA=0.9 pPadB=2.2 pName="SW_MSK1102"
_PrepareNewSym(pName)

;pin
PadM = _PadSMFillet(pPadA1 pPadB1)
PadM2 = _PadTH_Default(0.6 0.8)
PadN = _PadSMFillet(pPadA pPadB)

_CreatePin(PadN -2.25:2.4 "1")
_CreatePin(PadN  0.75:2.4 "2")
_CreatePin(PadN  2.25:2.4 "3")
_CreatePinMechanical(PadM -3.8:-1.4)
_CreatePinMechanical(PadM -3.8: 1.4)
_CreatePinMechanical(PadM  3.8:-1.4)
_CreatePinMechanical(PadM  3.8: 1.4)
_CreatePinMechanical(PadM2 1.5:0)
_CreatePinMechanical(PadM2 -1.5:0)

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
	_Rectangle(1.3 1.5 0.8:-2.15 0.1) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
