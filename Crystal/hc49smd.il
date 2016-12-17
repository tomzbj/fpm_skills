; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Crystal/SMD crystal
;Desc:generic HC49SMD
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.5 Pitch=9.0 pA=11.05 pB=4.8 pH=3.5 PadX=5.0 PadY=1.6

pName="HC49SMD"
_PrepareNewSym(pName)

;pin
PadN=_PadSMFillet(PadX PadY)
_CreatePin(PadN -Pitch/2:0 "1")
_CreatePin(PadN Pitch/2:0 "2")

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
_Rectangle(pA pB 0:0 1.5) ;A B Center Fillet
)
_Circle(1.4 -Pitch/2:0 1.3)
_Circle(1.4 Pitch/2:0 1.3)
_Rectangle(1.2 1.2 0:0 0 1.2)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
