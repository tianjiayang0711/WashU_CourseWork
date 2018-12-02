\* Dellmar *\
Minimize
OBJ: 20 XAhn + 20 XAho + 20 XAne + 20 XAnm + 20 XAom + 20 XAow + 4000 XBAhn
 + 5000 XBAho + 3000 XBAne + 5000 XBAnm + 3000 XBAom + 4000 XBAow + 4000 XBMhn
 + 5000 XBMho + 3000 XBMom + 4000 XBMow + 3000 XBne + 5000 XBnm + 15 XMhn
 + 15 XMho + 15 XMne + 15 XMnm + 15 XMom + 15 XMow
Subject To
_C1: XAhn + XAho <= 50000
_C10: - 50000 XBMhn + XMhn <= 0
_C11: - 50000 XBMow + XMow <= 0
_C12: - 50000 XBMom + XMom <= 0
_C13: - 50000 XBnm + XMnm <= 0
_C14: - 50000 XBne + XMne <= 0
_C15: XAho - XAom - XAow >= -20000
_C16: XAho - XAom - XAow + XMho - XMom - XMow >= -20000
_C17: XAhn - XAne - XAnm >= -10000
_C18: XAhn - XAne - XAnm + XMhn - XMne - XMnm >= -10000
_C19: XAow >= 18000
_C2: XMhn + XMho <= 50000
_C20: XAne >= 23000
_C21: XAnm + XAom >= 14000
_C22: XAow + XMow >= 38000
_C23: XAne + XMne >= 53000
_C24: XAnm + XAom + XMnm + XMom >= 39000
_C3: XAho - 50000 XBAho <= 0
_C4: XAhn - 50000 XBAhn <= 0
_C5: XAow - 50000 XBAow <= 0
_C6: XAom - 50000 XBAom <= 0
_C7: XAnm - 50000 XBAnm <= 0
_C8: XAne - 50000 XBAne <= 0
_C9: - 50000 XBMho + XMho <= 0
Bounds
XAhn <= 50000
XAho <= 50000
XAne <= 50000
XAnm <= 50000
XAom <= 50000
XAow <= 50000
XMhn <= 50000
XMho <= 50000
XMne <= 50000
XMnm <= 50000
XMom <= 50000
XMow <= 50000
Binaries
XBAhn
XBAho
XBAne
XBAnm
XBAom
XBAow
XBMhn
XBMho
XBMom
XBMow
XBne
XBnm
End
