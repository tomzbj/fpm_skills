; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/PCB Connector
;Desc:XH header, 2.5mm pitch
;Vendor:stavrosatic@gmail.com
;Count:15

Courtyard=0.3 Pitch=2.5 pB=5.8 pH=7.0 pPad=1.6 pHole=1.0

PadN1 = _PadTH_Default(pPad pHole t)
PadN  = _PadTH_Default(pPad pHole)
for(num 2 16 

    sprintf(pName, "XH25A-%d", num)
    _PrepareNewSym(pName)
    pA=(num+1)*Pitch
    
    for(i 1 num
        xpos = (i-(num+1.0)/2)*Pitch
        if(i==1
            _CreatePin(PadN1 xpos:-0.6 i) 
            _CreatePin(PadN  xpos:-0.6 i) 
        ) 
    )
    
    ;bound
    _Layer(lPkgGeoPlaceT) ;PlaceTop
    _BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH) 
    ;A B Center Height
    _Layer(lPkgGeoDfaT) 
    _BoundHeight(_ShapeRectangle(pA pB) pH pName)
    
    ;assembly
    for(i 1 2
        if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
        _Rectangle(pA pB)
        _Rectangle(pA-1 pB-1)
        _Line(list(-(pA-1)/2:0.3 (pA-1)/2:0.3))
        x1 = (1-(num+1.0)/2-0.5)*Pitch
        x2 = (1-(num+1.0)/2+0.5)*Pitch
        x3 = (num-(num+1.0)/2-0.5)*Pitch
        x4 = (num-(num+1.0)/2+0.5)*Pitch
        _Line(list(x1:-(pB-1)/2 x1:-pB/2))
        _Line(list(x2:-(pB-1)/2 x2:-pB/2))
        _Line(list(x3:-(pB-1)/2 x3:-pB/2))
        _Line(list(x4:-(pB-1)/2 x4:-pB/2))
    )
    
    ;ref & val
    _CreateRefValue(pName 0:0)
    _CrossCenter()
    
    _SaveDesign(pName)
    _MakeDevice(pName,2)
)
