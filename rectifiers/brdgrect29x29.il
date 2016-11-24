; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Diodes/Bridge rectifier
;Desc:29mmx29mm Rectangle bridge rectifier, KBPC5010
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.5 PitchHor=14.3 PitchVer=18.1 pA=29.0 pB=29.0 pH=11.0
pName="BRDGRECT29X29"
_PrepareNewSym(pName)
;pin

PadN1 = _Pad_Slot(3.0 8.8 1.0 6.8)
PadN = _Pad_Slot(8.8 3.0 6.8 1.0)

_CreatePin(PadN1 -PitchVer/2:PitchHor/2 "1")
_CreatePin(PadN  -PitchHor/2:-PitchVer/2 "2")
_CreatePin(PadN  PitchHor/2:-PitchVer/2 "3")
_CreatePin(PadN  PitchHor/2:PitchVer/2 "4")

PadM = _PadTH_Default(12.0 6.0) 
_CreatePinMechanical(PadM 0:0)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB) pH pName)
;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Line( list(-pA/2:pB/2-1.5 -pA/2:-pB/2) )
    _Line( list(-pA/2:-pB/2 pA/2:-pB/2) )
    _Line( list(pA/2:-pB/2 pA/2:pB/2) )
    _Line( list(pA/2:pB/2 -pA/2+1.5:pB/2) )
    _Line( list(-pA/2+1.5:pB/2 -pA/2:pB/2-1.5) )
)
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
