; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/Power Connector
;Desc:6.3mm lug terminal
;Vendor: stavrosatic@gmail.com
;Count:1

pA=8.0 pB=2.5 pH=6.0 pPad=2.0 pHole=1.4 Courtyard=0.2 pName="LUG508-630X080" 
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
 
_CreatePin(PadN -2.54:0 1)
_CreatePin(PadN  2.54:0 2)

;Place层
_Layer(lPkgGeoPlaceT) ;切换到PlaceTop层
_BoundHeight(_ShapeRectangle(pA+2*Courtyard pB+2*Courtyard 0:0 0.2) pH)
_Layer(lPkgGeoDfaT) ;切换到PlaceTop层
_BoundHeight(_ShapeRectangle(pA pB 0:0 0.2) pH pName)

for(asm 0 1 ;丝印和装配层
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;层切换
    _Rectangle(pA pB 0:0 1.0)
)

_CreateRefValue(pName) ;必须的文字层

_SaveDesign(pName)    ;保存文件
_MakeDevice(pName,2) ;需要的话附带生成DEVICE文件,0=IC 1=IO 2=DISCRETE
