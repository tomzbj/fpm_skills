; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/Phone connector
;Desc:3.5mm stereo phone jack
;Vendor:stavrosatic@gmail.com
;Count:1

pA=11.0 pB=12.0 pH=5.0 pPad=1.8 pHole=1.2 Courtyard=0.3 pName="STEREO"
_PrepareNewSym(pName)
PadN = _Pad_Slot(2.4 1.6 1.6 0.8)
PadM = _PadTH_Default(0.1 1.2)
 
ofs = -pA/2+3.0
_CreatePin(PadN -5.0:ofs "1" 90)
_CreatePin(PadN -2.5:ofs "2" 90)
_CreatePin(PadN  2.5:ofs "3" 90)
_CreatePin(PadN  5.0:ofs "4" 90)
_CreatePin(PadN    0:ofs+5 "5")
_CreatePinMechanical(PadM -5.0:ofs+5)
_CreatePinMechanical(PadM -5.0:ofs+7.5)
_CreatePinMechanical(PadM  5.0:ofs+7.5)
_CreatePinMechanical(PadM  5.0:ofs+5)

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pB+Courtyard pA+Courtyard 0:0) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pB pA 0:0) pName pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT)) 
	_Rectangle(pB pA)
	_Line(list(3.0:pA/2 3.0:pA/2+3.0))
	_Line(list(-3.0:pA/2 -3.0:pA/2+3.0))
	_Line(list(-3.0:pA/2+3.0 3.0:pA/2+3.0))
) 
_CreateRefValue(pName) 
_SaveDesign(pName)
_MakeDevice(pName,2) 
