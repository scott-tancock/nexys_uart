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
ExecStep $xv_path/bin/xelab -wto 84eeee341bb54e0f9c96e2254cb4c790 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_uart_behav xil_defaultlib.test_uart xil_defaultlib.glbl -log elaborate.log
