; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:PowerModule/AC-DC Module
;Desc:HLK Isolated AC-DC Module
;Vendor:stavrosatic@gmail.com
;Count:1

pA=34.0 pB=20.2 pH=15.0 pPad=1.8 pHole=1.2 Courtyard=0.2 pName="HLK-PM12" 
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
PadN1=_PadTH_Default(pPad pHole t)
 
_CreatePin(PadN1 -14.7: 2.5 "1")
_CreatePin(PadN -14.7:-2.5 "2")
_CreatePin(PadN  14.7: 7.7 "3")
_CreatePin(PadN  14.7:-7.7 "4")

;Place层
_Layer(lPkgGeoDfaT)
_BoundHeight( _ShapeRectangle(pA pB) pH pName)

_Layer(lPkgGeoPlaceT) ;切换到PlaceTop层
_BoundHeight(_ShapeRectangle(pA+2*Courtyard pB+2*Courtyard) pH)

for(asm 0 1 ;丝印和装配层
        if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;层切换
    _Rectangle(pA pB)
)

_CreateRefValue(pName) ;必须的文字层

_SaveDesign(pName)    ;保存文件
_MakeDevice(pName,2) ;需要的话附带生成DEVICE文件,0=IC 1=IO 2=DISCRETE
