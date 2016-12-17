; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Numeric LED Display
;Desc:Matrix LED Display, 5x7 dots, 17.8mm x 12.7mm (0.7inch x 0.5inch)
;Vendor:stavrosatic@gmail.com
;Count:1

pA=17.8 pB=12.7 pH=7.0 pPad=1.3 pHole=0.7 Courtyard=0.0 pName="LEDMTRX5X7_178X127"   
_PrepareNewSym(pName)  
PadN=_PadTH_Default(pPad pHole) 
 
for(x 0 5
	sprintf( pN1 "%d" x+1)
	_CreatePin(PadN (x-2.5)*2.54:-3.81 pN1)
	sprintf( pN2 "%d" x+7)
	_CreatePin(PadN (2.5-x)*2.54:3.81 pN2)
   )

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0 0) pH)

for(asm 0 1 
    if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     
	_Rectangle(pA pB)
    
    for(y 1 5
        for(x 1 7
            _Dot((x-0.5)*2.54-pA/2:(y-0.5)*2.54-pB/2 2.0)
        )
	)
)
_CreateRefValue(pName) 
_SaveDesign(pName)    
_MakeDevice(pName,2) 
