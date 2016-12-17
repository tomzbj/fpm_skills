; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/USB Connector
;Desc:Micro USB Standard Type B, Surface Mount
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0 pA=4.8 pB=8.8 pH=2.6 pL=5.7 pW=8.1 pitch=0.65 pName="USBMICRO_5S_B"

_PrepareNewSym(pName)

PadN   = _PadSMFillet(2.0 0.4)
PadN15 = _PadSMFillet(2.0 0.5)
PadM1  = _Pad_Slot(2.0 1.4 1.2 0.6)
PadM2  = _PadTH_Default(1.1 0.8)
;pin
_CreatePin(PadM1 0.0:3.62   "S1")
_CreatePin(PadM1 0.0:-3.62  "S2")
_CreatePin(PadM2 2.65:2.42  "S3")
_CreatePin(PadM2 2.65:-2.42 "S4")

_CreatePin(PadN15 3.2:pitch*2+0.05 1)
_CreatePin(PadN   3.2:pitch*1 2)
_CreatePin(PadN   3.2:pitch*0 3)
_CreatePin(PadN   3.2:pitch*-1 4)
_CreatePin(PadN15 3.2:pitch*-2-0.05 5)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA pB 0.9:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pL pW 0.4:0) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pL pW 0.4:0 0) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
