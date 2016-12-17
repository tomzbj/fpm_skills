; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Potentiometer/Through hole potentiometer
;Desc:Coaxial dual volume pot
;Vendor:stavrosatic@gmail.com
;Count:1

pA=17 pB=11 pH=5.0 pPad=2.0 pHole=1.2 pName="POT_DUAL_6" 

_PrepareNewSym(pName)  
PadN=_PadTH_Default(pPad pHole) 

_CreatePin(PadN -5.08:2.54 "1")
_CreatePin(PadN     0:2.54 "2")
_CreatePin(PadN  5.08:2.54 "3")
_CreatePin(PadN -5.08:-2.54 "4")
_CreatePin(PadN     0:-2.54 "5")
_CreatePin(PadN  5.08:-2.54 "6")

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+2 pB+2 0:.5 .5) pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     

	_Rectangle(pA pB)
	_Line(list(3.5:pB/2 3.5:pB/2+11.0))
	_Line(list(3.5:pB/2+11 -3.5:pB/2+11.0))
	_Line(list(-3.5:pB/2 -3.5:pB/2+11.0)) 
)

_CreateRefValue(pName) 

_SaveDesign(pName)    
_MakeDevice(pName,2) 

