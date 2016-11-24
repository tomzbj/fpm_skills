; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/RF Connector
;Desc:Clamp type BNC connector (BNC-EM1)
;Vendor:stavrosatic@gmail.com
;Count:1

pH=6.5 pPadX=6.0 pPadY=2.5 pName="BNC_EM1"
_PrepareNewSym(pName)

;pin
FilletR=0.0
PadN1=_PadSMFillet(pPadX pPadY)
FilletR=0.9
PadN2=_PadSMFillet(pPadX pPadY)
PadN3=_PadSMFillet(pPadX pPadY t)

_CreatePin(PadN1 -3.0:0 "1")
_CreatePin(PadN2 -3.0:5.0 "2")
_CreatePinMechanical(PadN2 -3.0:-5.0)
_CreatePinMechanical(PadN3 -3.0:5.0)
_CreatePinMechanical(PadN3 -3.0:-5.0)

;place bound & dfa bound
_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(7.0 14.0 -3.5:0) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(7.0 14.0 -3.5:0) pH pName)

;assembly, no silkscreen!
_Layer(lPkgGeoAsmT) 
_Rectangle(1.0 12.0 0.5:0 0)
;_Rectangle(1.0 12.0 9:0 0)
_Line( list( 1.0:5.0 13.5:5.0 13.5:-5.0 1.0:-5.0)  )

_Line( list( 9.0:5.0 9.0:6.0 10.0:6.0 10.0:5.0) )
_Line( list( 9.0:-5.0 9.0:-6.0 10.0:-6.0 10.0:-5.0) )
for( j 3 10 
    _Line( list( j*0.5:6 j*0.5:-6) )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
