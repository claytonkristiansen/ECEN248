##Switches
#Switch0
set_property PACKAGE_PIN G15 [get_ports {SWs[0]}]               //Least significant switch on board
set_property IOSTANDARD LVCMOS33 [get_ports {SWs[0]}]
#Switch1
set_property PACKAGE_PIN P15 [get_ports {SWs[1]}]               //Second least significant switch on board
set_property IOSTANDARD LVCMOS33 [get_ports {SWs[1]}]

##Buttons
##IO_L20N_T3_34
#Button0
set_property PACKAGE_PIN K18 [get_ports {BTNs[0]}]              //Rightmost button on board for enable
set_property IOSTANDARD LVCMOS33 [get_ports {BTNs[0]}]
#Button1
set_property PACKAGE_PIN P16 [get_ports {BTNs[1]}]              //Second to the right button on board for reset
set_property IOSTANDARD LVCMOS33 [get_ports {BTNs[1]}]

##LEDs
#LED0
set_property PACKAGE_PIN M14 [get_ports {LEDs[0]}]              //Rightmost LED on board
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[0]}]
#LED1
set_property PACKAGE_PIN M15 [get_ports {LEDs[1]}]              //Second to the right LED on board
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[1]}]
#LED2
set_property PACKAGE_PIN G14 [get_ports {LEDs[2]}]              //Second to the left LED on board
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[2]}]
#LED3
set_property PACKAGE_PIN D18 [get_ports {LEDs[3]}]              //Leftmost LED on board
set_property IOSTANDARD LVCMOS33 [get_ports {LEDs[3]}]

##Clock Signal
set_property PACKAGE_PIN K17 [get_ports FastClk]                
set_property IOSTANDARD LVCMOS33 [get_ports FastClk]
create_clock add name sys_clk_pin period 8.00 waveform {0 4} [get_ports FastClk]        //Configuring the clock