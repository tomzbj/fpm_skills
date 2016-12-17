; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transistor/SMT Transistor
;Desc:ULTRASO-8 Mosfet
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pB=5.0 pA=6.0 pH=0.28 pName="ULTRASO-8"
_PrepareNewSym(pName)
Pad1 = _PadSMFillet(1.8 3.4)
Pad2 = _PadSMFillet(1.8 0.8)
Pad3 = _PadSMFillet(4.8 4.6)

_CreatePin(Pad1 -3.1:0.6 2) 
_CreatePin(Pad2 -3.1:-1.9 1) 
_CreatePin(Pad3 1.6:0.0 3) 

;bound
_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(8.5 5.5) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 1 2
    if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(pA pB)
)

_CreateRefValue(pName)
_CrossCenter()
_SaveDesign(pName)
