; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Button
;Desc:Pushbutton 6x6 Rightangle
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 Pitch=4.0 Pitch2=7.0 pA=7.6 pB=6.8 pH=7.0 pPad=1.5 pHole=0.9 pName="PUSHBT6X6RA"
_PrepareNewSym(pName)

;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN=_PadTH_Default(pPad pHole)
PadM=_PadTH_Default(1.8 1.1)

_CreatePin(PadN1 -Pitch/2:1.3 "1")
_CreatePin(PadN Pitch/2:1.3 "2")
_CreatePinMechanical(PadM -Pitch2/2:-1.2)
_CreatePinMechanical(PadM Pitch2/2:-1.2)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+1.6 pB+Courtyard*2 0:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Line(list(-pA/2:-pB/2 -pA/2:pB/2 pA/2:pB/2 pA/2:-pB/2) )
    _Line(list(-pA/2:0 pA/2:0) )
    _Line(list(-1.7:pB/2 -1.7:pB/2+3.4 1.7:pB/2+3.4 1.7:pB/2) )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
