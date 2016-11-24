; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Battery Holder
;Desc:SMD CR2032 battery holder
;Count:1

Courtyard=0.5 pA=22.0 pB=16.0 pA2=28.5 pB2=7.0 pH=5.5 PadX=3.2 PadY=4.8 
pName="BATT2032_285X160"

_PrepareNewSym(pName)

;pin
Pad=_PadSMFillet(PadX PadY)

_CreatePin(Pad -29.3/2:0 "1")
_CreatePin(Pad 29.3/2:0 "2")

;bound
_Layer(lPkgGeoPlaceT)
Shape1 = _ShapeRectangle(pA pB 0:0 0)
Shape2 = _ShapeRectangle(pA2 pB2 0:0 0)
Shape3 = _ShapeCircle(10)
axlShapeMerge(car(Shape1) list(car(Shape2) car(Shape3)) 'quiet)
_BoundHeight(list(Shape1 nil) pH)
_Layer(lPkgGeoDfaT)
;_BoundHeight(list(Shape1 nil) pH)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(pA pB)
    _Rectangle(pA2 pB2)
    _Circle(10)
    _Line(list(-15:6.5 -12:6.5))
    _Line(list(-13.5:5.0 -13.5:8.0))
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
