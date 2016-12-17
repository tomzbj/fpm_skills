; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:IC/SMD IC
;Desc:SOIC 5.1 Pitch (DB107S)
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=8.32 pB=6.35 pH=3.20 Pitch=5.10 pName="SOIC510P1005X320-4"
_PrepareNewSym(pName)
PadN = _PadSMFillet( 1.5 2.0 )
;pin
_CreatePin( PadN -Pitch/2:-4.4 "1")
_CreatePin( PadN Pitch/2:-4.4 "2")
_CreatePin( PadN Pitch/2:4.4 "3")
_CreatePin( PadN -Pitch/2:4.4 "4")
;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH pName)
;_BoundHeight(_ShapeRectangle(pL pW 0.4:0) pH pName)
;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Dot(-Pitch/2-1.5:-4.2 0.8)
    _Rectangle(pA pB)
)
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
