; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transformer/IFT
;Desc:7x7 IFT for Transistor Radio Receiver
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 Pitch=4.6 pA=7.5 pB=7.5 pH=12.0 pPad=1.3 pHole=0.7 pName="IFT7X7"
_PrepareNewSym(pName)

;pin
PadN=_PadTH_Default(pPad pHole)
PadS=_Pad_Slot(2.6 1.4 1.8 0.6)

_CreatePin(PadN -Pitch/2:Pitch/2 "3")
_CreatePin(PadN -Pitch/2:0 "4")
_CreatePin(PadN -Pitch/2:-Pitch/2 "5")
_CreatePin(PadN Pitch/2:-Pitch/2 "1")
_CreatePin(PadN Pitch/2:Pitch/2 "2")

_CreatePin(PadS 0:pB/2 "S1" )
_CreatePin(PadS 0:-pB/2 "S2" )

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
_Layer(lPkgGeoDfaT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
	if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
	_Rectangle(pA pB) ;A B Center Fillet
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
