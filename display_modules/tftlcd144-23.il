; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/TFTLCD Display
;Desc:1.44" TFTLCD Display, parallel interface
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pA=36.5 pB=29.5 pH=2.0 pName="TFTLCD144-23" 
_PrepareNewSym(pName) 
PadN = _PadSMFillet(1.8 0.4)

;pin
for(i 1 23 
    _CreatePin(PadN -pA/2-9.7:-(i-12) * 0.8 i)
)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB) ;A B Center Fillet
    _Rectangle(10.6 20.6 -pA/2-10.6/2:0)
    _Line(list(-pA/2-10.6/2:10.3 -pA/2-10.6/2:-10.3))
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
