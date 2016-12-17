; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Pad/PAD
;Desc:2pin PAD, 1-SIG 2-GND
;Vendor:stavrosatic@gmail.com
;Count:1

PadR=1.8 pName="USART2S"
_PrepareNewSym(pName)

;pin
PadN1 = _PadSM(PadR PadR t nil)
PadN = _PadSM(PadR PadR nil t) ;Circle pad

_CreatePin(PadN1 0:1.5 "1" 45)
_CreatePin(PadN 1.5:0 "2")

;bound
_Layer(lPkgGeoPlaceT)
;_BoundHeight(_ShapeCircle(pD/2+Courtyard) pH)
_Layer(lPkgGeoDfaT)
;_BoundHeight(_ShapeCircle(pD/2) pName pH)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
;    _Circle(pD/2)
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
