; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard pB. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Relay
;Desc:JQX115F Family Relay
;Vendor:stavrosatic@gmail.com
;Count:1

Yard=0.5 pA=29.0 pB=12.7 pH=15.7 pName="JQX115F"

PadN=_PadTH_Default(1.9 1.3) ; 管脚焊盘
PadN1=_PadTH_Default(1.9 1.3 t);

_CreatePin(PadN1 -pA/2+2.6:-3.78 "1")
_CreatePin(PadN  -pA/2+2.6+20.16-5.04:-3.78 "2")
_CreatePin(PadN  -pA/2+2.6+20.16:-3.78 "3")
_CreatePin(PadN  -pA/2+2.6+20.16+5.04:-3.78 "4")
_CreatePin(PadN  -pA/2+2.6+20.16+5.04:3.78 "5")
_CreatePin(PadN  -pA/2+2.6+20.16:3.78 "6")
_CreatePin(PadN  -pA/2+2.6+20.16-5.04:3.78 "7")
_CreatePin(PadN  -pA/2+2.6:3.78 "8")

;silkscreen & assembly
for(i 1 2
    if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(pA pB 0:0)
)

;bound
_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Yard pB+Yard) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
