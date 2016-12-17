; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transistor/SMT Transistor
;Desc:TO-247 Transistor, 2 pins, Horizontally mount 
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=15.6 pB=20.6 pH=4.7 pName="TO247-HOR-2"
_PrepareNewSym(pName)
PadS2 = _PadSMFillet(12.8 13.0)
PadS = _PadSMFillet(4.0 5.0)
;pin
_CreatePin(PadS -5.5:-13.3 "1")
_CreatePin(PadS  5.5:-17.3 "2")
_CreatePin(PadS2 0:3.0 "3")

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)
;Mounting hole
_Layer(lBrdGeoOutline)
_Circle(2 0:4.8)
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB)
)
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
