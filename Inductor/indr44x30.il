; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Inductor/Power Ring Indcutor
;Desc:44x28 Ring Inductor
;Vendor:stavrosatic@gmail.com
;Count:1

pA=44.0 pB=30.0 Pitch=26.0 pH=44.0 pPad=4.0 pHole=2.0 Courtyard=0.5 
pName="INDR44X30" 
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
_CreatePin(PadN 0:-Pitch/2 1)
_CreatePin(PadN 0:Pitch/2 2)


_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+2*Courtyard pB+2*Courtyard 0:0 0.2) pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     
    _Rectangle(pA pB)
)

_CreateRefValue(pName) 

_SaveDesign(pName)    
_MakeDevice(pName,2) 
