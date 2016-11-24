; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Heatsink/TO220&TOP3
;Desc:Heatsink 51x24x35
;Vendor:Stavros ZHANG Hao
;Count:1

pA=51 pB=24 pH=35 pPad=2.3 pHole=1.5 Courtyard=0 pName="HEATSINK_51X24X35"
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
_CreatePin(PadN -18:-3 "1")
_CreatePin(PadN 18:-3 "2")

;Place≤„
_Layer(lPkgGeoPlaceT) ;«–ªªµΩPlaceTop≤„
_BoundHeight( _ShapeRectangle(pA+2 2 0:-pB/2 0) pH )
_BoundHeight( _ShapeRectangle(12 pB-0.5 -pA/2+4.5:1.0 0) pH )
_BoundHeight( _ShapeRectangle(12 pB-0.5 pA/2-4.5:1.0 0) pH )

for(asm 0 1
        if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;≤„«–ªª
	_Line(list(-pA/2:-pB/2 pA/2:-pB/2))
	_Line(list(-pA/2:pB/2 -pA/2+10:pB/2))
	_Line(list(-pA/2:pB/2-6 -pA/2+10:pB/2-6))
	_Line(list(-pA/2:pB/2-12 -pA/2+10:pB/2-12))
	_Line(list(-pA/2:pB/2-18 -pA/2+10:pB/2-18))

	_Line(list(pA/2:pB/2 pA/2-10:pB/2))
	_Line(list(pA/2:pB/2-6 pA/2-10:pB/2-6))
	_Line(list(pA/2:pB/2-12 pA/2-10:pB/2-12))
	_Line(list(pA/2:pB/2-18 pA/2-10:pB/2-18))

	_Line(list(-pA/2+10:pB/2 -pA/2+10:-pB/2))
	_Line(list(pA/2-10:pB/2 pA/2-10:-pB/2))

)

_CreateRefValue(pName)

_SaveDesign(pName)
_MakeDevice(pName,2)
