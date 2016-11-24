; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Inductor/RF Inductor
;Desc:Self-made VHF Coil
;Vendor:stavrosatic@gmail.com
;Count:1

pA=6.0 pB=6.0 pH=5.0 pPad=1.8 pHole=1.2 Courtyard=0.2 pName="INDU5X5" 
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
ofs = -pA/2+3.0
_CreatePin(PadN -2.54:2.54 1)
_CreatePin(PadN 2.54:-2.54 2)


_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+2*Courtyard pB+2*Courtyard 0:0 0.2) pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     
	path = axlPathStart(list(-0.3:-1.90))
    axlPathArcAngle(path SilkWidth -0.3:-0.65 nil 180)
    axlPathArcAngle(path SilkWidth -0.3:0.65  nil 180)
    axlPathArcAngle(path SilkWidth -0.3:1.90  nil 180)
    axlDBCreatePath(path)
    _Line(list(-2.54:2.54 -0.3:2.54 -0.3:1.90))
    _Line(list(2.54:-2.54 -0.3:-2.54 -0.3:-1.90))
)

_CreateRefValue(pName) 

_SaveDesign(pName)    
_MakeDevice(pName,2) 
