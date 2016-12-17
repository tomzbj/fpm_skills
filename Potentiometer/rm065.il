; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Potentiometer/Through hole potentiometer
;Desc:Blue/White potentiometer
;Vendor:stavrosatic@gmail.com
;Count:1

pL=2.54  pA=5.2 pH=5.2 pPad=1.6 pHole=1.1 Courtyard=2.0 pName="RM065" 
_PrepareNewSym(pName) 

PadN=_PadTH_Default(pPad pHole)
PadN1=_PadTH_Default(pPad pHole t)

_CreatePin(PadN 0:2.5 2 ) 
_CreatePin(PadN1 -2.5:-2.5 1 )
_CreatePin(PadN 2.5:-2.5 3 )

;Place层
_Layer(lPkgGeoPlaceT) ;切换到PlaceTop层
;_BoundHeight(_ShapeRectangle(pA+1.3 pA-1 0:-0.6 1) pH)
s1=_ShapeCircle(3.25)
s2=_ShapeRectangle( 6.5 4.0 0:-2 )
p1=_PolyCreate(s1) p2=_PolyCreate(s2)
poly=axlPolyOperation(p1 p2 'OR )

foreach(onepoly poly 
    objs=axlDBCreateShape(onepoly t)
    _BoundHeight(onepoly 7.7) 
)

for(asm 0 1 ;丝印和装配层
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT)) ;层切换
    _Line( list( -3.25:-3.95 -3.25:0) )
    _Line( list( -3.25:-3.95 3.25:-3.95) )
    _Line( list( 3.25:-3.95 3.25:0) )
    _Line( list( -2.5:0 2.5:0 ) )
    _Line( list( 0:-1 0:1 ) )
    _Circle( 3.25 )
)

_CreateRefValue(pName) ;必须的文字层

_SaveDesign(pName);保存文件
_MakeDevice(pName,2) ;需要的话附带生成DEVICE文件,0=IC 1=IO 2=DISCRETE 
