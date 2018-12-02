\* Problem Sensitivity 1 *\
Minimize
total_cost: 0.3 x_A_1 + 13.3 x_A_2 + 11.1 x_A_3 + 10.05 x_A_4 + 17.8 x_B_1
 + 14.5 x_B_2 + 11.8 x_B_3 + 10.05 x_B_4 + 18.2 x_C_1 + 15.02 x_C_2
 + 12.2 x_C_3 + 10.7 x_C_4 + 0.7 x_D_1 + 15 x_D_2 + 12.3 x_D_3 + 10.65 x_D_4
 + 18.2 x_E_1 + 14.5 x_E_2 + 12.45 x_E_3 + 10.65 x_E_4 + 18.25 x_F_1
 + 13.9 x_F_2 + 11.4 x_F_3 + 8.9 x_F_4 + 20.25 x_G_1 + 14.4 x_G_2 + 11.5 x_G_3
 + 10.15 x_G_4
Subject To
capacity_A: 0.4 x_A_2 + 0.375 x_A_3 + 0.25 x_A_4 <= 2500
capacity_B: 0.7 x_B_1 + 0.5 x_B_2 + 0.35 x_B_3 + 0.25 x_B_4 <= 3000
capacity_C: 0.675 x_C_1 + 0.45 x_C_2 + 0.4 x_C_3 + 0.25 x_C_4 <= 2500
capacity_D: 0.45 x_D_2 + 0.35 x_D_3 + 0.2 x_D_4 <= 2600
capacity_E: 0.65 x_E_1 + 0.45 x_E_2 + 0.4 x_E_3 + 0.25 x_E_4 <= 2500
capacity_F: 0.625 x_F_1 + 0.5 x_F_2 + 0.425 x_F_3 + 0.425 x_F_4 <= 38000
capacity_G: 0.7 x_G_1 + 0.45 x_G_2 + 0.35 x_G_3 + 0.4 x_G_4 <= 2500
demand_1: x_A_1 + x_B_1 + x_C_1 + x_D_1 + x_E_1 + x_F_1 + x_G_1 >= 25000
demand_2: x_A_2 + x_B_2 + x_C_2 + x_D_2 + x_E_2 + x_F_2 + x_G_2 >= 26000
demand_3: x_A_3 + x_B_3 + x_C_3 + x_D_3 + x_E_3 + x_F_3 + x_G_3 >= 33000
demand_4: x_A_4 + x_B_4 + x_C_4 + x_D_4 + x_E_4 + x_F_4 + x_G_4 >= 28000
xA1=0: x_A_1 = 0
xD1=0: x_D_1 = 0
End
