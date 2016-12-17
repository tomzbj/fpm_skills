; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/Power Connector
;Desc:5.5mm Power Connector
;Vendor:stavrosatic@gmail.com
;Count:1

pH=12.55 X=14.4 Y=9.0 pName="PWR55"
_PrepareNewSym(pName)

PadN13 = _Pad_Slot(1.8 4.0 0.8 2.8)
PadN2 = _Pad_Slot(4.0 1.8 2.8 0.8)

_CreatePin(PadN2 -10.7:4.7 "2")
_CreatePin(PadN13 -10.7+3:0 "1")
_CreatePin(PadN13 -10.7-3:0 "3")

;bound
_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(X-3.2+1 Y+0.5 -(X+3.2+1)/2:0) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(X Y -X/2:0) pH)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(X Y -X/2:0)
    _Line(list(-3.2:Y/2 -3.2:-Y/2))
    _Line(list(0:0 -3.2:0))
    _Line(list(-10.7+1.6:4.7 -10.7-1.6:4.7))
)

;ref & val
_CreateRefValue(pName 0:-Y/2-tSilkHeight/2-SilkWidth 
    0:-Y/2-tSilkHeight/2-SilkWidth)

_SaveDesign(pName)
