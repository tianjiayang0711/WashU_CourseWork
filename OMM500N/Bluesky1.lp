\* Problem A *\
Maximize
OBJ: 190 xch + 282 xcm + 195 xcp + 197 xhc + 110 xhm + 125 xhp + 292 xmc
 + 108 xmh + 238 xmp + 192 xpc + 110 xph + 230 xpm
Subject To
cCH: xch + xcm + xcp <= 240
cHC: xhc + xmc + xpc <= 240
cHM: xcm + xhm + xpm <= 240
cHP: xcp + xhp + xmp <= 240
cMH: xmc + xmh + xmp <= 240
cPH: xpc + xph + xpm <= 240
Bounds
xch <= 130
xcm <= 98
xcp <= 88
xhc <= 123
xhm <= 80
xhp <= 110
xmc <= 105
xmh <= 72
xmp <= 68
xpc <= 90
xph <= 115
xpm <= 66
End
