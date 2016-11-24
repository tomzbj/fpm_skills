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

Courtyard=0 pA=4.7 pB=9.8 pH=2.6 pL=5.7 pW=8.1 pitch=0.65 pName="USBMICRO-STD-B"
_PrepareNewSym(pName)

PadM1 = _PadSMFillet(1.9 1.8)
PadM2 = _PadSMFillet(1.4 1.0)
PadN  = _PadSMFillet(1.6 0.4)
PadN15  = _PadSMFillet(1.6 0.7)
PadT  = _PadTH_Default(0.1 0.5)
;pin
_CreatePin(PadM1 0:4 "S1")
_CreatePin(PadM1 0:-4 "S2")
_CreatePin(PadM1 0:1.2 "S3")
_CreatePin(PadM1 0:-1.2 "S4")

_CreatePin(PadM2 2.35:3.5 "S5")
_CreatePin(PadM2 2.35:-3.5 "S6")

_CreatePin(PadN15 2.9:pitch*2+0.15 1)
_CreatePin(PadN 2.9:pitch*1 2)
_CreatePin(PadN 2.9:pitch*0 3)
_CreatePin(PadN 2.9:pitch*-1 4)
_CreatePin(PadN15 2.9:pitch*-2-0.15 5)

_CreatePinMechanical(PadT 2.4:2.25)
_CreatePinMechanical(PadT 2.4:-2.25)
;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0.9:0) pH)


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
