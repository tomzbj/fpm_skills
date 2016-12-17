; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Socket/SMD-Through Hole Converter
;Desc:PLCC44 Through Hole Socket
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=.3 Pitch=5.08 pL=7.62 pA=23.5 pB=23.5 pH=4.00 pPad=1.50 pHole=0.90 pName="PLCC44_TH"
_PrepareNewSym(pName)

;pin
PadN=_PadTH_Default(pPad pHole)
for(i 1 3 _CreatePin(PadN 2.54*1.5-i*2.54:2.54*2.5 i*2-1) _CreatePin(PadN 2.54*0.5-i*2.54:2.54*3.5 i*2))
for(i 1 5 _CreatePin(PadN -2.54*3.5:2.54*3.5-i*2.54 i*2+5) _CreatePin(PadN -2.54*2.5:2.54*3.5-i*2.54 i*2+6))
for(i 1 6 _CreatePin(PadN -2.54*4.5+i*2.54:-2.54*2.5 i*2+15) _CreatePin(PadN -2.54*3.5+i*2.54:-2.54*3.5 i*2+16))
for(i 1 5 _CreatePin(PadN 2.54*3.5:-2.54*3.5+i*2.54 i*2+27) _CreatePin(PadN 2.54*2.5:-2.54*3.5+i*2.54 i*2+28))
for(i 1 3 _CreatePin(PadN 2.54*4.5-i*2.54:2.54*2.5 i*2+37) _CreatePin(PadN 2.54*3.5-i*2.54:2.54*3.5 i*2+38))

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA pB) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB 0:0 1) ;A B Center Fillet
    _Circle(0.5 -10:10)
    _Circle(0.5 1.27:5)
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2) 
