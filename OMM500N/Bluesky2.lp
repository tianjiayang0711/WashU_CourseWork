\* Problem A *\
Maximize
OBJ: 190 x_C_H + 282 x_C_M + 195 x_C_P + 197 x_H_C + 110 x_H_M + 125 x_H_P
 + 292 x_M_C + 108 x_M_H + 238 x_M_P + 192 x_P_C + 110 x_P_H + 230 x_P_M
Subject To
DCC: x_C_C <= 0
DCH: x_C_H <= 130
DCM: x_C_M <= 98
DCP: x_C_P <= 88
DHC: x_H_C <= 123
DHH: x_H_H <= 0
DHM: x_H_M <= 80
DHP: x_H_P <= 110
DMC: x_M_C <= 105
DMH: x_M_H <= 72
DMM: x_M_M <= 0
DMP: x_M_P <= 68
DPC: x_P_C <= 90
DPH: x_P_H <= 115
DPM: x_P_M <= 66
DPP: x_P_P <= 0
inbound_C: x_C_C + x_H_C + x_M_C + x_P_C <= 240
inbound_M: x_C_M + x_H_M + x_M_M + x_P_M <= 240
inbound_P: x_C_P + x_H_P + x_M_P + x_P_P <= 240
outbound_C: x_C_C + x_C_H + x_C_M + x_C_P <= 240
outbound_M: x_M_C + x_M_H + x_M_M + x_M_P <= 240
outbound_P: x_P_C + x_P_H + x_P_M + x_P_P <= 240
End
