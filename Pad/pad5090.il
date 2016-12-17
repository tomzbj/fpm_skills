; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Pad/Single SMD Pad
;Desc:Single SMD Pad, 5mm x 5mm
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pH=3.0 PadX=5.0 PadY=9.0 pName = "PAD5090"
_PrepareNewSym(pName)
PadN = _PadSMFillet(PadX PadY)

_CreatePin(PadN 0:0 1 )

;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(PadX PadY) pH)
;dfa
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(PadX PadY) pH pName)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(PadX PadY)
)
;bound
;_Layer(lPkgGeoPlaceT)

;silkscreen & assembly
for(i 1 2 
	if(i==1	
		_Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(PadX+Courtyard*2 PadY+Courtyard*2)
)
;ref & val
_CreateRefValue(pName)
_CrossCenter()
_SaveDesign(pName)
