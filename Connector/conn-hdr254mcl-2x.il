; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/PCB Connector
;Desc:Clamp header, 2.54mm pitch
;Vendor:stavrosatic@gmail.com
;Count:1
;CVG64:
;Datasheet:

Pitch=2.54 pA=9.0 pB=2.54 pH=4.0 PadL=4.0 PadW=1.8

for( num 2 20 

    sprintf(pName, "HDR254MCL-2X%d", num)
    _PrepareNewSym(pName)
    
    ;pin
    FilletR = 0.0
    PadT1=_PadSMFillet(PadL PadW)
    FilletR = 0.9
    PadT=_PadSMFillet(PadL PadW)
    PadB=_PadSMFillet(PadL PadW t)
    
    for( i 1 num
        ypos = float(num+1)/2-i
        if( i==1
            _CreatePin(PadT1 -2:Pitch*ypos+0.1 i*2-1) 
            _CreatePin(PadT -2:Pitch*ypos+0.1 i*2-1) ) 
        _CreatePin(PadB -2:Pitch*ypos-0.1 i*2)
    )
    
    ;bound
    _Layer(lPkgGeoPlaceT) ;PlaceTop
    _BoundHeight(_ShapeRectangle( 4.5 Pitch*num+2 -2.25:0) pH)
    
    ;A B Center Height
    _Layer(lPkgGeoDfaT) 
    _BoundHeight(_ShapeRectangle( 4.5 Pitch*num+2 -2.25:0) pH pName)
    
    ;assembly
    _Layer(lPkgGeoAsmT)
    _Rectangle(pA pB*num+7.5 pA/2:0 0) ;A B Center Fillet
    _Rectangle(7 4.5 pA-3.5:0 0)
    ;silkscreen
    _Layer(lPkgGeoSilkT)
    _Dot(-3:Pitch*float(num)/2+0.5 1.0)
    ;_Rectangle(pA pB*num+7.5 pA/2:0 0) ;A B Center Fillet
    ;_Rectangle(7 4.5 pA-3.5:0 0)
    
    ;ref & val
    _CreateRefValue(pName 0:0)
    _CrossCenter()
    
    _SaveDesign(pName)
    _MakeDevice(pName,2)
)
