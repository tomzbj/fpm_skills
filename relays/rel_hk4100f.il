; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Relay
;Desc:HK4100F SPDT Relay
;Vendor:stavrosatic@gmail.com
;Count:1

Yard=0.5 W=15.5 L=10.5 H=11.8 pName="HK4100F"
_PrepareNewSym(pName)

PadN=_PadTH_Default(1.6 0.7) ; 管脚焊盘
PadNT=_PadTH_Default(1.6 0.7 t);

_CreatePin(PadNT -2.5*2.54:-1.5*2.54 "1")
_CreatePin(PadN  -1.5*2.54:-1.5*2.54 "2")
_CreatePin(PadN   2.5*2.54:-1.5*2.54 "3")
_CreatePin(PadN   2.5*2.54: 1.5*2.54 "4")
_CreatePin(PadN  -1.5*2.54: 1.5*2.54 "5")
_CreatePin(PadN  -2.5*2.54: 1.5*2.54 "6")

;silkscreen & assembly
for(i 1 2
    if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
    _Rectangle(W L 0:0)
)

;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(W+Yard L+Yard 0:0) H)
_Layer(lPkgGeoDfaT) _BoundHeight(_ShapeRectangle(W L 0:0) H "pName")

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter(0:0);pick-place marker(0:0)
_SaveDesign(pName)
_MakeDevice(pName 2)
