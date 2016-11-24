; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Diodes/Through hold LED
;Desc:Through hole LED 5mm
;Vendor:stavrosatic@gmail.com
;Count:1

pH=7.7 Pitch=2.54 d=5.8 pName="LED_T5"

_PrepareNewSym(pName)
PadN1=_PadTH_Default(1.5 0.9 t)
PadN =_PadTH_Default(1.5 0.9  )

_CreatePin(PadN1 -Pitch/2:0 "1")
_CreatePin(PadN   Pitch/2:0 "2")

;bound
_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeCircle(d/2.0+0.5) pH)
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeCircle(d/2.0) pH pName)

;silkscreen & assembly
for(i 1 2 
    if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Circle(d/2.0)
)

;ref & val
_CreateRefValue(pName 0:d/2+tSilkHeight/2+SilkWidth 0:d/2+tSilkHeight/2+SilkWidth)
_SaveDesign(pName)
