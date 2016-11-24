; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/RF Connector
;Desc:Right angle SMA connector
;Vendor:Stavros@foretechstudio
;Count:1
;CVG64:
;Datasheet:

pA=5.1 pB=5.1 pH=13.6 pPad=2.4 pHole=1.4

pName="SMA_RA"
_PrepareNewSym(pName)

;pin
PadN=_PadTH_Default(pPad pHole)
PadN1=_PadTH_Default(pPad pHole t)

_CreatePin(PadN1 0:0 1)
_CreatePin(PadN -pA/2:-pB/2 2)
_CreatePinMechanical(PadN  pA/2:-pB/2)
_CreatePinMechanical(PadN -pA/2:pB/2)
_CreatePinMechanical(PadN  pA/2:pB/2)

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH)

;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB) pH pName )

;silkscreen & assembly
for(i 0 1
    if(i==1 
        _Layer(lPkgGeoAsmT) 
        _Layer(lPkgGeoSilkT))
        _Rectangle(pA pB 0:0 0) ;A B Center Fillet
        _Line( list( pA/2:2.0 pA/2+8.5:2.0 pA/2+8.5:-2.0 pA/2:-2.0) 
    )  
    for( j 0 5
        _Line( list( pA/2+8.0-j*0.5:2.5 pA/2+8.0-j*0.5:-2.5) )
    )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
