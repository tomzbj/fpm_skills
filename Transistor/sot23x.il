; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transistor/SMT Transistor
;Desc:SOT-23 Transistor, extended pad
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=3.0 pB=4.0 pH=2.0 pName="SOT23X"
_PrepareNewSym(pName)
PadN1 = _PadSMFillet(0.8 1.0)
PadN2 = _PadSMFillet(1.4 1.8)
;pin
_CreatePin(PadN1 -0.95:-1.4 "1")
_CreatePin(PadN1 0.95:-1.4 "2")
_CreatePin(PadN2 0:1.2 "3")
;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)
;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(3.0 1.8 0:0)
)
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
