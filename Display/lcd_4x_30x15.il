; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/7 Segment LCD Display
;Desc:4 digits, 7 Segment LCD Display, 30mm x 15mm, 12pins
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=34.0 pB=23.5 pH=10.0 pitch=2.54 pName="LCD_4X_30X15"

_PrepareNewSym(pName) 
PadN   = _PadTH_Default(1.3 0.7)
PadN1  = _PadTH_Default(1.3 0.7 t)

;pin
for(i 1 12
    if(i == 1
        _CreatePin(PadN1 (i-6.5)*2.0:-pB/2 i)
        _CreatePin(PadN  (i-6.5)*2.0:-pB/2 i)
    )
)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA 1 0:-pB/2+0.5) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA 1 0:-pB/2+0.5) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
