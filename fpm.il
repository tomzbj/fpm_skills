
(ProtList = nil)

(SkillDir = "")

(fpmStrLevel = "")

(fpmSMDlevel = 1)

(_PadName = nil)

(Pitch = 0.0)

(shapeOffsetY = 0)

(solder_mask_offset = 0.1)

(SilkGap = 0.3)

(SilkWidth = 0.2)

(Pin2Pin = 0.2)

(Roundoff = 0.05)

(bDeviceFile = nil)

(bFilletPad = nil)

(bSmoothThermal = 1)

(bViaSolderMask = nil)

(DiodePin1Name = "1")

(DiodePin2Name = "2")

(FilletR = 0.1)

(pad_th_od2id = 0.2)

(pad_th_anti2d = 0.2)

(pad_th_d2hole = 0.6)

(pad_th_spoke = 0.4)

(tSilkName = "2")

(tSilkWidth = 1.2)

(tSilkHeight = 1.5)

(tSilkLinespace = 1.0)

(tSilkPhotowidth = 0.15)

(tSilkCharspace = 0.0)

(tSymName = "3")

(tSymWidth = 0.3)

(tSymHeight = 0.4)

(tSymLinespace = 0.0)

(tSymPhotowidth = 0.0)

(tSymCharspace = 0.0)

(lPkgGeoAsmT = "PACKAGE GEOMETRY/ASSEMBLY_TOP")

(lPkgGeoSilkT = "PACKAGE GEOMETRY/SILKSCREEN_TOP")

(lPkgGeoAsmB = "PACKAGE GEOMETRY/ASSEMBLY_BOTTOM")

(lPkgGeoSilkB = "PACKAGE GEOMETRY/SILKSCREEN_BOTTOM")

(lPkgGeoPlaceT = "PACKAGE GEOMETRY/PLACE_BOUND_TOP")

(lPkgGeoPlaceB = "PACKAGE GEOMETRY/PLACE_BOUND_BOTTOM")

(lPkgGeoSmT = "PACKAGE GEOMETRY/SOLDERMASK_TOP")

(lPkgGeoSmB = "PACKAGE GEOMETRY/SOLDERMASK_BOTTOM")

(lPkgGeoPmT = "PACKAGE GEOMETRY/PASTEMASK_TOP")

(lPkgGeoPmB = "PACKAGE GEOMETRY/PASTEMASK_BOTTOM")

(lPkgGeoDfaT = "PACKAGE GEOMETRY/DFA_BOUND_TOP")

(lPkgGeoDfaB = "PACKAGE GEOMETRY/DFA_BOUND_BOTTOM")

(lRouteKoT = "ROUTE KEEPOUT/TOP")

(lRouteKoB = "ROUTE KEEPOUT/BOTTOM")

(lRouteKoA = "ROUTE KEEPOUT/ALL")

(lEtchT = "ETCH/TOP")

(lEtchB = "ETCH/BOTTOM")

(lPadT = "TOP")

(lPadB = "BOTTOM")

(lPadI = "DEFAULT INTERNAL")

(lPadST = "SOLDERMASK_TOP")

(lPadSB = "SOLDERMASK_BOTTOM")

(lPadPT = "PASTEMASK_TOP")

(lPadPB = "PASTEMASK_BOTTOM")

(lPad3 = list(lPadT lPadI lPadB))

	(lBrdGeoOutline = "BOARD GEOMETRY/OUTLINE")

(bga_fiducal = nil)

(bga_fid_keepout = 2.0)

(bga_fid_pad = 1.0)

(bga_soldermask = 0.0)

(dfa_shap = nil)

(dfa_prop = nil)

(RibbonLead = 0)

(RoundFlatLead = 1)

(JLead = 2)

(RectTermination = 3)

(CylindricalTermination = 4)

(BottomOnlyTermination = 5)

(LeadlessCastellated = 6)

(ButtJoint = 7)

(InwardLShapedRibbon = 8)

(FlatLugLead = 9)

defun(_LoadEnv 
		(fn) 
		(axlSetVariable "psmpath" 
			list(".")
		) 
		(axlSetVariable "padpath" 
			list(".")
		) 
		(result = nil)
		(p = infile(fn)) 
		if(p then 
			(result = t) 
			(bDone = nil) 
			while(((mean = lineread(p)) && (bDone != t)) 
				if((mean != t) then 
					sprintf(tryPar "aTb=list%L" mean) 
					loadstring(tryPar) 
					if((car(aTb) == 100) then 
						(fpmRootDir = nth(1 aTb)) 
						createDir(fpmRootDir) 
						changeWorkingDir(fpmRootDir)
						(fpmSMDlevel = nth(2 aTb)) 
						if((fpmSMDlevel == 0) 
							(fpmStrLevel = "M")
						) 
						if((fpmSMDlevel == 2) 
							(fpmStrLevel = "L")
						) 
						(solder_mask_offset = nth(3 aTb)) 
						(SilkGap = nth(4 aTb))
						(SilkWidth = nth(5 aTb)) 
						(Pin2Pin = nth(6 aTb)) 
						(Roundoff = nth(7 aTb)) 
						if((nth(8 aTb) == 1) 
							(bDeviceFile = t)
						) 
						if((nth(9 aTb) == 1) 
							(bFilletPad = t)
						)
						(bSmoothThermal = nth(10 aTb)) 
						(pin_num_diode = nth(11 aTb)) 
						case(pin_num_diode 
							(0 
								(DiodePin1Name = "C") 
								(DiodePin2Name = "A")
							) 
							(1 
								(DiodePin1Name = "1") 
								(DiodePin2Name = "2")
							) 
							(2 
								(DiodePin1Name = "K") 
								(DiodePin2Name = "A")
							)
						) 
						(FilletR = nth(12 aTb)) 
						(pad_th_anti2d = nth(13 aTb))
						if((nth(14 aTb) == 1) 
							(bViaSolderMask = t)
						) 
						(pad_th_d2hole = nth(15 aTb)) 
						(pad_th_od2id = float(nth(16 aTb))) 
						(pad_th_spoke = nth(17 aTb)) 
						(tSilkWidth = nth(18 aTb))
						(tSilkHeight = nth(19 aTb)) 
						(tSilkLinespace = nth(20 aTb)) 
						(tSilkPhotowidth = nth(21 aTb)) 
						(tSilkCharspace = nth(22 aTb)) 
						(tSymWidth = nth(23 aTb))
						(tSymHeight = nth(24 aTb)) 
						(tSymLinespace = nth(25 aTb)) 
						(tSymPhotowidth = nth(26 aTb)) 
						(tSymCharspace = nth(27 aTb)) 
						if((nth(28 aTb) == 1) 
							(bga_fiducal = t)
						)
						(bga_fid_keepout = nth(29 aTb)) 
						(bga_fid_pad = nth(30 aTb)) 
						(bga_soldermask = nth(31 aTb)) 
						if((nth(32 aTb) == 1) 
							(dfa_shap = t)
						) 
						if((nth(33 aTb) == 1) 
							(dfa_prop = t)
						)
					)
					if((car(aTb) == 101) then 
						sprintf(tryPar "ProtList=list%L" mean) 
						loadstring(tryPar) 
						(bDone = t)
					)
				)
			)
			close(p)
		) result
	)

defun(_Protrusion_calc 
		(PType) 
		(idx = PType) 
		if((PType == 0) then 
			if((Pitch > 0.625) 
				(idx = 0) 
				(idx = 1)
			) else 
			idx++
		) 
		(Toe = nth(((idx * 4) + 1) ProtList))
		(Heel = nth(((idx * 4) + 2) ProtList)) 
		(Side = nth(((idx * 4) + 3) ProtList)) 
		(Courtyard = nth(((idx * 4) + 4) ProtList))
	)

