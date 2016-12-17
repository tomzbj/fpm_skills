;FPM skill by Richard L. version=0.08 fpmontreal@gmail.com
;Tree:Transformer/LF Transformer
;Desc:Transformer 42mm(L)x22mm(W)x34mm(H), 5VA
;Vendor:stavrosatic@gmail.com
;Count:1
;CVG64:
;Datasheet:

pName="test"
_PrepareNewSym(pName)

_Layer(lPkgGeoPlaceT) ;PlaceTop

Shape1 = _ShapeRectangle(30 30 0:0 5)
Shape2 = _ShapeRectangle(20 50 0:0 5)
Shape3 = _ShapeRectangle(40 10 0:0 5)
axlShapeMerge( car(Shape1) list(car(Shape2) car(Shape3)) 'quiet)

axlChangeWidth(car(Shape1) 0.2)
Path1 = axlDB2Path( car(Shape1))


_Layer(lPkgGeoSilkT)
ret = axlDBCreatePath( Path1 )

axlChangeWidth( car(ret) 0.2)

