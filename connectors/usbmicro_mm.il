; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/USB Connector
;Desc:Micro USB Standard Type B, Mid Mount (Drop-In), CSCONN CMU06581C117
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 pA=6.5 pB=12.0 pH=2.6 pL=5.7 pW=8.1 pitch=0.65 
pName="USBMICRO_MM_CMU06581C117"

_PrepareNewSym(pName)

PadN   = _PadSMFillet(2.6 0.35)
PadN15 = _PadSMFillet(2.6 0.7)
PadM   = _PadSMFillet(2.4 2.0)
;pin
_CreatePin(PadM -2.0:5.0 "S1")
_CreatePin(PadM -2.0:-5.0 "S2")
_CreatePin(PadM  2.2:5.0 "S3")
_CreatePin(PadM  2.2:-5.0 "S4")

_CreatePin(PadN15 2.7:pitch*2+0.2 1)
_CreatePin(PadN   2.7:pitch*1 2)
_CreatePin(PadN   2.7:pitch*0 3)
_CreatePin(PadN   2.7:pitch*-1 4)
_CreatePin(PadN15 2.7:pitch*-2-0.2 5)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)

;slot
_Layer(lBrdGeoOutline)
_Rectangle(4.5 8.0 -1:0)

;silkscreen & assembly
_Layer(lPkgGeoAsmT) 
_Rectangle(8.0 8.5 -0.8:0 0) ;A B Center Fillet
_Layer(lPkgGeoSilkT))
_Rectangle(8.0 8.5 -0.8:0 0) ;A B Center Fillet

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