defun(_BoundHeight 
		(bnd \@optional 
			(Hmax 1.0) 
			(Hmin 0.0) DfaClass
		) 
		(axlDBAddProp bnd 
			list(list('PACKAGE_HEIGHT_MAX Hmax) 
				list('PACKAGE_HEIGHT_MIN Hmin)
			)
		) 
		if(DfaClass 
			(axlDBAddProp 
				(axlDBGetDesign) 
				list('DFA_DEV_CLASS DfaClass)
			)
		)
	)

defun(_Layer 
		(layer) 
		(axlDBControl 
			'activeLayer layer
		)
	)

defun(_ShapeCircle 
		(r \@optional layer 
			(pos 
				(0:0)
			)
		) 
		if(layer 
			(sid = (axlDBCreateShape 
					(axlPathStartCircle 
						list(pos r) 0
					) t layer
				)) 
			(sid = (axlDBCreateShape 
					(axlPathStartCircle 
						list(pos r) 0
					) t
				))
		) sid
	)

defun(_Circle 
		(r \@optional 
			(xy 
				(0:0)
			) 
			(w SilkWidth)
		) 
		(axlDBCreateCircle 
			list(xy r) w
		)
	)

defun(_Dot 
		(xy d) 
		(axlDBCreateCircle 
			list(xy 
				(d / 4)
			) 
			(d / 2)
		)
	)

defun(_Line 
		(poss \@optional 
			(w SilkWidth) layer
		) 
		if(layer 
			(axlDBCreateLine poss w layer) 
			(axlDBCreateLine poss w)
		)
	)

defun(_Cross 
		(xy len \@optional 
			(w SilkWidth)
		) 
		(len = float(len)) 
		(_Line 
			list(((car(xy) - (len / 2)):cadr(xy)) 
				((car(xy) + (len / 2)):cadr(xy))
			) w
		) 
		(_Line 
			list((car(xy):(cadr(xy) - (len / 2))) 
				(car(xy):(cadr(xy) + (len / 2)))
			) w
		)
	)

defun(_Rectangle 
		(x y \@optional 
			(center 
				(0:0)
			) 
			(r 0.0)
			(w SilkWidth)
		) 
		(axlDBCreatePath 
			(_PathRectangle x y center r
				w
			)
		)
	)

defun(_HalfCircle 
		(xy r ang \@optional 
			(w SilkWidth)
		) 
		(start = (car(xy):(cadr(xy) + r))) 
		(end = (car(xy):(cadr(xy) - r))) 
		(c = caar((axlDBCreatePath 
					(axlPathArcCenter 
						(axlPathStart 
							list(start)
						) w end nil
						xy
					)
				)
			))
		(axlTransformObject c ?angle ang ?origin
			xy
		)
	)

defun(_StrNoDot 
		(str) 
		rexCompile("\\.") 
		(str = rexReplace(str "_" 0))
	)

defun(_Triangle 
		(xy len angle \@optional 
			(w SilkWidth)
		) 
		defMathConstants(`m) 
		(angleA = ((angle * (m.PI)) / 180.0)) 
		(tp0 = xy)
		(pa = ((car(tp0) - (len * cos(angleA))):(cadr(tp0) - (len * sin(angleA))))) 
		(len = (len / 3.0)) 
		(angleA = (((angle + 90) * (m.PI)) / 180.0)) 
		(tp1 = ((car(pa) - (len * cos(angleA))):(cadr(pa) - (len * sin(angleA))))) 
		(angleA = (((angle + 270) * (m.PI)) / 180.0))
		(tp2 = ((car(pa) - (len * cos(angleA))):(cadr(pa) - (len * sin(angleA))))) 
		(_Line 
			list(tp0 tp1 tp2 tp0) w
		) 
		(angleA = (((angle + 90) * (m.PI)) / 180.0)) 
		(step = fix(((2 * len) / w))) 
		if((step > 1) then 
			for(i 1 step 
				(tp1 = ((car(tp2) - (i * SilkWidth * cos(angleA))):(cadr(tp2) - (i * SilkWidth * sin(angleA))))) 
				(_Line 
					list(tp0 tp1) w
				)
			)
		)
	)

defun(_CreateObjPath 
		(objs \@optional 
			(w SilkWidth) 
			(bDelete t)
		) 
		foreach(obj objs 
			if((obj->segments) then 
				(path = (axlPathStart 
						list(car((car((obj->segments))->startEnd)))
					)) 
				foreach(seg 
					(obj->segments) 
					(end = cadr((seg->startEnd))) 
					case((seg->objType) 
						("line" 
							(axlPathLine path w end)
						) 
						("arc" 
							if((seg->isCircle) then 
								(path = (axlPathStartCircle 
										list((seg->xy) 
											(seg->radius)
										) w
									)) else 
								(path = (axlPathArcCenter path w end 
										(seg->isClockwise)
										(seg->xy)
									))
							)
						)
					)
				) 
				(path = (axlDBCreatePath path))
			)
		) 
		if((bDelete && objs) 
			(axlDeleteObject objs)
		) path
	)

defun(_PolyCreate 
		(shapes \@optional 
			(bDelete t)
		) 
		(thep = (axlPolyFromDB 
				car(shapes)
			)) 
		if(bDelete 
			(axlDeleteObject 
				car(shapes)
			)
		) thep
	)

defun(_PolyOp 
		(polys op) 
		(p = nil) 
		foreach(myp polys 
			(p = (axlPolyOperation myp p op))
		) p
	)

defun(_CrossCenter 
		(\@optional 
			(pos 
				(0:0)
			) 
			(clen 2.0)
		) 
		for(i 0 1 
			if((i == 0) 
				(_Layer "PACKAGE GEOMETRY/BODY_CENTER") 
				(_Layer "PACKAGE GEOMETRY/DISPLAY_TOP")
			) 
			(_Cross pos clen 0)
			(_Circle 
				(clen / 4.0) pos 0
			)
		)
	)

defun(_CornerRectangle 
		(x y \@optional 
			(center 
				(0:0)
			) 
			(len 1)
			(width 0)
		) 
		(x = float(x)) 
		(y = float(y)) 
		(x0 = car(center))
		(y0 = cadr(center)) 
		(_Line 
			list((((-x / 2) + x0):((-y / 2) + len + y0)) 
				(((-x / 2) + x0):((-y / 2) + y0)) 
				(((-x / 2) + len + x0):((-y / 2) + y0))
			) width
		) 
		(_Line 
			list((((-x / 2) + x0):(((y / 2) - len) + y0)) 
				(((-x / 2) + x0):((y / 2) + y0)) 
				(((-x / 2) + len + x0):((y / 2) + y0))
			) width
		) 
		(_Line 
			list(((((x / 2) - len) + x0):((-y / 2) + y0)) 
				(((x / 2) + x0):((-y / 2) + y0)) 
				(((x / 2) + x0):((-y / 2) + len + y0))
			) width
		) 
		(_Line 
			list(((((x / 2) - len) + x0):((y / 2) + y0)) 
				(((x / 2) + x0):((y / 2) + y0)) 
				(((x / 2) + x0):(((y / 2) - len) + y0))
			) width
		)
	)

defun(_SaveDesignShape 
		(filename \@optional 
			(bShape t)
		) 
		(axlDBChangeDesignExtents 
			(axlExtentDB 
				'obstacle
			)
		) 
		if(bShape 
			(fullPathFile = strcat(filename ".ssm")) 
			(fullPathFile = strcat(filename ".fsm"))
		) 
		if(!isFile(fullPathFile) then 
			if(bShape 
				(ts = "shape") 
				(ts = "flash")
			) 
			(axlCompileSymbol ?symbol fullPathFile ?type ts)
		)
		(objs = (axlDBGetShapes nil)) 
		if(objs 
			(axlDeleteObject objs)
		) 
		(fullPathFile = strcat(filename ".log")) 
		if(isFile(fullPathFile) 
			deleteFile(fullPathFile)
		) 
		(axlDBChangeDesignExtents 
			'((-200 -200) 
					(200 200)
				)
		)
	)

defun(_SaveDesign 
		(filename \@optional 
			(psm t)
		) 
		(_Layer lEtchT) 
		(axlDBChangeDesignExtents 
			(axlExtentDB 
				'obstacle
			)
		) 
		(axlWindowFit)
		if(psm 
			(fullPathFile = strcat(filename ".psm")) 
			(fullPathFile = strcat(filename ".bsm"))
		) 
		deleteFile(fullPathFile) 
		(logfullPathFile = strcat(filename ".log")) 
		if(isFile(logfullPathFile) 
			deleteFile(logfullPathFile)
		) 
		(fullPathFile = strcat(filename ".dra"))
		deleteFile(fullPathFile) 
		if(psm 
			(ts = "package") 
			(ts = "mechanical")
		) 
		(axlCompileSymbol ?symbol fullPathFile ?type ts) 
		(axlSaveDesign ?design fullPathFile ?mode "nocheck") 
		if(isFile(logfullPathFile) 
			deleteFile(logfullPathFile)
		)
	)

defun(_PrepareNewSym 
		(symName) 
		(axlDBChangeDesignExtents 
			'((-200 -200) 
					(200 200)
				)
		) 
		(axlSetFindFilter ?enabled 
			list('ALL 
				'ALL
			) ?onButtons 
			list('ALL 
				'ALL
			)
		) 
		(axlAddSelectAll)
		(objs = (axlGetSelSet)) 
		if(objs 
			(axlDeleteObject objs)
		) 
		(axlPurgePadstacks 
			'padstacks nil
		) 
		(fullPathFile = strcat(symName ".dra")) 
		(axlRenameDesign fullPathFile)
	)

defun(_FlushShape nil 
		(axlSetFindFilter ?enabled 
			list('ALL 
				'ALL
			) ?onButtons 
			list('ALL 
				'ALL
			)
		) 
		(axlAddSelectAll) 
		(objs = (axlGetSelSet))
		if(objs 
			(axlDeleteObject objs)
		) 
		(axlPurgePadstacks 
			'padstacks nil
		)
	)

defun(_PadSM 
		(x y \@optional bRect bRound
			(maskoversize 0.0) bBottom bNoPaste
		) 
		if((maskoversize > 0.0) 
			(solder_masksize = ((x + (maskoversize * 2)):(y + (maskoversize * 2)))) 
			(solder_masksize = ((x + (solder_mask_offset * 2)):(y + (solder_mask_offset * 2))))
		) 
		sprintf(_PadName "X%.2fY%.2f" x y) 
		(_PadName = (_StrNoDot _PadName))
		if(bBottom 
			(_PadName = strcat(_PadName "B")) 
			(_PadName = strcat(_PadName "T"))
		) 
		if((x != y) then 
			if(bRect 
				(_PadName = strcat("R" _PadName)) 
				(_PadName = strcat("O" _PadName))
			) else 
			if(bRound 
				(_PadName = strcat("E" _PadName)) 
				(_PadName = strcat("S" _PadName))
			)
		) 
		if(!(axlLoadPadstack _PadName) then 
			if((x != y) 
				if(bRect 
					(fig = 'RECTANGLE) 
					(fig = 'OBLONG)
				) 
				if(!bRound 
					(fig = 'SQUARE) 
					(fig = 'CIRCLE)
				)
			) 
			if(bBottom then 
				(lPad = lPadB) 
				(lPadS = lPadSB) 
				(lPadP = lPadPB)
				else 
				(lPad = lPadT) 
				(lPadS = lPadST) 
				(lPadP = lPadPT)
			) 
			(PadLst = list((make_axlPadStackPad ?layer lPad ?type nil
						?figure fig ?figureSize 
						(x:y)
					) 
					(make_axlPadStackPad ?layer lPadS ?type nil
						?figure fig ?figureSize solder_masksize
					)
				))
			if(!bNoPaste 
				(PadLst = append(PadLst 
						list((make_axlPadStackPad ?layer lPadP ?type nil
								?figure fig ?figureSize 
								(x:y)
							)
						)
					))
			) 
			(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
			(axlPadstackToDisk _PadName)
		) _PadName
	)

defun(_PadSMFillet 
		(x y \@optional bBottom bNoPaste) 
		(x = float(x)) 
		(y = float(y)) 
		if(bFilletPad then 
			(solder_masksize = ((x + (solder_mask_offset * 2)):(y + (solder_mask_offset * 2)))) 
			if((x != y) 
				sprintf(_PadName "RX%.2fY%.2fR%.2f" x y FilletR) 
				sprintf(_PadName "SXY%.2fR%.2f" x FilletR)
			) 
			(_PadName = (_StrNoDot _PadName))
			if(bBottom 
				(_PadName = strcat(_PadName "B")) 
				(_PadName = strcat(_PadName "T"))
			) 
			if(!(axlLoadPadstack _PadName) then 
				(sN = (_ShapeFileRectangle x y FilletR)) 
				(shapeNameM = (_ShapeFileRectangle 
						(x + solder_mask_offset) 
						(y + solder_mask_offset) FilletR
					)) 
				if(bBottom then 
					(lPad = lPadB) 
					(lPadS = lPadSB) 
					(lPadP = lPadPB)
					else 
					(lPad = lPadT) 
					(lPadS = lPadST) 
					(lPadP = lPadPT)
				)
				(PadLst = list((make_axlPadStackPad ?layer lPad ?type 
							'REGULAR
							?figure sN ?figureSize 
							(x:y)
						) 
						(make_axlPadStackPad ?layer lPadS ?type 
							'REGULAR
							?figure shapeNameM ?figureSize solder_masksize
						)
					)) 
				if(!bNoPaste 
					(PadLst = append(PadLst 
							list((make_axlPadStackPad ?layer lPadP ?type 
									'REGULAR
									?figure sN ?figureSize 
									(x:y)
								)
							)
						))
				) 
				(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
				(axlPadstackToDisk _PadName)
			) else 
			(_PadName = (_PadSM x y t))
		)
		_PadName
	)

defun(_PadTH_Default 
		(d h \@optional bRect) 
		(pID = (h + (pad_th_d2hole * 2))) 
		if((pID > d) 
			(pID = d)
		) 
		(pOD = (pID + (pad_th_od2id * 2) + (fix(h) / 10.0)))
		(pSpoke = pad_th_spoke) 
		(pPadInner = pID) 
		(pAntiInner = (pID + (pad_th_anti2d * 2))) 
		(aPL = list(0 0 h d pID
				d pAntiInner pID pOD pSpoke
			)) 
		(_PadName = (_PadTH aPL bRect))
		_PadName
	)

defun(_CreatePin 
		(padName pos number \@optional 
			(PadAngle 0)
			(TxtAngle 0)
		) 
		if((TxtAngle == 0) 
			(tpos = (0:(-tSymHeight / 2))) 
			(tpos = ((tSymHeight / 2):0))
		) 
		(PinId = (axlDBCreatePin padName pos 
				(make_axlPinText ?number number ?offset tpos
					?text 
					(make_axlTextOrientation ?textBlock tSymName ?mirrored nil
						?justify "center" ?rotation TxtAngle
					)
				) PadAngle
			)) PinId
	)

defun(_CreatePinMechanical 
		(padName \@optional 
			(pos 
				(0:0)
			) 
			(PadAngle 0)
		) 
		(axlDBCreatePin padName pos nil PadAngle)
	)

defun(_CreateRefValue 
		(name \@optional 
			(posS 
				(0:0)
			) 
			(posA 
				(0:0)
			)
		) 
		(posS = (car(posS):(cadr(posS) - (tSilkHeight / 2)))) 
		(posA = (car(posA):(cadr(posA) - (tSymHeight / 2)))) 
		(TorS = (make_axlTextOrientation ?textBlock tSilkName ?justify "center"))
		(TorA = (make_axlTextOrientation ?textBlock tSymName ?justify "center")) 
		(Ts = '(("ref" "REF DES/SILKSCREEN_TOP") 
					("val" "COMPONENT VALUE/SILKSCREEN_TOP")
				)) 
		foreach(aT Ts 
			(axlDBCreateText 
				car(aT) posS TorS 
				cadr(aT)
			)
		) 
		(Ts = '(("dev" "DEVICE TYPE/ASSEMBLY_TOP") 
					("pn" "USER PART NUMBER/ASSEMBLY_TOP") 
					("RichardLC" "TOLERANCE/ASSEMBLY_TOP") 
					("val" "COMPONENT VALUE/ASSEMBLY_TOP")
				)) 
		foreach(aT Ts 
			(axlDBCreateText 
				car(aT) posA TorA 
				cadr(aT)
			)
		)
		(axlDBCreateText name posA TorA "REF DES/ASSEMBLY_TOP")
	)

defun(_PadTH 
		(aTb \@optional bRect) 
		(pHole = nth(2 aTb)) 
		(pPadTop = nth(3 aTb)) 
		(pPadInner = nth(4 aTb))
		(pPadBot = nth(5 aTb)) 
		(pAnti = nth(6 aTb)) 
		(pID = nth(7 aTb)) 
		(pOD = nth(8 aTb)) 
		(pSpoke = nth(9 aTb))
		(drill_data = (make_axlPadStackDrill ?drillDiameter pHole ?figure 
				'CIRCLE
				?figureSize 
				(pHole:pHole) ?plating 
				'PLATED
			)) 
		sprintf(_PadName "PAD%.2fD%.2f" pPadTop pHole) 
		(fth = (_FlashFileCircleThermal pID pOD pSpoke)) 
		if(bRect then 
			(_PadName = strcat(_PadName "S")) 
			(f = 'SQUARE) else
			(f = 'CIRCLE)
		) 
		(_PadName = (_StrNoDot _PadName))
		(PadLst = list((make_axlPadStackPad ?layer lPadT ?type nil
					?figure f ?figureSize 
					(pPadTop:pPadTop)
				) 
				(make_axlPadStackPad ?layer lPadI ?type nil
					?figure 
					'CIRCLE ?figureSize 
					(pPadInner:pPadInner)
				) 
				(make_axlPadStackPad ?layer lPadB ?type nil
					?figure f ?figureSize 
					(pPadBot:pPadBot)
				) 
				(make_axlPadStackPad ?layer lPadT ?type 
					'ANTIPAD
					?figure f ?figureSize 
					(pAnti:pAnti)
				) 
				(make_axlPadStackPad ?layer lPadI ?type 
					'ANTIPAD
					?figure 
					'CIRCLE ?figureSize 
					(pAnti:pAnti)
				)
				(make_axlPadStackPad ?layer lPadB ?type 
					'ANTIPAD
					?figure f ?figureSize 
					(pAnti:pAnti)
				) 
				(make_axlPadStackPad ?layer lPadST ?type nil
					?figure f ?figureSize 
					((pPadTop + solder_mask_offset):(pPadTop + solder_mask_offset))
				) 
				(make_axlPadStackPad ?layer lPadSB ?type nil
					?figure f ?figureSize 
					((pPadBot + solder_mask_offset):(pPadBot + solder_mask_offset))
				)
			)) 
		foreach(lPad lPad3 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type 
							'THERMAL
							?figure 
							'FLASH ?flash fth ?figureSize
							(pOD:pOD)
						)
					)
				))
		) 
		(ps_id = (axlDBCreatePadStack _PadName drill_data PadLst t)) 
		(axlPadstackToDisk _PadName) _PadName
	)

defun(_PadTH_NP 
		(aTb) 
		(pHole = nth(1 aTb)) 
		(pPadTop = nth(2 aTb)) 
		(pPadInner = nth(3 aTb))
		(pPadBot = nth(4 aTb)) 
		(pThermal = nth(5 aTb)) 
		(pSolderMask = nth(6 aTb)) 
		(pAssembly = nth(7 aTb)) 
		(pAnti = nth(8 aTb))
		(pKeepout = nth(9 aTb)) 
		sprintf(_PadName "PAD%.2fD%.2fNP" pPadTop pHole) 
		(_PadName = (_StrNoDot _PadName)) 
		if(!(axlLoadPadstack _PadName) then 
			(solder_masksize = (pPadTop:pPadTop)) 
			(drill_data = (make_axlPadStackDrill ?drillDiameter pHole ?figure 
					'CIRCLE
					?figureSize 
					(pHole:pHole) ?plating 
					'NON_PLATED
				)) 
			(f = 'CIRCLE)
			(PadLst = list((make_axlPadStackPad ?layer lPadT ?type nil
						?figure f ?figureSize 
						(pPadTop:pPadTop)
					) 
					(make_axlPadStackPad ?layer lPadI ?type nil
						?figure f ?figureSize 
						(pPadInner:pPadInner)
					) 
					(make_axlPadStackPad ?layer lPadB ?type nil
						?figure f ?figureSize 
						(pPadBot:pPadBot)
					) 
					(make_axlPadStackPad ?layer lPadST ?type nil
						?figure f ?figureSize 
						((pPadTop + solder_mask_offset):(pPadTop + solder_mask_offset))
					) 
					(make_axlPadStackPad ?layer lPadSB ?type nil
						?figure f ?figureSize 
						((pPadBot + solder_mask_offset):(pPadBot + solder_mask_offset))
					)
				)) 
			foreach(lPad lPad3 
				(PadLst = append(PadLst 
						list((make_axlPadStackPad ?layer lPad ?type 
								'THERMAL
								?figure f ?figureSize 
								(pThermal:pThermal)
							)
						)
					)) 
				(PadLst = append(PadLst 
						list((make_axlPadStackPad ?layer lPad ?type 
								'ANTIPAD
								?figure f ?figureSize 
								(pAnti:pAnti)
							)
						)
					))
			) 
			(ps_id = (axlDBCreatePadStack _PadName drill_data PadLst t)) 
			(axlPadstackToDisk _PadName)
		) _PadName
	)

defun(_PinArray 
		(PadN Col Row PitchX PitchY
			\@optional 
			(Pos1 
				(0:0)
			) 
			(bRight t) 
			(bUp t) 
			(bRowFirst t)
			(bPin1 t) 
			(bPinNum t) 
			(Pin1Offset 0) 
			(PinAngle 0) 
			(PinTAngle 0)
			(delta 1) 
			(Prefix nil)
		) 
		(pTotal = (Col * Row)) 
		for(pRow 1 Row 
			for(pCol 1 Col 
				if(bRight 
					(x = (car(Pos1) + ((pCol - 1) * PitchX))) 
					(x = (car(Pos1) - ((pCol - 1) * PitchX)))
				) 
				if(bUp 
					(y = (cadr(Pos1) + ((pRow - 1) * PitchY))) 
					(y = (cadr(Pos1) - ((pRow - 1) * PitchY)))
				)
				if(bRowFirst 
					(pnum = (((pRow - 1) * Col) + pCol)) 
					(pnum = (((pCol - 1) * Row) + pRow))
				) 
				sprintf(pn "%d" 
					(Pin1Offset + ((pnum - 1) * delta) + 1)
				) 
				if(Prefix 
					(pn = strcat(Prefix pn))
				) 
				if(bPinNum 
					if(!((pnum == 1) && !bPin1) 
						(_CreatePin PadN 
							(x:y) pn PinAngle
							PinTAngle
						)
					) 
					(_CreatePinMechanical PadN 
						(x:y) PinAngle
					)
				)
			)
		)
	)

defun(_PathRectangle 
		(x y center r width) 
		(x = float(x)) 
		(y = float(y)) 
		(p1 = (((-x / 2) + r + car(center)):((-y / 2) + cadr(center))))
		(p2 = ((((x / 2) - r) + car(center)):cadr(p1))) 
		(p3 = (((x / 2) + car(center)):(cadr(p2) + r))) 
		(p4 = (car(p3):(((y / 2) - r) + cadr(center)))) 
		(p5 = (car(p2):(cadr(p4) + r))) 
		(p6 = (car(p1):cadr(p5)))
		(p7 = ((car(p1) - r):cadr(p4))) 
		(p8 = (car(p7):cadr(p3))) 
		(path = (axlPathStart 
				list(p1)
			)) 
		(axlPathLine path width p2) 
		(axlPathArcAngle path width p3 nil
			90
		)
		(axlPathLine path width p4) 
		(axlPathArcAngle path width p5 nil
			90
		) 
		(axlPathLine path width p6) 
		(axlPathArcAngle path width p7 nil
			90
		) 
		(axlPathLine path width p8)
		(axlPathArcAngle path width p1 nil
			90
		) path
	)

defun(_ShapeRectangle 
		(x y \@optional 
			(center 
				(0:0)
			) r
			(ang 0.0)
		) 
		(x = float(x)) 
		(y = float(y)) 
		if(r 
			(rsid = (axlDBCreateShape 
					(_PathRectangle x y center r
						0
					) t
				)) 
			(rsid = (axlDBCreateRectangle 
					list((((-x / 2) + (xCoord center)):
							((-y / 2) + (yCoord center))) 
						(((x / 2) + (xCoord center)):
							((y / 2) + (yCoord center)))
					) t
				))
		)
		if((ang != 0.0) 
			(rsid = (axlTransformObject rsid ?angle ang ?origin
					center
				))
		) rsid
	)

defun(_ShapeFileRectangle 
		(x y r) 
		if((x != y) 
			sprintf(sFN "SRX%.2fY%.2fR%.2f" x y r) 
			sprintf(sFN "SSXY%.2fR%.2f" x r)
		) 
		(sFN = (_StrNoDot sFN)) 
		(ExistFile = strcat(sFN ".ssm"))
		if(!isFile(ExistFile) then 
			(_FlushShape) 
			(_Layer lEtchT) 
			(_ShapeRectangle x y 
				(0:0) r
			)
			(_SaveDesignShape sFN)
		) sFN
	)

defun(_FlashFileCircleThermal 
		(id od spoke \@optional 
			(n 4)
			(angle 45)
		) 
		sprintf(flashName "F%.f_%.f_%.f" 
			(id * 100) 
			(od * 100) 
			(spoke * 100)
		) 
		(fullflashfilename = strcat(flashName ".fsm")) 
		if(!isFile(fullflashfilename) then 
			(_FlushShape) 
			(axlDBChangeDesignExtents 
				'((-200 -200) 
						(200 200)
					)
			) 
			(_Layer lEtchT)
			if((id <= spoke) 
				(spoke = (id / 2))
			) 
			defMathConstants(`m) 
			(r = ((od + id) / 4)) 
			(y = ((spoke / 2) + ((od - id) / 4))) 
			(x = sqrt(((r * r) - (y * y))))
			(r1 = ((od - id) / 2)) 
			(arc = (((2 * (m.PI)) / n) - (acos((x / r)) * 2))) 
			(nx = ((x * cos(arc)) - (y * sin(arc)))) 
			(ny = ((y * cos(arc)) + (x * sin(arc)))) 
			for(i 1 n 
				(c = caar((axlDBCreatePath 
							(axlPathArcCenter 
								(axlPathStart 
									list((x:y))
								) r1 
								(nx:ny) nil
								(0:0)
							)
						)
					)) 
				(axlTransformObject c ?angle 
					(((i - 1) * (360.0 / n)) + angle) ?origin
					(0:0)
				)
				(axlDBCreateShape 
					car((axlPolyFromDB c ?endCapType 
							'ROUND
						)
					) t
				) 
				(axlDeleteObject c)
			)
			(_SaveDesignShape flashName nil)
		)
		flashName
	)

defun(_ShapeCircleArray 
		(x y center d) 
		(x = float(x)) 
		(y = float(y)) 
		(d = float(d))
		(gap = 0.5) 
		(row = fix(((y - (gap * 2)) / (d + gap)))) 
		(col = fix(((x - (gap * 2)) / (d + gap)))) 
		if(!((row == 0) && (col == 0)) then 
			for(r 0 row 
				for(c 0 col 
					(pc = ((((-col * (gap + d)) / 2) + (c * (gap + d)) + (xCoord center)):
							(((-row * (gap + d)) / 2) + (r * (gap + d)) + (yCoord center)))) 
					(_ShapeCircle 
						(d / 2) nil pc
					)
				)
			)
		)
	)

defun(_MySkill 
		(aTb) 
		(pSkill = strcat(SkillDir "/" 
				nth(1 aTb) ".il"
			)) 
		load(pSkill)
	)

defun(_MakeDevice 
		(devName \@optional 
			(class_id 0)
		) 
		if(bDeviceFile then 
			(DevFile = outfile(strcat(devName ".txt"))) 
			(devName = upperCase(devName)) 
			fprintf(DevFile "(DEVICE FILE: %s)\n" devName)
			fprintf(DevFile "\nPACKAGE %s" devName) 
			case(class_id 
				(0 
					(class_value = "IC")
				) 
				(1 
					(class_value = "IO")
				) 
				(2 
					(class_value = "DISCRETE")
				)
			) 
			fprintf(DevFile "\nCLASS %s" class_value) 
			(axlSetFindFilter ?enabled 
				list("noall" "PINS" "invisible") ?onButtons 
				list("noall" "PINS")
			) 
			(axlClearSelSet)
			(axlAddSelectAll) 
			fprintf(DevFile "\nPINCOUNT %d\n\n" 
				(axlGetSelSetCount)
			) 
			(dev_pins = (axlGetSelSet)) 
			for(i 0 2 
				case(i 
					(0 
						(sect = strcat("PINORDER " devName))
					) 
					(1 
						(sect = strcat("\n\nPINSWAP " devName))
					) 
					(2 
						(sect = strcat("\n\nFUNCTION " devName " " devName))
					)
				) 
				fprintf(DevFile "%s" sect)
				(count10 = 0) 
				foreach(p dev_pins 
					count10++ 
					fprintf(DevFile " %s" 
						(p->number)
					) 
					if((mod(count10 10) == 0) 
						fprintf(DevFile ",\n")
					)
				)
			) 
			fprintf(DevFile "\n\nEND\n")
			close(DevFile)
		)
	)

defun(PadShapeMELF 
		(x y cX cY) 
		(solder_masksize = ((x + solder_mask_offset):(y + solder_mask_offset))) 
		sprintf(_PadName "MELFX%.fY%.fA%.fB%.f" 
			(x * 100) 
			(y * 100) 
			(cX * 100)
			(cY * 100)
		) 
		(_PadName = (_StrNoDot _PadName))
		if(!(axlLoadPadstack _PadName) then 
			(sN = (ShapeFileMELF x y cX cY)) 
			(shapeNameM = (_ShapeFileRectangle 
					(x + solder_mask_offset) 
					(y + solder_mask_offset) FilletR
				)) 
			(PadLst = list((make_axlPadStackPad ?layer lPadT ?type 
						'REGULAR
						?figure sN ?figureSize 
						(x:y)
					) 
					(make_axlPadStackPad ?layer lPadST ?type 
						'REGULAR
						?figure shapeNameM ?figureSize solder_masksize
					) 
					(make_axlPadStackPad ?layer lPadPT ?type 
						'REGULAR
						?figure sN ?figureSize 
						(x:y)
					)
				))
			(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
			(axlPadstackToDisk _PadName)
		) _PadName
	)

defun(PadShapeKeyR 
		(A B W g \@optional
			down
		) 
		(solder_masksize = ((A + solder_mask_offset):(B + solder_mask_offset))) 
		sprintf(_PadName "KR%.fX%.fw%.fg%.f" 
			(A * 100) 
			(B * 100) 
			(W * 100)
			(g * 100)
		) 
		if(down 
			(_PadName = strcat(_PadName "D")) 
			(_PadName = strcat(_PadName "U"))
		)
		if(!(axlLoadPadstack _PadName) then 
			(sN = (ShapeFileKeyRectangle A B W g
					down
				)) 
			if(down 
				(of = (0:((B / 2) - (W / 2)))) 
				(of = (0:((-B / 2) + (W / 2))))
			) 
			(PadLst = list((make_axlPadStackPad ?layer lPadT ?type 
						'REGULAR
						?figure sN ?figureSize 
						(A:B)
					) 
					(make_axlPadStackPad ?layer lPadST ?type 
						'REGULAR
						?figure 
						'RECTANGLE ?figureSize solder_masksize ?offset
						of
					)
				))
			(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
			(axlPadstackToDisk _PadName)
		) _PadName
	)

defun(PadShapeKeyOval 
		(A B W g \@optional
			down
		) 
		(solder_masksize = ((A + solder_mask_offset):(B + solder_mask_offset))) 
		sprintf(_PadName "KOV%.fX%.fw%.fg%.f" 
			(A * 100) 
			(B * 100) 
			(W * 100)
			(g * 100)
		) 
		if(down 
			(_PadName = strcat(_PadName "D")) 
			(_PadName = strcat(_PadName "U"))
		)
		if(!(axlLoadPadstack _PadName) then 
			(sN = (ShapeFileKeyOval A B W g
					down
				)) 
			if(down 
				(of = (0:shapeOffsetY)) 
				(of = (0:-shapeOffsetY))
			) 
			(PadLst = list((make_axlPadStackPad ?layer lPadT ?type 
						'REGULAR
						?figure sN ?offset of
					)
				))
			(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
			(axlPadstackToDisk _PadName)
		) _PadName
	)

defun(PadShapeKeySpiral 
		(A B W g \@optional
			down
		) 
		sprintf(_PadName "KSP%.fw%.fg%.f" 
			(A * 100) 
			(W * 100) 
			(g * 100)
		) 
		if(down 
			(_PadName = strcat(_PadName "D")) 
			(_PadName = strcat(_PadName "U"))
		) 
		(sN = (ShapeFileKeyOval A B W g
				down
			))
		(solder_masksize = (((abs(shapeOffsetY) * 2) + W + solder_mask_offset):((abs(shapeOffsetY) * 2) + W + solder_mask_offset))) 
		if(down 
			(of = (0:shapeOffsetY)) 
			(of = (0:-shapeOffsetY))
		) 
		(PadLst = list((make_axlPadStackPad ?layer lPadT ?type 
					'REGULAR
					?figure sN ?offset of
				) 
				(make_axlPadStackPad ?layer lPadST ?type 
					'REGULAR
					?figure 
					'CIRCLE ?figureSize solder_masksize ?offset
					of
				)
			)) 
		(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
		(axlPadstackToDisk _PadName)
		_PadName
	)

defun(PadShapeKeyE 
		(D W g \@optional down) 
		(solder_masksize = ((D + solder_mask_offset):(D + solder_mask_offset))) 
		sprintf(_PadName "KE%.fw%.fg%.f" 
			(D * 100) 
			(W * 100) 
			(g * 100)
		) 
		if(down 
			(_PadName = strcat(_PadName "D")) 
			(_PadName = strcat(_PadName "U"))
		)
		if(!(axlLoadPadstack _PadName) then 
			(sN = (ShapeFileKeyElliptical D W g down)) 
			if(!sN 
				return(nil)
			) 
			if(down 
				(of = (0:((D / 2) - (W / 2)))) 
				(of = (0:((-D / 2) + (W / 2))))
			)
			(PadLst = list((make_axlPadStackPad ?layer lPadT ?type 
						'REGULAR
						?figure sN
					) 
					(make_axlPadStackPad ?layer lPadST ?type 
						'REGULAR
						?figure 
						'CIRCLE ?figureSize solder_masksize ?offset
						of
					)
				)) 
			(ps_id = (axlDBCreatePadStack _PadName nil PadLst t)) 
			(axlPadstackToDisk _PadName)
		) _PadName
	)

defun(ChipComp 
		(aTb \@optional polarity diode) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(cLmax = ((nth(2 aTb) + 
					nth(3 aTb)) / 2)) 
		(cTmax = ((nth(4 aTb) + 
					nth(5 aTb)) / 2))
		(cWmax = nth(7 aTb)) 
		(cH = nth(8 aTb)) 
		(_Protrusion_calc RectTermination) 
		(pX = (cTmax + Heel + Toe)) 
		(pY = (cWmax + (Side * 2)))
		(cC = ((cLmax - (2 * cTmax) - (2 * Heel)) + pX)) 
		(xoffset = 0.0) 
		if(((cC - pX) < Pin2Pin) then 
			(xoffset = (Pin2Pin - (cC - pX))) 
			(cC = (cC + xoffset))
		) 
		(cG1 = (cC + pX + (Courtyard * 2) + xoffset)) 
		(cG2 = (pY + (Courtyard * 2)))
		(cG3 = (pY + Courtyard ))
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet pX pY)) 
		if(diode then 
			(Pn1 = DiodePin1Name) 
			(Pn2 = DiodePin2Name) else
			(Pn1 = "1") 
			(Pn2 = "2")
		) 
		(_CreatePin _PadName 
			((-cC / 2):0) Pn1
		) 
		(_CreatePin _PadName 
			((cC / 2):0) Pn2
		)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle cG1 cG2) cH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle cLmax cWmax) cH "CHIP"
		) 
		(_Layer lPkgGeoSilkT)
;		if(((cC - pX - (SilkGap * 2)) > (SilkWidth * 2)) then 
			(x = (((cC - pX - SilkWidth) / 2) - SilkGap)) 
;			(_Rectangle cG1-Courtyard cG2-Courtyard)
			(_Line 
				list((-cLmax/2:(cG3/ 2)) 
					(cLmax/2:(cG3/ 2))
				)
			) 
			(_Line 
				list((-cLmax/2:(-cG3/ 2)) 
					(cLmax/2:(-cG3 / 2))
				)
			)
;			else 
;			(_Line 
;				list((0:(pY / 2)) 
;					(0:(-pY / 2))
;				)
;			)
;		) 
		if(polarity 
			(_Dot 
				((-cC / 2):((-pY / 2) - SilkGap - 0.25)) 0.5
			)
		) 
		(_Layer lPkgGeoAsmT) 
		(_Rectangle cLmax cWmax) 
		if(polarity then 
			for(i 1 4 
				(_Line 
					list((((-cLmax / 2) + ((i * SilkWidth) / 2)):(cWmax / 2)) 
						(((-cLmax / 2) + ((i * SilkWidth) / 2)):(-cWmax / 2))
					)
				)
			)
		)
		(_CreateRefValue pName 
			(0:((cWmax / 2) + (tSilkHeight / 2) + SilkWidth))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(MoldedComp 
		(aTb \@optional 
			(polarity t) diode
		) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pLmin = nth(2 aTb)) 
		(pLmax = nth(3 aTb))
		(pTmin = nth(4 aTb)) 
		(pTmax = nth(5 aTb)) 
		(pTWmin = nth(6 aTb)) 
		(pTWmax = nth(7 aTb)) 
		(pTWavg = ((pTWmin + pTWmax) / 2))
		(pWmin = nth(8 aTb)) 
		(pWmax = nth(9 aTb)) 
		(pWavg = ((pWmin + pWmax) / 2)) 
		(pH = nth(10 aTb)) 
		(_Protrusion_calc InwardLShapedRibbon)
		(pY = (pTWavg + (Side * 2))) 
		(pX = (pTmax + Heel + Toe)) 
		(pC = ((pLmax - (2 * pTmax) - (2 * Toe)) + pX)) 
		(pV1 = (pC + pX + (Courtyard * 2))) 
		(pV2 = (pWavg + (Courtyard * 2)))
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet pX pY)) 
		if(diode then 
			(Pn1 = DiodePin1Name) 
			(Pn2 = DiodePin2Name) else
			(Pn1 = "1") 
			(Pn2 = "2")
		) 
		(_CreatePin _PadName 
			((-pC / 2):0) Pn1
		) 
		(_CreatePin _PadName 
			((pC / 2):0) Pn2
		)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle pV1 pV2) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pLmax pWmax) pH
		) 
		(_Layer lPkgGeoSilkT)
		if((((pY / 2) + SilkGap) < (pWavg / 2)) then 
			(_Line 
				list(((-pLmax / 2):((-pY / 2) - SilkGap)) 
					((-pLmax / 2):(-pWavg / 2)) 
					((pLmax / 2):(-pWavg / 2)) 
					((pLmax / 2):((-pY / 2) - SilkGap))
				)
			) 
			(_Line 
				list(((-pLmax / 2):((pY / 2) + SilkGap)) 
					((-pLmax / 2):(pWavg / 2)) 
					((pLmax / 2):(pWavg / 2)) 
					((pLmax / 2):((pY / 2) + SilkGap))
				)
			) else
			(_Line 
				list(((-pLmax / 2):((pV2 / 2) - 0.1)) 
					((pLmax / 2):((pV2 / 2) - 0.1))
				)
			) 
			(_Line 
				list(((-pLmax / 2):-((pV2 / 2) - 0.1)) 
					((pLmax / 2):-((pV2 / 2) - 0.1))
				)
			)
		) 
		if(polarity 
			(_Dot 
				(((-pLmax / 2) - 0.25 - SilkWidth):((pY / 2) + SilkGap + 0.25)) 0.5
			)
		) 
		(_Layer lPkgGeoAsmT) 
		(_Rectangle pLmax pWavg) 
		if(polarity then 
			for(cnt 1 5 
				(_Line 
					list((((-pLmax / 2) + ((cnt * SilkWidth) / 2)):(-pWavg / 2)) 
						(((-pLmax / 2) + ((cnt * SilkWidth) / 2)):(pWavg / 2))
					)
				)
			)
		)
		(_CreateRefValue pName 
			(0:((-pWavg / 2) - SilkWidth - (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(MELF 
		(aTb \@optional polarity diode) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(cLmin = nth(2 aTb)) 
		(cLmax = nth(3 aTb))
		(cTmin = nth(4 aTb)) 
		(cTmax = nth(5 aTb)) 
		(cWmin = nth(6 aTb)) 
		(cWmax = nth(7 aTb)) 
		(cCX = nth(8 aTb))
		(cCY = nth(9 aTb)) 
		(_Protrusion_calc CylindricalTermination) 
		(Roundoff = 0.1) 
		(pX = (cTmax + Heel + Toe + Roundoff)) 
		if(((cCX + 0.1) > pX) 
			(cCX = (pX - 0.1))
		)
		(pY = (cWmax + (Side * 2))) 
		(cC = (((cLmin - cTmin - cTmax) + pX) - Roundoff)) 
		(xoffset = 0.0) 
		if(((cC - pX) < Pin2Pin) then 
			(xoffset = (Pin2Pin - (cC - pX))) 
			(cC = (cC + xoffset))
		) 
		(cG1 = (cC + pX + (Courtyard * 2) + xoffset))
		(cG2 = (pY + (Courtyard * 2))) 
		(_PrepareNewSym pName) 
		(_PadName = (PadShapeMELF pX pY cCX cCY)) 
		if(diode then 
			(Pn1 = DiodePin1Name) 
			(Pn2 = DiodePin2Name) else
			(Pn1 = "1") 
			(Pn2 = "2")
		) 
		(_CreatePin _PadName 
			((-cC / 2):0) Pn1 180
		)
		(_CreatePin _PadName 
			((cC / 2):0) Pn2
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle cG1 cG2) cWmax
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle cLmax cWmax) cWmax "MELF"
		)
		(_Layer lPkgGeoSilkT) 
		if(((cC - pX - (SilkGap * 2)) > (SilkWidth * 2)) then 
			(x = (((cC - pX - SilkWidth) / 2) - SilkGap)) 
			(_Line 
				list((-x:(cWmax / 2)) 
					(x:(cWmax / 2))
				)
			) 
			(_Line 
				list((-x:(-cWmax / 2)) 
					(x:(-cWmax / 2))
				)
			)
			else 
			(_Line 
				list((0:(pY / 2)) 
					(0:(-pY / 2))
				)
			)
		) 
		if(polarity 
			(_Dot 
				((-cC / 2):((-cWmax / 2) - SilkGap - (SilkWidth / 2) - 0.25)) 0.5
			)
		) 
		(_Layer lPkgGeoAsmT) 
		(_Rectangle cLmax cWmax)
		if(polarity then 
			for(i 1 4 
				(_Line 
					list((((-cLmax / 2) + ((i * SilkWidth) / 2)):(cWmax / 2)) 
						(((-cLmax / 2) + ((i * SilkWidth) / 2)):(-cWmax / 2))
					)
				)
			)
		) 
		(_CreateRefValue pName 
			(0:((pY / 2) + SilkGap + (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(KeyR 
		(aTb) 
		(pName = nth(1 aTb)) 
		(A1 = nth(3 aTb)) 
		(B1 = nth(2 aTb))
		(W = nth(4 aTb)) 
		(g = nth(5 aTb)) 
		(OverSize = nth(6 aTb)) 
		(A = (A1 + (OverSize * 2))) 
		(B = (B1 + (OverSize * 2)))
		(Courtyard = 0) 
		(_PrepareNewSym pName) 
		(PadNameD = (PadShapeKeyR A B W g
				t
			)) 
		(PadNameU = (PadShapeKeyR A B W g
				nil
			)) 
		(_CreatePin PadNameD 
			(0:((-B / 2) + (W / 2))) "1"
		)
		(_CreatePin PadNameU 
			(0:((B / 2) - (W / 2))) "2"
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(A + (Courtyard * 2)) 
				(B + (Courtyard * 2))
			)
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle A B)
		)
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle 
				(A + (SilkGap * 2) + SilkWidth) 
				(B + (SilkGap * 2) + SilkWidth) 
				(0:0) 0.05
			)
		) 
		(_CreateRefValue pName 
			(0:((-B / 2) - 1.5))
		) 
		(_CrossCenter) 
		(_SaveDesign pName) 
		(_MakeDevice pName 1)
	)

defun(KeyOval 
		(aTb) 
		(pName = nth(1 aTb)) 
		(A1 = nth(3 aTb)) 
		(B1 = nth(2 aTb))
		(W = nth(4 aTb)) 
		(g = nth(5 aTb)) 
		(OverSize = nth(6 aTb)) 
		(A = (A1 + (OverSize * 2))) 
		(B = (B1 + (OverSize * 2)))
		(B = (floor((B / (W + g))) * (W + g))) 
		if((A < B) then 
			(tmp = A) 
			(A = B) 
			(B = tmp)
		) 
		(Courtyard = g) 
		(_PrepareNewSym pName) 
		(PadNameD = (PadShapeKeyOval A B W g
				t
			))
		(PadNameU = (PadShapeKeyOval A B W g
				nil
			)) 
		(_CreatePin PadNameD 
			(0:-shapeOffsetY) "1"
		) 
		(_CreatePin PadNameU 
			(0:shapeOffsetY) "2"
		) 
		(_Layer lPkgGeoSmT) 
		(ssizeY = (B + g + solder_mask_offset))
		(ssizeX = (A + solder_mask_offset)) 
		if((shapeOffsetY < 0) then 
			(ssizeX = (ssizeX + g + W)) 
			(ssizeY = (ssizeY + g + W))
		) 
		(shapeNameM = (_ShapeRectangle ssizeX ssizeY 
				(0:0) 
				(ssizeY / 2)
			)) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(ssizeX + (Courtyard * 2)) 
				(ssizeY + (Courtyard * 2)) 
				(0:0) 
				((ssizeY + (Courtyard * 2)) / 2)
			)
		)
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle ssizeX ssizeY 
				(0:0) 
				(ssizeY / 2)
			)
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle 
				(ssizeX + (SilkGap * 2) + SilkWidth) 
				(ssizeY + (SilkGap * 2) + SilkWidth) 
				(0:0) 
				((ssizeY + (SilkGap * 2) + SilkWidth) / 2)
			)
		) 
		(_CreateRefValue pName 
			(0:((-ssizeY / 2) - 1.5))
		) 
		(_CrossCenter)
		(_SaveDesign pName) 
		(_MakeDevice pName 1)
	)

