; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Diodes/Bridge rectifier
;Desc:19mmx19mm Rectangle bridge rectifier, KBPC808
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.5 Pitch=12.7 pA=19.0 pB=19.0 pH=7.0 pPad=2.5 pHole=1.8 pName="BRDGRECT19X19"
_PrepareNewSym(pName)
;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN=_PadTH_Default(pPad pHole)
PadM=_PadTH_Default(5.5 3.5)

_CreatePin(PadN1 -Pitch/2:Pitch/2 "1")
_CreatePin(PadN  -Pitch/2:-Pitch/2 "2")
_CreatePin(PadN  Pitch/2:-Pitch/2 "3")
_CreatePin(PadN  Pitch/2:Pitch/2 "4")
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
