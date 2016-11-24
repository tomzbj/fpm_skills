; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Power Module/DC-DC Module
;Desc:Mornsun Isolated DC-DC Module
;Vendor:stavrosatic@gmail.com
;Count:1

pA=19.5 pB=6.0 Pitch=2.54 pH=9.3 pPad=1.3 pHole=0.8 Courtyard=0.3 
pName="MORNSUN_B_LS" 
_PrepareNewSym(pName)

PadN=_PadTH_Default(pPad pHole)
PadN1=_PadTH_Default(pPad pHole t)
 
_CreatePin(PadN -3*Pitch:Pitch/2 "1")
_CreatePin(PadN -2*Pitch:Pitch/2 "2")
_CreatePin(PadN  0*Pitch:Pitch/2 "4")
_CreatePin(PadN  2*Pitch:Pitch/2 "6")

;Place层
_Layer(lPkgGeoDfaT)
_BoundHeight( _ShapeRectangle(pA pB) pH pName)

_Layer(lPkgGeoPlaceT) ;切换到PlaceTop层
_BoundHeight(_ShapeRectangle(pA+2*Courtyard pB+2*Courtyard 0:0 0.0) pH)

for(asm 0 1 ;丝印和装配层
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;层切换
    _Rectangle(pA pB)
)

_CreateRefValue(pName) ;必须的文字层

_SaveDesign(pName)    ;保存文件
_MakeDevice(pName,2) ;需要的话附带生成DEVICE文件,0=IC 1=IO 2=DISCRETE
