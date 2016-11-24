; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transformer/BALUN
;Desc:15x5 Ring BALUN
;Vendor:stavrosatic@gmail.com
;Count:1

pA=17.0 pB=7.0 Pitch=5.0 pH=9.0 pPad=2.0 pHole=1.2 Courtyard=0.3 pName="BALUN1550" 
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
_CreatePin(PadN -7:-Pitch/2 1)
_CreatePin(PadN -7:Pitch/2 8)
_CreatePin(PadN 7:-Pitch/2 4)
_CreatePin(PadN 7:Pitch/2 5)

_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(pA+2*Courtyard pB+2*Courtyard 0:0 0.2) pH)
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB 0:0 0.2) pH pName)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     
    _Rectangle(pA pB)
)

_CreateRefValue(pName) 

_SaveDesign(pName)    
_MakeDevice(pName,2) 
