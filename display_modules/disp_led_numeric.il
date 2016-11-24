; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Numeric LED Display
;Desc:Numeric LED Display
;Vendor:stavrosatic@gmail.com
;Count:17

pH=7.0 pPad=1.3 pHole=0.7 Courtyard=0.3 
PadN1 =_PadTH_Default(pPad pHole t)
PadN  =_PadTH_Default(pPad pHole)

name_tab = `("028" "036" "040" "056")
height_tab = `(10.0 14.0 16.0 19.2)
width_tab= `(7.50 7.50 10.16 12.7)
ypitch_tab = `(3.81 5.08 6.35 7.62)
startnum_tab = `(2 2 2 1)
       
for(size 0 3
    startnum = nth(size startnum_tab)
    width = nth(size width_tab)
    pB = nth(size height_tab)
    ypitch = nth(size ypitch_tab)
    for(num startnum 5
        pA = width * num
        pins = num + 8
        if((mod pins 2)!=0 pins=pins+1)
        sprintf(pName "LED%s-%d-%d" nth(size name_tab) num pins)
        _PrepareNewSym(pName)  ;文件初始化

        _CreatePin(PadN1 (1-(1+pins/2)/2.0)*2.54:-ypitch 1)
        for(x 2 pins/2 
            _CreatePin(PadN (x-(1+pins/2)/2.0)*2.54:-ypitch x)
        )
        for(x pins/2+1 pins _CreatePin(PadN ((pins/2+1+pins)/2.0-x)*2.54:ypitch x))
            
        ;Place层
        _Layer(lPkgGeoPlaceT) ;切换到PlaceTop层
        _BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2) pH)
        _Layer(lPkgGeoDfaT) ;切换到PlaceTop层
        _BoundHeight(_ShapeRectangle(pA pB) pH)

        for(asm 0 1 ;丝印和装配层
            if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     ;层切换

            _Rectangle(pA pB)

            for(i 1 num
                x=(i-(1+num)/2.0)*width
                _Rectangle(width*0.6 pB*0.6 x:0)
                _Line(list(x-width*0.3:0 x+width*0.3:0))
            )
        )
        _CreateRefValue(pName) ;必须的文字层
        _SaveDesign(pName)    ;保存文件
        _MakeDevice(pName,2) ;需要的话附带生成DEVICE文件,0=IC 1=IO 2=DISCRETE
    )
)
