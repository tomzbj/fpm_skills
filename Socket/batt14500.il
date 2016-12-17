; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/Battery Holder
;Desc:Single cell AA/5#/14500 battery holder
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.3 pitch=53.0 pA=57.0 pB=17.0 pH=18.00 pName="batt14500"
_PrepareNewSym(pName)

PadN = _Pad_Slot(2.6 5.0 0.8 3.2)

_CreatePin(PadN -pitch/2:0 "1")
_CreatePin(PadN pitch/2:0 "2")

_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)


_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB 0:0)
)

_CreateRefValue(pName 0:0 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
