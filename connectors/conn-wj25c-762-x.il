; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/PCB Connector
;Desc:WJ25C header, 7.62mm pitch
;Vendor:stavrosatic@gmail.com
;Count:7

Courtyard=0.3 Pitch=7.62 pB=13.5 pH=14.8 pPad=1.8 pHole=1.0

PadN1 = _PadTH_Default(pPad pHole t)
PadN  = _PadTH_Default(pPad pHole)
for(num 2 8 

    sprintf(pName, "WJ25C-762-%d", num)
    _PrepareNewSym(pName)
    pA=num*Pitch+1.50 
    for(i 1 num
        xpos = (i-(num+1.0)/2)*Pitch
        if(i==1
            _CreatePin(PadN1 xpos:0 i) 
            _CreatePin(PadN  xpos:0 i) 
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
        for(n 1 num-1
            xpos=(n-num/2.0)*Pitch
            _Line(list(xpos:(pB-1)/2 xpos:-(pB-1)/2))
        )
        for(n 1 num
            xpos = (n-(num+1.0)/2)*Pitch
            _Line(list(xpos-2:0 xpos+2:0))
            _Line(list(xpos:2 xpos:-2))
            _Circle(3 xpos:0) 
        )
    )
    
    ;ref & val
    _CreateRefValue(pName 0:0)
    _CrossCenter()
    
    _SaveDesign(pName)
    _MakeDevice(pName,2)
)
