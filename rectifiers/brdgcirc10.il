; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Diodes/Bridge rectifier
;Desc:9mm Circular bridge rectifier, W005/W10 
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 Pitch=5.1 pA=10.0 pH=7.4 pPad=1.6 pHole=1.0 pName="BRDGCIRC10"
_PrepareNewSym(pName)
;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN=_PadTH_Default(pPad pHole)

_CreatePin(PadN1 -Pitch/2:Pitch/2 "1")
_CreatePin(PadN  -Pitch/2:-Pitch/2 "2")
_CreatePin(PadN  Pitch/2:-Pitch/2 "3")
_CreatePin(PadN  Pitch/2:Pitch/2 "4")
;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeCircle(pA/2+Courtyard*2) pH)
;A B Center Height
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeCircle(pA/2) pH pName)
;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Circle(pA/2)
)
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