defun(KeySpiral 
		(aTb) 
		(pName = nth(1 aTb)) 
		(A1 = nth(2 aTb)) 
		(W = nth(3 aTb))
		(g = nth(4 aTb)) 
		(OverSize = nth(5 aTb)) 
		(A = (A1 + (OverSize * 2))) 
		(A = (floor((A / (W + g))) * (W + g))) 
		(B = (A - g))
		(Courtyard = 0) 
		(_PrepareNewSym pName) 
		(PadNameD = (PadShapeKeySpiral A B W g
				t
			)) 
		(PadNameU = (PadShapeKeySpiral A B W g
				nil
			)) 
		(_CreatePin PadNameD 
			(0:-shapeOffsetY) "1"
		)
		(_CreatePin PadNameU 
			(0:shapeOffsetY) "2"
		) 
		(bDia = abs(shapeOffsetY)) 
		if((shapeOffsetY < 0) 
			(bDia = (bDia + W))
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeCircle 
				(bDia + Courtyard)
			)
		)
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeCircle bDia)
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Circle 
				(bDia + SilkGap + (SilkWidth / 2))
			)
		) 
		(_CreateRefValue pName 
			(0:(-bDia - 1.5))
		) 
		(_CrossCenter)
		(_SaveDesign pName) 
		(_MakeDevice pName 1)
	)

defun(KeyE 
		(aTb) 
		(pName = nth(1 aTb)) 
		(D1 = nth(2 aTb)) 
		(W = nth(3 aTb))
		(g = nth(4 aTb)) 
		(OverSize = nth(5 aTb)) 
		(D = (D1 + (OverSize * 2))) 
		(Courtyard = 0) 
		(_PrepareNewSym pName)
		(PadNameD = (PadShapeKeyE D W g t)) 
		if(!PadNameD 
			return(nil)
		) 
		(PadNameU = (PadShapeKeyE D W g nil)) 
		if(!PadNameU 
			return(nil)
		) 
		(_CreatePin PadNameD 
			(0:((-D / 2) + (W / 2))) "1"
		)
		(_CreatePin PadNameU 
			(0:((D / 2) - (W / 2))) "2"
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeCircle 
				((D / 2) + Courtyard)
			)
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeCircle 
				(D / 2)
			)
		)
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Circle 
				((D / 2) + SilkGap + (SilkWidth / 2))
			)
		) 
		(_CreateRefValue pName 
			(0:((-D / 2) - 1.5))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 1)
	)

defun(CapAlumElec 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(cLmax = nth(3 aTb)) 
		(cTmax = nth(5 aTb))
		(cWmax = nth(7 aTb)) 
		(cA = nth(8 aTb)) 
		(cH = nth(9 aTb)) 
		case(fpmSMDlevel 
			(0 
				(Toe = 1.0) 
				(Heel = 0.0) 
				(Side = 0.8) 
				(Courtyard = 0.75)
			) 
			(1 
				(Toe = 0.5) 
				(Heel = 0.0) 
				(Side = 0.4) 
				(Courtyard = 0.5)
			) 
			(2 
				(Toe = 0.5) 
				(Heel = 0.0) 
				(Side = 0.2) 
				(Courtyard = 0.3)
			)
		) 
		(cY = (cWmax + (Side * 2)))
		(cX = (cTmax + Heel + Toe)) 
		(cC = ((cLmax - (2 * cTmax) - (2 * Heel)) + cX)) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet cX cY)) 
		(_PinArray _PadName 2 1 cC
			0 
			((-cC / 2):0)
		)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(cC + cX + (Courtyard * 2)) 
				(cA + (Courtyard * 2))
			) cH
		) 
		(_Layer lPkgGeoDfaT) 
		(s1 = (_ShapeRectangle cLmax cWmax)) 
		(s2 = (_ShapeRectangle cA cA))
		(p1 = (_PolyCreate s1)) 
		(p2 = (_PolyCreate s2)) 
		(polys = (_PolyOp 
				list(p1 p2) 
				'OR
			)) 
		(_BoundHeight 
			(axlDBCreateShape 
				car(polys) t
			) cH "CAE"
		) 
		(CrossSize = 0.6)
		if(((((cA - cY) / 2) - SilkGap) < 2) 
			(CrossSize = ((cA - cY) / (2 * 3)))
		) 
		(pDia = (cA - 0.75)) 
		(Chamfer = (cA - ((cA + (3 * SilkGap)) / 1.4142))) 
		if(((((cA - cX) / 2) - SilkGap) < 2) then 
			(Chamfer = ((cA - cX) / (2 * 3))) 
			(CrossSize = ((cA - cX) / (2 * 3)))
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Line 
				list(((-cA / 2):((-cA / 2) + Chamfer)) 
					((-cA / 2):((cA / 2) - Chamfer)) 
					(((-cA / 2) + Chamfer):(cA / 2)) 
					((cA / 2):(cA / 2)) 
					((cA / 2):(-cA / 2))
					(((-cA / 2) + Chamfer):(-cA / 2)) 
					((-cA / 2):((-cA / 2) + Chamfer))
				)
			)
			(_Circle 
				(pDia / 2)
			) 
			if((asm == 0) then 
				(_Dot 
					(((-cA / 2) - 0.25 - 0.2):((cY / 2) + SilkGap + 0.25)) 0.5
				) 
				(_Cross 
					(((-cA / 2) - 0.25 - 0.2):((-cA / 2) + CrossSize)) 
					(CrossSize * 2)
				)
			) 
			for(step 1 
				fix((pDia / (2 * SilkWidth))) 
				(_HalfCircle 
					(0:0) 
					(SilkWidth * step) 180
				)
			) 
			(_Line 
				list((0:(pDia / 2)) 
					(0:(-pDia / 2))
				)
			)
		)
		(_CreateRefValue pName 
			(0:((-cA / 2) - (tSilkHeight / 2) - SilkWidth)) 
			(0:((-cA / 2) - (tSymHeight / 2) - SilkWidth))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(Fiducial 
		(aTb) 
		(pName = nth(1 aTb)) 
		(cPad = nth(2 aTb)) 
		(cSolderMask = nth(3 aTb))
		(_PrepareNewSym pName) 
		(PadLst = cons((make_axlPadStackPad ?layer lPadT ?type 
					'REGULAR
					?figure 
					'CIRCLE ?figureSize 
					(cPad:cPad)
				) nil
			)) 
		(PadLst = cons((make_axlPadStackPad ?layer lPadST ?type 
					'REGULAR
					?figure 
					'CIRCLE ?figureSize 
					(cSolderMask:cSolderMask)
				) PadLst
			)) 
		(ps_id = (axlDBCreatePadStack pName nil PadLst t)) 
		(axlPadstackToDisk pName)
		(_CreatePinMechanical pName) 
		(_BoundHeight 
			(_ShapeCircle 
				(cSolderMask / 2) lPkgGeoPlaceT
			)
		) 
		(bound = (_ShapeCircle 
				(cSolderMask / 2) lRouteKoT
			)) 
		(_SaveDesign pName nil) 
		(axlSetSymbolType "package")
	)

defun(Via 
		(aTb) 
		(pName = nth(1 aTb)) 
		(pPadDia = nth(2 aTb)) 
		(pHole = nth(3 aTb))
		(pAnti = nth(4 aTb)) 
		(pID = nth(5 aTb)) 
		(pOD = nth(6 aTb)) 
		(pSpoke = nth(8 aTb)) 
		(drill_data = (make_axlPadStackDrill ?drillDiameter pHole ?figure 
				'CIRCLE
				?figureSize 
				(pHole:pHole) ?plating 
				'PLATED ?fixed
				'OPTIONAL
			))
		(PadLst = nil) 
		foreach(lPad lPad3 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type 
							'REGULAR
							?figure 
							'CIRCLE ?figureSize 
							(pPadDia:pPadDia)
						)
					)
				)) 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type 
							'ANTIPAD
							?figure 
							'CIRCLE ?figureSize 
							(pAnti:pAnti)
						)
					)
				))
		) 
		if((pID != 0.0) then 
			(fth = (_FlashFileCircleThermal pID pOD pSpoke)) 
			foreach(lPad lPad3 
				(PadLst = append(PadLst 
						list((make_axlPadStackPad ?layer lPad ?type 
								'THERMAL
								?figure 
								'FLASH ?flash fth ?figureSize
								(pOD:pOD)
							)
						)
					))
			) else
			foreach(lPad lPad3 
				(PadLst = append(PadLst 
						list((make_axlPadStackPad ?layer lPad ?type 
								'THERMAL
								?figure 
								'CIRCLE ?figureSize 
								(pHole:pHole)
							)
						)
					))
			)
		) 
		if(bViaSolderMask then 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPadST ?type 
							'REGULAR
							?figure 
							'CIRCLE ?figureSize 
							((pPadDia + solder_mask_offset):(pPadDia + solder_mask_offset))
						)
					)
				)) 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPadSB ?type 
							'REGULAR
							?figure 
							'CIRCLE ?figureSize 
							((pPadDia + solder_mask_offset):(pPadDia + solder_mask_offset))
						)
					)
				))
		) 
		(ps_id = (axlDBCreatePadStack pName drill_data PadLst t))
		(axlPadstackToDisk pName)
	)

defun(MtgPlated 
		(aTb \@optional bVia) 
		(pName = nth(1 aTb)) 
		(pHole = nth(4 aTb)) 
		(pPadTop = nth(5 aTb))
		(pPadInner = nth(6 aTb)) 
		(pPadBot = nth(7 aTb)) 
		(pPadVia = (((pPadTop - pHole) / 2) - 0.2)) 
		if((pPadVia > 1.0) 
			(pPadVia = 1.0)
		) 
		if(bVia 
			(pName = strcat(pName "-VIA"))
		)
		(_PrepareNewSym pName) 
		(drill_data = (make_axlPadStackDrill ?drillDiameter pHole ?figure 
				'SQUARE
				?figureSize 
				(pHole:pHole) ?plating 
				'PLATED
			)) 
		(sz1 = (pPadTop + (pad_th_anti2d * 2))) 
		(sz2 = (pPadInner + (pad_th_anti2d * 2))) 
		(sz3 = (pPadBot + (pad_th_anti2d * 2)))
		(fth = (_FlashFileCircleThermal pPadInner sz2 pad_th_spoke)) 
		(fSize1 = list((pPadTop:pPadTop) 
				(pPadInner:pPadInner) 
				(pPadBot:pPadBot)
			)) 
		(fSize2 = list((sz1:sz1) 
				(sz2:sz2) 
				(sz3:sz3)
			)) 
		(PadLst = nil) 
		(idx = 0)
		foreach(lPad lPad3 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type nil
							?figure 
							'CIRCLE ?figureSize 
							nth(idx fSize1)
						)
					)
				)) 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type 
							'ANTIPAD
							?figure 
							'CIRCLE ?figureSize 
							nth(idx fSize2)
						)
					)
				)) 
			idx++
		) 
		(PadLst = append(PadLst 
				list((make_axlPadStackPad ?layer lPadT ?type 
						'THERMAL
						?figure 
						'CIRCLE ?figureSize 
						(sz1:sz1)
					) 
					(make_axlPadStackPad ?layer lPadI ?type 
						'THERMAL
						?figure 
						'FLASH ?flash fth ?figureSize
						(sz2:sz2)
					) 
					(make_axlPadStackPad ?layer lPadB ?type 
						'THERMAL
						?figure 
						'CIRCLE ?figureSize 
						(sz3:sz3)
					) 
					(make_axlPadStackPad ?layer lPadST ?type nil
						?figure 
						'CIRCLE ?figureSize 
						((pPadTop + solder_mask_offset):(pPadTop + solder_mask_offset))
					) 
					(make_axlPadStackPad ?layer lPadSB ?type nil
						?figure 
						'CIRCLE ?figureSize 
						((pPadBot + solder_mask_offset):(pPadBot + solder_mask_offset))
					)
				)
			)) 
		(_PadName1 = strcat("PAD_" 
				nth(1 aTb)
			)) 
		(axlDBCreatePadStack _PadName1 drill_data PadLst t) 
		(axlPadstackToDisk _PadName1)
		(_CreatePin _PadName1 
			(0:0) "1"
		) 
		if(bVia then 
			(pHoleVia = 0.3) 
			(drill_data = (make_axlPadStackDrill ?drillDiameter pHoleVia ?figure 
					'SQUARE
					?figureSize 
					(pHoleVia:pHoleVia) ?plating 
					'PLATED
				)) 
			(PadLst = nil)
			foreach(lPad lPad3 
				(PadLst = append(PadLst 
						list((make_axlPadStackPad ?layer lPad ?type nil
								?figure 
								'CIRCLE ?figureSize 
								(pPadVia:pPadVia)
							)
						)
					))
			) 
			(_PadName2 = strcat("PAD_" 
					nth(1 aTb) "V"
				)) 
			(axlDBCreatePadStack _PadName2 drill_data PadLst t) 
			(axlPadstackToDisk _PadName2) 
			(r = ((((pPadTop / 2) - (pHole / 2)) / 2) + (pHole / 2)))
			for(a 0 8 
				(_CreatePinMechanical _PadName2 
					(axlGeoRotatePt 
						(a * 45.0) 
						(r:0) nil
					)
				)
			)
		) 
		(_BoundHeight 
			(_ShapeCircle 
				(pPadTop / 2) lPkgGeoPlaceT
			)
		) 
		(_BoundHeight 
			(_ShapeCircle 
				(pPadBot / 2) lPkgGeoPlaceB
			)
		) 
		(_CreateRefValue pName)
		if(bVia 
			(axlDBAddProp 
				(axlDBGetDesign) 
				list('NODRC_SYM_SAME_PIN)
			)
		) 
		(_SaveDesign pName) pName
	)

