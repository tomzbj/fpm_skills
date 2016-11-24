; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Potentiometer/Through hole potentiometer 
;Desc:POT3006
;Vendor:stavrosatic@@Foretech Studio
;Count:1

Courtyard=.2 pA=19.3 pB=5.0 pH=6.5 pPad=1.3 pHole=0.7 pName="POT3006"
_PrepareNewSym(pName)

;pin
PadN=_PadTH_Default(pPad pHole)
_CreatePin(PadN 6.35:-1.27 "1")
_CreatePin(PadN -1.27:1.27 "2")
_CreatePin(PadN -6.35:-1.27 "3")

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH) 

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName )

;silkscreen & assembly
for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB 0:0 0) ;A B Center Fillet
    _Line(list(-pA/2:0.76 -pA/2-2:0.76 -pA/2-2:-0.76 -pA/2:-0.76))
    _Line(list(-pA/2+1:-pB/2 -pA/2+1:pB/2) )
    _Line(list(pA/2-1:-pB/2 pA/2-1:pB/2) )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
