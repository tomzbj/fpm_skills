; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Inductor/SM Power Inductor
;Desc:SM Power Inductor 13x13
;Vendor:stavrosatic@gmail.com

Courtyard=0.3 pA=13.0 pB=13.0 pH=6.00 pPad=5.0 pHole=3.0 pName="INDUSMD13x13"
_PrepareNewSym(pName)

PadN = _PadSMFillet( 6.0 10.0 )
_CreatePin(PadN -pA/2:0 "1")
_CreatePin(PadN pA/2:0 "2")

_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName )

for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB 0:0 1)
)

_CreateRefValue(pName 0:0 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
