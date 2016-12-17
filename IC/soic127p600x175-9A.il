; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:IC/SMD IC
;Desc:SOIC127P600pA175-8 (SOIC8 39mm) with Exposed Pad
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pA=5.0 pB=6.0 pH=1.75 pName = "SOIC127P600X175-9A"
_PrepareNewSym(pName)
FilletR = 0.3
PadA = _PadSMFillet( 0.6 1.8 )
PadB = _PadSMFillet( 6.0 2.4 )

for(i 1 4
    _CreatePin(PadA 1.27*(i-2.5):-2.6 i )
    _CreatePin(PadA 1.27*(i-2.5):2.6 9-i )
) 
_CreatePin(PadB 0:0 "9")

;bound
_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)

_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)

;silkscreen & assembly
for(i 0 1 if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(5.0 3.9)
    _Dot(-pA/2-0.5:-pB/2 0.8) 
)

_CreateRefValue(pName)
_CrossCenter()
_SaveDesign(pName)
