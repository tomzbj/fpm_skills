; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Bulb socket
;Desc:10mm screw socket (edison socket)
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.5 pA=14.0 pB=10.0 pH=10.0 pName="E10_SOCKET"
_PrepareNewSym(pName)

PadN = _Pad_Slot(1.4 5.2 0.6 4.0)

_CreatePin(PadN pA/2:0 "1")
_CreatePin(PadN pA/2-4:0 "2")

;bound
_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 1 2 
    if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(pA pB)
    for(j -2 2
        _Line(list(j*3:pB/2 j*3:-pB/2))
    )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
