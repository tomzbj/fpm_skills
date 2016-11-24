; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Numeric LED Display
;Desc: Matrix LED Display, 8x8 dots, 20.3mm x 20.3mm (0.8inch x 0.8inch)
;Vendor: stavrosatic@gmail.com
;Count:1

pA=20.3 pB=20.3 pH=7.0 pPad=1.3 pHole=0.7 Courtyard=0.0 pName="LEDMTRX8X8_203X203S"   
_PrepareNewSym(pName)  

FilletR = 0.6
PadN=_PadSMFillet(1.2 3.0)
 
for(x 0 7
	sprintf(pN1 "%d" x+1)
	_CreatePin(PadN (x-3.5)*2.54:-pB/2-2 pN1)
	sprintf(pN2 "%d" x+9)
	_CreatePin(PadN (3.5-x)*2.54:pB/2+2 pN2)
   )

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0 0) pH)

for(asm 0 1 
        if(asm==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))     
	_Rectangle(pA pB)
    
    for(y 1 8
        for(x 1 8
            _Dot((x-0.5)*2.54-pA/2:(y-0.5)*2.54-pB/2 2.0)
        )
	)
)
_CreateRefValue(pName) 
_SaveDesign(pName)    
_MakeDevice(pName,2) 
