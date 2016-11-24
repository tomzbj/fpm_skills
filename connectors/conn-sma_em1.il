; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Connector/RF Connector
;Desc:Clamp type SMA connector (SMA-EM1)
;Vendor:stavrosatic@gmail.com
;Count:1

pH=6.5 pPadX=5.0 pPadY=1.8 pName="SMA_EM1"
_PrepareNewSym(pName)

;pin
FilletR=0.0
PadN1=_PadSMFillet(pPadX pPadY)
FilletR=0.9
PadN2=_PadSMFillet(pPadX pPadY)
PadN3=_PadSMFillet(pPadX pPadY t)

_CreatePin(PadN1 -2.5:0 "1")
_CreatePin(PadN2 -2.5:2.54 "S1")
_CreatePin(PadN2 -2.5:-2.54 "S2")
_CreatePin(PadN3 -2.5:2.54 "S3")
_CreatePin(PadN3 -2.5:-2.54 "S4")

;place bound & dfa bound
_Layer(lPkgGeoPlaceT)
_BoundHeight(_ShapeRectangle(6.0 8.0 -3.0:0) pH)
_Layer(lPkgGeoDfaT) 
_BoundHeight(_ShapeRectangle(6.0 8.0 -3.0:0) pH pName)

;assembly, no silkscreen!
_Layer(lPkgGeoAsmT) 
_Rectangle(1.5 6.5 0.75:0 0)
_Line( list( 1.5:2.0 10.0:2.0 10.0:-2.0 1.5:-2.0)  )
for( j 0 5
    _Line( list( 9.5-j*0.5:2.5 9.5-j*0.5:-2.5) )
)

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()

_SaveDesign(pName)
_MakeDevice(pName,2)
