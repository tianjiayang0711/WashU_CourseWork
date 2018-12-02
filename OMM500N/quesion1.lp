\* question1 *\
Minimize
OBJ: 10.05 xac + 0.3 xae + 13.3 xaf + 11.1 xam + 10.05 xbc + 17.8 xbe
 + 14.5 xbf + 11.8 xbm + 10.7 xcc + 18.2 xce + 15.02 xcf + 12.2 xcm
 + 10.65 xdc + 0.7 xde + 15 xdf + 12.3 xdm + 10.65 xec + 18.2 xee + 14.5 xef
 + 12.45 xem + 8.9 xfc + 18.25 xfe + 13.9 xff + 11.4 xfm + 10.15 xgc
 + 20.25 xge + 14.4 xgf + 11.5 xgm
Subject To
_C1: xae + xbe + xce + xde + xee + xfe + xge = 25000
_C10: 0.425 xfc + 0.625 xfe + 0.5 xff + 0.425 xfm <= 38000
_C11: 0.4 xgc + 0.7 xge + 0.45 xgf + 0.35 xgm <= 2500
_C2: xaf + xbf + xcf + xdf + xef + xff + xgf = 26000
_C3: xam + xbm + xcm + xdm + xem + xfm + xgm = 28000
_C4: xac + xbc + xcc + xdc + xec + xfc + xgc = 28000
_C5: 0.25 xac + 0.4 xaf + 0.375 xam <= 2500
_C6: 0.25 xbc + 0.7 xbe + 0.5 xbf + 0.35 xbm <= 3000
_C7: 0.25 xcc + 0.675 xce + 0.45 xcf + 0.4 xcm <= 2500
_C8: 0.2 xdc + 0.45 xdf + 0.35 xdm <= 2600
_C9: 0.25 xec + 0.65 xee + 0.45 xef + 0.4 xem <= 2500
Bounds
0 <= xac <= 999999
xae = 0
0 <= xaf <= 999999
0 <= xam <= 999999
0 <= xbc <= 999999
0 <= xbe <= 999999
0 <= xbf <= 999999
0 <= xbm <= 999999
0 <= xcc <= 999999
0 <= xce <= 999999
0 <= xcf <= 999999
0 <= xcm <= 999999
0 <= xdc <= 999999
xde = 0
0 <= xdf <= 999999
0 <= xdm <= 999999
0 <= xec <= 999999
0 <= xee <= 999999
0 <= xef <= 999999
0 <= xem <= 999999
0 <= xfc <= 999999
0 <= xfe <= 999999
0 <= xff <= 999999
0 <= xfm <= 999999
0 <= xgc <= 999999
0 <= xge <= 999999
0 <= xgf <= 999999
0 <= xgm <= 999999
Generals
xac
xae
xaf
xam
xbc
xbe
xbf
xbm
xcc
xce
xcf
xcm
xdc
xde
xdf
xdm
xec
xee
xef
xem
xfc
xfe
xff
xfm
xgc
xge
xgf
xgm
End
