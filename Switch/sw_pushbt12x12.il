; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Switch/Button
;Desc:Pushbutton 12x12
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.2 Pitch=5.0 pL=12.0 pA=12.0 pB=12.0 pH=10.0 pPad=1.8 pHole=1.1 pName="PUSHBT12X12"
_PrepareNewSym(pName)
;pin
PadN1=_PadTH_Default(pPad pHole t)
PadN=_PadTH_Default(pPad pHole)
_CreatePin(PadN1 -Pitch/2:-pL/2 "1")
_CreatePin(PadN Pitch/2:-pL/2 "2")
_CreatePinMechanical(PadN -Pitch/2:pL/2)
_CreatePinMechanical(PadN Pitch/2:pL/2)
;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT)
_BoundHeight(_ShapeRectangle(pA pB) pH pName)
;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB 0:0 1) ;A B Center Fillet
   )
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
