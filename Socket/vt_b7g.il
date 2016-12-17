; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Vacuum Tube Socket
;Desc:Miniature 7 pins (B7G) 
;Vendor:stavrosatic@gmail.com
;Count:1

pL=7.0  pA=18.5 pH=18.5 Courtyard=0.3 pName="VT_B7G"   
_PrepareNewSym(pName)  
PadS = _Pad_Slot(3.0 1.6 2.2 0.8)

for(i 1 7
    j=i+6
    angle = j*45
    rad = angle * 3.1416/180
    _CreatePin(PadS pL*cos(rad):pL*sin(rad) i angle+90)
)

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeCircle(pA/2+Courtyard) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeCircle(pA/2) pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT)) 
    _Circle(pA/2)   
)

_CreateRefValue(pName) 

_SaveDesign(pName)
_MakeDevice(pName,2) 
