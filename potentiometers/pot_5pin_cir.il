; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Potentiometer/Through Hole Potentiometer
;Desc:Dual Volume Pot
;Vendor:stavrosatic@gmail.com
;Count:1

pA=10.5 pB=16.0 pH=4.0 pPad=1.5 pHole=1.0 Courtyard=1.0 pName="POT_DUAL_VOLUME_CIR"   
_PrepareNewSym(pName)  

PadN=_PadTH_Default(pPad pHole) 
PadMech = _PadTH_Default(2.5 1.5)
for(i 1 5
    j=i-3
    sprintf(pinNumber "%d" i)
    _CreatePin(PadN -j*2.0:-pB/2 pinNumber)
)                    
_CreatePinMechanical(PadMech -5.1:-pB/2+10.2)
_CreatePinMechanical(PadMech 5.1:-pB/2+10.2) 

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(15+Courtyard*2 10+Courtyard*2 0:-3 pB/8) pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     
    _Circle(pB/2)   
    _Rectangle(10.5 10.3 0:-2.8)
)

_CreateRefValue(pName) 

_SaveDesign(pName)    
_MakeDevice(pName,2) 
