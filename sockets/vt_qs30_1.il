; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Vacuum Tube Socket
;Desc:QS30-1
;Vendor:stavrosatic@gmail.com
;Count:1

pL=8.3  pA=30.0 pH=30.0 pPad=2.5 pHole=1.8 Courtyard=0.5 angle=360.0/14

pName="VT_QS30_1"   
_PrepareNewSym(pName)  

PadN=_PadTH_Default(pPad pHole) 
PadN1=_PadTH_Default(pPad pHole t) 

for(i 1 13
    j=i+9
    if(i==1 then
        _CreatePin(PadN1 pL*cos((j+.5)*angle*3.1416/180):pL*sin((j+.5)*angle*3.1416/180) i)
    else
        _CreatePin(PadN pL*cos((j+.5)*angle*3.1416/180):pL*sin((j+.5)*angle*3.1416/180) i)
    )
) 

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeCircle(pA/2+Courtyard lPkgGeoPlaceT) pH)

for(asm 0 1 
if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT)) 
    _Circle(pA/2)   
	_Circle(4.2)
)
_CreateRefValue(pName) 

_SaveDesign(pName)
_MakeDevice(pName,2)
