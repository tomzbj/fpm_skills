; This is is a free software and there is NO WARRANTY. No restriction on use. 
; You can use, modify and redistribute it for personal, non-profit or 
; commercial products UNDER YOUR RESPONSIBILITY. Redistributions of source 
; code must retain the above copyright notice.
; Copyright (C) 2016, Zhang Hao, all right reserved.
;
;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transformer/LF Transformer
;Desc:Transformer 42mm(L)x22mm(W)x34mm(H), 5VA
;Vendor:stavrosatic@gmail.com
;Count:1

Courtyard=0.5 Pitch=56.0 pA=42.0 pB=22.0 pH=34.0 pPad=7.0 pHole=3.5 pA2=30.0 pB2=40.0 pA3=68.0 pB3=16.0
pName="TSFM_42x22x34"
_PrepareNewSym(pName)
;pin

PadN = _PadTH_Default(pPad pHole)

_CreatePin(PadN -Pitch/2:0 "S1")
_CreatePin(PadN  Pitch/2:0 "S2")

;bound
_Layer(lPkgGeoPlaceT) ;PlaceTop

Shape1 = _ShapeRectangle(pA pB 0:0 1)
Shape2 = _ShapeRectangle(30 40 0:0 5)
Shape3 = _ShapeRectangle(68 16 0:0 8) 
axlShapeMerge( car(Shape1) list(car(Shape2) car(Shape3)) 'quiet)
path = axlDB2Path(car(Shape1))
       
;silkscreen & assembly
_Layer(lPkgGeoSilkT)
lr=axlDBCreatePath(path) 
axlChangeWidth( car(lr) 0.2)
_Layer(lPkgGeoAsmT) 
lr=axlDBCreatePath(path) 
axlChangeWidth( car(lr) 0.2)

_Layer(lPkgGeoDfaT)
_BoundHeight( list(Shape1 nil) pH )

;ref & val
_CreateRefValue(pName 0:0)
_CrossCenter()
_SaveDesign(pName)
_MakeDevice(pName,2)
