#set_property PACKAGE_PIN AE13     [get_ports SYSCLK_P] ;# Bank  66 VCCO - VCC1V2   - IO_L21N_T3L_N5_AD8N_66
#set_property IOSTANDARD  DIFF_SSTL12 [get_ports SYSCLK_P] ;# Bank  66 VCCO - VCC1V2   - IO_L21N_T3L_N5_AD8N_66

#set_property PACKAGE_PIN AF13     [get_ports SYSCLK_N] ;# Bank  66 VCCO - VCC1V2   - IO_L21P_T3L_N4_AD8P_66
#set_property IOSTANDARD  DIFF_SSTL12 [get_ports SYSCLK_N] ;# Bank  66 VCCO - VCC1V2   - IO_L21P_T3L_N4_AD8P_66

set_property PACKAGE_PIN AH12        [get_ports "SYSCLK_P"] ;# Bank  66 VCCO - VCC1V2   - IO_L13P_T2L_N0_GC_QBC_66
set_property IOSTANDARD  DIFF_SSTL12 [get_ports "SYSCLK_P"] ;# Bank  66 VCCO - VCC1V2   - IO_L13P_T2L_N0_GC_QBC_66

set_property PACKAGE_PIN AJ12        [get_ports "SYSCLK_N"] ;# Bank  66 VCCO - VCC1V2   - IO_L13N_T2L_N1_GC_QBC_66
set_property IOSTANDARD  DIFF_SSTL12 [get_ports "SYSCLK_N"] ;# Bank  66 VCCO - VCC1V2   - IO_L13N_T2L_N1_GC_QBC_66

#set_property PACKAGE_PIN E5       [get_ports UART_rxd] ;# Bank  88 VCCO - VCC3V3   - IO_L12N_AD8N_88
#set_property IOSTANDARD  LVCMOS33 [get_ports UART_rxd] ;# Bank  88 VCCO - VCC3V3   - IO_L12N_AD8N_88
#set_property PACKAGE_PIN F6       [get_ports UART_txd] ;# Bank  88 VCCO - VCC3V3   - IO_L12P_AD8P_88
#set_property IOSTANDARD  LVCMOS33 [get_ports UART_txd] ;# Bank  88 VCCO - VCC3V3   - IO_L12P_AD8P_88

set_property PACKAGE_PIN AH17      [get_ports "UART_rxd"] ;# Bank  64 VCCO - VCC1V2   - IO_L13N_T2L_N1_GC_QBC_64
set_property IOSTANDARD  LVCMOS12  [get_ports "UART_rxd"] ;# Bank  64 VCCO - VCC1V2   - IO_L13N_T2L_N1_GC_QBC_64
set_property PACKAGE_PIN AL17      [get_ports "UART_txd"] ;# Bank  64 VCCO - VCC1V2   - IO_T1U_N12_64
set_property IOSTANDARD  LVCMOS12  [get_ports "UART_txd"] ;# Bank  64 VCCO - VCC1V2   - IO_T1U_N12_64

create_clock -period 3.333 -name SYSCLK_P -waveform {0.000 1.6666666666666667} -add [get_ports SYSCLK_P]
