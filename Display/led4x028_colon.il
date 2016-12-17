; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Display/Numeric LED Display
;Desc:Numeric LED Display, 4 Dights, 7 segments with DP, colon, 0.28 inch
;Vendor:stavrosatic@gmail.com
;Count:1

pA=32.2 pB=10.0 pH=6.1 pPad=1.3 pHole=0.7 Courtyard=0.1 pName="LED4x028"
_PrepareNewSym(pName)  

PadN1=_PadTH_Default(pPad pHole t) 
PadN=_PadTH_Default(pPad pHole) 
 
for(x 1 7
    if( x==1 then _CreatePin(PadN1 (x-4)*2.54:-3.81 x)
    else _CreatePin(PadN (x-4)*2.54:-3.81 x) )
   )
for(x 8 14
	_CreatePin(PadN (11-x)*2.54:3.81 x)
   )

_Layer(lPkgGeoPlaceT) 
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0 0) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0:0 0) pH pName)

for(asm 0 1 
    if(asm==1 
        _Layer(lPkgGeoAsmT) 
        _Layer(lPkgGeoSilkT)
    )     
	_Rectangle(pA pB) 
	y1=1.5 x1=3.0 left=-pA/2 top=pB/2
	y2=5 x2=2.6
	y3=8.5 x3=2.2
	for(ofs 0 3
		w1=ofs*8.0
		w2=ofs*8.0+2.9

		_Line(list(left+x1+w1:top-y1 left+x2+w1+.03:top-y2+.3) .5)
		_Line(list(left+x2+w1-.03:top-y2-.3 left+x3+w1:top-y3) .5)

		_Line(list(left+x1+w2:top-y1 left+x2+w2+.03:top-y2+.3) .5)
		_Line(list(left+x2+w2-.03:top-y2-.3 left+x3+w2:top-y3) .5)
			
		_Line( list(left+x1+w1+.6:top-y1 left+x1+w2-.6:top-y1) .5)
		_Line( list(left+x2+w1+.6:top-y2 left+x2+w2-.6:top-y2) .5)
		_Line( list(left+x3+w1+.6:top-y3 left+x3+w2-.6:top-y3) .5)

		_Dot( left+x3+w2+.9:top-y3 .8)
	)
)
_CreateRefValue(pName) 
_SaveDesign(pName)    
_MakeDevice(pName,2) 
