; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Push
;Desc:Push Switch A05
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 Pitch=2.5 pA=12.6 pB=5.0 pH=8.3 pPad=1.3 pHole=0.7 pName="SW_A05"
_PrepareNewSym(pName)

;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN =_PadTH_Default(pPad pHole)
PadM =_PadTH_Default(1.8 1.2)
_CreatePin(PadN1 Pitch:0 1)
_CreatePin(PadN  0:0 2)
_CreatePin(PadN  -Pitch:0 3)
_CreatePinMechanical(PadM -5.9:-1.0) 
_CreatePinMechanical(PadM  5.9:pB/2) 

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)

;silkscreen & assembly
for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB 0:0 ) ;A B Center Fillet
    _Rectangle(9.4 2.8 pA/2+4.7:0)
    _Line( list(pA/2+6.5:pB/2 pA/2+6.5:-pB/2) )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
