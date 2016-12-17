; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Potentiometer/SMT potentiometer
;Desc:Pot23A
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=1.0 Side=0.5 Heel=0.5 Toe=1.0 pH=3.0 X=4.5 Y=4.5 pName = "POT23A"

_PrepareNewSym(pName)
PadA = _PadSMFillet( 3.0 3.0 )
PadB = _PadSMFillet( 3.0 1.8 )

_CreatePin(PadA -2.0:0 2 )
_CreatePin(PadB 2.0:1.4 1 )
_CreatePin(PadB 2.0:-1.4 3 ) 

;bound
_Layer(lPkgGeoPlaceT) _BoundHeight(_ShapeRectangle(X Y) pH)

;silkscreen & assembly
for(i 1 2 if(i==1 _Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))
	_Rectangle(X Y)
)
;bound
;_Layer(lPkgGeoPlaceT)

;silkscreen & assembly
/*for(i 1 2 
	if(i==1	
		_Layer(lPkgGeoSilkT) _Layer(lPkgGeoAsmT))


)*/
;ref & val
_CreateRefValue(pName)
_CrossCenter()
_SaveDesign(pName)
