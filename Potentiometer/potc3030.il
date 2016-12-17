; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Potentiometer/SMT potentiometer
;Desc:3x3mm pot
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pH=3.0 pA=3.0 pB=3.0 pName = "POTC3030"
_PrepareNewSym(pName)
PadA = _PadSMFillet(1.6 1.6)
PadB = _PadSMFillet(1.2 1.2)

_CreatePin(PadA 0:1.65 2)
_CreatePin(PadB -1.0:-1.6 1)
_CreatePin(PadB 1.0:-1.6 3) 

;bound
_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 1 2 
    if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(pA pB)
)

;ref & val
_CreateRefValue(pName)
_CrossCenter()
_SaveDesign(pName)
