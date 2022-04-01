################################################################################
#
# Design name:  estimator
#
# Created by icc2 write_sdc on Mon Dec 20 22:24:35 2021
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance MOhm -capacitance fF -voltage V -current uA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000000
# capacitive_load_unit    : 1e-15
# voltage_unit            : 1
# current_unit            : 1e-06
# power_unit              : 1e-12
################################################################################


# Mode: default
# Corner: min
# Scenario: min

# /courses/engr852/engr852-02/asic_flow_32nm/asic_flow_setup_32/pnr/Estimator/new/lame.sdc, \
#   line 9
create_clock -name ideal_clk -period 3.846 -waveform {0 1.923} [get_ports \
    {clock}]
set_operating_conditions -library \
    saed32hvt_ff1p16v125c.db:saed32hvt_ff1p16v125c -analysis_type \
    on_chip_variation ff1p16v125c
