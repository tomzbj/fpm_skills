; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Kink
;Desc:Kink SPDT Switch SMTS-102W2
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0 Pitch=2.54 pA=8.9 pB=5.08 pH=8.1 pPad=1.6 pHole=1.0 pName="SMTS-102W2"
_PrepareNewSym(pName)

;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN=_PadTH_Default(pPad pHole)
_CreatePin(PadN1 2*Pitch:0 1)
_CreatePin(PadN 3*Pitch:0 2)
_CreatePin(PadN 4*Pitch:0 3)
_CreatePinMechanical(PadN 0:0)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0.61:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0.61:0) pH pName)

;silkscreen & assembly
for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB 0.61:0 ) ;A B Center Fillet
    _Rectangle(5.6 3.4 -6.7:0 )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