defun(MtgNonPlated 
		(aTb) 
		(pName = nth(1 aTb)) 
		(pKeepOut = nth(3 aTb)) 
		(pHole = nth(4 aTb))
		(pPadTop = nth(5 aTb)) 
		(pPadInner = nth(6 aTb)) 
		(pPadBot = nth(7 aTb)) 
		(pAnti = nth(8 aTb)) 
		(_PrepareNewSym pName)
		(drill_data = (make_axlPadStackDrill ?drillDiameter pHole ?figure 
				'SQUARE
				?figureSize 
				(pHole:pHole) ?plating 
				'NON_PLATED
			)) 
		(PadLst = list((make_axlPadStackPad ?layer lPadT ?type nil
					?figure 
					'CIRCLE ?figureSize 
					(pPadTop:pPadTop)
				) 
				(make_axlPadStackPad ?layer lPadI ?type nil
					?figure 
					'CIRCLE ?figureSize 
					(pPadInner:pPadInner)
				) 
				(make_axlPadStackPad ?layer lPadB ?type nil
					?figure 
					'CIRCLE ?figureSize 
					(pPadBot:pPadBot)
				) 
				(make_axlPadStackPad ?layer lPadST ?type nil
					?figure 
					'CIRCLE ?figureSize 
					(pKeepOut:pKeepOut)
				) 
				(make_axlPadStackPad ?layer lPadSB ?type nil
					?figure 
					'CIRCLE ?figureSize 
					(pKeepOut:pKeepOut)
				)
			)) 
		foreach(lPad lPad3 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type 
							'THERMAL
							?figure 
							'CIRCLE ?figureSize 
							(pAnti:pAnti)
						)
					)
				)) 
			(PadLst = append(PadLst 
					list((make_axlPadStackPad ?layer lPad ?type 
							'ANTIPAD
							?figure 
							'CIRCLE ?figureSize 
							(pAnti:pAnti)
						)
					)
				))
		) 
		(_PadName = strcat("PAD_" 
				nth(1 aTb)
			)) 
		(axlDBCreatePadStack _PadName drill_data PadLst t)
		(axlPadstackToDisk _PadName) 
		(_CreatePin _PadName 
			(0:0) "1"
		) 
		(bound = (_ShapeCircle 
				(pKeepOut / 2) lRouteKoA
			)) 
		(_BoundHeight 
			(_ShapeCircle 
				(pKeepOut / 2) lPkgGeoPlaceT
			)
		) 
		(_BoundHeight 
			(_ShapeCircle 
				(pKeepOut / 2) lPkgGeoPlaceB
			)
		)
		(_CreateRefValue pName) 
		(_SaveDesign pName) pName
	)

