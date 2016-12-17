; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Heatsink/TO220&TOP3
;Desc:Heatsink 50x19x50
;Vendor:stavrosatic@gmail.com
;Count:1

pA=50.0 pB=19.0 pH=50.0 pPad=3.0 Pitch=46.0 pHole=2.0 Courtyard=0.5 
pName="HEATSINK_50X19X50"
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
_CreatePin(PadN -Pitch/2:0 "1")
_CreatePin(PadN  Pitch/2:0 "2")

;Place≤„ 
_Layer(lPkgGeoDfaT)
_BoundHeight( _ShapeRectangle(15 pB -pA/2+7.5:0) pH pName)
_BoundHeight( _ShapeRectangle(15 pB  pA/2-7.5:0) pH pName)

_Layer(lPkgGeoPlaceT) ;«–ªªµΩPlaceTop≤„
_BoundHeight( _ShapeRectangle(16 pB+2*Courtyard -pA/2+7.5:0) pH )
_BoundHeight( _ShapeRectangle(16 pB+2*Courtyard  pA/2-7.5:0) pH )

_FilletR = 0.1
for(asm 0 1
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;≤„«–ªª

    _Line(list(-pA/2+3:0 pA/2-3:0) 2.0)
    _Line(list(-pA/2+3:-pB/2 -pA/2+3:pB/2) 1.3)
    _Line(list( pA/2-3:-pB/2  pA/2-3:pB/2) 1.3)

    _Line(list(-pA/2+9:-pB/2 -pA/2+9:pB/2) 1.3)
    _Line(list( pA/2-9:-pB/2  pA/2-9:pB/2) 1.3)

    _Line(list(-pA/2+14:0 -pA/2+14:pB/2) 1.3)
    _Line(list( pA/2-14:0  pA/2-14:pB/2) 1.3)

    _Line(list(-pA/2:-pB/2 -pA/2+3:-pB/2) 1.3)
    _Line(list(-pA/2: pB/2 -pA/2+3: pB/2) 1.3)
    _Line(list( pA/2:-pB/2  pA/2-3:-pB/2) 1.3)
    _Line(list( pA/2: pB/2  pA/2-3: pB/2) 1.3)

    _Line(list(-pA/2+0.5:-1.5 -pA/2+2.5:-1.5) 2.0)
    _Line(list(-pA/2+0.5: 1.5 -pA/2+2.5: 1.5) 2.0)
    _Line(list( pA/2-0.5:-1.5  pA/2-2.5:-1.5) 2.0)
    _Line(list( pA/2-0.5: 1.5  pA/2-2.5: 1.5) 2.0)
)

_CreateRefValue(pName)

_SaveDesign(pName)
_MakeDevice(pName,2)
