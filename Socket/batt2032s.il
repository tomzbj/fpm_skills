; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Battery Holder
;Desc:SMD CR2032 battery holder
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pD=20.0 pH=5.5 PadX=4.0 PadY=3.0 PadD=17.0 pName="BATT2032S"
_PrepareNewSym(pName)

;pin
PadP = _PadSMFillet(PadX PadY)
PadN = _PadSM(PadD PadD nil t) ;Circle pad

_CreatePin(PadP 0:pD/2+2 "1")
_CreatePinMechanical(PadP 0:-pD/2-2)
_CreatePin(PadN 0:0 "2")

;bound
_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeCircle(pD/2+Courtyard) pH)
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeCircle(pD/2) pName pH)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Circle(pD/2)
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