defun(TO 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPNum = nth(2 aTb)) 
		(Pitch = nth(3 aTb))
		(pL = nth(5 aTb)) 
		(pT1 = nth(7 aTb)) 
		(pW1 = nth(9 aTb)) 
		(pT2 = nth(11 aTb)) 
		(pW2 = nth(13 aTb))
		(pT3 = nth(14 aTb)) 
		(pA = nth(15 aTb)) 
		(pB = nth(16 aTb)) 
		(pH = nth(17 aTb)) 
		(_Protrusion_calc RibbonLead)
		(pX1 = (pW1 + (Side * 2))) 
		(pY1 = (pT1 + Heel + Toe)) 
		(pX2 = (pW2 + (Side * 2))) 
		(pY2 = (pT2 + Heel + Toe + 0.5)) 
		(pC1 = ((((pL - pT1) + Toe) - Heel) / 2))
		(pC2 = (((pL - pT2 - Toe) + Heel) / 2)) 
		(pR1 = pX2) 
		(pR2 = ((pC1 + pC2) - (pY1 / 2) - (pY2 / 2) - (SilkGap * 2))) 
		if((pPNum < 4) 
			(Pitch = (Pitch * 2.0))
		) 
		(_PrepareNewSym pName)
		(PadN1 = (_PadSMFillet pX1 pY1)) 
		(PadN2 = (_PadSMFillet pX2 pY2)) 
		(_PinArray PadN1 
			(pPNum - 1) 1 Pitch
			0 
			(((-(pPNum - 2) * Pitch) / 2):-pC1)
		) 
		sprintf(pnum "%d" pPNum) 
		(_CreatePin PadN2 
			(0:pC2) pnum
		)
		(_Layer lPkgGeoPlaceT) 
		(s1 = (_ShapeRectangle 
				(pX2 + (Courtyard * 2)) 
				(pT3 + pB + Heel + Toe + 0.5 + (Courtyard * 2)) 
				(0:((pL / 2) - ((pT3 + pB) / 2)))
			)) 
		(s2 = (_ShapeRectangle 
				((Pitch * (pPNum - 2)) + pW1 + (Courtyard * 2)) 
				((pL - pT3 - pB) + Heel + Toe + (Courtyard * 2)) 
				(0:(-(pT3 + pB) / 2))
			)) 
		(p1 = (_PolyCreate s1)) 
		(p2 = (_PolyCreate s2))
		(polys = (_PolyOp 
				list(p1 p2) 
				'OR
			)) 
		foreach(poly polys 
			(_BoundHeight 
				(axlDBCreateShape poly t) pH
			)
		) 
		(_Layer lPkgGeoDfaT) 
		(s1 = (_ShapeRectangle pA 
				(pT3 + pB) 
				(0:((pL / 2) - ((pT3 + pB) / 2)))
			)) 
		(s2 = (_ShapeRectangle 
				((Pitch * (pPNum - 2)) + pW1) 
				(pL - pT3 - pB) 
				(0:(-(pT3 + pB) / 2))
			))
		(p1 = (_PolyCreate s1)) 
		(p2 = (_PolyCreate s2)) 
		(polys = (_PolyOp 
				list(p1 p2) 
				'OR
			)) 
		foreach(poly polys 
			(_BoundHeight 
				(axlDBCreateShape poly t) pH "TO"
			)
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(y0 = ((pL / 2) - (pT3 + pB)))
			(y1 = ((pL / 2) - pT3)) 
			(x0 = (-pW2 / 2)) 
			(_Line 
				list((x0:y0) 
					((x0 + pW2):y0) 
					((x0 + pW2):y1) 
					(x0:y1) 
					(x0:y0)
				)
			) 
			(_Line 
				list((x0:y1) 
					((x0 + pW2):y1) 
					((x0 + pW2):((y1 + pT3) - 0.5)) 
					(((x0 + pW2) - 0.5):(y1 + pT3)) 
					((x0 + 0.5):(y1 + pT3))
					(x0:((y1 + pT3) - 0.5)) 
					(x0:y1)
				)
			)
		)
		(_CreateRefValue pName 
			(0:(pC2 + (pY2 / 2) + SilkGap + (SilkWidth / 2) + (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(RadialOval 
		(aTb) 
		(pName = nth(1 aTb)) 
		(pL = nth(2 aTb)) 
		(pW = nth(3 aTb))
		(pH = nth(4 aTb)) 
		(pPitch = nth(5 aTb)) 
		(pd = nth(6 aTb)) 
		(pPad = nth(7 aTb)) 
		(pHole = nth(8 aTb))
		(_PrepareNewSym pName) 
		if((pL < 8.0) 
			(Courtyard = 0.5) 
			(Courtyard = 0.5)
		) 
		(_PadName = (_PadTH_Default pPad pHole)) 
		(_PinArray _PadName 2 1 pPitch
			0 
			((-pPitch / 2):0)
		) 
		(_Layer lPkgGeoPlaceT)
		(_BoundHeight 
			(_ShapeRectangle 
				(pL + (Courtyard * 2)) 
				(pW + (Courtyard * 2)) 
				(0:0) 0.2
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pL pW 
				(0:0) 0.2
			) pH
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle pL pW 
				(0:0) 0.5
			)
		) 
		(_CrossCenter)
		(_CreateRefValue pName 
			(0:((pW / 2) + SilkWidth + (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(CapRadial 
		(aTb) 
		(pName = nth(1 aTb)) 
		(pA = nth(2 aTb)) 
		(pH = nth(3 aTb))
		(pPitch = nth(4 aTb)) 
		(pPad = nth(6 aTb)) 
		(pHole = nth(7 aTb)) 
		(_PrepareNewSym pName) 
		if((pA < 8.0) 
			(Courtyard = 0.5) 
			(Courtyard = 1.0)
		)
		(PadN1 = (_PadTH_Default pPad pHole t)) 
		(_CreatePin PadN1 
			((-pPitch / 2):0) "1"
		) 
		(_PadName = (_PadTH_Default pPad pHole)) 
		(_CreatePin _PadName 
			((pPitch / 2):0) "2"
		) 
		(_BoundHeight 
			(_ShapeCircle 
				((pA / 2) + Courtyard) lPkgGeoPlaceT
			) pH
		)
		(_BoundHeight 
			(_ShapeCircle 
				(pA / 2) lPkgGeoDfaT
			) pH "CAPPR"
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Circle 
				(pA / 2)
			)
			if((asm == 0) 
				(_Cross 
					(((-pA / 2 / 1.414) - 0.5):((-pA / 2 / 1.414) - 0.5)) 1.0
				) 
				(_Cross 
					((-pPitch / 2):((-pHole / 2) - SilkGap - 0.5 - SilkWidth)) 1.0
				)
			) 
			for(step 1 
				fix((pA / (2 * SilkWidth))) 
				(_HalfCircle 
					(0:0) 
					(SilkWidth * step) 180
				)
			) 
			(_Line 
				list((0:(-pA / 2)) 
					(0:(pA / 2))
				)
			)
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((-pA / 2) - SilkWidth - (tSilkHeight / 2)))
		) 
		(_SaveDesign pName)
		(_MakeDevice pName 2)
	)

defun(SOT223 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPnum = nth(2 aTb)) 
		(Pitch = nth(3 aTb))
		(pLmin = nth(4 aTb)) 
		(pLmax = nth(5 aTb)) 
		(pTmin = nth(6 aTb)) 
		(pTmax = nth(7 aTb)) 
		(pT = pTmax)
		(pW1min = nth(8 aTb)) 
		(pW1max = nth(9 aTb)) 
		(pW1 = pW1max) 
		(pW2min = nth(10 aTb)) 
		(pW2max = nth(11 aTb))
		(pW2 = pW2max) 
		(pA = nth(12 aTb)) 
		(pB = nth(13 aTb)) 
		(pH = nth(14 aTb)) 
		(_Protrusion_calc RibbonLead)
		(pX1 = (pW1 + (Side * 2))) 
		(pX2 = (pW2 + (Side * 2))) 
		(pY = (pT + Heel + Toe)) 
		(pC = ((pLmax - (2 * pT) - (2 * Heel)) + pY)) 
		(pR1 = (pC - pY - (SilkGap * 2) - SilkWidth))
		(_PrepareNewSym pName) 
		(PadN1 = (_PadSMFillet pX1 pY)) 
		(PadN2 = (_PadSMFillet pX2 pY)) 
		(_PinArray PadN1 
			(pPnum - 1) 1 Pitch
			0 
			(((-(pPnum - 2) * Pitch) / 2):(-pC / 2))
		) 
		sprintf(pnum "%d" pPnum)
		(_CreatePin PadN2 
			(0:(pC / 2)) pnum
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pB + (Courtyard * 2)) 
				(pC + pY + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pB pLmax) pH
		)
		(_Layer lPkgGeoAsmT) 
		(_Rectangle pB pA) 
		(_Layer lPkgGeoSilkT) 
		(_Rectangle pB pA) 
		(_CreateRefValue pName 
			(0:((pC / 2) + (pY / 2) + SilkGap + (SilkWidth / 2) + (tSilkHeight / 2)))
		)
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(SOT23 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPnum = nth(2 aTb)) 
		(Pitch = nth(3 aTb))
		(pLmin = nth(4 aTb)) 
		(pLmax = nth(5 aTb)) 
		(pL = ((pLmax + pLmin) / 2)) 
		(pTmin = nth(6 aTb)) 
		(pTmax = nth(7 aTb))
		(pT = pTmax) 
		(pWmin = nth(8 aTb)) 
		(pWmax = nth(9 aTb)) 
		(pW = pWmax) 
		(pA = nth(10 aTb))
		(pB = nth(11 aTb)) 
		(pH = nth(12 aTb)) 
		(_Protrusion_calc RibbonLead) 
		(pX = (pW + (Side * 2))) 
		(pY = (pT + Heel + Toe))
		(pC = ((pL + (2 * Toe)) - pY)) 
		(pV2 = (pC + pY + (Courtyard * 2))) 
		(pV1 = (pB + (Courtyard * 2))) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSM pX pY))
		(x0 = Pitch) 
		case(pPnum 
			(3 
				(_CreatePin _PadName 
					(-x0:(-pC / 2)) "1"
				) 
				(_CreatePin _PadName 
					(x0:(-pC / 2)) "2"
				) 
				(_CreatePin _PadName 
					(0:(pC / 2)) "3"
				)
			) 
			(5 
				(_PinArray _PadName 3 1 Pitch
					0 
					(-Pitch:(-pC / 2))
				) 
				(_PinArray _PadName 2 1 
					(2 * Pitch)
					0 
					(Pitch:(pC / 2)) nil t t
					t t 3
				)
			) 
			(6 
				(_PinArray _PadName 3 1 x0
					0 
					(-x0:(-pC / 2))
				) 
				(_PinArray _PadName 3 1 x0
					0 
					(x0:(pC / 2)) nil t t
					t t 3
				)
			) 
			(8 
				(x0 = (Pitch + (Pitch / 2))) 
				(_PinArray _PadName 4 1 Pitch
					0 
					((-Pitch - (Pitch / 2)):(-pC / 2))
				) 
				(_PinArray _PadName 4 1 Pitch
					0 
					((Pitch + (Pitch / 2)):(pC / 2)) nil t t
					t t 4
				)
			)
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle pV1 pV2) pH
		) 
		(_Layer lPkgGeoDfaT)
		(_BoundHeight 
			(_ShapeRectangle pB pLmax) pH "SOT"
		) 
		(_Layer lPkgGeoAsmT) 
		(_Rectangle pB pA) 
		(_Dot 
			(((-pB / 2) + SilkWidth + 0.25):((-pA / 2) + SilkWidth + 0.25)) 0.5
		) 
		(_Layer lPkgGeoSilkT)
		(_Rectangle pB pA) 
		(_Dot 
			((-x0 - (pX / 2) - SilkGap - 0.25):(-pC / 2)) 0.5
		) 
		(_CreateRefValue pName 
			(0:((-pC / 2) - (pY / 2) - SilkGap - (tSilkHeight / 2) - (SilkWidth / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(SOD 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pLmin = nth(2 aTb)) 
		(pLmax = nth(3 aTb))
		(pLavg = ((pLmin + pLmax) / 2)) 
		(pTmin = nth(4 aTb)) 
		(pTmax = nth(5 aTb)) 
		(pWmin = nth(6 aTb)) 
		(pWmax = nth(7 aTb))
		(pWavg = ((pWmin + pWmax) / 2)) 
		(pA = nth(8 aTb)) 
		(pB = nth(9 aTb)) 
		(pH = nth(10 aTb)) 
		(_Protrusion_calc BottomOnlyTermination)
		(pX = (pWavg + (Side * 2))) 
		(pY1 = ((((pLmax + (Toe * 2)) - pA) + (Heel * 2)) / 2)) 
		(pY2 = (pTmax + Toe + Heel)) 
		if((pY1 > pY2) 
			(pY = pY1) 
			(pY = pY2)
		) 
		(pC1 = ((pLmax + (2 * Toe)) - pY))
		(pC2 = (pB + (pTmax / 2))) 
		(pC = ((pC1 + pC2) / 2)) 
		if((pC1 > pC2) 
			(pC = pC1) 
			(pC = pC2)
		) 
		(pV1 = (pC + pY + (Courtyard * 2))) 
		(pV2 = (pB + (Courtyard * 2)))
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet pX pY)) 
		(_CreatePin _PadName 
			((-pC / 2):0) DiodePin1Name 90
		) 
		(_CreatePin _PadName 
			((pC / 2):0) DiodePin2Name 90
		) 
		(_Layer lPkgGeoPlaceT)
		(_BoundHeight 
			(_ShapeRectangle pV1 pV2) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pLmax pB) pH "SOD"
		) 
		(_Layer lPkgGeoSilkT) 
		(_Rectangle pA pB)
		(_Dot 
			(((-pA / 2) - 0.25 - 0.1):((pX / 2) + SilkGap + 0.25)) 0.5
		) 
		(_Layer lPkgGeoAsmT) 
		(_Rectangle pA pB) 
		for(cnt 1 5 
			(_Line 
				list((((-pA / 2) + ((cnt * SilkWidth) / 2)):(-pB / 2)) 
					(((-pA / 2) + ((cnt * SilkWidth) / 2)):(pB / 2))
				)
			)
		) 
		(_Rectangle 
			(pTmax - SilkWidth) 
			(pWmax - SilkWidth) 
			(((-pA / 2) - (pTmax / 2)):0)
		)
		(_Rectangle 
			(pTmax - SilkWidth) 
			(pWmax - SilkWidth) 
			(((pA / 2) + (pTmax / 2)):0)
		) 
		(_CreateRefValue pName 
			(0:((-pB / 2) - (tSilkHeight / 2) - SilkWidth))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(THDip 
		(aTb) 
		(pName = nth(1 aTb)) 
		(pPNum = nth(2 aTb)) 
		(Pitch = nth(3 aTb))
		(pL = nth(4 aTb)) 
		(pA = nth(5 aTb)) 
		(pB = nth(6 aTb)) 
		(pH = nth(7 aTb)) 
		(pPad = nth(8 aTb))
		(pHole = nth(9 aTb)) 
		(_PrepareNewSym pName) 
		(Courtyard = 0.5) 
		(PadN1 = (_PadTH_Default pPad pHole t)) 
		(_PadName = (_PadTH_Default pPad pHole))
		(_CreatePin PadN1 
			(((-((pPNum / 2) - 1) * Pitch) / 2):(-pL / 2)) "1"
		) 
		(_PinArray _PadName 
			(pPNum / 2) 1 Pitch
			0 
			(((-((pPNum / 2) - 1) * Pitch) / 2):(-pL / 2)) t t t
			nil
		) 
		(_PinArray _PadName 
			(pPNum / 2) 1 Pitch
			0 
			(((((pPNum / 2) - 1) * Pitch) / 2):(pL / 2)) nil t t
			t t 
			(pPNum / 2)
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pB + (Courtyard * 2)) 
				(pL + pPad + (Courtyard * 2))
			) pH
		)
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pB 
				(pL + pHole)
			) pH
		) 
		(p1 = (_PolyCreate 
				(_ShapeRectangle pB pA)
			)) 
		(p2 = (_PolyCreate 
				(_ShapeCircle 0.6 lPkgGeoAsmT 
					((-pB / 2):0)
				)
			)) 
		(_Layer lPkgGeoSilkT)
		(dy = (pL - pPad - (SilkGap * 2) - SilkWidth)) 
		if((dy > pA) 
			(dy = pA)
		) 
		(p3 = (_PolyCreate 
				(_ShapeRectangle pB dy)
			)) 
		(polys = (axlPolyOperation p3 p2 
				'ANDNOT
			)) 
		(_CreateObjPath 
			(axlDBCreateShape 
				car(polys) t
			)
		)
		(_Dot 
			((((-((pPNum / 2) - 1) * Pitch) / 2) - (pPad / 2) - SilkGap - 0.25):(-pL / 2)) 0.5
		) 
		(_Layer lPkgGeoAsmT) 
		(polys = (axlPolyOperation p1 p2 
				'ANDNOT
			)) 
		(_CreateObjPath 
			(axlDBCreateShape 
				car(polys) t
			)
		) 
		(_CrossCenter)
		(_CreateRefValue pName 
			(0:((-pL / 2) - (pPad / 2) - SilkGap - (SilkWidth / 2) - (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(Axial 
		(aTb \@optional polarity) 
		(pName = nth(1 aTb)) 
		(pL = nth(2 aTb)) 
		(pW = nth(3 aTb))
		(pd = nth(4 aTb)) 
		(pC = nth(5 aTb)) 
		(pPad = nth(6 aTb)) 
		(pHole = nth(7 aTb)) 
		(_PrepareNewSym pName)
		if(polarity then 
			(Pn1 = DiodePin1Name) 
			(Pn2 = DiodePin2Name) else
			(Pn1 = "1") 
			(Pn2 = "2")
		) 
		if(polarity 
			(PadN1 = (_PadTH_Default pPad pHole t)) 
			(PadN1 = (_PadTH_Default pPad pHole))
		) 
		(_PadName = (_PadTH_Default pPad pHole)) 
		(_CreatePin PadN1 
			((-pC / 2):0) Pn1
		) 
		(_CreatePin _PadName 
			((pC / 2):0) Pn2
		)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pC + pPad + 1) 
				(pW + 1)
			) pW
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pC + pHole) pW
			) pW "AXIAL"
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			if((asm == 0) 
				(x = ((pC / 2) - ((pHole + 0.8) / 2) - SilkGap)) 
				(x = (pC / 2))
			)
			if((asm == 1) then 
				(_Line 
					list(((-pL / 2):0) 
						(-x:0)
					) pd
				) 
				(_Line 
					list(((pL / 2):0) 
						(x:0)
					) pd
				) else
				(_Line 
					list(((-pL / 2):0) 
						(-x:0)
					)
				) 
				(_Line 
					list(((pL / 2):0) 
						(x:0)
					)
				)
			) 
			(_Rectangle pL pW) 
			if(polarity then 
				for(j 1 9 
					(_Line 
						list((((-pL / 2) + ((j * SilkWidth) / 2)):(pW / 2)) 
							(((-pL / 2) + ((j * SilkWidth) / 2)):(-pW / 2))
						)
					)
				)
			)
		)
		(_CreateRefValue pName 
			(0:((-pW / 2) - SilkWidth - (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(HeaderF 
		(aTb) 
		(OrgName = nth(1 aTb)) 
		(pRow = nth(2 aTb)) 
		(pFrom = nth(3 aTb))
		(pTo = nth(4 aTb)) 
		(Pitch = nth(5 aTb)) 
		(pDIA = nth(6 aTb)) 
		(pHole = nth(7 aTb)) 
		(pGA = nth(8 aTb))
		(pGB = nth(9 aTb)) 
		(pL = nth(10 aTb)) 
		(pBend = nth(11 aTb)) 
		(Courtyard = 0.0) 
		(RA = nil)
		if((pBend > 0.0) 
			(RA = t)
		) 
		for(col pFrom pTo 
			sprintf(pName "%s-%dX%dX%.0f" OrgName pRow col
				(pL * 100)
			) 
			(_PrepareNewSym pName)
			(PN1 = (_PadTH_Default pDIA pHole t)) 
			(PN = (_PadTH_Default pDIA pHole)) 
			(_CreatePin PN1 
				(((col - 1) * Pitch):0) "1" 90
			) 
			(_PinArray PN col pRow Pitch
				Pitch 
				(((col - 1) * Pitch):0) nil t nil
				nil
			) 
			(_Layer lPkgGeoPlaceT)
			(gx1 = -pGA) 
			(gy1 = -pGB) 
			(gx2 = (((col - 1) * Pitch) + pGA)) 
			(gy2 = (((pRow - 1) * Pitch) + pGB)) 
			if(RA then 
				(bound = (axlDBCreateRectangle 
						list(((gx1 - Courtyard):((-Pitch / 2) - Courtyard)) 
							((gx2 + Courtyard):(((pRow - 1) * Pitch) + (Pitch / 2) + Courtyard))
						) t
					)) 
				(_BoundHeight bound 
					(((pRow - 1) * Pitch) + (pGB * 2))
				) else
				(bound = (axlDBCreateRectangle 
						list(((gx1 - Courtyard):(gy1 - Courtyard)) 
							((gx2 + Courtyard):(gy2 + Courtyard))
						) t
					)) 
				(_BoundHeight bound pL)
			)
			(x1 = gx1) 
			(x2 = gx2) 
			if(RA then 
				(y1 = (-Pitch / 2)) 
				(y2 = (((pRow - 1) * Pitch) + pBend)) 
				(y3 = (y2 + pL))
				else 
				(y1 = gy1) 
				(y2 = gy2)
			) 
			for(asm 0 1 
				if((asm == 1) 
					(_Layer lPkgGeoAsmT) 
					(_Layer lPkgGeoSilkT)
				) 
				(_Triangle 
					(((col - 1) * Pitch):y1) 1 90
				)
				if(RA then 
					(_Line 
						list((x1:y2) 
							(x2:y2) 
							(x2:y3) 
							(x1:y3) 
							(x1:y2)
						)
					) 
					(_Line 
						list(((((col - 1) * Pitch) / 2):y3) 
							((((col - 1) * Pitch) / 2):(y3 - 2))
						)
					) 
					for(pnum 1 col 
						if((asm == 1) 
							(_Line 
								list((((pnum - 1) * Pitch):0) 
									(((pnum - 1) * Pitch):y2)
								)
							) 
							(_Line 
								list((((pnum - 1) * Pitch):(((pRow - 1) * Pitch) + (pDIA / 2) + SilkGap + (SilkWidth / 2))) 
									(((pnum - 1) * Pitch):y2)
								)
							)
						) 
						(_Line 
							list((((pnum - 1) * Pitch):y3) 
								(((pnum - 1) * Pitch):(y3 - 1))
							)
						)
					)
					else 
					(_Line 
						list((x1:y1) 
							(x2:y1) 
							(x2:y2) 
							(x1:y2) 
							(x1:y1)
						)
					) 
					if((pRow == 1) then 
						(_Line 
							list(((((col - 1) * Pitch) - (Pitch / 2)):y1) 
								((((col - 1) * Pitch) - (Pitch / 2)):y2)
							)
						) else 
						(_Line 
							list(((((col - 1) * Pitch) - (Pitch / 2)):y1) 
								((((col - 1) * Pitch) - (Pitch / 2)):(Pitch / 2)) 
								(x2:(Pitch / 2))
							)
						)
					)
				)
			) 
			(_CreateRefValue pName)
			(_SaveDesign pName) 
			(_MakeDevice pName 1)
		)
	)

defun(Header 
		(aTb) 
		(OrgName = nth(1 aTb)) 
		(pRow = nth(2 aTb)) 
		(pFrom = nth(3 aTb))
		(pTo = nth(4 aTb)) 
		(Pitch = nth(5 aTb)) 
		(pDIA = nth(6 aTb)) 
		(pHole = nth(7 aTb)) 
		(pSA = nth(8 aTb))
		(pSB = nth(9 aTb)) 
		(pSGa = nth(10 aTb)) 
		(pSGb = nth(11 aTb)) 
		(Courtyard = 0.0) 
		(Shrouded = nil)
		if(((pSA > 0.0) && (pSB > 0.0) && (pSGa > 0.0) && (pSGb > 0.0)) 
			(Shrouded = t)
		) 
		for(col pFrom pTo 
			sprintf(pName "%s-%dX%d" OrgName pRow col) 
			(_PrepareNewSym pName)
			(PN1 = (_PadTH_Default pDIA pHole t)) 
			(PN = (_PadTH_Default pDIA pHole)) 
			(_CreatePin PN1 
				(0:0) "1"
			) 
			(_PinArray PN col pRow Pitch
				Pitch 
				(0:0) t t nil
				nil
			) 
			(x1 = (-Pitch / 2))
			(y1 = (-Pitch / 2)) 
			(x2 = (((col - 1) * Pitch) + (Pitch / 2))) 
			(y2 = (((pRow - 1) * Pitch) + (Pitch / 2))) 
			if((x1 > ((-pDIA / 2) - SilkGap - (SilkWidth / 2))) 
				(x1 = ((-pDIA / 2) - SilkGap - (SilkWidth / 2)))
			) 
			if((y1 > ((-pDIA / 2) - SilkGap - (SilkWidth / 2))) 
				(y1 = ((-pDIA / 2) - SilkGap - (SilkWidth / 2)))
			)
			(center = ((((col - 1) * Pitch) / 2):(((pRow - 1) * Pitch) / 2))) 
			(w = (col * Pitch)) 
			(h = (pRow * Pitch)) 
			(w1 = ((pSGa * 2) + w)) 
			(h1 = ((pSGb * 2) + h))
			(w2 = (((pSGa * 2) + w) - (pSA * 2))) 
			(h2 = (((pSGb * 2) + h) - (pSB * 2))) 
			for(asm 0 1 
				if((asm == 1) 
					(_Layer lPkgGeoAsmT) 
					(_Layer lPkgGeoSilkT)
				) 
				(_Rectangle w h center)
				if((((pDIA / 2) + SilkGap + (SilkWidth / 2)) < (Pitch / 2)) then 
					if((pRow == 1) 
						(_Line 
							list(((x1 + Pitch):y1) 
								((x1 + Pitch):y2)
							)
						) 
						(_Line 
							list(((x1 + Pitch):y1) 
								((x1 + Pitch):(Pitch / 2)) 
								(x1:(Pitch / 2))
							)
						)
					)
				) 
				if(Shrouded then 
					(_Rectangle w1 h1 center) 
					(s1 = (_ShapeRectangle w2 h2 center)) 
					if((col <= 6) then 
						(s2 = (_ShapeRectangle 4 pSB 
								(car(center):((cadr(center) - (h1 / 2)) + (pSB / 2)))
							)) 
						(s3 = nil) else
						(s2 = (_ShapeRectangle 4 pSB 
								(2:((cadr(center) - (h1 / 2)) + (pSB / 2)))
							)) 
						(s3 = (_ShapeRectangle 4 pSB 
								((((col - 1) * Pitch) - 2):((cadr(center) - (h1 / 2)) + (pSB / 2)))
							))
					)
					(p1 = (_PolyCreate s1)) 
					(p2 = (_PolyCreate s2)) 
					(p3 = (_PolyCreate s3)) 
					(polys = (_PolyOp 
							list(p1 p2 p3) 
							'OR
						)) 
					foreach(poly polys 
						(_CreateObjPath 
							(axlDBCreateShape poly t)
						)
					)
				) 
				if(Shrouded 
					(_Triangle 
						(0:(cadr(center) - (h1 / 2))) 1 90
					) 
					(_Triangle 
						(0:y1) 1 90
					)
				) 
				(_Line 
					list(center 
						(car(center):(cadr(center) + (h1 / 2)))
					)
				)
			) 
			(_Layer lPkgGeoPlaceT) 
			if(Shrouded then 
				(wx = w1) 
				(wy = h1) else
				(wx = w) 
				(wy = h)
			)
			(_BoundHeight 
				(_ShapeRectangle 
					(wx + (Courtyard * 2)) 
					(wy + (Courtyard * 2)) center
				) 
				(Pitch * 2)
			) 
			(_Layer lPkgGeoDfaT) 
			(_BoundHeight 
				(_ShapeRectangle wx wy center) 
				(Pitch * 2) "HEADER"
			) 
			if(Shrouded 
				(_CreateRefValue pName 
					(car(center):(cadr(center) - (h1 / 2) - SilkWidth - (tSilkHeight / 2)))
				) 
				(_CreateRefValue pName 
					(car(center):((-Pitch / 2) - SilkWidth - (tSilkHeight / 2)))
				)
			) 
			(_SaveDesign pName)
			(_MakeDevice pName 1)
		)
	)

defun(HeaderRA 
		(aTb) 
		(OrgName = nth(1 aTb)) 
		(pRow = nth(2 aTb)) 
		(pFrom = nth(3 aTb))
		(pTo = nth(4 aTb)) 
		(Pitch = nth(5 aTb)) 
		(pDIA = nth(6 aTb)) 
		(pHole = nth(7 aTb)) 
		(pHeadLen = nth(8 aTb))
		(pBend = nth(9 aTb)) 
		(pRAThick = nth(10 aTb)) 
		(Courtyard = 0.0) 
		for(col pFrom pTo 
			sprintf(pName "%s-%dX%d" OrgName pRow col) 
			(_PrepareNewSym pName)
			(PN1 = (_PadTH_Default pDIA pHole t)) 
			(PN = (_PadTH_Default pDIA pHole)) 
			(_CreatePin PN1 
				(0:0) "1"
			) 
			(_PinArray PN col pRow Pitch
				Pitch 
				(0:0) t t nil
				nil
			) 
			(x1 = (-Pitch / 2))
			(y1 = (-Pitch / 2)) 
			(x2 = (((col - 1) * Pitch) + (Pitch / 2))) 
			(y2 = (((pRow - 1) * Pitch) + (Pitch / 2))) 
			(center = ((((col - 1) * Pitch) / 2):(((pRow - 1) * Pitch) / 2))) 
			(w = (col * Pitch))
			(h = (pRow * Pitch)) 
			for(asm 0 1 
				if((asm == 1) 
					(_Layer lPkgGeoAsmT) 
					(_Layer lPkgGeoSilkT)
				) 
				(_Rectangle w h center)
				if((pRow == 1) 
					(_Line 
						list(((x1 + Pitch):y1) 
							((x1 + Pitch):y2)
						)
					) 
					(_Line 
						list(((x1 + Pitch):y1) 
							((x1 + Pitch):(Pitch / 2)) 
							(x1:(Pitch / 2))
						)
					)
				) 
				(RAx1 = (-Pitch / 2)) 
				(RAx2 = (((col - 1) * Pitch) + (Pitch / 2))) 
				(RAy1 = (((pRow - 1) * Pitch) + pBend)) 
				(RAy2 = (RAy1 + pRAThick))
				(_Line 
					list(((RAx1 + 0.25):RAy1) 
						((RAx2 - 0.25):RAy1) 
						(RAx2:(RAy1 + 0.25)) 
						(RAx2:(RAy2 - 0.25)) 
						((RAx2 - 0.25):RAy2)
						((RAx1 + 0.25):RAy2) 
						(RAx1:(RAy2 - 0.25)) 
						(RAx1:(RAy1 + 0.25)) 
						((RAx1 + 0.25):RAy1)
					)
				) 
				for(i 1 col 
					(_Line 
						list((((i - 1) * Pitch):0) 
							(((i - 1) * Pitch):RAy1)
						)
					) 
					(_Line 
						list((((i - 1) * Pitch):RAy2) 
							(((i - 1) * Pitch):(RAy2 + pHeadLen))
						)
					)
				) 
				(_Triangle 
					(0:y1) 1 90
				) 
				(_Line 
					list(center 
						(car(center):(RAy2 + (pHeadLen / 2)))
					)
				)
			) 
			(_Layer lPkgGeoPlaceT) 
			(_BoundHeight 
				(_ShapeRectangle 
					(w + (Courtyard * 2)) 
					(h + (Courtyard * 2)) center
				) 
				(Pitch * 2)
			) 
			(_Layer lPkgGeoDfaT)
			(_BoundHeight 
				(_ShapeRectangle w h center) 
				(Pitch * 2) "HEADER-RA"
			) 
			(_CreateRefValue pName 
				(car(center):((-Pitch / 2) - SilkWidth - (tSilkHeight / 2)))
			) 
			(_SaveDesign pName) 
			(_MakeDevice pName 1)
		)
	)

defun(TestPoint 
		(aTb) 
		(pPad = nth(1 aTb)) 
		(pHole = nth(2 aTb)) 
		for(sq 0 1 
			if((pHole == 0.0) 
				sprintf(pName "%.f" 
					(pPad * 100)
				) 
				sprintf(pName "%.fd%.f" 
					(pPad * 100) 
					(pHole * 100)
				)
			) 
			if((sq != 0) 
				(pName = strcat("TPS" pName)) 
				(pName = strcat("TP" pName))
			)
			(_PrepareNewSym pName) 
			if((pHole == 0.0) 
				if((sq != 0) 
					(_PadName = (_PadSM pPad pPad)) 
					(_PadName = (_PadSM pPad pPad nil t))
				) 
				if((sq != 0) 
					(_PadName = (_PadTH_Default pPad pHole t)) 
					(_PadName = (_PadTH_Default pPad pHole))
				)
			) 
			(_CreatePin _PadName 
				(0:0) "1"
			) 
			(_Layer lPkgGeoPlaceT) 
			if((sq != 0) 
				(bound = (_ShapeRectangle pPad pPad)) 
				(bound = (_ShapeCircle 
						(pPad / 2)
					))
			)
			(_BoundHeight bound 0.5) 
			(dx = (pPad + (SilkGap * 2) + SilkWidth)) 
			for(asm 0 1 
				if((asm == 1) 
					(_Layer lPkgGeoAsmT) 
					(_Layer lPkgGeoSilkT)
				) 
				if((sq != 0) 
					(_Rectangle dx dx) 
					(_Circle 
						(dx / 2)
					)
				)
			) 
			(_CreateRefValue pName) 
			(_SaveDesign pName)
			(_MakeDevice pName 1)
		)
	)

defun(SOP 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPin = nth(2 aTb)) 
		(pLmin = nth(3 aTb))
		(pLmax = nth(4 aTb)) 
		(pLavg = ((pLmin + pLmax) / 2)) 
		(pTmin = nth(5 aTb)) 
		(pTmax = nth(6 aTb)) 
		(pWmin = nth(7 aTb))
		(pWmax = nth(8 aTb)) 
		(pA = nth(9 aTb)) 
		(pB = nth(10 aTb)) 
		(pH = nth(11 aTb)) 
		(Pitch = nth(12 aTb))
		(_Protrusion_calc RibbonLead) 
		(Heel = (Heel + 0.1)) 
		(Toe = (Toe + 0.1)) 
		(pX = (pWmax + (Side * 2))) 
		if(((Pitch - pX) < Pin2Pin) 
			(pX = (Pitch - Pin2Pin))
		)
		(pY = (pTmax + Heel + Toe)) 
		(pC = ((pLavg + (2 * Toe)) - pY)) 
		(pV1 = (pB + (Courtyard * 2))) 
		(pV2 = (pLavg + ((Toe + Courtyard) * 2))) 
		(pR1 = pB)
		(pR2 = (pC - pY - (2 * SilkGap) - SilkWidth)) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSM pX pY)) 
		(dis = (((pPin / 2) - 1) * Pitch)) 
		(_PinArray _PadName 
			(pPin / 2) 1 Pitch
			0 
			((-dis / 2):(-pC / 2))
		)
		(_PinArray _PadName 
			(pPin / 2) 1 Pitch
			0 
			((dis / 2):(pC / 2)) nil t t
			t t 
			(pPin / 2)
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle pV1 pV2) pH
		) 
		(_Layer lPkgGeoDfaT) 
		sprintf(cdfa "SOP_%d" 
			fix((Pitch * 100.0))
		)
		(p1 = (_PolyCreate 
				(_ShapeRectangle 
					(dis + pWmax) pLmax
				)
			)) 
		(p2 = (_PolyCreate 
				(_ShapeRectangle pB pA)
			)) 
		(polys = (_PolyOp 
				list(p1 p2) 
				'OR
			)) 
		foreach(poly polys 
			(_BoundHeight 
				(axlDBCreateShape poly t) pH 0 cdfa
			)
		) 
		(_Layer lPkgGeoSilkT)
		(_Rectangle pR1 pR2) 
		(_Dot 
			(((-pR1 / 2) + 0.3):((-pR2 / 2) + 0.3)) 0.5
		) 
		(_Dot 
			((((-((pPin / 2) - 1) * Pitch) / 2) - (pX / 2) - SilkGap - 0.25):(-pC / 2)) 0.5
		) 
		(_Layer lPkgGeoAsmT) 
		(_Rectangle pB pA)
		(_Dot 
			(((-pB / 2) + 0.5):((-pA / 2) + 0.5)) 0.8
		) 
		(xorg = (-dis / 2)) 
		for(PinCount 1 
			(pPin / 2) 
			(_Line 
				list((xorg:(-pA / 2)) 
					(xorg:((-pLavg / 2) + pTmax))
				) SilkWidth
			) 
			(_Line 
				list((xorg:((-pLavg / 2) + pTmax)) 
					(xorg:(-pLavg / 2))
				) pWmax
			)
			(_Line 
				list((xorg:(pA / 2)) 
					(xorg:((pLavg / 2) - pTmax))
				) SilkWidth
			) 
			(_Line 
				list((xorg:((pLavg / 2) - pTmax)) 
					(xorg:(pLavg / 2))
				) pWmax
			) 
			(xorg = (xorg + Pitch))
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((-(pC + pY) / 2) - SilkGap - (tSilkHeight / 2) - (SilkWidth / 2)))
		)
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(SON 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPin = nth(2 aTb)) 
		(pAmin = nth(3 aTb))
		(pAmax = nth(4 aTb)) 
		(pAvg = ((pAmin + pAmax) / 2.0)) 
		(pTmin = nth(5 aTb)) 
		(pTmax = nth(6 aTb)) 
		(pWmin = nth(7 aTb))
		(pWmax = nth(8 aTb)) 
		(pT2min = nth(9 aTb)) 
		(pT2max = nth(10 aTb)) 
		(pW2min = nth(11 aTb)) 
		(pW2max = nth(12 aTb))
		(pB = nth(13 aTb)) 
		(pH = nth(14 aTb)) 
		(Pitch = nth(15 aTb)) 
		(_Protrusion_calc LeadlessCastellated) 
		(pX = (pTmax + Heel + Toe))
		(pY = (pWmax + (Side * 2))) 
		if(((Pitch - pY) < Pin2Pin) 
			(pY = (Pitch - Pin2Pin))
		) 
		(pC = ((pAvg + (2 * Toe)) - pX)) 
		if(((pC - pX - (Pin2Pin * 2)) < pW2max) 
			(pC = (pW2max + pX + (Pin2Pin * 2)))
		) 
		(_PrepareNewSym pName)
		(_PadName = (_PadSMFillet pX pY)) 
		(_PinArray _PadName 1 
			(pPin / 2) 0
			Pitch 
			((-pC / 2):((((pPin / 2) - 1) * Pitch) / 2)) t nil
		) 
		(_PinArray _PadName 1 
			(pPin / 2) 0
			Pitch 
			((pC / 2):((-((pPin / 2) - 1) * Pitch) / 2)) t t t
			t t 
			(pPin / 2)
		) 
		(_Layer lEtchT) 
		(_ShapeRectangle pW2max pT2max 
			(0:0) 0.1
		)
		(_Layer lPkgGeoSmT) 
		(_ShapeRectangle 
			(pW2max + solder_mask_offset) 
			(pT2max + solder_mask_offset) 
			(0:0) 0.1
		) 
		(_Layer lPkgGeoPmT) 
		(_ShapeCircleArray pW2max pT2max 
			(0:0) 1
		) 
		(_Layer lPkgGeoPlaceT)
		(_BoundHeight 
			(_ShapeRectangle 
				(pC + pX + (Courtyard * 2)) 
				(pB + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pAmax pB) pH "SON"
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle pAvg pB)
			if((asm == 0) 
				(_Dot 
					(((-pAvg / 2) - SilkWidth - 0.25):(((((pPin / 2) - 1) * Pitch) / 2) + (pY / 2) + SilkGap + 0.25)) 0.5
				) 
				(_Dot 
					(((-pAvg / 2) + SilkWidth + 0.25):((pB / 2) - 0.25 - SilkWidth)) 0.5
				)
			)
		) 
		(_CrossCenter)
		(_CreateRefValue pName 
			(0:((-pB / 2) - (tSilkHeight / 2) - SilkWidth))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(SOJ 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPin = nth(2 aTb)) 
		(pLmin = nth(3 aTb))
		(pLmax = nth(4 aTb)) 
		(pLavg = ((pLmax + pLmin) / 2)) 
		(pTmin = nth(5 aTb)) 
		(pTmax = nth(6 aTb)) 
		(pWmin = nth(7 aTb))
		(pWmax = nth(8 aTb)) 
		(pA = nth(9 aTb)) 
		(pB = nth(10 aTb)) 
		(pH = nth(11 aTb)) 
		(Pitch = nth(12 aTb))
		(_Protrusion_calc JLead) 
		(pX = (pTmax + Heel + Toe)) 
		(pY = (pWmax + (Side * 2))) 
		(pS = (pLmax - (pTmax * 2))) 
		(pC = ((pS - (Toe * 2)) + pX))
		if(((Pitch - pY) < Pin2Pin) 
			(pY = (Pitch - Pin2Pin))
		) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSM pX pY)) 
		(_PinArray _PadName 1 
			(pPin / 2) 0
			Pitch 
			((-pC / 2):((((pPin / 2) - 1) * Pitch) / 2)) t nil
		) 
		(_PinArray _PadName 1 
			(pPin / 2) 0
			Pitch 
			((pC / 2):((-((pPin / 2) - 1) * Pitch) / 2)) t t t
			t t 
			(pPin / 2)
		)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pC + pX + (Courtyard * 2)) 
				(pB + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pLmax pB) pH "SOJ"
		) 
		(p1 = (_PolyCreate 
				(_ShapeRectangle pA pB)
			))
		(p2 = (_PolyCreate 
				(_ShapeCircle 0.75 lPkgGeoAsmT 
					(0:(pB / 2))
				)
			)) 
		(polys = (axlPolyOperation p1 p2 
				'ANDNOT
			)) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_CreateObjPath 
				(axlDBCreateShape 
					car(polys) t
				)
			)
			if((asm == 0) 
				(_Dot 
					(((-pA / 2) - SilkWidth - 0.25):(((((pPin / 2) - 1) * Pitch) / 2) + SilkGap + (pY / 2) + 0.25)) 0.5
				)
			) 
			if((asm == 1) then 
				for(i 1 
					(pPin / 2) 
					(y = (((((pPin / 2) - 1) * Pitch) / 2) - ((i - 1) * Pitch))) 
					(_Line 
						list((((-pLmax / 2) + (pTmax / 4)):y) 
							(((-pLavg / 2) + (pTmax / 2)):y)
						) pWmax
					)
					(_Line 
						list((((pLmax / 2) - (pTmax / 4)):y) 
							(((pLavg / 2) - (pTmax / 2)):y)
						) pWmax
					)
				)
			)
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((pB / 2) + (tSilkHeight / 2) + SilkWidth))
		)
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(QFP 
		(aTb \@optional PinCenter) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPA = nth(2 aTb)) 
		(pPB = nth(3 aTb))
		(pL1min = nth(4 aTb)) 
		(pL1max = nth(5 aTb)) 
		(pL1avg = ((pL1min + pL1max) / 2)) 
		(pL2min = nth(6 aTb)) 
		(pL2max = nth(7 aTb))
		(pL2avg = ((pL2min + pL2max) / 2)) 
		(pTmin = nth(8 aTb)) 
		(pTmax = nth(9 aTb)) 
		(pWmin = nth(10 aTb)) 
		(pWmax = nth(11 aTb))
		(pA = nth(12 aTb)) 
		(pB = nth(13 aTb)) 
		(pH = nth(14 aTb)) 
		(Pitch = nth(15 aTb)) 
		(_Protrusion_calc RibbonLead)
		(Heel = (Heel + 0.1)) 
		(Toe = (Toe + 0.1)) 
		(pY = (pWmax + (Side * 2))) 
		if(((Pitch - pY) < Pin2Pin) 
			(pY = (Pitch - Pin2Pin))
		) 
		(pX = (pTmax + Heel + Toe))
		(pC1 = ((pL1avg + (Toe * 2)) - pX)) 
		(pC2 = ((pL2avg + (Toe * 2)) - pX)) 
		(pV1 = (pC1 + pX + (Courtyard * 2))) 
		(pV2 = (pC2 + pX + (Courtyard * 2))) 
		(pR1 = (pC1 - pX - (SilkGap * 2) - SilkWidth))
		(pR2 = (pC2 - pX - (SilkGap * 2) - SilkWidth)) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSM pX pY)) 
		(_Layer lPkgGeoAsmT) 
		(poffset = ((pPB - 1) / 2))
		if(!PinCenter then 
			(_PinArray _PadName 1 pPB Pitch
				Pitch 
				((-pC1 / 2):(((pPB - 1) * Pitch) / 2)) t nil t
				t t 0
			) 
			(_PinArray _PadName 1 pPB Pitch
				Pitch 
				((pC1 / 2):(-((pPB - 1) * Pitch) / 2)) t t t
				t t 
				(pPB + pPA)
			) 
			(_PinArray _PadName pPA 1 Pitch
				Pitch 
				((((pPA - 1) * Pitch) / 2):(pC2 / 2)) nil t t
				t t 
				((pPB * 2) + pPA) 90 90
			)
			(_PinArray _PadName pPA 1 Pitch
				Pitch 
				((-((pPA - 1) * Pitch) / 2):(-pC2 / 2)) t t t
				t t pPB 90 90
			) else 
			(_PinArray _PadName 1 poffset Pitch
				Pitch 
				((-pC1 / 2):(((pPB - 1) * Pitch) / 2)) t nil t
				t t 
				(((pPA * 2) + (pPB * 2)) - poffset)
			) 
			(_PinArray _PadName 1 
				(pPB - poffset) Pitch
				Pitch 
				((-pC1 / 2):0) t nil t
				t t 0
			) 
			(_PinArray _PadName 1 pPB Pitch
				Pitch 
				((pC1 / 2):(-((pPB - 1) * Pitch) / 2)) t t t
				t t 
				((pPB + pPA) - poffset)
			)
			(_PinArray _PadName pPA 1 Pitch
				Pitch 
				((((pPA - 1) * Pitch) / 2):(pC2 / 2)) nil t t
				t t 
				(((pPB * 2) + pPA) - poffset) 90 90
			) 
			(_PinArray _PadName pPA 1 Pitch
				Pitch 
				((-((pPA - 1) * Pitch) / 2):(-pC2 / 2)) t t t
				t t 
				(pPB - poffset) 90 90
			)
		) 
		for(pcnt 1 pPB 
			(pos = ((((pPB - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
			(_Line 
				list(((-pL1avg / 2):pos) 
					(((-pL1avg / 2) + pTmax):pos)
				) pWmax
			)
			(_Line 
				list((((-pL1avg / 2) + pTmax):pos) 
					((-pR1 / 2):pos)
				)
			) 
			(_Line 
				list(((pL1avg / 2):-pos) 
					(((pL1avg / 2) - pTmax):-pos)
				) pWmax
			) 
			(_Line 
				list((((pL1avg / 2) - pTmax):-pos) 
					((pR1 / 2):-pos)
				)
			)
		) 
		for(pcnt 1 pPA 
			(pos = ((((pPA - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
			(_Line 
				list((pos:(pL2avg / 2)) 
					(pos:((pL2avg / 2) - pTmax))
				) pWmax
			)
			(_Line 
				list((pos:((pL2avg / 2) - pTmax)) 
					(pos:(pR2 / 2))
				)
			) 
			(_Line 
				list((-pos:(-pL2avg / 2)) 
					(-pos:((-pL2avg / 2) + pTmax))
				) pWmax
			) 
			(_Line 
				list((-pos:((-pL2avg / 2) + pTmax)) 
					(-pos:(-pR2 / 2))
				)
			)
		) 
		(_Layer lPkgGeoPlaceT) 
		(p1 = (_PolyCreate 
				(_ShapeRectangle pA pB)
			))
		(p2 = (_PolyCreate 
				(_ShapeRectangle 
					(((pPA - 1) * Pitch) + pWmax) 
					(pC2 + pX)
				)
			)) 
		(p3 = (_PolyCreate 
				(_ShapeRectangle 
					(pC1 + pX) 
					(((pPB - 1) * Pitch) + pWmax)
				)
			)) 
		(polys = (_PolyOp 
				list(p1 p2 p3) 
				'OR
			)) 
		(polyBound = (axlPolyExpand polys Courtyard 
				'NONE
			)) 
		foreach(poly polyBound 
			(_BoundHeight 
				(axlDBCreateShape poly t) pH
			)
		)
		(_Layer lPkgGeoDfaT) 
		(p1 = (_PolyCreate 
				(_ShapeRectangle pA pB)
			)) 
		(p2 = (_PolyCreate 
				(_ShapeRectangle 
					(((pPA - 1) * Pitch) + pWmax) pL2max
				)
			)) 
		(p3 = (_PolyCreate 
				(_ShapeRectangle pL1max 
					(((pPB - 1) * Pitch) + pWmax)
				)
			)) 
		(polys = (_PolyOp 
				list(p1 p2 p3) 
				'OR
			))
		sprintf(cdfa "QFP_%d" 
			fix((Pitch * 100.0))
		) 
		foreach(poly polys 
			(_BoundHeight 
				(axlDBCreateShape poly t) pH cdfa
			)
		) 
		(_Layer lPkgGeoSilkT) 
		(_Rectangle pR1 pR2) 
		case(PinCenter 
			(nil 
			(_Dot 
				(((-pR1 / 2) + 0.8):((pR2 / 2) - 0.8)) 0.8
			) 
			(_Dot 
				((-pC1 / 2):((((pPB - 1) * Pitch) / 2) + (pY / 2) + SilkGap + 0.25)) 0.5
			) 
			(oY1 = (((pPB - 1) * Pitch) / 2)) 
			(nY1 = fix((pPB / 10)))
			(mY1 = (10 - mod(pPB 10))) 
			(oX1 = (((-(pPA - 1) * Pitch) / 2) + ((mY1 - 1) * Pitch))) 
			(nX1 = fix(((pPA - mY1) / 10))) 
			(mX1 = (10 - mod((pPA + pPB) 10))) 
			(oY2 = (((-(pPB - 1) * Pitch) / 2) + ((mX1 - 1) * Pitch)))
			(nY2 = fix(((pPB - mX1) / 10))) 
			(mY2 = (10 - mod(((pPA * 2) + pPB) 10))) 
			(oX2 = ((((pPA - 1) * Pitch) / 2) - ((mY2 - 1) * Pitch))) 
			(nX2 = fix(((pPA - mY2) / 10))) 
			for(mm 0 nY1 
				(_Dot 
					(((-(pC1 + pX) / 2) - SilkGap - 0.2):oY1) 0.4
				) 
				(oY1 = (oY1 - (Pitch * 10)))
				if((mm == 0) 
					(oY1 = (oY1 + Pitch))
				)
			)
			for(mm 0 nX1 
				(_Dot 
					(oX1:((-(pC2 + pX) / 2) - SilkGap - 0.2)) 0.4
				) 
				(oX1 = (oX1 + (Pitch * 10)))
			) 
			for(mm 0 nY2 
				(_Dot 
					((((pC1 + pX) / 2) + SilkGap + 0.2):oY2) 0.4
				) 
				(oY2 = (oY2 + (Pitch * 10)))
			) 
			for(mm 0 nX2 
				(_Dot 
					(oX2:(((pC2 + pX) / 2) + SilkGap + 0.2)) 0.4
				) 
				(oX2 = (oX2 - (Pitch * 10)))
			)
			) 
			(t 
				(_Dot 
					(((-pR1 / 2) + 0.8):0) 0.8
				) 
				(_Dot 
					(((-pC2 / 2) - (pX / 2) - SilkGap - 0.25):0) 0.5
				)
			)
		)
		(_Layer lPkgGeoAsmT) 
		(_Rectangle pR1 pR2) 
		if(PinCenter 
			(_Dot 
				(((-pR1 / 2) + 0.8):0) 0.8
			) 
			(_Dot 
				(((-pR1 / 2) + 0.8):((pR2 / 2) - 0.8)) 0.8
			)
		) 
		(_CrossCenter) 
		(_CornerRectangle pC1 pC2)
		(_CreateRefValue pName 
			(0:(((pC2 + pX) / 2) + SilkGap + (tSilkHeight / 2) + (SilkWidth / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(QFPBumped 
		(aTb \@optional PinCenter) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPin = (nth(2 aTb) / 4)) 
		(Pitch = nth(3 aTb))
		(pLmin = nth(4 aTb)) 
		(pLmax = nth(5 aTb)) 
		(pLavg = ((pLmin + pLmax) / 2)) 
		(pWmin = nth(6 aTb)) 
		(pWmax = nth(7 aTb))
		(pTmin = nth(8 aTb)) 
		(pTmax = nth(9 aTb)) 
		(pA = nth(10 aTb)) 
		(pH = nth(11 aTb)) 
		(_Protrusion_calc RibbonLead)
		(Heel = (Heel + 0.1)) 
		(Toe = (Toe + 0.1)) 
		(pY = (pWmax + (Side * 2))) 
		(pX = (pTmax + Heel + Toe)) 
		(pC = ((pLavg + (Toe * 2)) - pX))
		(pV = (pC + pX + (Courtyard * 2))) 
		(pR = (pC - pX - (SilkGap * 2) - SilkWidth)) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSM pX pY)) 
		(_Layer lPkgGeoAsmT)
		(poffset = ((pPin - 1) / 2)) 
		if(!PinCenter then 
			(_PinArray _PadName 1 pPin Pitch
				Pitch 
				((-pC / 2):(((pPin - 1) * Pitch) / 2)) t nil t
				t t 0
			) 
			(_PinArray _PadName 1 pPin Pitch
				Pitch 
				((pC / 2):(-((pPin - 1) * Pitch) / 2)) t t t
				t t 
				(pPin * 2)
			) 
			(_PinArray _PadName pPin 1 Pitch
				Pitch 
				((((pPin - 1) * Pitch) / 2):(pC / 2)) nil t t
				t t 
				(pPin * 3) 90 90
			)
			(_PinArray _PadName pPin 1 Pitch
				Pitch 
				((-((pPin - 1) * Pitch) / 2):(-pC / 2)) t t t
				t t pPin 90 90
			) else 
			(_PinArray _PadName 1 poffset Pitch
				Pitch 
				((-pC / 2):(((pPin - 1) * Pitch) / 2)) t nil t
				t t 
				((pPin * 4) - poffset)
			) 
			(_PinArray _PadName 1 
				(pPin - poffset) Pitch
				Pitch 
				((-pC / 2):0) t nil t
				t t 0
			) 
			(_PinArray _PadName 1 pPin Pitch
				Pitch 
				((pC / 2):(-((pPin - 1) * Pitch) / 2)) t t t
				t t 
				((pPin * 2) - poffset)
			)
			(_PinArray _PadName pPin 1 Pitch
				Pitch 
				((((pPin - 1) * Pitch) / 2):(pC / 2)) nil t t
				t t 
				((pPin * 3) - poffset) 90 90
			) 
			(_PinArray _PadName pPin 1 Pitch
				Pitch 
				((-((pPin - 1) * Pitch) / 2):(-pC / 2)) t t t
				t t 
				(pPin - poffset) 90 90
			)
		) 
		for(pcnt 1 pPin 
			(y = ((((pPin - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
			(_Line 
				list(((-pLavg / 2):y) 
					(((-pLavg / 2) + pTmax):y)
				) pWmax
			)
			(_Line 
				list((((-pLavg / 2) + pTmax):y) 
					((-pR / 2):y)
				)
			) 
			(_Line 
				list(((pLavg / 2):-y) 
					(((pLavg / 2) - pTmax):-y)
				) pWmax
			) 
			(_Line 
				list((((pLavg / 2) - pTmax):-y) 
					((pR / 2):-y)
				)
			)
		) 
		for(pcnt 1 pPin 
			(x = ((((pPin - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
			(_Line 
				list((x:(pLavg / 2)) 
					(x:((pLavg / 2) - pTmax))
				) pWmax
			)
			(_Line 
				list((x:((pLavg / 2) - pTmax)) 
					(x:(pR / 2))
				)
			) 
			(_Line 
				list((-x:(-pLavg / 2)) 
					(-x:((-pLavg / 2) + pTmax))
				) pWmax
			) 
			(_Line 
				list((-x:((-pLavg / 2) + pTmax)) 
					(-x:(-pR / 2))
				)
			)
		) 
		(_Layer lPkgGeoPlaceT)
		(_BoundHeight 
			(_ShapeRectangle pV pV) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pLmax pLmax) pH "BUMPER_QFP"
		) 
		(_Layer lPkgGeoSilkT) 
		(p1 = (_PolyCreate 
				(_ShapeRectangle pR pR)
			))
		(w = ((pR - (pPin * Pitch)) / (2 * 1.414))) 
		(d = (w / (1.414 * 2))) 
		(s2 = caar((axlDBCreateLine 
					list((((-pLavg / 2) + d):((-pLavg / 2) + d)) 
						(((pLavg / 2) - d):((pLavg / 2) - d))
					) w
				)
			)) 
		(p2 = (axlPolyFromDB s2 ?endCapType 
				'ROUND
			)) 
		(axlDeleteObject s2)
		(s3 = caar((axlDBCreateLine 
					list((((pLavg / 2) - d):((-pLavg / 2) + d)) 
						(((-pLavg / 2) + d):((pLavg / 2) - d))
					) w
				)
			)) 
		(p3 = (axlPolyFromDB s3 ?endCapType 
				'ROUND
			)) 
		(axlDeleteObject s3) 
		(polys = (_PolyOp 
				list(p1 p2 p3) 
				'OR
			)) 
		foreach(poly polys 
			(_CreateObjPath 
				(axlDBCreateShape poly t)
			)
		)
		case(PinCenter 
			(nil 
			(_Dot 
				(((-pR / 2) + 0.8):((pR / 2) - 0.8)) 0.8
			) 
			(_Dot 
				((-pC / 2):((((pPin - 1) * Pitch) / 2) + (pY / 2) + SilkGap + 0.25)) 0.5
			)
			) 
			(t 
				(_Dot 
					(((-pR / 2) + 0.8):0) 0.8
				) 
				(_Dot 
					(((-pC / 2) - (pX / 2) - SilkGap - 0.25):0) 0.5
				)
			)
		) 
		(_Layer lPkgGeoAsmT) 
		foreach(poly polys 
			(_CreateObjPath 
				(axlDBCreateShape poly t)
			)
		) 
		if(PinCenter 
			(_Dot 
				(((-pR / 2) + 0.8):0) 0.8
			) 
			(_Dot 
				(((-pR / 2) + 0.8):((pR / 2) - 0.8)) 0.8
			)
		) 
		(_CrossCenter)
		(_CornerRectangle pC pC) 
		(_CreateRefValue pName 
			(0:(((pC + pX) / 2) + SilkGap + (tSilkHeight / 2) + (SilkWidth / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(ShapeFileKeyOval 
		(A B W g \@optional
			down
		) 
		sprintf(sN "KO%.fX%.fW%.fg%.f" 
			(A * 100) 
			(B * 100) 
			(W * 100)
			(g * 100)
		) 
		if(down 
			(sN = strcat(sN "d")) 
			(sN = strcat(sN "u"))
		) 
		(_FlushShape)
		(_Layer lPkgGeoAsmT) 
		(pitch = (W + g)) 
		(x = (((A - B) / 2) - (g / 2))) 
		(y = 0) 
		(step = floor((B / (pitch * 4))))
		(path = (axlPathStart 
				list((-x:0))
			)) 
		(axlPathLine path W 
			(x:0)
		) 
		for(i 0 step 
			if((((y * 2) + W) <= B) then 
				(y = (y + (pitch * 2))) 
				(axlPathArcCenter path W 
					(x:y) nil
					(x:pitch)
				) 
				(axlPathLine path W 
					(-x:y)
				)
				(shapeOffsetY = y) 
				if((((y * 2) + pitch) <= B) then 
					(axlPathArcCenter path W 
						(-x:-y) nil
						(-x:0)
					) 
					(axlPathLine path W 
						(x:-y)
					) else
					(y = (y + (pitch * 2))) 
					(shapeOffsetY = -shapeOffsetY) 
					(i = (step + 1))
				)
			)
		) 
		(antis = caar((axlDBCreatePath path))) 
		if(down 
			(axlTransformObject antis ?move 
				(0:(-pitch / 2))
			) 
			(axlTransformObject antis ?angle 180 ?origin
				(0:(pitch / 4))
			)
		)
		(poly = (axlPolyFromDB antis ?endCapType 
				'ROUND
			)) 
		(axlSetFindFilter ?enabled 
			list('ALL 
				'ALL
			) ?onButtons 
			list('ALL 
				'ALL
			)
		) 
		(axlClearSelSet) 
		(axlAddSelectAll) 
		(axlDeleteObject 
			(axlGetSelSet)
		)
		(_Layer lEtchT) 
		(sid = (axlDBCreateShape 
				car(poly) t
			)) 
		(shapeOffsetY = (shapeOffsetY + (pitch / 2))) 
		if(down 
			(axlTransformObject sid ?move 
				(0:shapeOffsetY)
			) 
			(axlTransformObject sid ?move 
				(0:-shapeOffsetY)
			)
		) 
		(_SaveDesignShape sN)
		sN
	)

defun(ShapeFileKeyRectangle 
		(A B W g \@optional
			down
		) 
		sprintf(sN "KR%.fX%.fW%.fg%.f" 
			(A * 100) 
			(B * 100) 
			(W * 100)
			(g * 100)
		) 
		if(down 
			(sN = strcat(sN "d")) 
			(sN = strcat(sN "u"))
		) 
		(_FlushShape)
		(_Layer lPkgGeoAsmT) 
		(s1 = (_ShapeRectangle A B 
				(0:0) 
				(g / 2)
			)) 
		(p1 = (axlPolyFromDB 
				car(s1)
			)) 
		(axlDeleteObject 
			car(s1)
		) 
		(pitch = (W + g))
		(step = floor(((A - g - (W * 2)) / pitch))) 
		if((mod(step 2) == 1) then 
			(odd = t) 
			(step = (step - 1)) else
			(odd = nil)
		) 
		(step = (step / 2)) 
		(x0 = (-step * pitch)) 
		if(odd 
			(x0 = (x0 - (pitch / 2)))
		)
		(y = ((B / 2) - W - g)) 
		(x = x0) 
		(path = (axlPathStart 
				list((x:(-B / 2)))
			)) 
		for(i 1 step 
			(axlPathLine path g 
				(x:y)
			) 
			(axlPathArcCenter path g 
				((x + (g / 2)):(y + (g / 2))) t
				((x + (g / 2)):y)
			)
			(axlPathLine path g 
				(((x + pitch) - (g / 2)):(y + (g / 2)))
			) 
			(axlPathArcCenter path g 
				((x + pitch):y) t
				(((x + pitch) - (g / 2)):y)
			) 
			(axlPathLine path g 
				((x + pitch):-y)
			) 
			(x = (x + pitch)) 
			(axlPathArcCenter path g 
				((x + (g / 2)):(-y - (g / 2))) nil
				((x + (g / 2)):-y)
			)
			(axlPathLine path g 
				(((x + pitch) - (g / 2)):(-y - (g / 2)))
			) 
			(axlPathArcCenter path g 
				((x + pitch):-y) nil
				(((x + pitch) - (g / 2)):-y)
			) 
			(x = (x + pitch))
		) 
		if(odd then 
			(axlPathLine path g 
				(x:y)
			) 
			(axlPathArcCenter path g 
				((x + (g / 2)):(y + (g / 2))) t
				((x + (g / 2)):y)
			) 
			(axlPathLine path g 
				(((x + pitch) - (g / 2)):(y + (g / 2)))
			)
			(axlPathArcCenter path g 
				((x + pitch):y) t
				(((x + pitch) - (g / 2)):y)
			) 
			(axlPathLine path g 
				((x + pitch):(-B / 2))
			) else 
			(axlPathLine path g 
				(x:(B / 2))
			)
		)
		(c = caar((axlDBCreatePath path))) 
		(p2 = (axlPolyFromDB c ?endCapType 
				'ROUND
			)) 
		(axlDeleteObject c) 
		(p = (axlPolyOperation p1 p2 
				'ANDNOT
			)) 
		if(down 
			(s = car(p)) 
			(s = cadr(p))
		)
		(_Layer lEtchT) 
		(ks = (axlDBCreateShape s t)) 
		if(down 
			(axlTransformObject ks ?move 
				(0:((B / 2) - (W / 2)))
			) 
			(axlTransformObject ks ?move 
				(0:((-B / 2) + (W / 2)))
			)
		) 
		(_SaveDesignShape sN) sN
	)

defun(ShapeFileKeyElliptical 
		(D W g \@optional down) 
		sprintf(sN "KE%.fW%.fg%.f" 
			(D * 100) 
			(W * 100) 
			(g * 100)
		) 
		if(down 
			(sN = strcat(sN "d")) 
			(sN = strcat(sN "u"))
		) 
		(ExistFile = strcat(sN ".ssm"))
		if(isFile(ExistFile) then sN else 
			(_FlushShape)
			(pitch = (W + g)) 
			(r = ((D / 2) - W - (g / 2))) 
			(R = (r - (pitch / 2))) 
			(step = (floor((((D / 2) - (pitch / 2) - W) / pitch)) + 1)) 
			(_Layer lPkgGeoAsmT)
			(s11 = (_ShapeCircle 
					(D / 2)
				)) 
			(p11 = (axlPolyFromDB 
					car(s11)
				)) 
			(x = (pitch / 2)) 
			(antiEtchPoly = nil) 
			if((((R * R) - (x * x)) >= 0) then 
				(y = (r - (pitch / 2))) 
				(y0 = sqrt(((R * R) - (x * x)))) 
				(path1 = (axlPathArcCenter 
						(axlPathStart 
							list((0:r))
						) g 
						(x:y) t
						(0:y)
					))
				(axlPathLine path1 g 
					(x:-y0)
				) 
				(path2 = (axlPathArcCenter 
						(axlPathStart 
							list((0:r))
						) g 
						(-x:y) nil
						(0:y)
					)) 
				(axlPathLine path2 g 
					(-x:-y0)
				) 
				(xe = x) 
				(ye = -y0)
				(up = 1) 
				(keepgo = t) 
				for(i 0 step 
					if(keepgo then 
						if((up > 0) 
							(dir = nil) 
							(dir = t)
						) 
						(x = (x + pitch)) 
						(y = y0)
						(x0 = (x - (pitch / 2))) 
						(yy = ((R * R) - ((x0 + pitch) * (x0 + pitch)))) 
						(axlPathArcCenter path1 g 
							(x:-(up * y)) dir
							(x0:-(up * y))
						) 
						(axlPathArcCenter path2 g 
							(-x:-(up * y)) 
							!dir
							(-x0:-(up * y))
						) 
						if((yy > 0) then 
							(y0 = sqrt(yy)) 
							(xe = x) 
							(ye = y0)
							(axlPathLine path1 g 
								(x:(up * y0))
							) 
							(axlPathLine path2 g 
								(-x:(up * y0))
							) else 
							(xe = x) 
							(ye = (up * y))
							(axlPathLine path1 g 
								(x:(up * y))
							) 
							(axlPathLine path2 g 
								(-x:(up * y))
							) 
							(keepgo = nil)
						)
						(up = -up)
					)
				) 
				(y = ((D / 2) * (ye / xe))) 
				(axlPathLine path1 g 
					((D / 2):y)
				)
				(axlPathLine path2 g 
					((-D / 2):y)
				) 
				(antis = caar((axlDBCreatePath path1))) 
				(aa = (axlPolyFromDB antis ?endCapType 
						'ROUND
					)) 
				(antis = caar((axlDBCreatePath path2))) 
				(bb = (axlPolyFromDB antis ?endCapType 
						'ROUND
					))
				(antiEtchPoly = (axlPolyOperation aa bb 
						'OR
					)) else 
				(c = caar((_Line 
							list(((-D / 2):0) 
								((D / 2):0)
							) g
						)
					)) 
				(antiEtchPoly = (axlPolyFromDB c ?endCapType 
						'ROUND
					))
			)
			(poly = (axlPolyOperation p11 antiEtchPoly 
					'ANDNOT
				)) 
			(axlSetFindFilter ?enabled 
				list('ALL 
					'ALL
				) ?onButtons 
				list('ALL 
					'ALL
				)
			) 
			(axlAddSelectAll) 
			(axlDeleteObject 
				(axlGetSelSet)
			) 
			(_Layer lEtchT)
			if(down then 
				(y = ((D / 2) - (W / 2))) 
				(y0 = ((-D / 2) + (W / 4))) else
				(y = ((-D / 2) + (W / 2))) 
				(y0 = ((D / 2) - (W / 4)))
			) 
			(success = nil) 
			(keepgo = t) 
			foreach(onepoly poly 
				if(keepgo then 
					if((axlIsPointInsideBox 
							(0:y0) 
							(onepoly->bBox)
						) then 
						(success = t) 
						(shapeid = (axlDBCreateShape onepoly t)) 
						(axlTransformObject shapeid ?move 
							(0:y)
						)
						(keepgo = nil)
					)
				)
			) 
			(_SaveDesignShape sN)
			if(success then sN else nil)
		)
	)

defun(ShapeFileMELF 
		(x y cX cY) 
		sprintf(sfN "melfx%.fy%.fa%.fb%.f" 
			(x * 100) 
			(y * 100) 
			(cX * 100)
			(cY * 100)
		) 
		(_FlushShape) 
		(_Layer lEtchT)
		(so = (_ShapeRectangle x y 
				(0:0) FilletR
			)) 
		if((cX != 0.0) then 
			(po = (_PolyCreate so)) 
			(pi = (_PolyCreate 
					(_ShapeRectangle cX cY 
						(((-x / 2) + (cX / 2)):0)
					)
				)) 
			(poly = (axlPolyOperation po pi 
					'ANDNOT
				))
			(axlDBCreateShape 
				car(poly) t
			)
		) 
		(_SaveDesignShape sfN) sfN
	)

defun(Shape223 
		(cp1 xy1 cp2 xy2) 
		(shapeid = nil) 
		(r = 0.1) 
		(s1 = (_ShapeRectangle 
				(xCoord xy1) 
				(yCoord xy1) cp1 r
			))
		(poly1 = (_PolyCreate s1)) 
		(s2 = (_ShapeRectangle 
				(xCoord xy2) 
				(yCoord xy2) cp2 r
			)) 
		(poly2 = (_PolyCreate s2)) 
		(p1 = (((xCoord cp1) + 
					((xCoord xy1) / 2)):
				(((yCoord cp1) + 
						((yCoord xy1) / 2)) - r))) 
		(p2 = (((xCoord p1) + r):
				((yCoord p1) + 
					(r * 4))))
		(p4 = (((xCoord cp2) + 
					((xCoord xy2) / 2)):
				(((yCoord cp2) - 
						((yCoord xy2) / 2)) + r))) 
		(p3 = (((xCoord p4) - r):
				((yCoord p4) - 
					(r * 4)))) 
		(p5 = (((xCoord cp2) - 
					((xCoord xy2) / 2)):
				(yCoord p4))) 
		(p6 = (((xCoord p5) + r):
				(yCoord p3))) 
		(p8 = (((xCoord cp1) - 
					((xCoord xy1) / 2)):
				(yCoord p1)))
		(p7 = (((xCoord p8) - r):
				(yCoord p2))) 
		(path = (axlPathStart 
				list(p8)
			)) 
		(axlPathLine path 0 p1) 
		(axlPathArcAngle path 0 p2 t
			30
		) 
		(axlPathLine path 0 p3)
		(axlPathArcAngle path 0 p4 nil
			30
		) 
		(axlPathLine path 0 p5) 
		(axlPathArcAngle path 0 p6 nil
			30
		) 
		(axlPathLine path 0 p7) 
		(axlPathArcAngle path 0 p8 t
			30
		)
		(s3 = (axlDBCreateShape path t)) 
		(poly3 = (_PolyCreate s3)) 
		(f_poly = (_PolyOp 
				list(poly1 poly2 poly3) 
				'OR
			)) 
		foreach(onepoly f_poly 
			(shapeid = (axlDBCreateShape onepoly t))
		) shapeid
	)

defun(QFN 
		(aTb) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pPA = nth(2 aTb)) 
		(pPB = nth(3 aTb))
		(pL1min = nth(4 aTb)) 
		(pL1max = nth(5 aTb)) 
		(pL1 = ((pL1min + pL1max) / 2.0)) 
		(pL2min = nth(6 aTb)) 
		(pL2max = nth(7 aTb))
		(pL2 = ((pL2min + pL2max) / 2.0)) 
		(pT1min = nth(8 aTb)) 
		(pT1max = nth(9 aTb)) 
		(pT1 = ((pT1min + pT1max) / 2.0)) 
		(pW1min = nth(10 aTb))
		(pW1max = nth(11 aTb)) 
		(pW1 = pW1max) 
		(pT2min = nth(12 aTb)) 
		(pT2max = nth(13 aTb)) 
		(pT2 = pT2max)
		(pW2min = nth(14 aTb)) 
		(pW2max = nth(15 aTb)) 
		(pW2 = pW2max) 
		(pH = nth(16 aTb)) 
		(Pitch = nth(17 aTb))
		(_Protrusion_calc LeadlessCastellated) 
		(pX1 = (pW1 + (Side * 2))) 
		if(((Pitch - pX1) < Pin2Pin) 
			(pX1 = (Pitch - Pin2Pin))
		) 
		(pY1 = (pT1 + Toe)) 
		(pC1 = ((pL1 + (Toe * 2)) - pY1))
		(pC2 = ((pL2 + (Toe * 2)) - pY1)) 
		(pV1 = (pL1 + (Courtyard * 2))) 
		(pV2 = (pL2 + (Courtyard * 2))) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet pX1 pY1))
		(totalp = ((pPA * 2) + (pPB * 2))) 
		(poffset = ((pPB - 1) / 2)) 
		(_PinArray _PadName 1 pPB 0
			Pitch 
			((-pC1 / 2):(((pPB - 1) * Pitch) / 2)) t nil t
			t t 0 90
		) 
		(_PinArray _PadName 1 pPB 0
			Pitch 
			((pC1 / 2):(-((pPB - 1) * Pitch) / 2)) t t t
			t t 
			(pPB + pPA) 90
		) 
		(_PinArray _PadName pPA 1 Pitch
			0 
			((((pPA - 1) * Pitch) / 2):(pC2 / 2)) nil t t
			t t 
			((pPB * 2) + pPA) 0 90
		)
		(_PinArray _PadName pPA 1 Pitch
			0 
			((-((pPA - 1) * Pitch) / 2):(-pC2 / 2)) t t t
			t t pPB 0 90
		) 
		(_Layer lPkgGeoAsmT) 
		for(pcnt 1 pPB 
			(y = ((((pPB - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
			(x1 = (((pL1 / 2) - (pW1 / 2)) + (SilkWidth / 2)))
			(x2 = (((pL1 / 2) - pT1) + (pW1 / 2))) 
			(_Line 
				list((-x1:y) 
					(-x2:y)
				) pW1
			) 
			(_Line 
				list((x1:-y) 
					(x2:-y)
				) pW1
			)
		) 
		for(pcnt 1 pPA 
			(x = ((((pPA - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
			(y1 = (((pL2 / 2) - (pW1 / 2)) + (SilkWidth / 2)))
			(y2 = (((pL2 / 2) - pT1) + (pW1 / 2))) 
			(_Line 
				list((x:y1) 
					(x:y2)
				) pW1
			) 
			(_Line 
				list((-x:-y1) 
					(-x:-y2)
				) pW1
			)
		) 
		(_Layer lEtchT)
		(_ShapeRectangle pW2 pT2) 
		(_Layer lPkgGeoSmT) 
		(_ShapeRectangle 
			(pW2 + solder_mask_offset) 
			(pT2 + solder_mask_offset)
		) 
		(_Layer lPkgGeoPmT) 
		(_ShapeCircleArray pW2 pT2 
			(0:0) 1
		)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle pV1 pV2) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pL1max pL2max) pH
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle pL1 pL2)
			if((asm == 1) then 
				(_Dot 
					(((-pL1 / 2) + 0.3):((pL2 / 2) - 0.3)) 0.5
				) else 
				(dy = (((pL2 - ((pPB - 1) * Pitch) - pW1) / 2) - SilkGap - (SilkWidth / 2)))
				(_Dot 
					(((-pL1 / 2) - 0.5):(((pL2 / 2) - dy) + 0.15)) 0.5
				)
			)
		)
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((pC2 / 2) + (pY1 / 2) + (pX1 / 2) + SilkWidth + (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(Concave2 
		(aTb \@optional flat) 
		(Toe = 0.45) 
		(Heel = 0.07) 
		(Side = 0.07)
		(Courtyard = 0.25) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(PinL = nth(2 aTb)) 
		(PinR = nth(3 aTb)) 
		(Pitch = nth(4 aTb))
		(pL1min = nth(5 aTb)) 
		(pL1max = nth(6 aTb)) 
		(pL1 = ((pL1min + pL1max) / 2)) 
		(pL2min = nth(7 aTb)) 
		(pL2max = nth(8 aTb))
		(pL2 = ((pL2min + pL2max) / 2)) 
		(pT = ((nth(9 aTb) + 
					nth(10 aTb)) / 2)) 
		(pW = ((nth(11 aTb) + 
					nth(12 aTb)) / 2)) 
		(pH = nth(13 aTb)) 
		(pX = (pT + Toe + Heel))
		(pC = ((pL1 + (Toe * 2)) - pX)) 
		(pY = (pW + (Side * 2))) 
		if(((Pitch - pY) < Pin2Pin) 
			(pY = (Pitch - Pin2Pin))
		) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet pX pY))
		(_PinArray _PadName 1 PinL 0
			Pitch 
			((-pC / 2):(((PinL - 1) * Pitch) / 2)) t nil
		) 
		(_PinArray _PadName 1 PinR 0
			Pitch 
			((pC / 2):((-(PinR - 1) * Pitch) / 2)) t t t
			t t PinL
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pL1 + (Toe * 2) + (Courtyard * 2)) 
				(pL2 + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT)
		(_BoundHeight 
			(_ShapeRectangle pL1max pL2max) pH "CONCAVE2"
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(polys = (_PolyCreate 
					(_ShapeRectangle pL1 pL2)
				))
			(r = (pW / 2)) 
			if(!flat then 
				for(pcnt 1 PinL 
					(y = ((((PinL - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
					(p2 = (_PolyCreate 
							(_ShapeCircle r nil 
								((-pL1 / 2):y)
							)
						))
					(polys = (axlPolyOperation polys p2 
							'ANDNOT
						))
				) 
				for(pcnt 1 PinR 
					(y = ((((PinR - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
					(p2 = (_PolyCreate 
							(_ShapeCircle r nil 
								((pL1 / 2):y)
							)
						))
					(polys = (axlPolyOperation polys p2 
							'ANDNOT
						))
				)
			) 
			foreach(poly polys 
				(_CreateObjPath 
					(axlDBCreateShape poly t)
				)
			) 
			if((PinL == PinR) 
				(_Dot 
					(((-pL1 / 2) - Toe - SilkGap - 0.25):(((PinL - 1) * Pitch) / 2)) 0.5
				)
			)
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((pL2 / 2) + (tSilkHeight / 2) + SilkWidth))
		) 
		(_SaveDesign pName)
		(_MakeDevice pName 2)
	)

defun(Concvex2 
		(aTb) 
		(Toe = 0.45) 
		(Heel = 0.07) 
		(Side = 0.07)
		(Courtyard = 0.25) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(PinL = nth(2 aTb)) 
		(PinR = nth(3 aTb)) 
		(Pitch = nth(4 aTb))
		(pL1min = nth(5 aTb)) 
		(pL1max = nth(6 aTb)) 
		(pL1 = ((pL1min + pL1max) / 2)) 
		(pL2min = nth(7 aTb)) 
		(pL2max = nth(8 aTb))
		(pL2 = ((pL2min + pL2max) / 2)) 
		(pT = ((nth(9 aTb) + 
					nth(10 aTb)) / 2)) 
		(pW = ((nth(11 aTb) + 
					nth(12 aTb)) / 2)) 
		(pH = nth(15 aTb)) 
		(pX = (pT + Toe + Heel))
		(pC = ((pL1 + (Toe * 2)) - pX)) 
		(pY = (pW + (Side * 2))) 
		if(((Pitch - pY) < Pin2Pin) 
			(pY = (Pitch - Pin2Pin))
		) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet pX pY))
		(_PinArray _PadName 1 PinL 0
			Pitch 
			((-pC / 2):(((PinL - 1) * Pitch) / 2)) t nil
		) 
		(_PinArray _PadName 1 PinR 0
			Pitch 
			((pC / 2):((-(PinR - 1) * Pitch) / 2)) t t t
			t t PinL
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pL1 + (Toe * 2) + (Courtyard * 2)) 
				(pL2 + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT)
		(_BoundHeight 
			(_ShapeRectangle pL1max pL2max) pH "CONCVEX2"
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle 
				(pL1 - pT) pL2
			)
			(y1 = (((PinL - 1) * Pitch) / 2)) 
			(y2 = (((PinR - 1) * Pitch) / 2)) 
			(_Line 
				list(((-pL1 / 2):y1) 
					((-pL1 / 2):(pL2 / 2)) 
					((pL1 / 2):(pL2 / 2)) 
					((pL1 / 2):y2)
				)
			) 
			(_Line 
				list(((-pL1 / 2):-y1) 
					((-pL1 / 2):(-pL2 / 2)) 
					((pL1 / 2):(-pL2 / 2)) 
					((pL1 / 2):-y2)
				)
			) 
			if((PinL == PinR) 
				(_Dot 
					(((-pL1 / 2) - Toe - SilkGap - 0.25):(((PinL - 1) * Pitch) / 2)) 0.5
				)
			)
			(r = ((pW - 0.2) / 2)) 
			for(pcnt 1 PinL 
				(y = ((((PinL - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
				(_Rectangle 
					(r / 2) pW 
					(((-pL1 / 2) + (r / 4)):y)
				)
			) 
			for(pcnt 1 PinR 
				(y = ((((PinR - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
				(_Rectangle 
					(r / 2) pW 
					(((pL1 / 2) - (r / 4)):y)
				)
			) 
			(_Dot 
				(((-pL1 / 2) - Toe - SilkGap - 0.25):(((PinL - 1) * Pitch) / 2)) 0.5
			)
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((pL2 / 2) + (tSilkHeight / 2) + SilkWidth))
		) 
		(_SaveDesign pName)
		(_MakeDevice pName 2)
	)

defun(Concave4 
		(aTb) 
		(Toe = 0.45) 
		(Heel = 0.07) 
		(Side = 0.07)
		(Courtyard = 0.25) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(PinUpDn = nth(2 aTb)) 
		(PinLR = nth(3 aTb)) 
		(Pitch = nth(4 aTb))
		(pL1 = ((nth(5 aTb) + 
					nth(6 aTb)) / 2)) 
		(pL2 = ((nth(7 aTb) + 
					nth(8 aTb)) / 2)) 
		(pT1 = ((nth(9 aTb) + 
					nth(10 aTb)) / 2)) 
		(pW1 = ((nth(11 aTb) + 
					nth(12 aTb)) / 2)) 
		(pT2 = ((nth(13 aTb) + 
					nth(14 aTb)) / 2))
		(pW2 = ((nth(15 aTb) + 
					nth(16 aTb)) / 2)) 
		(pH = nth(17 aTb)) 
		(pX1 = (pT1 + Toe + Heel)) 
		(pC1 = ((pL1 + (Toe * 2)) - pX1)) 
		(pY1 = (pW1 + (Side * 2)))
		(pY2 = (pT2 + Toe + Heel)) 
		(pC2 = ((pL2 + (Toe * 2)) - pY2)) 
		(pX2 = (pW2 + (Side * 2))) 
		if(((Pitch - pY1) < Pin2Pin) 
			(pY1 = (Pitch - Pin2Pin))
		) 
		(_PrepareNewSym pName)
		(PadN1 = (_PadSMFillet pX1 pY1)) 
		(PadN2 = (_PadSMFillet pX2 pY2)) 
		(_PinArray PadN1 1 PinLR 0
			Pitch 
			((-pC1 / 2):(((PinLR - 1) * Pitch) / 2)) t nil t
			t t PinUpDn
		) 
		(_PinArray PadN1 1 PinLR 0
			Pitch 
			((pC1 / 2):((-(PinLR - 1) * Pitch) / 2)) t t t
			t t 
			(PinLR + (PinUpDn * 2))
		) 
		(_PinArray PadN2 PinUpDn 1 Pitch
			0 
			((((PinUpDn - 1) * Pitch) / 2):(pC2 / 2)) nil
		)
		(_PinArray PadN2 PinUpDn 1 Pitch
			0 
			(((-(PinUpDn - 1) * Pitch) / 2):(-pC2 / 2)) t t t
			t t 
			(PinLR + PinUpDn)
		) 
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pL1 + (Toe * 2) + (Courtyard * 2)) 
				(pL2 + (Toe * 2) + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pL1 pL2) pH "CONCAVE4"
		)
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(polys = (_PolyCreate 
					(_ShapeRectangle pL1 pL2)
				))
			(r = (pW1 / 2)) 
			for(pcnt 1 PinLR 
				(y = ((((PinLR - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
				(p2 = (_PolyCreate 
						(_ShapeCircle r nil 
							((-pL1 / 2):y)
						)
					))
				(polys = (axlPolyOperation polys p2 
						'ANDNOT
					)) 
				(p2 = (_PolyCreate 
						(_ShapeCircle r nil 
							((pL1 / 2):y)
						)
					)) 
				(polys = (axlPolyOperation polys p2 
						'ANDNOT
					))
			) 
			(r = (pW2 / 2)) 
			for(pcnt 1 PinUpDn 
				(x = ((((PinUpDn - 1) * Pitch) / 2) - ((pcnt - 1) * Pitch))) 
				(p2 = (_PolyCreate 
						(_ShapeCircle r nil 
							(x:(pL2 / 2))
						)
					))
				(polys = (axlPolyOperation polys p2 
						'ANDNOT
					)) 
				(p2 = (_PolyCreate 
						(_ShapeCircle r nil 
							(x:(-pL2 / 2))
						)
					)) 
				(polys = (axlPolyOperation polys p2 
						'ANDNOT
					))
			) 
			foreach(poly polys 
				(_CreateObjPath 
					(axlDBCreateShape poly t)
				)
			)
			if((PinUpDn == PinLR) 
				(_Dot 
					(((-pL1 / 2) - Toe - SilkGap - 0.25):(((PinUpDn - 1) * Pitch) / 2)) 0.5
				)
			) 
			(_Dot 
				((((PinUpDn - 1) * Pitch) / 2):((pL2 / 2) + Toe + SilkGap + 0.25)) 0.5
			)
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((-(pC2 + pY2) / 2) - SilkGap - (tSilkHeight / 2) - (tSilkPhotowidth / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName 2)
	)

defun(OSCJ 
		(aTb) 
		case(fpmSMDlevel 
			(0 
				(Toe = 0.2) 
				(Heel = 0.8) 
				(Side = 0.2) 
				(Courtyard = 0.5)
			) 
			(1 
				(Toe = 0.0) 
				(Heel = 0.6) 
				(Side = 0.1) 
				(Courtyard = 0.25)
			) 
			(2 
				(Toe = 0.0) 
				(Heel = 0.4) 
				(Side = 0.05) 
				(Courtyard = 0.15)
			)
		) 
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(Pin = nth(2 aTb))
		(Pitch = nth(3 aTb)) 
		(pLnom = nth(4 aTb)) 
		(pLtol = nth(5 aTb)) 
		(pL = (pLnom + pLtol)) 
		(pTC = nth(6 aTb))
		(pWnom = nth(7 aTb)) 
		(pWtol = nth(8 aTb)) 
		(pW = (pWnom + pWtol)) 
		(pA = nth(9 aTb)) 
		(pB = nth(10 aTb))
		(pH = nth(11 aTb)) 
		(X = ((pL - pTC) + Toe + Heel)) 
		(Y = (pW + (Side * 2))) 
		(Cx = ((pL + (Heel * 2)) - X)) 
		if(((Pitch - Y) < Pin2Pin) 
			(Y = (Pitch - Pin2Pin))
		)
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet X Y)) 
		(_PinArray _PadName 1 
			(Pin / 2) 0
			Pitch 
			((-Cx / 2):((((Pin / 2) - 1) * Pitch) / 2)) t nil
		) 
		(_PinArray _PadName 1 
			(Pin / 2) 0
			Pitch 
			((Cx / 2):((-((Pin / 2) - 1) * Pitch) / 2)) t t t
			t t 2
		) 
		(_Layer lPkgGeoPlaceT)
		(_BoundHeight 
			(_ShapeRectangle 
				(pL + (Heel * 2) + (Courtyard * 2)) 
				(pB + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pL pB) pH "OSCJ"
		) 
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle pA pB)
			(_Dot 
				(((-pA / 2) - SilkGap - 0.25):(((((Pin / 2) - 1) * Pitch) / 2) + (Y / 2) + SilkGap + 0.25)) 0.5
			)
		) 
		(_CrossCenter)
		(_CreateRefValue pName 
			(0:((pB / 2) + SilkWidth + (tSilkHeight / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(OSCCC 
		(aTb) 
		(InrPy = 0.07) 
		(OtrPy = 0.25) 
		(Courtyard = 0.25)
		(pName = strcat(nth(1 aTb) fpmStrLevel)) 
		(pL1nom = nth(2 aTb)) 
		(pL1tol = nth(3 aTb)) 
		(pL1 = (pL1nom + pL1tol)) 
		(pL2nom = nth(4 aTb))
		(pL2tol = nth(5 aTb)) 
		(pL2 = (pL2nom + pL2tol)) 
		(pS1nom = nth(6 aTb)) 
		(pS1tol = nth(7 aTb)) 
		(pS1 = (pS1nom + pS1tol))
		(pS2nom = nth(8 aTb)) 
		(pS2tol = nth(9 aTb)) 
		(pS2 = (pS2nom + pS2tol)) 
		(pH = nth(10 aTb)) 
		(X = (((pL1 / 2) - (pS1 / 2)) + OtrPy + InrPy))
		(Y = (((pL2 / 2) - (pS2 / 2)) + OtrPy + InrPy)) 
		(Cx = ((pL1 + (OtrPy * 2)) - X)) 
		(Cy = ((pL2 + (OtrPy * 2)) - Y)) 
		(_PrepareNewSym pName) 
		(_PadName = (_PadSMFillet X Y))
;		(_PinArray _PadName 2 2 Cx Cy ((-Cx / 2):(Cy / 2)) t nil nil) 
		(_CreatePin _PadName ((-Cx / 2):(Cy / 2)) 1)
		(_CreatePin _PadName ((-Cx / 2):(-Cy / 2)) 2)
		(_CreatePin _PadName ((Cx / 2):(-Cy / 2)) 3)
		(_CreatePin _PadName ((Cx / 2):(Cy / 2)) 4)
		(_Layer lPkgGeoPlaceT) 
		(_BoundHeight 
			(_ShapeRectangle 
				(pL1 + (OtrPy * 2) + (Courtyard * 2)) 
				(pL2 + (OtrPy * 2) + (Courtyard * 2))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pL1 pL2) pH "OSCCC"
		)
		for(asm 0 1 
			if((asm == 1) 
				(_Layer lPkgGeoAsmT) 
				(_Layer lPkgGeoSilkT)
			) 
			(_Rectangle pL1 pL2 
				(0:0) 0.1
			)
			(_Dot 
				(((-Cx / 2) - (X / 2) - SilkGap - 0.25):(Cy / 2)) 0.5
			)
		) 
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:(((Cy + Y) / 2) + SilkGap + (tSilkHeight / 2) + (tSilkPhotowidth / 2)))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

defun(OSCSCF 
		(aTb \@optional bFlat) 
		(pName = nth(1 aTb)) 
		(Pin = nth(2 aTb)) 
		(Pitch = nth(3 aTb))
		(pL1 = nth(4 aTb)) 
		(pL1tol = nth(5 aTb)) 
		(pL2 = nth(6 aTb)) 
		(pL2tol = nth(7 aTb)) 
		(pT = nth(8 aTb))
		(pTtol = nth(9 aTb)) 
		(pW = nth(10 aTb)) 
		(pWtol = nth(11 aTb)) 
		(pH = nth(12 aTb)) 
		(FullTab = list(car(aTb) pName 
				(Pin / 2) 
				(Pin / 2) Pitch
				(pL1 - pL1tol) 
				(pL1 + pL1tol) 
				(pL2 - pL2tol) 
				(pL2 + pL2tol) 
				(pT - pTtol)
				(pT + pTtol) 
				(pW - pWtol) 
				(pW + pWtol) pH
			))
		(Concave2 FullTab bFlat)
	)

defun(BGA 
		(aTb \@optional bLGA) 
		(BGAPinRow = list("A" "B" "C" "D" "E"
				"F" "G" "H" "J" "K"
				"L" "M" "N" "P" "R"
				"T" "U" "V" "W" "Y"
				"AA" "AB" "AC" "AD" "AE"
				"AF" "AG" "AH" "AJ" "AK"
				"AL" "AM" "AN" "AP" "AR"
				"AT" "AU" "AV" "AW" "AY"
				"BA" "BB" "BC" "BD" "BE"
				"BF" "BG" "BH" "BJ" "BK"
				"BL" "BM" "BN" "BP" "BR"
				"BT" "BU" "BV" "BW" "BY"
				"CA" "CB" "CC" "CD" "CE"
				"CF" "CG" "CH" "CJ" "CK"
				"CL" "CM" "CN" "CP" "CR"
				"CT" "CU" "CV" "CW" "CY"
				"DA" "DB" "DC" "DD" "DE"
				"DF" "DG" "DH" "DJ" "DK"
				"DL" "DM" "DN" "DP" "DR"
				"DT" "DU" "DV" "DW" "DY"
			)) 
		(pName = substring(nth(1 aTb) 1 31)) 
		(Row = nth(2 aTb))
		(Col = nth(3 aTb)) 
		if(bLGA then 
			(PitchY = nth(4 aTb)) 
			(PitchX = nth(5 aTb)) 
			(Ball = nth(6 aTb))
			(pA = nth(7 aTb)) 
			(pB = nth(8 aTb)) 
			(pH = nth(9 aTb)) 
			(Courtyard = nth(10 aTb)) 
			(pArray = nth(11 aTb))
			else 
			(pCollap = nth(4 aTb)) 
			(PitchY = nth(5 aTb)) 
			(PitchX = nth(6 aTb)) 
			(Ball = nth(7 aTb))
			(pA = nth(9 aTb)) 
			(pB = nth(10 aTb)) 
			(pH = nth(11 aTb)) 
			(pRoundOff = nth(15 aTb)) 
			(Courtyard = nth(16 aTb))
			(pBallAdj = nth(17 aTb)) 
			(pArray = nth(18 aTb))
		) 
		(_PrepareNewSym pName) 
		if(bLGA then 
			(PadSize = Ball) else 
			if((pCollap == 0) 
				(pBallAdj = -abs(pBallAdj)) 
				(pBallAdj = abs(pBallAdj))
			)
			(PadSize = (Ball + (Ball * pBallAdj))) 
			(PadSize = ((PadSize / pRoundOff) * pRoundOff))
		) 
		(_PadName = (_PadSM PadSize PadSize nil t
				bga_soldermask
			))
		(off = t) 
		(cntIndex = 0) 
		(cnt = nth(cntIndex pArray)) 
		for(i 1 Row 
			for(j 1 Col 
				(currPos = (((i - 1) * Col) + j)) 
				if((currPos > cnt) then 
					cntIndex++ 
					(cnt = (cnt + nth(cntIndex pArray))) 
					(off = !off)
				)
				if((currPos <= cnt) then 
					if(!off then 
						(ox = (((-(Col - 1) * PitchX) / 2) + (PitchX * (j - 1)))) 
						(oy = ((((Row - 1) * PitchY) / 2) - (PitchY * (i - 1)))) 
						sprintf(PadNum "%s%d" 
							nth((i - 1) BGAPinRow) j
						)
						(_CreatePin _PadName 
							(ox:oy) PadNum
						)
					)
				)
			)
		) 
		(_Layer lPkgGeoPlaceT)
		(_BoundHeight 
			(_ShapeRectangle 
				(pA + (2 * Courtyard)) 
				(pB + (2 * Courtyard))
			) pH
		) 
		(_Layer lPkgGeoDfaT) 
		(_BoundHeight 
			(_ShapeRectangle pA pB) pH "BGA"
		) 
		for(i 1 2 
			if((i == 1) 
				(_Layer lPkgGeoSilkT) 
				(_Layer lPkgGeoAsmT)
			) 
			(_Rectangle pA pB)
			(_Line 
				list(((-pA / 2):((pB / 2) - (SilkWidth * 2))) 
					(((-pA / 2) + (SilkWidth * 2)):(pB / 2))
				)
			) 
			(_Line 
				list(((-pA / 2):((pB / 2) - SilkWidth)) 
					(((-pA / 2) + SilkWidth):(pB / 2))
				)
			) 
			if((i == 1) then 
				(disx = ((((Col - 1) * PitchX) / 2) + (PadSize / 2) + SilkGap + 0.25)) 
				(disxs = ((pA / 2) + (SilkWidth / 2) + 0.25)) 
				if((disx < disxs) 
					(disx = disxs)
				)
				(_Dot 
					(-disx:(((Row - 1) * PitchY) / 2)) 0.5
				)
			)
		) 
		if(bga_fiducal then 
			(pFidName = "BGA_FIDUCAL") 
			(PadLst = cons((make_axlPadStackPad ?layer lPadT ?type 
						'REGULAR
						?figure 
						'CIRCLE ?figureSize 
						(bga_fid_pad:bga_fid_pad)
					) nil
				)) 
			(PadLst = cons((make_axlPadStackPad ?layer lPadST ?type 
						'REGULAR
						?figure 
						'CIRCLE ?figureSize 
						(bga_fid_keepout:bga_fid_keepout)
					) PadLst
				))
			(ps_id = (axlDBCreatePadStack pFidName nil PadLst t)) 
			(axlPadstackToDisk pFidName) 
			(_CreatePinMechanical pFidName 
				(((-pA / 2) - Courtyard):((-pB / 2) - Courtyard))
			) 
			(bound = (_ShapeCircle 
					(bga_fid_keepout / 2) lRouteKoT 
					(((-pA / 2) - Courtyard):((-pB / 2) - Courtyard))
				)) 
			(_CreatePinMechanical pFidName 
				(((pA / 2) + Courtyard):((pB / 2) + Courtyard))
			)
			(bound = (_ShapeCircle 
					(bga_fid_keepout / 2) lRouteKoT 
					(((pA / 2) + Courtyard):((pB / 2) + Courtyard))
				))
		)
		(_CrossCenter) 
		(_CreateRefValue pName 
			(0:((-pB / 2) - (tSilkHeight / 2) - SilkWidth))
		) 
		(_SaveDesign pName) 
		(_MakeDevice pName)
	)

procedure( 
    _Pad_Slot(PadWidth PadHeight SlotWidth SlotHeight)
        let( (drill_data pad_list PadName Pad)
        drill_data = make_axlPadStackDrill(?figure 'OBLONG_Y, 
            ?figureSize SlotWidth:SlotHeight, ?plating 'PLATED, 
            ?holeType 'OVAL_SLOT, ?slotSize SlotWidth:SlotHeight)
        pad_list = cons(make_axlPadStackPad( ?layer "TOP", ?type 'REGULAR, 
                        ?figure 'OBLONG_Y, ?figureSize PadWidth:PadHeight) nil )
        pad_list = cons(make_axlPadStackPad( ?layer "DEFAULT INTERNAL", ?type 'REGULAR,
                        ?figure 'OBLONG_Y, ?figureSize PadWidth*0.9:PadHeight*0.9) pad_list)
        pad_list = cons(make_axlPadStackPad( ?layer "BOTTOM", ?type 'REGULAR, 
                        ?figure 'OBLONG_Y, ?figureSize PadWidth:PadHeight) pad_list ) 
        pad_list = cons(make_axlPadStackPad( ?layer "SOLDERMASK_TOP", ?type nil
                        ?figure 'OBLONG_Y, ?figureSize PadWidth+solder_mask_offset:PadHeight+solder_mask_offset) pad_list ) 
        pad_list = cons(make_axlPadStackPad( ?layer "SOLDERMASK_BOTTOM", ?type nil
                        ?figure 'OBLONG_Y, ?figureSize PadWidth+solder_mask_offset:PadHeight+solder_mask_offset) pad_list ) 

        sprintf(PadName "pad_slot_%d_%d_%d_%d" round(PadWidth*100) 
            round(PadHeight*100) round(SlotWidth*100) round(SlotHeight*100) )
        Pad = axlDBCreatePadStack( PadName drill_data pad_list t)
        axlPadstackToDisk( PadName PadName)
        Pad
    )   ; end let
)       ; end procedure
procedure((_fpmMain) 
		(axlShell "done") 
		(SkillDir = getWorkingDir()) 
		(SkillDir = strcat(SkillDir "/skill")) 
		(PreWorkDir = getWorkingDir())
		(FPDUne = getShellEnvVar("yifpm")) 
		(bFPDUne = nil) 
		if(FPDUne 
			(bFPDUne = t)
		) 
		(FPDFile = getShellEnvVar("fpmDRW")) 
		if(!(_LoadEnv FPDFile) 
			return(nil)
		)
		(axlOpenDesign ?design "null.dra" ?mode "wf") 
		(axlDBChangeDesignUnits "millimeters" 3) 
		(ScrFileName = (axlTempFile)) 
		(sFile = outfile(ScrFileName "w")) 
		fprintf(sFile "scriptmode +i\n")
		fprintf(sFile "define grid \nsetwindow form.grid\n") 
		fprintf(sFile "FORM grid non_etch non_etch_x_grids 0.1 \n") 
		fprintf(sFile "FORM grid non_etch non_etch_y_grids 0.1 \n") 
		fprintf(sFile "FORM grid all_etch all_etch_x_grids 0.1 \n") 
		fprintf(sFile "FORM grid all_etch all_etch_y_grids 0.1 \n")
		fprintf(sFile "FORM grid display NO\n") 
		fprintf(sFile "FORM grid done\n") 
		fprintf(sFile "status\n") 
		fprintf(sFile "setwindow form.status\n") 
		fprintf(sFile "FORM status display_non_plated_holes YES\n")
		fprintf(sFile "FORM status display_enhance NO\n") 
		fprintf(sFile "FORM status display_endcaps YES\n") 
		fprintf(sFile "FORM status done\n") 
		close(sFile) 
		sprintf(runScript "replay %s" ScrFileName)
		(axlShell runScript) 
		deleteFile(ScrFileName) 
		(axlVisibleDesign nil) 
		(CompList = nil) 
		(p = infile(FPDFile))
		if(!p 
			return(nil)
		) 
		while((mean = lineread(p)) 
			if((mean != t) then 
				sprintf(tryPar "aTb=list%L" mean) 
				loadstring(tryPar) 
				(CompList = cons(aTb CompList))
			)
		) 
		close(p) 
		(axlVisibleDesign t) 
		(AllColors = '((255 255 255) 
					(14 210 255) 
					(255 121 203) 
					(0 255 106) 
					(166 16 255)
					(121 153 196) 
					(255 0 0) 
					(255 255 0) 
					(0 0 255) 
					(55 247 215)
					(179 179 185) 
					(116 150 113) 
					(252 199 46) 
					(255 40 40) 
					(172 138 138)
					(2 168 213) 
					(176 0 206) 
					(234 190 0) 
					(141 73 102) 
					(255 40 140)
					(14 249 182) 
					(161 4 4) 
					(100 255 80) 
					(255 255 255)
				))
		(axlColorSet 
			'ALL AllColors
		) 
		(Layers = '(("package geometry/display_top" 7) 
					("etch/top" 13) 
					("ref des/assembly_top" 2) 
					("ref des/silkscreen_top" 19) 
					("component value/assembly_top" 7)
					("component value/silkscreen_top" 7) 
					("package geometry/assembly_top" 2) 
					("package geometry/silkscreen_top" 1) 
					("package geometry/assembly_bottom" 16) 
					("package geometry/silkscreen_bottom" 16)
					("package geometry/place_bound_top" 15) 
					("package geometry/place_bound_bottom" 12) 
					("package geometry/dfa_bound_top" 15) 
					("package geometry/dfa_bound_bottom" 12) 
					("package geometry/soldermask_top" 7)
					("package geometry/pastemask_top" 7) 
					("package geometry/pin_number" 13) 
					("pin/soldermask_top" 7) 
					("route keepout/top" 16) 
					("pin/top" 13)
					("pin/bottom" 9) 
					("pin/soldermask_bottom" 16)
				)) 
		foreach(aLayer Layers 
			(p = (axlLayerGet 
					car(aLayer)
				)) 
			(p->color = cadr(aLayer)) 
			(axlLayerSet p)
		) 
		(p = (axlLayerGet "TOLERANCE/ASSEMBLY_TOP")) 
		(p->visible = nil)
		(axlLayerSet p) 
		(dsn = (axlGetParam "paramTextBlock:2")) 
		(dsn->height = tSilkHeight) 
		(dsn->width = tSilkWidth) 
		(dsn->charSpace = tSilkCharspace)
		(dsn->lineSpace = tSilkLinespace) 
		(dsn->photoWidth = tSilkPhotowidth) 
		(axlSetParam dsn) 
		(dsn = (axlGetParam "paramTextBlock:3")) 
		(dsn->height = tSymHeight)
		(dsn->width = tSymWidth) 
		(dsn->charSpace = tSymCharspace) 
		(dsn->lineSpace = tSymLinespace) 
		(dsn->photoWidth = tSymPhotowidth) 
		(axlSetParam dsn)
		(axlFlushDisplay) 
		(axlVisibleUpdate t) 
		foreach(one CompList 
			(id = car(one)) 
			if((id >= 30000) 
				(_MySkill one)
			) 
			if(((id >= 1001) && (id <= 1006)) 
				(BGA one)
			)
			if(((id >= 2401) && (id <= 2499)) 
				(SOP one)
			) 
			if(((id >= 2701) && (id <= 2799)) 
				(SON one)
			) 
			if(((id >= 2201) && (id <= 2299)) 
				(QFN one)
			) 
			case(id 
				(1101 
					(CapAlumElec one)
				) 
				(1401 
					(ChipComp one)
				) 
				(1402 
					(ChipComp one)
				) 
				(1403 
					(ChipComp one)
				)
				(1404 
					(ChipComp one t)
				) 
				(1405 
					(ChipComp one)
				) 
				(1406 
					(ChipComp one t t)
				) 
				(1501 
					(Concave2 one t)
				) 
				(1502 
					(Concave2 one)
				)
				(1504 
					(Concave4 one)
				) 
				(1503 
					(Concvex2 one)
				) 
				(1701 
					(BGA one t)
				) 
				(1901 
					(MoldedComp one)
				) 
				(1902 
					(MoldedComp one nil)
				)
				(1903 
					(MoldedComp one t t)
				) 
				(1904 
					(MoldedComp one nil)
				) 
				(1905 
					(MoldedComp one nil)
				) 
				(1801 
					(MELF one t t)
				) 
				(1802 
					(MELF one)
				)
				(2501 
					(SOD one)
				) 
				(2601 
					(SOJ one)
				) 
				(2602 
					(SOJ one)
				) 
				(2603 
					(SOJ one)
				) 
				(2801 
					(SOT23 one)
				)
				(2802 
					(SOT223 one)
				) 
				(2301 
					(QFP one)
				) 
				(2302 
					(QFP one)
				) 
				(2303 
					(QFP one)
				) 
				(2304 
					(QFP one)
				)
				(2305 
					(QFP one)
				) 
				(2306 
					(QFP one)
				) 
				(2307 
					(QFP one t)
				) 
				(2308 
					(QFPBumped one)
				) 
				(2309 
					(QFPBumped one t)
				)
				(2001 
					(OSCCC one)
				) 
				(2002 
					(OSCJ one)
				) 
				(2003 
					(OSCSCF one)
				) 
				(2004 
					(OSCJ one)
				) 
				(2007 
					(OSCSCF one t)
				)
				(3101 
					(_PadTH one) 
					(_PadTH one t)
				) 
				(3102 
					(_PadTH_NP one)
				) 
				(3103 
					(Via one)
				) 
				(3104 
					(Fiducial one)
				) 
				(3105 
					(TestPoint one)
				)
				(3201 
					(KeyR one)
				) 
				(3202 
					(KeyE one)
				) 
				(3204 
					(KeyOval one)
				) 
				(3205 
					(KeySpiral one)
				) 
				(3001 
					(TO one)
				)
				(4005 
					(Header one)
				) 
				(4006 
					(HeaderRA one)
				) 
				(4007 
					(HeaderF one)
				) 
				(5001 
					(MtgPlated one) 
					(MtgPlated one t)
				) 
				(5002 
					(MtgNonPlated one)
				)
				(5003 
					(MtgPlated one) 
					(MtgPlated one t)
				) 
				(5004 
					(MtgNonPlated one)
				) 
				(5101 
					(THDip one)
				) 
				(5102 
					(Axial one t)
				) 
				(5103 
					(Axial one)
				)
				(5104 
					(RadialOval one)
				) 
				(5105 
					(CapRadial one)
				)
			)
		) 
		(axlSaveDesign ?design "null.dra" ?mode "nocheck") 
		if(!bFPDUne then 
			changeWorkingDir(PreWorkDir)
		)
	)

(_fpmMain) 
