; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Pad/Single SMD Pad
;Desc:Single SMD Pad, 5mm x 3mm
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pH=3.0 pA=5 pB=7 PadX=5.0 PadY=3.0
pName = "PAD5030-2"
_PrepareNewSym(pName)
PadN = _PadSMFillet(PadX PadY)

_CreatePin(PadN 0:2 "1" )
_CreatePin(PadN 0:-2 "2" )

;bound
_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2))
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(PadX PadY) pH)


;silkscreen & assembly
for(i 1 2 
	if(i==1	
		_Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(pA+Courtyard*2 pB+Courtyard*2)
)
;ref & val
_CreateRefValue(pName)
_CrossCenter()
_SaveDesign(pName)
