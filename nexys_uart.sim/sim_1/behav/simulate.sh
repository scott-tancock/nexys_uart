#!/bin/bash -f
xv_path="/media/d/Xilinx/Vivado/2016.3"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim test_uart_behav -key {Behavioral:sim_1:Functional:test_uart} -tclbatch test_uart.tcl -log simulate.log
