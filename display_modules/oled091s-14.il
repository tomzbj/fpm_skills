; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/OLED Display
;Desc:0.91" OLED Display, I2C interface
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0 pA=30.0 pB=11.5 pH=2.0 pName="OLED091S-14" 
_PrepareNewSym(pName) 
PadN   = _PadSMFillet(2.0 0.35)

;pin
for(i 1 14
    _CreatePin(PadN pA/2+9.5:(i - 9.5) * 0.62 i)
)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA pB) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB) ;A B Center Fillet
    _Rectangle(10.5 9.0 pA/2+10.5/2:-pB/2+9.0/2)
    _Line(list(pA/2+10.5/2:-pB/2+9.0 pA/2+10.5/2:-pB/2))
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
