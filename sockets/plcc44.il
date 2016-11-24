; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:IC/Plastic LCC
;Desc:Plastic LCC 44pin
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=1.8 pA=16.6 pB=16.6 pH=4.6 pName="PLCC44" 
_PrepareNewSym(pName)

FilletR = 0.3 
PadN1 = _PadSMFillet( 0.6 2.4 )
PadN2 = _PadSMFillet( 2.4 0.6 )

;pin
for( i 1 6 _CreatePin( PadN1 (i-1)*(-1.27):pB/2+0.3 i))
for( i 7 17 _CreatePin( PadN2 -pA/2-0.3:(i-12)*(-1.27) i))
for( i 18 28 _CreatePin( PadN1 (i-23)*1.27:-pB/2-0.3 i))
for( i 29 39 _CreatePin( PadN2 pA/2+0.3:(i-34)*1.27 i))
for( i 40 44 _CreatePin( PadN1 (i-45)*(-1.27):pB/2+0.3 i))

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop
_BoundHeight(_ShapeRectangle(pA+Courtyard*2 pB+Courtyard*2 0:0) pH)
;A B Center Height
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(pA pB 0:0) pH pName)

;silkscreen & assembly
for(i 0 1
    if(i==1 _Layer(lPkgGeoAsmT) _Layer(lPkgGeoSilkT))
    _Rectangle(pA pB)
    _Line(list(-pA/2:pB/2-1 -pA/2+1:pB/2))
    _Dot(0:pB/2-2 0.8)
)
;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
